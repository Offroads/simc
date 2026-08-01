@echo off
rem Builds the simc command-line client (WoD 6.2.3 branch) with the
rem Visual Studio 2026 (v18) toolchain. Output: simc.exe in the repo root.
call "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\VsDevCmd.bat" -arch=amd64 -no_logo
if not exist "%~dp0build" mkdir "%~dp0build"
cd /d "%~dp0engine"
cl /nologo /MP /O2 /EHsc /std:c++14 /Zc:__cplusplus- /permissive /W0 ^
  /DWIN32 /DNDEBUG /D_NO_DEBUG /D_CONSOLE /DWINDOWS /D_CRT_SECURE_NO_WARNINGS /DNOMINMAX ^
  /I. /I..\vs /I..\vs\msinttypes ^
  /Fo..\build\ /Fe..\simc.exe @cpp_list.txt ^
  /link wininet.lib ws2_32.lib shell32.lib
exit /b %errorlevel%
