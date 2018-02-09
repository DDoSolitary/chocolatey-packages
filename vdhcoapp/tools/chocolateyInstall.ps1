$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.1.3/VdhCoAppSetup-1.1.3.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = '72e69bfcdeec2286f941136bed5e477b78201a2df8287b791a84e423df1691d07932508f19890d89ab95f8491593aa6ef89a610f08e418bbcf9f1fa54f94c24f'
}

Install-ChocolateyPackage @packageArgs
