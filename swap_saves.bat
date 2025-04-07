@echo off
setlocal EnableDelayedExpansion

color 0A

set "SAVE_PATH=%UserProfile%\AppData\LocalLow\TVGS\Schedule I\Saves\76561198081940642\SaveGame_1\Players"
set "PLAYER_0=%SAVE_PATH%\Player_0"
set "SHKIPPER=%SAVE_PATH%\Player_76561198081940642"
set "DOMASHNIY=%SAVE_PATH%\Player_76561198800014550"

echo Checking path: %SAVE_PATH%

if not exist "%SAVE_PATH%" (
    echo Error: Path %SAVE_PATH% not found!
    echo Please ensure the folder exists and the path is correct.
    pause
    exit /b
) else (
    echo Path found, continuing...
)

echo Select who will be the host:
echo 1 - Shk1pper
echo 2 - Domashniy
set /p CHOICE="Press 1 or 2 and Enter: "

if "%CHOICE%"=="1" (
    echo You selected Shk1pper as the host.

    if not exist "%SHKIPPER%" (
        echo Error: Folder %SHKIPPER% not found!
        pause
        exit /b
    ) else (
        echo Folder Shk1pper found: %SHKIPPER%
    )
    if not exist "%PLAYER_0%" (
        echo Error: Folder %PLAYER_0% not found!
        pause
        exit /b
    ) else (
        echo Folder Player_0 found: %PLAYER_0%
    )

    if exist "%DOMASHNIY%" (
        echo Deleting old Domashniy folder: %DOMASHNIY%
        rmdir /s /q "%DOMASHNIY%"
        if errorlevel 1 (
            echo Error: Failed to delete %DOMASHNIY%
            pause
            exit /b
        )
    )
    echo Creating folder for Domashniy: %DOMASHNIY%
    mkdir "%DOMASHNIY%"
    if errorlevel 1 (
        echo Error: Failed to create %DOMASHNIY%
        pause
        exit /b
    )

    echo Copying contents from %PLAYER_0% to %DOMASHNIY%...
    xcopy "%PLAYER_0%\*.*" "%DOMASHNIY%\" /E /H /C /I /Y
    if errorlevel 1 (
        echo Error: Failed to copy from %PLAYER_0% to %DOMASHNIY%
        pause
        exit /b
    )

    echo Copying contents from %SHKIPPER% to %PLAYER_0%...
    xcopy "%SHKIPPER%\*.*" "%PLAYER_0%\" /E /H /C /I /Y
    if errorlevel 1 (
        echo Error: Failed to copy from %SHKIPPER% to %PLAYER_0%
        pause
        exit /b
    )

    echo Deleting Shk1pper folder: %SHKIPPER%
    rmdir /s /q "%SHKIPPER%"
    if errorlevel 1 (
        echo Error: Failed to delete %SHKIPPER%
        pause
        exit /b
    )

    echo Saves successfully updated! Shk1pper is now the host.
)

if "%CHOICE%"=="2" (
    echo You selected Domashniy as the host.

    if not exist "%DOMASHNIY%" (
        echo Error: Folder %DOMASHNIY% not found!
        pause
        exit /b
    ) else (
        echo Folder Domashniy found: %DOMASHNIY%
    )
    if not exist "%PLAYER_0%" (
        echo Error: Folder %PLAYER_0% not found!
        pause
        exit /b
    ) else (
        echo Folder Player_0 found: %PLAYER_0%
    )

    if exist "%SHKIPPER%" (
        echo Deleting old Shk1pper folder: %SHKIPPER%
        rmdir /s /q "%SHKIPPER%"
        if errorlevel 1 (
            echo Error: Failed to delete %SHKIPPER%
            pause
            exit /b
        )
    )
    echo Creating folder for Shk1pper: %SHKIPPER%
    mkdir "%SHKIPPER%"
    if errorlevel 1 (
        echo Error: Failed to create %SHKIPPER%
        pause
        exit /b
    )

    echo Copying contents from %PLAYER_0% to %SHKIPPER%...
    xcopy "%PLAYER_0%\*.*" "%SHKIPPER%\" /E /H /C /I /Y
    if errorlevel 1 (
        echo Error: Failed to copy from %PLAYER_0% to %SHKIPPER%
        pause
        exit /b
    )

    echo Copying contents from %DOMASHNIY% to %PLAYER_0%...
    xcopy "%DOMASHNIY%\*.*" "%PLAYER_0%\" /E /H /C /I /Y
    if errorlevel 1 (
        echo Error: Failed to copy from %DOMASHNIY% to %PLAYER_0%
        pause
        exit /b
    )

    echo Deleting Domashniy folder: %DOMASHNIY%
    rmdir /s /q "%DOMASHNIY%"
    if errorlevel 1 (
        echo Error: Failed to delete %DOMASHNIY%
        pause
        exit /b
    )

    echo Saves successfully updated! Domashniy is now the host.
)

if not "%CHOICE%"=="1" if not "%CHOICE%"=="2" (
    echo Error: Invalid choice! Please select 1 or 2.
)

pause
