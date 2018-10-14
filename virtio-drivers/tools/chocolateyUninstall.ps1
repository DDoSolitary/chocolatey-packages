$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$infListPath = Join-Path $pkgDir inflist.txt
Get-Content $infListPath | % { pnputil /delete-driver $_ }
