#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  run.sh
# 
#         USAGE:  ./run.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Habib Quliyev (), graypit@gmail.com
#       COMPANY:  Pronet LLC
#       VERSION:  1.0
#       CREATED:  03/17/2020 01:36:38 PM +04
#      REVISION:  ---
#===============================================================================

prepare_env(){
mkdir -p /root/procall/fs/conf /root/procall/fs/records /root/procall/fs/scripts
mkdir -p /root/procall/fs/pg_data /root/procall/fs/logs
tar -xf fs_conf.tar.bz2 -C /root/procall/fs/
echo "alias procall_cli='docker exec -it freeswitch fs_cli'" >> $HOME/.bash_profile
echo "alias procall_bash='docker exec -it freeswitch bash'" >> $HOME/.bash_profile
source $HOME/.bash_profile
}

get_images(){
mkdir images && cd images
wget http://10.234.100.55/fs_image.tar.bz2
wget http://10.234.100.55/pgsql_image.tar.bz2
tar -xf fs_image.tar.bz2 && tar -xf pgsql_image.tar.bz2
docker load < procall_latest && rm -rf procall_latest
docker load < pgsql_image && rm -rf pgsql_image && cd ..
}

build_and_start(){
docker-compose build
docker-compose up -d
}

prepare_env && get_images && build_and_start
