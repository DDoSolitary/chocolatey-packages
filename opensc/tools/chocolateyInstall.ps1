$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/OpenSC/OpenSC/releases/download/0.20.0/OpenSC-0.20.0_win32.msi'
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	checksumType = 'sha512'
	checksum = '7ea2a2ecfab534a75fdcb7f03024b012bca855acf4ca289ee1ede9ca7be480d6670ae5ca189b2a0f8de88392ad81ab5dc36163bff2944f84060dd94d7c3efaa3'
}

Install-ChocolateyPackage @packageArgs

if ((Get-OsArchitectureWidth) -eq 64) {
	$packageArgs.url = 'https://github.com/OpenSC/OpenSC/releases/download/0.20.0/OpenSC-0.20.0_win64.msi'
	$packageArgs.checksum = 'dbbe882abd294fd2d6e4c30c003d6a2c1b34d627b503651471ae405d1a38705d84839a72dcb1d56e211dffa8bf25d5f3b13b8d83e5c4e4dcc9ca01c0e8262c58'
	Install-ChocolateyPackage @packageArgs
}
