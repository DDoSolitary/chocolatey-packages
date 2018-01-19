$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.1.2/VdhCoAppSetup-1.1.2.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = 'b30e3eda2fda166d6ec749734a17adfc206659e9b301ba24a265fb14cebb85161f72e9642a35a6087492f2762c1c57a657373dfd05772d0f0742ec410fb94706'
}

Install-ChocolateyPackage @packageArgs
