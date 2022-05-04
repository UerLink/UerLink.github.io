start /min /w mshta vbscript:setTimeout("window.close()",1000)
echo The InputValue is %1
set name=%1
echo %name%
start /d "C:\Program Files\Typora"   Typora.exe  "C:\SaveData\GitHubWeb\UerLinkBlog\source\_posts\%name%.md"
pause