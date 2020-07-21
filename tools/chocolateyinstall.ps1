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

    checksum       = 'A607258DE36F4369552426A5025329B8859C4FB3CC4A29C14C865ABF3BBDBAC0'
    checksumType   = 'sha256' 
    checksum64     = '7D84713F40E835B2D4B6FF6A3044338598B5D2D4E3B0716277450776AE3D7089'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
