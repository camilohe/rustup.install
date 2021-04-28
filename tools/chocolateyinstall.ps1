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

    checksum       = 'C1288BC054BCDB1106686D63DB9527481AC823FA0EF2538B7012CFE7D0F3D307'
    checksumType   = 'sha256' 
    checksum64     = 'A586CF9DE3E4AA791FD5796B6A5F99CA05591CCEF8BB94E53AF5B69F0261FB03'
    checksumType64 = 'sha256' 

    silentArgs     = '-v -y' # it seems we need '-v -y' starting with 1.9.0 to get rustup copied to the .cargo\bin folder.

    validExitCodes = @(0, -1073741515) # workaround for choco-verifier on win2012r2x64 (Windows Server 2012 R2 x64)
}

Install-ChocolateyPackage @packageArgs 
