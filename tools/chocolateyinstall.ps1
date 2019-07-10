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

    checksum       = '9B15C26905D4505AB77E000750AA3AEDEB909507485C5E5901B6AD7DE9D42E2D'
    checksumType   = 'sha256' 
    checksum64     = '9DA383C67914EEF4B8F880CB8E6D75F623F1261A08ED791A0404C3EBCA8C3A5A'
    checksumType64 = 'sha256' 

    silentArgs     = '--version' # tell rustup-init.exe to just show the version instead of installing a rust toolchain. if you want the default toolchain for your os/arch use '-v -y' instead.
}

Install-ChocolateyPackage @packageArgs 
