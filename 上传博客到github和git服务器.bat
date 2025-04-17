@echo off
chcp 65001

powershell -Command "Write-Host 'ECHO  复制obsidian文件夹内容' -ForegroundColor Yellow"
rmdir /s /q "D:\UerLinkBlog\source\"
echo    ▷  已删除“D:\UerLinkBlog\source\”文件夹
mkdir "D:\UerLinkBlog\source\"
echo    ▷  已新建空的source文件夹

xcopy /e "C:\Users\UerLi\OneDrive\个人管理\知识库\我的博客" "D:\UerLinkBlog\source\" /Y /Q >nul 2>&1

echo    ▷  复制完成
powershell -Command "Write-Host 'ECHO  上传至GitHub服务器' -ForegroundColor Yellow"
echo    ▷  清除缓存已禁用
cd /d  D:\UerLinkBlog
title HexoGo
cd 
%call hexo clean%
echo    ▷  重新生成并上传...
call hexo g
call hexo d

powershell -Command "Write-Host 'ECHO  同步至git服务器' -ForegroundColor Yellow"
rmdir /s /q "D:\GitSpace\uerlinkblog\public\"
echo    ▷  已删除“D:\GitSpace\uerlinkblog\public\”文件夹
mkdir "D:\GitSpace\uerlinkblog\public"
echo    ▷  已新建空的public文件夹
xcopy /e "D:\UerLinkBlog\public\" "D:\GitSpace\uerlinkblog\public\" /Y /Q >nul 2>&1
cd /d  D:\GitSpace\uerlinkblog
echo    ▷  同步中...
git add .
git commit -m "博客同步提交"
git push origin master
powershell -Command "Write-Host 'ECHO  预览服务启动' -ForegroundColor Yellow"
cd /d  D:\UerLinkBlog
call hexo s


pause