@echo off
chcp 65001 >nul

echo ======================================
echo      ZMIANA HASLA NA JEDNYM KOMPIE
echo ======================================
echo.

:: Podaj nazwę komputera
echo Podaj nazwe komputera (np. PC1):
set /p PC_NAME=

:: Podaj konto do zmiany
echo Podaj nazwe konta (np. Uczen, Egzamin):
set /p USER_NAME=

::Podaj nazwe admian do kota administratora na PC
echo Podaj nazwe konta Admina:
set /p ADMIN_NAME=

:: Podaj haslo Admina
echo Podaj haslo do konta Admin:
set /p ADMIN_PASS=


:: Podaj nowe haslo
echo Podaj nowe haslo dla %USER_NAME%:
set /p NEWPASS=

echo.
echo ======== ZMIANA HASLA NA %PC_NAME% ========
echo.

PSTools\PsExec.exe -s -i \\%PC_NAME% -u %ADMIN_NAME% -p %ADMIN_PASS% net user "%USER_NAME%" "%NEWPASS%"

echo.
echo Zakonczono.
pause
