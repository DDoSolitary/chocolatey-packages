$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$infListPath = Join-Path $pkgDir inflist.txt
Invoke-Expression "$(Join-Path $pkgDir 'blnsvr.exe') -u"
Get-Content $infListPath | % { pnputil /delete-driver $_ }
$cert = New-Object Security.Cryptography.X509Certificates.X509Certificate2
$cert.Import((Join-Path $pkgDir 'RedHat.cer'))
Get-ChildItem (Join-Path Cert:\LocalMachine\TrustedPublisher $cert.Thumbprint) | Remove-Item
