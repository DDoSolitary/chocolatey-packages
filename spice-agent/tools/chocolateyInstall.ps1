$installPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = $installPath
	url = 'https://www.spice-space.org/download/windows/vdagent/vdagent-win-0.9.0/vdagent-win-0.9.0-x86.zip'
	url64Bit = 'https://www.spice-space.org/download/windows/vdagent/vdagent-win-0.9.0/vdagent-win-0.9.0-x64.zip'
	checksumType = 'sha512'
	checksum = '9D2E69B3216FE3A17D65F8138D89E900577E35B0C0002AA3D35A408C1B83F8F52AE54D33307FF8626A64EA4BE2C4B684E2BF0495DA22EFF8618CADD3DFECAFE4'
	checksum64 = 'D001691B8319DE8111959A86D255F298C466CF495A85277BDFCB070111A962DB3D6B4560ED735F16BC0BFFDA2E44DBDE18D288481EF10F07BFB89E10B744D00E'
}
Install-ChocolateyZipPackage @packageArgs
$servicePath = Join-Path (ls -Directory $installPath)[0].FullName vdservice.exe
Invoke-Expression "$servicePath install"
