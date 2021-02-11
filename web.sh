#web scripts
#add with . ~/Scripts/web.sh
alias webread="sed 's/<[^a][^>]*>/ /g ; /^$/d' |  sed 's/  */ /g' |sed 's/&nbsp/ /g' |fmt --width=$(tput cols) | less "
alias webtags="sed 's@<\([^<>][^<>]*\)>\([^<>]*\)</\1>@\2@g'"
alias webstrip="sed -e 's/<[script|style][^>]*>//g'  |less"
alias webreadq="sed 's/<span xml:base[^>]*>/\n\n\n/g' | sed 's/<[^a][^>]*>/ /g ' | sed 's/&nbsp/ /g' |  less "
alias webload='wget -O - -o /dev/null '
function ytrnd(){
#https://github.com/FrozenVoid/C-techniques/blob/master/rng/rnduri.c
echo "https://www.youtube.com/watch?v="$(webload "https://www.youtube.com/results?search_query=$(rnduri)&search=Search"|egrep --max-count=1 -o 'videoId\":\"[^\"]+'|tail -1|sed 's/videoId...//g')
}

alias youall='youtube-dl   --no-call-home '
alias youvid='youtube-dl  --no-call-home -f bestvideo'
alias youaud='youtube-dl  --no-call-home -f bestaudio '
alias quakes='wget -O - -o /dev/null "https://www.emsc-csem.org/service/rss/rss.php?typ=emsc&magmin=5" | webreadq '

function w(){
webload "$1" |  webstrip
}
function wsearch(){
queryddg="$@"
webload "https://lite.duckduckgo.com/lite/?q=$queryddg" |  webread
}
function wmedia(){
feh "$1"
}
function tubesearch(){
queryyt="$@"
webload "https://m.youtube.com/results?search_query=$queryyt" | webread

}
function wvideo(){

 youtube-dl --no-call-home -f 'best[height<=480]' "$1"
}
function wrndvideo(){

 youtube-dl --no-call-home -f 'best[height<=480]' "$(ytrnd)"
}
alias news='w https://mobile.reuters.com/'
