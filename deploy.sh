#!/bin/bash

# 构建静态文件
hugo

# 进入生成的文件夹
cd public

# 初始化Git仓库并提交所有文件
git init
git add .
git commit -m "Deploying to GitHub Pages"

# 推送到GitHub Pages仓库
git remote add origin https://github.com/moloxiao/blog.git
git branch -M gh-pages
git push -u origin gh-pages --force

# 返回项目根目录
cd ..
