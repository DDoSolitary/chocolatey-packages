$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/gyunaev/birdtray/releases/download/1.8.0/Birdtray-1.8.0-Win-x86.exe'
	url64bit = 'https://github.com/gyunaev/birdtray/releases/download/1.8.0/Birdtray-1.8.0-Win-x64.exe'
	fileType = 'exe'
	silentArgs = '/allusers /S'
	softwareName = 'Birdtray*'
	checksumType = 'sha512'
	checksum = '82421e9f3314f3207779d8615e6029d36263eb832d226273e67fce256a68717c49455124f089d68494d997741460de51384650affadf78149c8f94c70434a906'
	checksum64 = 'e78b1eafcb299e728b0e12bfc0b0ba85c7edcd062cab8987eb4fd9f8b16592ff57ba8b1f8deda25e05e399f1812e8b2788713c055e48784199187988cc01d5c5'
}

Install-ChocolateyPackage @packageArgs
