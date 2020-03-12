$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.4.0/VdhCoAppSetup-1.4.0.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '1945c0f27cd660d49ff86b9760694186c8f31c877b068f5954dabd6521b142b60e28ae3a39a904583a944ec6d932ec58985fb58457810782b2ddd6ef07d65270'
}

Install-ChocolateyPackage @packageArgs
