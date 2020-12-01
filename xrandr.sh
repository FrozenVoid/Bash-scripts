#reset display
function resd(){
curdisplay=$(xrandr |egrep '.* (connected)' -o|sed 's/connected//')
xrandr --output $curdisplay  --auto --scale 1x1 --rotate normal --reflect normal --gamma 1.0:1.0:1.0 --brightness 1.0
}

#setxscale 1.5 1.0
function setxscale(){
curdisplay=$(xrandr |egrep '.* (connected)' -o|sed 's/connected//')
xrandr --output $curdisplay --scale $1x$2
echo "Press Ctrl-C to confirm new scale, otherwise wait 10sec"
sleep 10 && xrandr --output $curdisplay --scale 1x1
}

#setxgamma 1.0 1.0 1.0
function setxgamma(){
curdisplay=$(xrandr |egrep '.* (connected)' -o|sed 's/connected//')
xrandr --output $curdisplay --gamma $1:$2:$3
echo "Press Ctrl-C to confirm new gamma, otherwise wait 10sec"
sleep 10 && xrandr --output $curdisplay --gamma 1.0:1.0:1.0
}

#setxbright 0.85
function setxbright(){
curdisplay=$(xrandr |egrep '.* (connected)' -o|sed 's/connected//')
xrandr --output $curdisplay --brightness $1
echo "Press Ctrl-C to confirm new brightness, otherwise wait 10sec"
sleep 10 && xrandr --output $curdisplay --brightness 1.0
}

#       width height hz
#setdmode 1280 1024 60
function setdmode(){
curdisplay=$(xrandr |egrep '.* (connected)' -o|sed 's/connected//')
nextdmode=$(cvt $1 $2 $3 |grep Modeline | sed 's/Modeline//')
nextdname=$(echo $nextdmode|awk '{print $1}')
xrandr --newmode $nextdmode
xrandr --addmode $curdisplay $nextdname
xrandr --output $curdisplay --mode $nextdname
echo "Press Ctrl-C to confirm new mode, otherwise wait 10sec"
sleep 10 && resd
}
