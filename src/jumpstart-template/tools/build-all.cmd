@echo off
echo ================[ Starting building mod to all platforms
call build.cmd linux
echo.
call build.cmd mac
echo.
call build.cmd win
echo.
echo ================[ Build mod to all platforms done.
