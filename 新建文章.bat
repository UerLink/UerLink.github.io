@echo off
set /p name=input page name:
echo name:%name%
echo please wait
hexo new %name% && call typora.bat %name%
pause