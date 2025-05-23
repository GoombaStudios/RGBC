@echo off
setlocal enabledelayedexpansion
title RGBC Installer
set oldcd=%cd%
powershell -command "iwr https://raw.githubusercontent.com/GoombaStudios/RGBC/refs/heads/code/rgbc.cmd -outfile rgbc.cmd"

cd C:\Windows\System32
echo test>test.test
if not exist test.test (
    cls
    echo Please run PowerShell as administrator.
    pause
    exit
)

del test.test

move %oldcd%\rgbc.cmd C:\Windows\System32\rgbc.cmd

cls
echo RGBC Successfully installed.
pause
exit
