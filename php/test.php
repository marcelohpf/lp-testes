<?php
            $phptest = [];
            function addh($func,$fim, $ini){
                global $phptest;
                $phptest[$func]= ($fim-$ini);
           }
            function fib($n){
                if( $n==0 || $n==1 )
                    return 1;
                return fib($n-1) + fib($n-2);
            }

            function soma( $n, $i){
                if($i==0)
                    return $n;
                return soma($n+1,$i-1);
            }
    /*
#def laco():
#    i=1000000
#    while(i!=0):
#        i-=1
#    return i
    */

            function pmatriz($n){
                $x = array_fill(0,$n,array_fill(0,$n,1)); 
                $y = array_fill(0,$n,array_fill(0,$n,1));
                $z = array_fill(0,$n,array_fill(0,$n,1));
                $ini = microtime(true);
                for ($i=0; $i<$n;$i++){
                    for ($j=0; $j<$n; $j++){
                        for ($k=0; $k<$n; $k++)
                            $z[$i][$j]+=$x[$i][$k]*$y[$k][$j];
                    }
                }
                $fim = microtime(true);
                addh("pmatriz",$fim,$ini);
            }
            
            function strconcat($n){
                $s="s";
                $ini = microtime(true);
                while($n!=0){
                    $s.="abcebc";
                    $n-=1;
                }
                $fim = microtime(true);
                addh("strconcat",$fim,$ini);
            }
            function strprocess($n){
                $s="";
                $ini = microtime(true);
                while($n!=0){
                    $s.="trbuhs";
                    $s = str_replace("buh","   ",$s);
                    $n-=1;
                }
                $fim = microtime(true);
                addh("strprocess",$fim,$ini);
            }
            function lappend($n){
                $l = [];
                $ini = microtime(true);
                while($n!=0){
                    array_push($l,$n);
                    $n-=1;
                }
                $fim = microtime(true);
                addh("lappend",$fim,$ini);
            }
            function linsert($n){
                $l= [];
                $ini = microtime(true);
                while($n!=0){
                    array_splice($l,0,0,$n);
                    $n-=1;
                }
                $fim = microtime(true);
                addh("linsert",$fim,$ini);
                return $l;
            }
            function lremove($l){
                $le=sizeOf($l);
                $ini = microtime(true);
                while($le){
                    array_splice($l,$le/2,1);
                    $le -= 1;
                }
                $fim = microtime(true);
                addh("lremove",$fim,$ini);
            }

            function main($args){
                $prec = (int) $args[1];
                $fibo =(int) $args[2];
                $sm = (int) $args[3];
                $mtr = (int) $args[4];
                $stg =(int) $args[5];
                $lst =(int) $args[6];
                global $phptest;
                $precision=[];
                for($caso=0;$caso<$prec;$caso++){ 
                    $ini = microtime(true);
                    fib($fibo);
                    $fim = microtime(true);
                    addh("fib",$fim,$ini);
                    try{
                        $ini = microtime(true);
                        soma($fibo,$sm);
                        $fim = microtime(true);
                    }catch(Exception $e){
                        $fim=0;
                        $ini=0;
                    }
                    addh("soma",$fim,$ini);
                    pmatriz($mtr);
                    strconcat($stg);
                    strprocess($stg);
                    lappend($lst);
                    $l = linsert($lst);
                    lremove($l);
                    $precision[$caso]=$phptest;
                    $phptest=[];
                }
                echo json_encode($precision);
            }
       main($argv);
?> 
