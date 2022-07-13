$ErrorActionPreference = 'Stop'; 

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://static.rust-lang.org/rustup/archive/1.25.1/i686-pc-windows-msvc/rustup-init.exe'
$url64 = 'https://static.rust-lang.org/rustup/archive/1.25.1/x86_64-pc-windows-msvc/rustup-init.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url
    url64bit       = $url64

    softwareName   = 'rustup*' 

    checksum       = '79442f66a969a504febda49ee9158a90ad9e94913209ccdca3c22ef86d635c31'
    checksumType   = 'sha256' 
    checksum64     = '2220ddb49fea0e0945b1b5913e33d66bd223a67f19fd1c116be0318de7ed9d9c'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
