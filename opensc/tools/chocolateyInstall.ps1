$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/OpenSC/OpenSC/releases/download/0.22.0/OpenSC-0.22.0_win32.msi'
	fileType = 'msi'
	silentArgs = '/qn /norestart'
	checksumType = 'sha512'
	checksum = '557f1f6e865d24b3b6ee2ef385ed715bd4533f88d5af4c1454bbffdd4d51c29855fa328a1dbfc35a464d9810ead9be199c24ee452e2f6f38d8ab9b9864f30819'
}

Install-ChocolateyPackage @packageArgs

if ((Get-OsArchitectureWidth) -eq 64) {
	$packageArgs.url = 'https://github.com/OpenSC/OpenSC/releases/download/0.22.0/OpenSC-0.22.0_win64.msi'
	$packageArgs.checksum = '54790360cf072207a5b86710cf5d2d5808c4a1d3e94e89b0ed611370371afeec590de5573759fa12e19f10e35b3f396b77ab66791d66e6bc6d68ec24a6cc2d3c'
	Install-ChocolateyPackage @packageArgs
}
