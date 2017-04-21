export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1

xrdb -merge ~/.Xresources
fcitx
exec i3
