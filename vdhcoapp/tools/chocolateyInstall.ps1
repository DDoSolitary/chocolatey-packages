$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.2.2/VdhCoAppSetup-1.2.2.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = 'ee15107ea95ce380e2a36cafbab42cf6416e9d38b5810bb478f7fc82cd87fc7441a6b8cb2eb548a4856ea675c2ec76de4ed0fb2f585c74d6a026927cb87db6b2'
}

Install-ChocolateyPackage @packageArgs
