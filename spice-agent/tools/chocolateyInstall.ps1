$servicePath = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Definition) vdservice.exe
Invoke-Expression "$servicePath install"
