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

    checksum       = '33DDB81079F94150E162FA00A84A00FF4649419FCE5AA54116CB4147785732D1'
    checksumType   = 'sha256' 
    checksum64     = '780B445EE18BDC5A31AD6A4A63943927E5C0BBA8BFF664E8ECC8D5BCA3906C7B'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
