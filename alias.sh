alias dir='ls -ABgtr  --color=always --group-directories-first --dereference-command-line -S'
alias net='sudo watch ss -tonp'
alias netstat='ss'
alias disktree='ncdu'
alias edit='featherpad'
alias temps='sensors'
alias diff="sync&&git diff --patch --patience --diff-filter=M --ignore-all-space  --no-index --word-diff=color  --color=always -b "
alias stack="sudo perf top -g"
alias trace='strace -C -S time '
alias vars='printenv'
alias cls='reset'
alias procs='sudo ps -aux'
alias up='sudo apt-get install --only-upgrade '
alias strings='strings --all'
alias rem='sudo apt purge'
alias ins='sudo apt-get install'
alias asm='objdump -SCl -Mintel'
alias ed='mousepad'
alias lock='echo "screen lock ON:to disable type pass+enter";xtrlock'
alias io='sudo iotop -a'
alias shut='sudo shutdown -h now'
alias reb='sudo shutdown -r now'
alias where='locate'
alias repocopy='git clone --recursive '
function bashrc(){
ed ~/.bashrc  
wait
source ~/.bashrc
}
