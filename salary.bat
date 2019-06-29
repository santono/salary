:m
dscroll.exe
if %ERRORLEVEL% EQU 99 goto :mkcopy
goto :exit
:mkcopy
copy D:\tt5\deplhi\DScroll.exe DScroll.exe
if %ERRORLEVEL% EQU 0 goto :m
:exit 
exit