$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/gyunaev/birdtray/releases/download/RELEASE_1.6/Birdtray-1.6.1-Win-x86.exe'
	url64bit = 'https://github.com/gyunaev/birdtray/releases/download/RELEASE_1.6/Birdtray-1.6.1-Win-x64.exe'
	fileType = 'exe'
	silentArgs = '/allusers /S'
	softwareName = 'Birdtray*'
	checksumType = 'sha512'
	checksum = 'cd079b611b5b1430e2d3273b385e50f9d71f038953ad35cee8c74b53a4032397f6eb00df7f816c0e4b2fac6ac325d4898b2afc7feefa6254a894d0622f0e816f'
	checksum64 = '9d381d0069393db4e30a2210a3bfb1b7ae55ccb423203df2c073782022804000ed8e1cd3d8a0529c65ee3cb272f2f313f0b72f6c7b3cfa57eaab44e5054d6614'
}

Install-ChocolateyPackage @packageArgs
