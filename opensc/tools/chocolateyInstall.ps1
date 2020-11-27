$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/OpenSC/OpenSC/releases/download/0.21.0/OpenSC-0.21.0_win32.msi'
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	checksumType = 'sha512'
	checksum = 'f7945de5a397c65c220c93de65c311d0c5d448fa9968df495d169ef6263481322b53e402dcda40f4a18c475a1fe66815565456b322333e2b439fa318b61fccca'
}

Install-ChocolateyPackage @packageArgs

if ((Get-OsArchitectureWidth) -eq 64) {
	$packageArgs.url = 'https://github.com/OpenSC/OpenSC/releases/download/0.21.0/OpenSC-0.21.0_win64.msi'
	$packageArgs.checksum = '46298566e49bdedad4fc7d1e1daf950c7dafbbd0187ab28b68e56902e6cd4488d1bdc7b26eaf053ea353c9d65162943c991912ec409d9a71f87a25b8d1a49858'
	Install-ChocolateyPackage @packageArgs
}
