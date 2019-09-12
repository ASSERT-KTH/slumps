# Compile and Validate

This script compiles and validates every wat file inside a input provided folder ```python3 compile_and_verify.py <os> <folder>```. It downloads the latest release available in the [**WABT**](https://github.com/WebAssembly/wabt/releases) repo. To run it you must specify the binary to download (the host operating system where you will run this script), the available options (for now) are: ```osx, linux, win32 and win64```. 

After the script exeution, a report file is created. The report file is the root of this folder, ```report.md```. Also two badges are generated to provide valid and unvalid counters i the validation process. In case of error the error message is also written to the report file.

## Report file

Example of [report file ](report.md)


## Get badges

- Valid badge count: ```![valid](utils/compile_and_verify/valid_badge.svg)``` ![valid](valid_badge.svg) 
- Error badge count ```![valid](utils/compile_and_verify/error_badge.svg)``` ![valid](error_badge.svg) 


### Issues

- Run this script from the repo root folder: ```python3 ./utils/compile_and_verify/compile_and_verify.py osx linux```