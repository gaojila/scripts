#!/bin/bash
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : luwenzheng
#   Email         : redgaojila@gmail.com
#   File Name     : deepin_screenshot.sh
#   Last Modified : 2019-09-04 17:35
#   Describe      :
#
# ====================================================


name=$(date +%Y%m%d-%H%M%S)
screenshot=/usr/bin/deepin-screenshot
xclip=/usr/bin/xclip

$screenshot -s ~/图片/ScreenShortcut/$name.png
$xclip -selection clipoard -t "image/png" ~/图片/ScreenShortcut/$name.png
