$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/gyunaev/birdtray/releases/download/1.8.1/Birdtray-1.8.1-Win-x86.exe'
	url64bit = 'https://github.com/gyunaev/birdtray/releases/download/1.8.1/Birdtray-1.8.1-Win-x64.exe'
	fileType = 'exe'
	silentArgs = '/allusers /S'
	softwareName = 'Birdtray*'
	checksumType = 'sha512'
	checksum = '61648fc082bcf860925763ed2a24ec8ac3c1b421cbdec126fc05062d185b2ce3943299a1e098328ec7fb4abfbd6f353a9986b4d4e26baf3815cb949d49f913af'
	checksum64 = '8439f8fb7d4b1bd34690dc3f8043c547e7009a2a6c70272ceeaa1cf6dddcef86545fc7455f3c25a8e6d5c82a80a4f136a90cc98f40bc33bf1b0cb54caa7abe45'
}

Install-ChocolateyPackage @packageArgs
