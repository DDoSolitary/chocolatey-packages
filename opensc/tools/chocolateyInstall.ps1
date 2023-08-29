$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/OpenSC/OpenSC/releases/download/0.23.0/OpenSC-0.23.0_win32.msi'
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	checksumType = 'sha512'
	checksum = '634b20ad23be4492f23878f46a4963f1b2ee5470c4f2b808a356655585712551e5c705a2fa912777d2a3225f5eb77249038629c8f69f837fcf859378af91ec7b'
}

Install-ChocolateyPackage @packageArgs

if ((Get-OsArchitectureWidth) -eq 64) {
	$packageArgs.url = 'https://github.com/OpenSC/OpenSC/releases/download/0.23.0/OpenSC-0.23.0_win64.msi'
	$packageArgs.checksum = '520f0a7c7de99118307e27733524f993242b6fce85e8835740fa55c9d03a9a15294ef752bdfa033ddb79e8fee242c186e69d983422ceee08314f1e82ef03eca7'
	Install-ChocolateyPackage @packageArgs
}
