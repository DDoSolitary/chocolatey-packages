$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.6.3/VdhCoAppSetup-1.6.3.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '8c9c5fc06af33034f48c2067e2f2ee2ee63f79c5bc32568522c97b83a67683401800a35c5cc395059aee7ef41e6a42caa9148b3b92f436497efb974f69108f7c'
}

Install-ChocolateyPackage @packageArgs
