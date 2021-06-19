#!/usr/bin/bash
if [ ! -f "/data/BOOTLOGO" ]; then
    /usr/bin/touch /data/BOOTLOGO
    dd if=/data/openpilot/installer/splash.img of=/dev/block/bootdevice/by-name/splash
    echo =================================================================
    echo Comma boot logo change complete
    mount -o rw,remount /system
    cp /data/openpilot/installer/bootanimation.zip /system/media/
    mount -o ro,remount /system
    
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh
