$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.6.0/VdhCoAppSetup-1.6.0.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '4ed79b233e1746e20f0a15a1deb0756cf5bb6ea2cd1c266aa1853ee9ff71708ff1759724d6af92c136c0d2b137c954c98dfae7623f531eb857c381eb35e8f892'
}

Install-ChocolateyPackage @packageArgs
