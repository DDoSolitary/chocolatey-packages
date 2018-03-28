$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = '5c7d7c8b836b61c365028ebbbd44728053f3fb14f1e66e898c94dd748caf10f010a90f98ee6ba9a8cbda653f7f77aa3d5d6b8a2c846a3aea25f914f14f10030c'
}

Install-ChocolateyZipPackage @packageArgs
