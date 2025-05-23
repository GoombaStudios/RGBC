@echo off
setlocal enabledelayedexpansion
set version=1.0

if "%~1"=="" (
    echo RGB Color %rgbc_version%
    echo./? for help
    exit /b
)

if "%~1"=="/?" (
    echo RedGreenBlue Color
    echo RGB: rgbc ^<r^> ^<g^> ^<b^>
    echo Example: rgbc 255 0 0
    echo Hex Color: ^<#hex^>
    echo Example: rgbc #FF0000
    echo /r Reset color
    exit /b
)

if "%~1"=="/r" (
    color 0f
    echo [0m
    exit /b
)

set "rgbctmp2=%1"
set "rgbctmp=!rgbctmp2:~0,1!"

if "!rgbctmp!"=="#" (
    goto hex
)

:rgb
set dcolor_r=%1
set dcolor_g=%2
set dcolor_b=%3
echo [38;2;%dcolor_r%;%dcolor_g%;%dcolor_b%m
exit /b

:hex
set "hex=%~1"
if "%hex:~0,1%"=="#" set "hex=%hex:~1%"
set "r_hex=%hex:~0,2%"
set "g_hex=%hex:~2,2%"
set "b_hex=%hex:~4,2%"
for /f %%A in ('powershell -nologo -command "0x%r_hex%"') do set dcolor_r=%%A
for /f %%A in ('powershell -nologo -command "0x%g_hex%"') do set dcolor_g=%%A
for /f %%A in ('powershell -nologo -command "0x%b_hex%"') do set dcolor_b=%%A
echo [38;2;%dcolor_r%;%dcolor_g%;%dcolor_b%m