@echo off 
setlocal enabledelayedexpansion

echo "This shell script is written by Yazhou He.
echo.
echo Usage: batch processing seq2ffv1.py.
echo Please make sure the script has been relocated INTO the psm folder!
echo Please make sure there is NO space in both INPUT and OUTPUT directory!
echo "psm/-
echo "    |- batch_seq2ffv1.py
echo "    |- raw_object_1
echo "    |- raw_object_2
echo "    |- ...
pause

Set /p user=Input user: 
echo Welcome %user%!
echo.

echo (NB: OE number must start with oe and then digits!)
Set /p start_oen=Input start OE number: 
Set oen=%start_oen:oe=%
:: or manually leave the oe number below with just digits (formatted '12345', no 'oe')
:: don't forget to comment the above lines :)
:: oen=
echo Start OE number: oe%oen%
echo.

::Set b_path=Input/Drag batch path:
::echo Batch path: %b_path%
cd %~dp0
echo Batch path (default to the location of the script): %~dp0
Set b_path=%~dp0
echo.

Set /p o_path=Input/Drag output path: 
echo Output path: %o_path%
echo.

echo ***Check above correct and now start...***
echo.
pause

:: change the directory key character here if needed:
:: for now, it refers to '[G]PR_[MK]08_01_0043_08[\]4096[x]3112[\]' 
:: also                  '[G]DB_[MK]08_01_0062_12[\]4096[x]3112[\]'
for /d /r %b_path% %%i in (*x*) do (
    echo Input path: %%i
    echo oe number:  oe!oen!
	Set commd="seq2ffv1.py -i %%i -o %o_path% -oe oe!oen! -user "%user%""
    echo %commd%
    :: manually input the username here, formatted 'Forname\ Surname', ie'Yazhou\ He'
	seq2ffv1.py -i %%i -o %o_path% -oe oe!oen! -user "%user%"
    echo.
	echo ***oe!oen! SIP has procceed. Manually check result.***
	echo.
    Set /a oen+=1
)

echo ***Batch seq2ffv1 finished.***
start %o_path%
pause