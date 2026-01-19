@echo off
title Multi zmiana hasla
set /p ADMIN_NAME=Podaj nazwe konta Admina:
set /p ADMIN_PASS=Podaj haslo do konta Admin:
set /p NEWUSER=Podaj nazwe konta na kturym chcesz zmienic chaslo:
set /p NEWPASS=Podaj nowe haslo dla konta User: 

echo.
echo =========== START ZMIANY HASLA ===========
echo.

for /f "usebackq tokens=*" %%i in ("Lista_pc.txt") do (
    echo ======== ZMIANA HASLA NA %%i ========
    
    PSTools\PsExec.exe -s -i \\%%i -u %ADMIN_NAME% -p %ADMIN_PASS% net user %NEWUSER% %NEWPASS%
    
    echo.
)

echo Zakonczono.
pause
