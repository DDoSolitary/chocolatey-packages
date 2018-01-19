$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://antibody-software.com/files/wiztree_3_17_setup.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'WizTree*'
	checksumType = 'sha512'
	checksum = '5a659ce23476b3e92dd9cfb0ec0163f8bca45bc47239450085c8140d8cceff2a9e02dbe991013a69d6e70df3f6b4a9bb4de4b2a2204c4f29cbc8188f1c61a3bc'
}

Install-ChocolateyPackage @packageArgs
