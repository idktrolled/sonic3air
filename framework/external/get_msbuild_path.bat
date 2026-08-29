@echo off

set "msbuildPathCom=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MSBuild.exe"
set "msbuildPathPro=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MSBuild.exe"

if exist "%msbuildPathCom%" (
    set "msbuildPath=%msbuildPathCom%"
) else (
    if exist "%msbuildPathPro%" (
        set "msbuildPath=%msbuildPathPro%"
    ) else (
        echo Error: No Visual Studio 2022 installation found
        exit /b 1
    )
)

echo Using Visual Studio installation: %msbuildPath%
echo.
