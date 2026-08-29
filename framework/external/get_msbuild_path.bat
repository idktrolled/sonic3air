@echo off

:: GitHub Actions / Visual Studio 2022
set "vswhere=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"

if not exist "%vswhere%" (
    echo Error: vswhere.exe not found
    exit /b 1
)

for /f "usebackq tokens=*" %%i in (`"%vswhere%" -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
    set "vsPath=%%i"
)

if not defined vsPath (
    echo Error: No Visual Studio 2022 installation found
    exit /b 1
)

set "msbuildPath=%vsPath%\MSBuild\Current\Bin\MSBuild.exe"

if not exist "%msbuildPath%" (
    echo Error: MSBuild.exe not found
    echo Expected: %msbuildPath%
    exit /b 1
)

echo Using Visual Studio installation: %vsPath%
echo Using MSBuild: %msbuildPath%
echo.
