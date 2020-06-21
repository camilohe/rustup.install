$ErrorActionPreference = 'Stop'; 

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://win.rustup.rs/i686' 
$url64 = 'https://win.rustup.rs/x86_64'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url
    url64bit       = $url64

    softwareName   = 'rustup*' 

    checksum       = 'B98D6677B55DB9C7DA8582A6279FF841DD49CEE93CD9BB67F9773995F1083F41'
    checksumType   = 'sha256' 
    checksum64     = '9F9E33FA4759075EC60E4DA13798D1D66A4C2F43C5500E08714399313409DCF5'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
