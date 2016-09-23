@echo off

echo ================[ Starting packing mod to all platforms
call pack.cmd linux
echo.
call pack.cmd mac
echo.
pack.cmd win
echo.

echo ================[ Pack mod to all platforms done.
