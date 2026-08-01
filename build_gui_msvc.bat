@echo off
rem Builds the SimulationCraft Qt GUI (WoD 6.2.3 branch) with the
rem Visual Studio 2026 (v18) toolchain and Qt 5.15.2 (msvc2019_64).
rem Output: gui_build\release\SimulationCraft.exe (DLLs deployed by windeployqt).
call "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\VsDevCmd.bat" -arch=amd64 -no_logo
set PATH=C:\Qt\5.15.2\msvc2019_64\bin;%PATH%
if not exist "%~dp0gui_build" mkdir "%~dp0gui_build"
cd /d "%~dp0gui_build"
qmake ..\simcqt.pro CONFIG+=qt CONFIG+=release ^
  "QMAKE_CXXFLAGS+=/std:c++14 /Zc:__cplusplus- /permissive /W0 /D_CRT_SECURE_NO_WARNINGS /DNOMINMAX /I%~dp0vs /I%~dp0vs\msinttypes"
if errorlevel 1 exit /b %errorlevel%
nmake
exit /b %errorlevel%
