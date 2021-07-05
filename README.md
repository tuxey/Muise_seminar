
[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/smgl9/Muise_seminar)
![Tests](https://github.com/smgl9/Muise_seminar/workflows/Test_cocotb/badge.svg?event=push)


![Teros HDL logo ](doc/logo.png)

# Seminars

This repository aims to collect documents and projects for different seminars

## Requirements

## TerosHDL

[Beta version v0.1.91](https://github.com/TerosTechnology/vscode-terosHDL/releases/tag/v0.1.91)

### Windows

- VSCode

[Install TerosHDL with remote WSL](https://code.visualstudio.com/docs/remote/wsl)

- WSL

[Install WSL Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

### Linux tools

```
sudo apt install iverilog
sudo apt install verilator
sudo apt install gnat
sudo apt-get install libz-dev
git clone https://github.com/ghdl/ghdl.git --depth=1 --branch v1.0.0 ghdl \
    && cd ghdl \
    && ./configure \
    && make --silent \
    && sudo make --silent install \
    && cd .. \
    && rm -rf ghdl
sudo apt install python3-pip
sudo pip3 install vunit_hdl
sudo pip3 install cocotb
```

### Run test

```
cd 2021/tb
make 
make TOPLEVEL_LANG=verilog SIM=icarus
```

