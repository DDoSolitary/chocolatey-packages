$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$isoPath = Join-Path $pkgDir virtio.iso
$downloadArgs = @{
	packageName = $Env:ChocolateyPackageName
	fileFullPath = $isoPath
	url = 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.185-1/virtio-win.iso'
	checksumType = 'sha512'
	checksum = '62992baafce1f2eb52c23ba62291765c535c513e2598910083a8519eff58e8c57366d46add702e791fb07ec96c0fb65c9cff03b57e8f32b4357799c86b46c198'
}
Get-ChocolateyWebFile @downloadArgs
$extractPath = Join-Path $pkgDir virtio
7z x $isoPath -o"$extractPath"
Remove-Item $isoPath

$info = ConvertFrom-Json ([IO.File]::ReadAllText((Join-Path $extractPath 'data/info.json')))
$arch = if ($Env:PROCESSOR_ARCHITEW6432 -eq $null) { $Env:PROCESSOR_ARCHITECTURE } else { $Env:PROCESSOR_ARCHITEW6432 }
$os = switch ($Env:OS_NAME) {
	'Windows 10' { 'w10' }
	'Windows 8.1' { 'w8.1' }
	'Windows 8' { 'w8' }
	'Windows 7' { 'w7' }
	'Windows XP' { 'xp' }
	'Windows Server 2019' { '2k19' }
	'Windows Server 2016' { '2k16' }
	'Windows Server 2012 R2' { '2k12R2' }
	'Windows Server 2012' { '2k12' }
	'Windows Server 2008 R2' { '2k8R2' }
	'Windows Server 2008' { '2k8' }
	'Windows Server 2003' { '2k3' }
}

# NetKVM is available for all $infRelPath - I extract the Certificate from there
$netkvm = $info.drivers | where { $_.name -eq 'Red Hat VirtIO Ethernet Adapter' -and $_.arch -eq $arch -and $_.windows_version -eq $os }
$cert = (Get-AuthenticodeSignature ([IO.Path]::ChangeExtension((Join-Path $extractPath $netkvm.inf_path), '.cat'))).SignerCertificate;
$certFile = Join-Path $pkgDir 'RedHat.cer'
$exportType = [Security.Cryptography.X509Certificates.X509ContentType]::Cert;
[IO.File]::WriteAllBytes($certFile, $cert.Export($exportType));
certutil.exe -addstore -f TrustedPublisher $certFile

$infListPath = Join-Path $pkgDir inflist.txt
$info.drivers | where { $_.arch -eq $arch -and $_.windows_version -eq $os } | % {
	$infPath = Join-Path $extractPath $_.inf_path
	$output = pnputil.exe /add-driver $infPath /install
	echo $output
	if ($output[4] -match '^[^:]*: *(.*)') {
		Add-Content -Path $infListPath -Value $Matches[1]
	}
	if ($_.name -eq 'VirtIO Balloon Driver') {
		Copy-Item (Join-Path (Split-Path -Parent $infPath) blnsvr.exe) $pkgDir
		Invoke-Expression "$(Join-Path $pkgDir 'blnsvr.exe') -i"
	}
}

$gaPath = Join-Path $extractPath 'guest-agent\qemu-ga-{0}.msi'
$installArgs = @{
	packageName = "QEMU Guest Agent"
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	file = $gaPath -f 'i386'
	file64 = $gaPath -f 'x86_64'
}
Install-ChocolateyInstallPackage @installArgs

Remove-Item -Recurse $extractPath
