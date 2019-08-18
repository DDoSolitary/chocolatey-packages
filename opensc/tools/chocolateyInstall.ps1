$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/OpenSC/OpenSC/releases/download/0.19.0/OpenSC-win32_0.19.0.msi'
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	checksumType = 'sha512'
	checksum = 'ba834fecf68f9d15d8e6d0edc35e4f27b7b3f503f2f876f5ec5d29b7b533a0e9fb742e4cc467c4306da0c7c3e50c404abdf7524443b2bf3a6a1c8d0dde22df7e'
}

Install-ChocolateyPackage @packageArgs

if ((Get-OsArchitectureWidth) -eq 64) {
	$packageArgs.url = 'https://github.com/OpenSC/OpenSC/releases/download/0.19.0/OpenSC-win64_0.19.0.msi'
	$packageArgs.checksum = '7282f1467119e9f56ba470b8a6de202bd55ea976e6f219cdfdbedeca2da6509ca6bad28df954fe8d88656e6de8fa088a86d243d73a27e6288ca3ef3778f5670e'
	Install-ChocolateyPackage @packageArgs
}
