function cloneuser(){
curl -s https://api.github.com/users/$1/repos?per_page=200 | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone --recursive
}

function uprepos(){
find . -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull
}


alias repocopy='git clone --recursive '
alias diff="sync && git diff --patch --patience --diff-filter=M --ignore-all-space  --no-index --word-diff=color  --color=always -b "
