$ErrorActionPreference = 'Stop'; 

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://static.rust-lang.org/rustup/archive/1.27.1/i686-pc-windows-msvc/rustup-init.exe'
$url64 = 'https://static.rust-lang.org/rustup/archive/1.27.1/x86_64-pc-windows-msvc/rustup-init.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url
    url64bit       = $url64

    softwareName   = 'rustup*' 

    checksum       = '011185bd2bfce79f5389c19247b6e45242d17c697fe135ec6cdd23948445803a'
    checksumType   = 'sha256' 
    checksum64     = '193d6c727e18734edbf7303180657e96e9d5a08432002b4e6c5bbe77c60cb3e8'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
