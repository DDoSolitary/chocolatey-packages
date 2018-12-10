$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = 'a0b38f7b4497571b87e01d9ca008e89369b5d996aa4cfd434c8b45a29dad593eb19a7eefcd3b14c0454253d7d2f6bf90eb6c01a35a62c9a8508d7046846f33fc'
}

Install-ChocolateyZipPackage @packageArgs
