@echo off
SETLOCAL
:: ====================================================================================================================
::  DayZ Mod Manager & Server Launcher v2.0
::  by: DayZ n' Chill 
:: ====================================================================================================================

::  This script efficiently manages DayZ mods and facilitates launching a DayZ Diagnostic Server.
::  The primary aim of this script is to simplify mod development, and server management.
::  Especially for users who may not be experienced modders or developers.

::  References:
::  https://community.bistudio.com/wiki/DayZ:Modding_Basics,
::  https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging 

::  WARNING!!! Do not edit this file unless you know what you are doing. 
::  Use the Start.bat in the root folder to set up your work enviornment
:: ====================================================================================================================

:: Load variables from Globals.cfg and set them with quoted values
for /f "tokens=1* delims== eol=#" %%i in (..\..\..\Utils\Shared\Globals.cfg)  do (
    set "%%i=%%j"
)

:: ====================================================================================================================
::  Server Specific Configuration: 
:: ====================================================================================================================

::  The Mods Section below are for mods that are specific to this server only. If you want to test with multiple maps,
::  and or servers, you will need to edit the globals.cfg in the Util/Shared folder.
SET "MODS=P:\Mods\@DeerIsle;"

:: ====================================================================================================================
::  NO NEED TO MODIFY ANYTHING ELSE, UNLESS YOU KNOW WHAT YOU'RE DOING!!!
:: ====================================================================================================================
SET "CLIENTLOGSDIR=%PROJECTDIR%\Servers\!ClientDiagLogs"
SET "MISSIONDIR=%PROJECTDIR%\Missions\Custom\empty.deerisle"
SET "SERVERCFG=%PROJECTDIR%\Servers\Others\DeerIsle\serverDZ.cfg"
SET "PROFILES=%PROJECTDIR%\Servers\Others\DeerIsle\Profiles"

:: ====================================================================================================================
::  Server and Game Initialization
::  You can change the -mission=%MISSIONDIR%" Variable with -mission=%EXPMISSIONDIR%" to use Experimental Mission
:: ====================================================================================================================

:: Start local server.
start /D "C:\Program Files (x86)\Steam\steamapps\common\DayZServer" DayZServer_x64.exe "-mod=%GLOBALMODS%%MODS%" -filePatching -server "-profiles=%PROFILES%" "-mission=%MISSIONDIR%" "-config=%SERVERCFG%" 
@REM :: Play on local server.

:: To Solve for BattlEye Kicking you from the game. Join the Lan from the DayZ Luancher. I will work on a fix. 

@REM start /D "%GAMEDIR%\" DayZ_x64.exe "-profiles=%CLIENTLOGSDIR%" "-mod=%GLOBALMODS%%MODS%" -nosplash -noPause -noBenchmark -filePatching -doLogs -scriptDebug=true -connect=127.0.0.1 -port=2302 BattlEye=1