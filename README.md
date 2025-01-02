# EasyCMakeScripts

Contains miscellaneous CMake scripts, functions etc.

Latest Version 1.0.4

## Getting Started

### Minimal (Manual)

- Download and extract `minimal-manual` release.
- Only license file and relevant scripts.
- Include the files in cmake scripts as necessary.

### Complete (Install)

- Download and extract `complete-install` release.
- Installs relevant cmake scripts, config scripts, license and readme file.
- Generate config files, use `default-install` preset.
- Install using `cmake --install <build_dir>`.
- Import cmake script path using `find_package()`.
- Use `include(easyCMakeExampleBuilder)` and `include(easyCMakeVersion)` for appropriate features.

Or

- Use as subdirectory.

### Development 

- Download and extract complete source release or use git clone.
- Installs relevant cmake scripts, config scripts, license and readme file.
- Generate config files, use `development` preset.
- Install using `cmake --install <build_dir>`.
- Import cmake script path using `find_package()`.
- Use `include(easyCMakeExampleBuilder)` and `include(easyCMakeVersion)` for appropriate features.

Or

- Use as subdirectory.

## Features

### Add version to code

Provide version of project or target as a preprocessor definition for MAJOR, MINOR, REVISION, BUILD_CODE, STRING_VERSION.

### Add Example sources as executable targets

Provide cmake function to generate executables from example sources, with specific naming conventions and meta information as pre-processor definitions like name of example.

<hr/>
<p style="text-align: center;">
Copyright &copy; Harith Manoj <br>
Licensed under Apache License, version 2.0 <br></p>

See [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0) for copy of license or attached LICENSE text file.

<hr/>