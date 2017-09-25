#!/bin/bash

PREC=1
FIBO=25
TRYCATCH=900
MATRIZ=10
STRING=1000
LIST=100

g++ c++/test.cpp -o c++/test.out &&javac java/Test.java && pushd scala && scalac Test.scala && popd
echo "compilados"

echo '{' > resultados.txt
for mode in rapido normal pesado
do
    if [[ $mode = "rapido"  ]];then
        echo \"$mode\": >> resultados.txt
    else
        FIBO=$(( $FIBO+1 ))
        TRYCATCH=$(( $TRYCATCH+10))
        MATRIZ=$(( $MATRIZ+100 ))
        STRING=$(( $STRING*10 ))
        LIST=$(( $LIST*10 ))
        echo ,\"$mode\": >> resultados.txt
    fi
    echo '{ "python3":' >> resultados.txt
    python3 python/test.py $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> resultados.txt

    echo ',"python2":' >> resultados.txt
    python2 python/test.py $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> resultados.txt

    echo ',"ruby":' >> resultados.txt
    ruby ruby/test.rb $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> resultados.txt

    echo ',"php5":' >> resultados.txt
    php php/test.php $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> resultados.txt

    echo ',"c++":' >> resultados.txt
    ./c++/test.out $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> resultados.txt

    echo ',"java":' >> resultados.txt
    pushd java && java Test $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> ../resultados.txt && popd

    echo ',"scala":' >> resultados.txt
    pushd scala && scala Test $PREC $FIBO $TRYCATCH $MATRIZ $STRING $LIST >> ../resultados.txt && popd
    
    echo "}" >>resultados.txt
done
echo "}" >> resultados.txt
python -c 'import json; h=json.loads(open("resultados.txt","r").read()); open("resultados.txt","w").write(json.dumps(h,indent=4,separators=(",",": ")));'
