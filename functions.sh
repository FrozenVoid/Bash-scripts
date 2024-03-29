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
gcc -Ofast -march=native -mtune=native  -fverbose-asm  -pipe -Wall -fno-exceptions  -fwhole-program -fwrapv -fno-trapping-math -Wno-unused  -S $*
}


function c(){
curname=$1
bname=$(fname "$1")
shift
#gcc -Ofast -march=native -mtune=native  -pipe -Wall -fno-exceptions  -fwhole-program -fwrapv -fno-trapping-math -Wno-unused  $curname -o$bname $*
gcc -O2 -gdwarf-3 -mtune=native -fwhole-program -ffast-math   -fwrapv -fno-trapping-math -pipe -Wall -fno-exceptions  -Wno-unused $curname -o$bname $*
}

function ada(){
curname=$1
bname=$(fname "$1")
shift
gcc -O3 -S -march=native -mtune=native  -pipe -Wall   -fwhole-program -fno-trapping-math -Wno-unused  $curname -o$bname $*
}



function fortran(){
curname=$1
bname=$(fname "$1")
shift
gfortran -fopenacc -frecursive -ffast-math -cpp -fmax-errors=3 -fexternal-blas -static-libgfortran -flto   -Wextra -Wsurprising -fdefault-integer-8 -fdefault-real-10 -fdefault-double-8 -ffree-line-length-none -fmax-identifier-length=63 -fall-intrinsics -fbackslash -fimplicit-none  -O3 -march=native -mtune=native  -pipe -Wall -fno-exceptions  -fwhole-program -fwrapv -fno-trapping-math -Wno-unused  $curname -o$bname $*
}



function bashrc(){
ed ~/.bashrc
wait
source ~/.bashrc
}
