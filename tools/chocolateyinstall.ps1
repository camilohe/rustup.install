$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://win.rustup.rs/i686' # download url, HTTPS preferred
$url64      = 'https://win.rustup.rs/x86_64' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  softwareName  = 'rustup*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # Checksums are now required as of 0.10.0.
  # To determine checksums, you can get that from the original site if provided. 
  # You can also use checksum.exe (choco install checksum) and use it 
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '9B15C26905D4505AB77E000750AA3AEDEB909507485C5E5901B6AD7DE9D42E2D'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '9DA383C67914EEF4B8F880CB8E6D75F623F1261A08ED791A0404C3EBCA8C3A5A'
  checksumType64= 'sha256' #default is checksumType

  silentArgs   = '--version' # tell rustup-init.exe to just show the version instead of installing a rust toolchain. if you want the default toolchain for your os/arch use '-v -y' instead.
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
#Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-zip-package

## ALWAYS use absolute paths - $toolsDir gets you to the package's tools directory.

## Main helper functions - these have error handling tucked into them already
## see https://chocolatey.org/docs/helpers-reference
