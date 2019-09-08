@echo off
title SpamMER - Active
setlocal EnableDelayedExpansion

for %%i in ("sendkey" "sendkeys" "sleep") do (
	call %%i.exe >nul
)

set line=1
if exist "input.ini" (
	for /f "tokens=*" %%i in (input.ini) do (
		if !line! equ 1 set "key1=%%i"
		if !line! equ 2 set "text1=%%i"
		if !line! equ 3 set "key2=%%i"
		if !line! equ 4 set "sleep1=%%i"
		if !line! equ 5 set "sleep2=%%i"
		set /a line+=1
	)
	del /f /q "input.ini" >nul
)

for %%i in (key1 key2 sleep1 sleep2) do (
	if /i "!%%i!" equ "" exit
)

:loop
	if /i not "%key1%" equ "none" (call sendkey.exe %key1%)
	if /i not "%text1%" equ "" (call sendkeys.exe -s "%text1%")
	if /i not "%key2%" equ "none" (call sendkey.exe %key2%)
	if /i not "%sleep1%" equ "0" (call sleep.exe %sleep1%)
	if /i not "%sleep2%" equ "0" (call sleep.exe %sleep2%)
	goto :loop