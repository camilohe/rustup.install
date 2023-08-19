$ErrorActionPreference = 'Stop'; 

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://static.rust-lang.org/rustup/archive/1.26.0/i686-pc-windows-msvc/rustup-init.exe'
$url64 = 'https://static.rust-lang.org/rustup/archive/1.26.0/x86_64-pc-windows-msvc/rustup-init.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url
    url64bit       = $url64

    softwareName   = 'rustup*' 

    checksum       = '3fcfaf0018c12b96c49dc7e13e8638bd8de686ab27dd14238c3f11d0a936c003'
    checksumType   = 'sha256' 
    checksum64     = '365d072ac4ef47f8774f4d2094108035e2291a0073702db25fa7797a30861fc9'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
