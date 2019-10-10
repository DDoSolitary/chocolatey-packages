$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$infListPath = Join-Path $pkgDir inflist.txt
Invoke-Expression "$(Join-Path $pkgDir 'blnsvr.exe') -u"
Get-Content $infListPath | % { pnputil /delete-driver $_ }
Get-ChildItem Cert:\LocalMachine\TrustedPublisher | ? subject -match 'CN="Red Hat, Inc.", O="Red Hat, Inc.", L=Raleigh, S=North Carolina, C=US' | Remove-Item
