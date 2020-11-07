alias webread="sed 's/<[^a][^>]*>/ /g ; /^$/d' |  sed 's/  */ /g' |sed 's/&nbsp/ /g' |fmt --width=$(tput cols) | less " 
alias webreadq="sed 's/<span xml:base[^>]*>/\n\n\n/g' | sed 's/<[^a][^>]*>/ /g ' | sed 's/&nbsp/ /g' |  less " 
alias webload='wget -O - -o /dev/null '
alias youall='youtube-dl  '
alias youvid='youtube-dl -f bestvideo'
alias youaud='youtube-dl -f bestaudio '
alias quakes='wget -O - -o /dev/null "https://www.emsc-csem.org/service/rss/rss.php?typ=emsc&magmin=5" | webreadq '

function w(){
webload "$1" |  webread
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

 youtube-dl --no-call-home -f 'best[height<=480]' "$1"  -o /tmp/
}
