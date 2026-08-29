@echo off

:: MSBuild is provided by microsoft/setup-msbuild@v2
set msbuildPath=msbuild

where %msbuildPath% >nul 2>&1
if errorlevel 1 (
    echo Error: MSBuild not found
    exit /b 1
)

echo Using MSBuild:
where %msbuildPath%
echo.
