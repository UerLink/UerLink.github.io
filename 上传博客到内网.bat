@echo off
chcp 65001
echo ▬▬▬▬▬▬▬▶ 已切换中文编码

echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【文件夹内容复制】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
rmdir /s /q "D:\UerLinkBlog\source\"
echo ▬▬▬▬▬▬▬▶ 已删除“D:\UerLinkBlog\source\”文件夹
mkdir "D:\UerLinkBlog\source\"
echo ▬▬▬▬▬▬▬▶ 已新建空的source文件夹

xcopy /e "C:\Users\UerLi\OneDrive\个人管理\知识库\我的博客" "D:\UerLinkBlog\source\" 

echo ▬▬▬▬▬▬▬▶ 已复制obsidian的内容到source文件夹

echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【hexo生成静态html文件并上传GitHub】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
echo ▬▬▬▬▬▬▬▶ 清除缓存已禁用
cd /d  D:\UerLinkBlog
title HexoGo
cd 
%call hexo clean%
echo ▬▬▬▬▬▬▬▶ 博客开始重新生成
call hexo g

echo ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬【hexo内容复制到IIS-Web】▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
rmdir /s /q "D:\IIS-Web\Blog\"
echo ▬▬▬▬▬▬▬▶ 已删除“D:\IIS-Web\Blog\”文件夹
mkdir "D:\IIS-Web\Blog\"
echo ▬▬▬▬▬▬▬▶ 已新建空的Blog文件夹
xcopy /e "D:\UerLinkBlog\public\" "D:\IIS-Web\Blog\" 
echo ▬▬▬▬▬▬▬▶ 已复制hexo的内容到IIS-Web\Blog文件夹

echo ▬▬▬▬▬▬▬▶ 博客预览服务启动
call hexo s


pause




