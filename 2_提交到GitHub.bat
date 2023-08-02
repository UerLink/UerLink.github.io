@echo off
chcp 65001
echo "▬▬▬▬▬▬▬▬▬▬▬▬▬▶ 已切换中文编码"
echo "▬▬▬▬▬▬▬▬▬▬▬▬▬▶ 清除缓存已禁用！如果博客样式出现问题，请重新开启"
cd /d  D:\UerLinkBlog
title HexoGo
cd 
%call hexo clean%
echo "▬▬▬▬▬▬▬▬▬▬▬▬▬▶ 博客开始重新生成:"
call hexo g
echo "▬▬▬▬▬▬▬▬▬▬▬▬▬▶ 博客开始上传GitHub:"
call hexo d
echo "▬▬▬▬▬▬▬▬▬▬▬▬▬▶ 博客预览服务启动:"
call hexo s
pause