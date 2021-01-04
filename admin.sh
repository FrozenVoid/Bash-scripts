#renice process_name
function pnice(){
sudo renice $1 $(pgrep $2)
}
#get top cpu processes sorted by use
alias pstop='ps -auxk -pcpu|less'
#kill top process
function pktop(){
pkill $(ps -auxk pcpu|tail -n 1|grep -oE '[^ ]+$')
}
