function text(){
grep -rnI './' -e "$1" -m 127 --after-context=0 --before-context=1
}

function  scrape(){
wget ‐‐execute robots=off ‐‐recursive ‐‐no-parent ‐‐continue ‐‐no-clobber $1
}

function sigcheck(){
gpgv2  $1.sig $1

}

function renext(){
for f in *.$1; do 
mv -- "$f" "${f%.$1}.$2"
done
}

function ownfold(){
sudo chown -R f $1
sudo chmod 777 $1
}

function wind(){
wind_dir=(N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW N)
echo "${wind_dir[$(calc "int($1/22.5)")]}"
}   

