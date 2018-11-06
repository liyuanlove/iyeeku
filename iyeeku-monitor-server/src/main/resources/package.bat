@echo off

set one=%1
set panTmp=E:\auto_Oracle\tmp\iyeeku04
set srcHome=C:\iyeeku\iyeeku-monitor-server
set srcPageTmp=C:\iyeeku\iyeeku-monitor-server\target

echo.
echo *************************************************************
echo ?????????,??iyeeku-monitor-server??????????
echo *************************************************************
echo.

if "%one%"=="-n" (
	echo.
) else (
	c:
	cd %srcHome%
	echo ******************????*********************
	echo.
	call mvn clean

	echo.
	echo ******************???????????class??*********************
	echo.

	call mvn package

	echo.
	echo ****************??????????????????*******************
	echo.
)

if exist %panTmp% (
	e:
	cd E:\auto_Oracle\utils
	java DeleteDirectory E:\auto_Oracle\tmp\iyeeku04

	call md %panTmp%
) else (
	call md %panTmp%
)

echo.
echo ???????????????????
echo.
xcopy %srcPageTmp%\classes %panTmp% /s
md %panTmp%\lib
xcopy E:\auto_Oracle\resource %panTmp%\lib

echo.
echo ******************????*********************


