@echo off
rem Launcher for the content-factory preview.
rem Starts a local HTTP server (needed so the clipboard copy button works)
rem and opens the manifest in the default browser.
rem Stop with Ctrl+C in this window.
title Контент-завод
cd /d "%~dp0"
set PORT=8123

echo.
echo  === Контент-завод ===
echo  Локальный сервер: http://localhost:%PORT%/
echo  Окно не закрывайте, пока работаете. Остановка — Ctrl+C.
echo.

rem open the browser after a short delay so the server has time to bind
start "" cmd /c "timeout /t 2 >nul & start "" http://localhost:%PORT%/"

rem prefer the py launcher, fall back to python
py -m http.server %PORT% 2>nul
if errorlevel 1 python -m http.server %PORT%

echo.
echo Сервер остановлен. Нажмите любую клавишу, чтобы закрыть окно.
pause >nul