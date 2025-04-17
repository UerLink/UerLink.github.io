@echo off
chcp 65001

REG ADD HKCU\CONSOLE /f /v VirtualTerminalLevel /t REG_DWORD /d 1 >nul 2>&1
set "RED=^[[91m"
set "GREEN=^[[92m"
set "YELLOW=^[[93m"
set "BLUE=^[[94m"
set "RESET=^[[0m"

REM 实际使用时，需将 ^[ 替换为 Esc 字符（ASCII 27）
REM 在文本编辑器中按 Ctrl+[ 或输入字符 0x1B

echo %RED%这是红色文本%RESET%
echo %GREEN%这是绿色文本%RESET%
echo %YELLOW%这是黄色文本%RESET%
echo %BLUE%这是蓝色文本%RESET%

echo %GREEN%info%GREEN%  复制obsidian文件夹内容
rmdir /s /q "D:\UerLinkBlog\source\"
echo     ▷ 已删除“D:\UerLinkBlog\source\”文件夹
mkdir "D:\UerLinkBlog\source\"
echo     ▷ 已新建空的source文件夹

xcopy /e "C:\Users\UerLi\OneDrive\个人管理\知识库\我的博客" "D:\UerLinkBlog\source\" /Y /Q >nul 2>&1

echo     ▷ 复制完成

echo %GREEN%info%GREEN%  上传至GitHub服务器
echo     ▷ 清除缓存已禁用
cd /d  D:\UerLinkBlog
title HexoGo
cd 
%call hexo clean%
echo     ▷ 重新生成...
call hexo g
echo     ▷ 开始上传GitHub...
call hexo d

 
echo %GREEN%info%GREEN%  同步至git服务器
rmdir /s /q "D:\GitSpace\uerlinkblog\public\"
echo     ▷ 已删除“D:\GitSpace\uerlinkblog\public\”文件夹
mkdir "D:\GitSpace\uerlinkblog\public"
echo     ▷ 已新建空的public文件夹
xcopy /e "D:\UerLinkBlog\public\" "D:\GitSpace\uerlinkblog\public\" /Y /Q >nul 2>&1
cd /d  D:\GitSpace\uerlinkblog
echo     ▷ 同步中...
git add .
git commit -m "博客同步提交"
git push origin master

echo %GREEN%info%GREEN%  预览服务启动
cd /d  D:\UerLinkBlog
call hexo s


pause