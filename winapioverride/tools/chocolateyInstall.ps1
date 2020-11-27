$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = 'ac45513ed9276edd5043e4419747aafe629d8f9f7317f34c9f4c1be614f2538e07b64c29cf3c8820dd41277d0458365615fd6bc856d37eaec321506c9ef4cad1'
}

Install-ChocolateyZipPackage @packageArgs
