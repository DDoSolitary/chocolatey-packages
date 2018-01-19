$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = '19269de497f20100411d0e8e10a47945ab2a5db2a38bdbe5cd7976ec30c4ab0de198051bfc73c43a8681e43c0ea991279741281c62f04216cf9327df5696b92c'
}

Install-ChocolateyZipPackage @packageArgs
