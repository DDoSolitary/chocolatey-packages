$installPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = $installPath
	url = 'https://www.spice-space.org/download/windows/vdagent/vdagent-win-0.10.0/vdagent-win-0.10.0-x86.zip'
	url64Bit = 'https://www.spice-space.org/download/windows/vdagent/vdagent-win-0.10.0/vdagent-win-0.10.0-x64.zip'
	checksumType = 'sha512'
	checksum = '2898a8dfbc7514d01ad0d5b45cebdc6993126d0738183ed7d7c89d72b0af05ee5625d863b8a9a6bf3dafe7ed0009ceb82128cc6f023599512221f8d7d25d3fc3'
	checksum64 = '205fff5abe58929565638f6bc08213514b71c8437e16402bf895e6344d02e99188a6e159b2af3f918c93034bbf31a800e53cfcb1ddcb7a916ab609d1cd2e6962'
}
Install-ChocolateyZipPackage @packageArgs
$servicePath = Join-Path (ls -Directory $installPath)[0].FullName vdservice.exe
Invoke-Expression "$servicePath install"
