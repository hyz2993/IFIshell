@echo off
echo put this script into the sip folder and run
pause
cd %~dp0
echo %~dp0
echo check start, press any key to move on to next
for /d /r %~dp0 %%i in (oe*) do (
	tree /f %%i 
pause
)
pause