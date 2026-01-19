@echo off
title Multi zmiana hasla

set /p ADMIN_NAME=Podaj nazwe konta Admin:
set /p ADMIN_PASS=Podaj haslo do konta Admin:
set /p NEWUSER=Podaj nazwe nowego Usera: 
set /p NEWPASS=Podaj nowe haslo dla konta: 

echo.
echo =========== START ZMIANY HASLA ===========
echo.

for /f "usebackq tokens=*" %%i in ("Lista_pc.txt") do (
    echo ======== ZMIANA HASLA NA %%i ========
    
    PSTools\PsExec.exe -s -i \\%%i -u %ADMIN_NAME% -p %ADMIN_PASS% net user %NEWUSER% %NEWPASS% /add
    PSTools\PsExec.exe -s -i \\%%i -u %ADMIN_NAME% -p %ADMIN_PASS% net localgroup Administratorzy %NEWUSER% /add
    
    echo.
)

echo Zakonczono.
pause


