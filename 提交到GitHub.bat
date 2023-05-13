@echo off
cd /d  D:\UerLinkBlog
title HexoGo
cd 
call hexo clean
call hexo g
call hexo d
call hexo s
pause