# rustup.install
A [chocolatey](https://chocolatey.org/) [**package**](https://chocolatey.org/packages/rustup.install) to install [**rustup**](https://rustup.rs/) the toolchain installer for  [**The Rust Programming Language**](https://www.rust-lang.org/) on Windows.

Note that this only installs **rustup**, to install a toolchain run ```rustup toolchain install stable-x86_64-pc-windows-msvc``` replacing your target toolchain. 

For convenience, omitted elements of the target triple will be inferred, so the above could be written ```rustup toolchain install stable-msvc``` or even ```rustup toolchain default stable-msvc``` to install the toolchain as the default one.

Please, run ```rustup --help``` to see the available commands, ```rustup target list``` to get a list of target toolchains and ```rustup toolchain --help``` for help managing toolchains. For more help, see the [README](https://github.com/rust-lang/rustup/blob/master/README.md) and for a summary of changes, see the [CHANGELOG](https://github.com/rust-lang/rustup/blob/master/CHANGELOG.md)

**NOTE: If you're a Windows Subsystem for Linux user do not install this package** but run the following in your terminal, then follow the onscreen instructions to install Rust.
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## changes
- updated to install rustup 1.22.1
- updated to install rustup 1.21.1 (thanks @gsomix)
- updated to install rustup 1.19.0
- initial version: rustup 1.18.3 
