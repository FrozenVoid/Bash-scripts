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

function extens(){
bname=$(basename -- "$1")
echo ${bname##*.}
}

function fname(){
bname=$(basename -- "$1")
echo ${bname%.*}
}

function casm(){
gcc -Ofast -march=native -fverbose-asm -pipe -Wall -fno-exceptions  -fwhole-program -fwrapv -fno-trapping-math "$1"  -S
}


function c(){
bname=$(fname "$1")

gcc -Ofast -march=native  -pipe -Wall -fno-exceptions  -fwhole-program -fwrapv -fno-trapping-math "$1" -o$bname
}
