$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
	url = 'http://jacquelin.potier.free.fr/exe/winapioverride32_bin.zip'
	checksumType = 'sha512'
	checksum = 'e52bb28a7f69dd55ec1f14e33735ad8d59f4dfdd63e9520c491e147fe3660cfb6776096ee794cc2a673bd190316c2d1f5b7ad022c22fd16bce4806970f20a5a5'
}

Install-ChocolateyZipPackage @packageArgs
