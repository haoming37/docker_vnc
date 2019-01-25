#!/bin/bash

# you can change password and/or geometry size to you want.



USER_ID=$(id -u)
GROUP_ID=$(id -g)

# グループを作成する
if [ x"$GROUP_ID" != x"0" ]; then
    groupadd -g $GROUP_ID $USER_NAME
fi

# ユーザを作成する
if [ x"$USER_ID" != x"0" ]; then
    useradd -d /home/$USER_NAME -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME
fi

# パーミッションを元に戻す
sudo chmod u-s /usr/sbin/useradd
sudo chmod u-s /usr/sbin/groupadd

sudo chown -R $USER_ID:$GROUP_ID /home/$USER_NAME/
xvnc='x11vnc -passwd password -env FD_GEOM=1600x900 -env FD_PROG=openbox-session -create'

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx

exec $xvnc
#if [ $1 ]; then
#    if [ $1 == xvnc ]; then
#	exec $xvnc
#    elif [ $1 == novnc ]; then
#	$xvnc -bg &
#	exec ~/noVNC/utils/launch.sh --listen 5901 --vnc localhost:5900 --ssl-only
#    fi
#else
#    exec bash
#fi
