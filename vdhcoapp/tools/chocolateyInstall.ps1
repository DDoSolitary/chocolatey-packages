$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.2.3/VdhCoAppSetup-1.2.3.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '7aea7a51db75d08a0a76104a6f77f4d7f5d297cb43991ce4395deda1c7943ca25549f339eca8c7754eab77bf42a89a5b9b39eac417318d45ea7eae7549c90bc8'
}

Install-ChocolateyPackage @packageArgs
