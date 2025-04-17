@echo off
chcp 65001
echo ▬▬▬▬▬▬▬▶ 已切换中文编码

echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【obsidian文件夹内容复制】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
rmdir /s /q "D:\UerLinkBlog\source\"
echo ▬▬▬▬▬▬▬▶ 已删除“D:\UerLinkBlog\source\”文件夹
mkdir "D:\UerLinkBlog\source\"
echo ▬▬▬▬▬▬▬▶ 已新建空的source文件夹

xcopy /e "C:\Users\UerLi\OneDrive\个人管理\知识库\我的博客" "D:\UerLinkBlog\source\" /Y /Q >nul 2>&1

echo ▬▬▬▬▬▬▬▶ 已复制obsidian的内容到source文件夹

echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【hexo生成静态html文件并上传GitHub】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
echo ▬▬▬▬▬▬▬▶ 清除缓存已禁用
cd /d  D:\UerLinkBlog
title HexoGo
cd 
%call hexo clean%
echo ▬▬▬▬▬▬▬▶ 博客正在重新生成
call hexo g
echo ▬▬▬▬▬▬▬▶ 博客开始上传GitHub
call hexo d


echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【hexo上传至git服务器】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
rmdir /s /q "D:\GitSpace\uerlinkblog\public\"
echo ▬▬▬▬▬▬▬▶ 已删除“D:\GitSpace\uerlinkblog\public\”文件夹
mkdir "D:\GitSpace\uerlinkblog\public"
echo ▬▬▬▬▬▬▬▶ 已新建空的public文件夹
xcopy /e "D:\UerLinkBlog\public\" "D:\GitSpace\uerlinkblog\public\" /Y /Q >nul 2>&1
echo ▬▬▬▬▬▬▬▶ 已复制hexo的内容到D:\GitSpace\uerlinkblog\public\文件夹
cd /d  D:\GitSpace\uerlinkblog
git add .
git commit -m "博客同步提交"
git push origin master

echo ▬▬▬▬▬▬▬▶ 博客预览服务启动
cd /d  D:\UerLinkBlog
call hexo s


pause