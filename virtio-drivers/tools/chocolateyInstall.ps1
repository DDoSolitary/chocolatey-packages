$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$isoPath = Join-Path $pkgDir virtio.iso
$downloadArgs = @{
	packageName = $Env:ChocolateyPackageName
	fileFullPath = $isoPath
	url = 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.173-3/virtio-win.iso'
	checksumType = 'sha512'
	checksum = 'be447aa6dffbdf461ab7329ef76984e7d684c741b860690d704c7c409898b986312a12fb10ff94da4a2939be5e9a6c78c74899cf6686ce0fc15c60627bf2b4d0'
}
Get-ChocolateyWebFile @downloadArgs
$extractPath = Join-Path $pkgDir virtio
7z x $isoPath -o"$extractPath"
Remove-Item $isoPath
$arch = if ((Get-OsArchitectureWidth) -eq 64) { 'amd64' } else { 'x86' }
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
$infRelPath = Join-Path $os $arch
# NetKVM is available for all $infRelPath - I extract the Certificate from there
$certCatFile = [IO.Path]::Combine($extractPath, 'NetKVM', $infRelPath, 'netkvm.cat')
$certFile = Join-Path $pkgDir 'RedHat.cer'
$exportType = [Security.Cryptography.X509Certificates.X509ContentType]::Cert;
$cert = (Get-AuthenticodeSignature $certCatFile).SignerCertificate;
[IO.File]::WriteAllBytes($certFile, $cert.Export($exportType));
if (Get-Command -Name Import-Certificate -ErrorAction SilentlyContinue) {
	Import-Certificate -FilePath $certFile -CertStoreLocation Cert:\LocalMachine\TrustedPublisher
} else {
	# Fallback for older Windows versions (Win7, Win Srv 2008R2, ...)
	Invoke-Expression "certutil.exe -addstore -f 'TrustedPublisher' $($certFile)"
}
$infListPath = Join-Path $pkgDir inflist.txt
foreach ($dir in (Get-ChildItem -Directory $extractPath).FullName) {
	$infDirPath = (Join-Path $dir $infRelPath)
	if (Test-Path $infDirPath) {
		foreach ($infPath in (Get-ChildItem (Join-Path $infDirPath *.inf)).FullName) {
			$output = pnputil /add-driver $infPath /install
			if ($output[4] -match '^Published Name: *(.*)') {
				Add-Content -Path $infListPath -Value $Matches[1]
			}
		}
	}
}
Copy-Item ([IO.Path]::Combine($extractPath, 'Balloon', $infRelPath, 'blnsvr.exe')) $pkgDir
Invoke-Expression "$(Join-Path $pkgDir 'blnsvr.exe') -i"
$gaPath = Join-Path $extractPath 'guest-agent\qemu-ga-{0}.msi'
$installArgs = @{
	packageName = $Env:ChocolateyPackageName
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	file = $gaPath -f 'i386'
	file64 = $gaPath -f 'x86_64'
}
Install-ChocolateyInstallPackage @installArgs
Remove-Item -Recurse $extractPath
