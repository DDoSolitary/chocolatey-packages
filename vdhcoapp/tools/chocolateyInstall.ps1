$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.2.4/VdhCoAppSetup-1.2.4.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '29398b38331a2cc98f16b7bc524902f917c372ca4296b9a659d1674d38c37ba1171b3c1388624c7fcc138cb8b9c20c8773482245c1af662e75bb48d8266fd321'
}

Install-ChocolateyPackage @packageArgs
