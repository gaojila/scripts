#!/bin/bash
set -e

FILE_NAME=`basename $0`

#说明
show_usage="usage:$FILE_NAME [-d develop_path,-b backup_path -f file_path]"

#参数
# 本地仓库目录
opt_develop_path=""

# 备份目录
opt_backup_path=""

# 部署文件
opt_file_path=""


GETOPT_ARGS=`getopt -o d:b:f: -al develop_path:,backup_path:,file_path: -- "$@"`
eval set -- "$GETOPT_ARGS"
#获取参数
while [ -n "$1" ]
do
        case "$1" in
                -d|--develop_path) opt_develop_path=$2; shift 2;;
                -b|--backup_path) opt_backup_path=$2; shift 2;;
                -f|--opt_file_path) opt_file_path=$2; shift 2;;
                --) break ;;
                *) echo $1,$2,$show_usage; break ;;
        esac
done

# 判断参数
if [[ -z $opt_develop_path || -z $opt_backup_path || -z $opt_file_path ]]; then
        echo -e $show_usage
        exit 0
fi

if [ "$opt_develop_path" = "$opt_backup_path" ]; then
  echo 'develop_path eq backup_path'
  exit 0
fi

# 判断部署文件是否存在
if [ ! -f $opt_file_path ]; then
    echo "$opt_file_path file does not exist"
    exit 0
fi

# 判断文件夹是否存在
if [ ! -x $opt_develop_path ]; then
  mkdir $opt_develop_path
fi

# 判断文件夹是否存在
if [ ! -x $opt_backup_path ]; then
  mkdir $opt_backup_path
fi

# 文件夹不是空的
if [ ! "`ls -A $opt_develop_path`" = "" ]; then
  cd $opt_develop_path
  tar -cf $opt_backup_path/$(date +%Y%m%d%H%M).tar.gz $opt_develop_path/*
  rm -rf $opt_develop_path/*
fi
# 解压文件
tar -xf $opt_file_path -C $opt_develop_path

echo "publish success!"
