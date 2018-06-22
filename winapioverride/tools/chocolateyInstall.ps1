$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = 'c70b0f9a1de024b9e5f01c1135fa2628215072f9e385ee8183c2a456cd844debb7d2d094aa2182a0f6b1ae71eb64e1a585539f0dd1b4a77ce9edb651d6a3e012'
}

Install-ChocolateyZipPackage @packageArgs
