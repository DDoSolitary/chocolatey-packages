$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.6.1/VdhCoAppSetup-1.6.1.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '287b28b09d30cd930c88544392d97b378d53d0ca109c9fdfb3418119d4d4d241c506d1989453668a7a1e6f5de4faf5167358f076ca77aaa24abbecd06e2e24bf'
}

Install-ChocolateyPackage @packageArgs
