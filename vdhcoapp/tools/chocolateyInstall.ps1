$packageArgs = @{
	packageName = $Env:ChocolateyPackageName
	url = 'https://github.com/mi-g/vdhcoapp/releases/download/v1.2.0/VdhCoAppSetup-1.2.0.exe'
	fileType = 'exe'
	silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	softwareName = 'VdhCoApp*'
	checksumType = 'sha512'
	checksum = 'f46ecc04329d889e483f0bec9f172b8053334908fcf5444cec88024881872ee7b31b22cb1f1d85d16294a67f9adee70922c9ebfd446512d68fe6abec4f7fab56'
}

Install-ChocolateyPackage @packageArgs
