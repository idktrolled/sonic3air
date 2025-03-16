@echo on

set outputDir=_master_image_template
call ..\..\..\..\framework\external\get_msbuild_path.bat


pushd ..\..

rmdir "scripts" /s /q
mkdir "data"


:: Make sure the Release build is up-to-date
%msbuildPath% build\_vstudio\sonic3air.sln /property:Configuration=Release /property:Platform=Win32 -verbosity:minimal

:: Update auto-generated C++ script binding reference and run script nativization
"bin\Release_x86\Sonic3AIR.exe" -dumpcppdefinitions -nativize

:: Build data packages and meta data
"bin\Release_x86\Sonic3AIR.exe" -pack
move "enginedata.bin" "data"
move "gamedata.bin" "data"
move "audiodata.bin" "data"
move "audioremaster.bin" "data"
copy "data\metadata.json" "data" /y

:: Copy scripts
:: TODO: Make sure these scripts are really up-to-date
copy "saves\scripts.bin" "data"

popd


:: Done
if "%1"=="" pause
