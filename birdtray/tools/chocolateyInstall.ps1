$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/gyunaev/birdtray/releases/download/RELEASE_1.7.0/Birdtray-1.7.0-Win-x86.exe'
	url64bit = 'https://github.com/gyunaev/birdtray/releases/download/RELEASE_1.6/Birdtray-1.7.0-Win-x64.exe'
	fileType = 'exe'
	silentArgs = '/allusers /S'
	softwareName = 'Birdtray*'
	checksumType = 'sha512'
	checksum = 'b7aa513145c7ee3ed8edd16fd261887974055c5e0bfaabb53d720086df76fc01f65ea65a49e4e0eb7201d9e47783eb4af79965d116e86f4e7afb3e1fdce21715'
	checksum64 = 'f531393b6f6e1020dd4eaf7a7aae2ee55ba2541043d96b2d0df6d06d2fbbe4b6f9303212b4920db7a101c25c60b2cea4f83cd258469656cdea6c382bfa82f69f'
}

Install-ChocolateyPackage @packageArgs
