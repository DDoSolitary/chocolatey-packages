$installPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$servicePath = Join-Path (ls -Directory $installPath)[0].FullName vdservice.exe
Invoke-Expression "$servicePath uninstall"
