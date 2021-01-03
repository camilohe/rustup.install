$ErrorActionPreference = 'Stop'; 

$version = '1.23.0'

$triple_x86 = 'i686-pc-windows-msvc'
$triple_x64 = 'x86_64-pc-windows-msvc'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# e.g. https://static.rust-lang.org/rustup/archive/1.23.0/i686-pc-windows-msvc/rustup-init.exe
$url = "https://static.rust-lang.org/rustup/archive/$version/$triple_x86/rustup-init.exe"
# e.g. https://static.rust-lang.org/rustup/archive/1.23.0/x86_64-pc-windows-msvc/rustup-init.exe
$url64 = "https://static.rust-lang.org/rustup/archive/$version/$triple_x64/rustup-init.exe"


$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url
    url64bit       = $url64

    softwareName   = 'rustup-init.exe' 

    checksum       = '48E2BEA0BF6B9C782C8732E8DE17A3D87B5760AF8931E801652F8A47B27018CC'
    checksumType   = 'sha256' 
    checksum64     = '655388940708EE094FCAD294B00AF05B8B81C0AB7F8DA67CD31224BD41F5F33B'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
