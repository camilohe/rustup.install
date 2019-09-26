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

    checksum       = '22F51975DCC460198FB576AFEC5D38D47E4F1B8E28185AE2312D57CF9D35DA1C'
    checksumType   = 'sha256' 
    checksum64     = 'E325B428A0FF9132B59EC586E85B1DB4EAA66ACC13B3DAF8090520D2E7694388'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.
}

Install-ChocolateyPackage @packageArgs 
