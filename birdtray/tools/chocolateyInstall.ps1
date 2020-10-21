$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/gyunaev/birdtray/releases/download/v1.9.0/Birdtray-1.9.0-Win-x86.exe'
	url64bit = 'https://github.com/gyunaev/birdtray/releases/download/v1.9.0/Birdtray-1.9.0-Win-x64.exe'
	fileType = 'exe'
	silentArgs = '/allusers /S'
	softwareName = 'Birdtray*'
	checksumType = 'sha512'
	checksum = '064d239eaf271c61647a3b13f2dfe72935e09a6c6c0cbcb9303e690381f63b0646ed98783f7e89fa870067bd92dce71ce9cff7bd266d3dafca2dce3a323304b8'
	checksum64 = '5de76b11c761707e67f526fef2121e57796d1d79452426876fca11489772074dfa16fdbe2d5280c6227f413f26d4ebab32734fa53bf884244476df247626619e'
}

Install-ChocolateyPackage @packageArgs
