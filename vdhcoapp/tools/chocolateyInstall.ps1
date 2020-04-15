$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.5.0/VdhCoAppSetup-1.5.0.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '53ff3ad426120ee5d5625e5fafb1359d289af70337624d34bd20ecc08e3b140ac3a6ae1e641e6329e0fef4f9254ee7a43748390a81c7a7aef808940bc3c3efe2'
}

Install-ChocolateyPackage @packageArgs
