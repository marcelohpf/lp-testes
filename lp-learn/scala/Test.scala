import scala.collection.mutable.{ArrayBuffer,HashMap,StringBuilder}
object Test{

    var stest = HashMap[String,Double]() 

    def addh(func:String,fim:Long,ini:Long){
        stest.put(func,(fim-ini)/1000000000.0);
    }

    def fib(n:Int):Int={
        if( n==0 || n==1 )
            return 1;
        return fib(n-1) + fib(n-2);
    }

    def soma(n:Int,i:Int):Int={
        if(i==0)
            return n;
        return soma(n+1,i-1);
    }
    /*
#def laco():
#    i=1000000
#    while(i!=0):
#        i-=1
#    return i
    */

    def pmatriz(n:Int){
        val x = Array.fill(n){ Array.fill(n){1}}
        val y = Array.fill(n){ Array.fill(n){1}}
        var z = Array.fill(n){ Array.fill(n){0}}
        val ini = System.nanoTime();
        for (i <- 0 to n-1){
            for (j <- 0 to n-1){
                for ( k <- 0 to n-1)
                    z(i)(j)+=x(i)(k)*y(k)(j);
            }
        }
        val fim = System.nanoTime();
        addh("pmatriz",fim,ini);
    }
    
    def strconcat(o:Int){
        var n = o
        var s=new StringBuilder("s");
        val ini = System.nanoTime();
        while(n!=0){
            s++="abcebc";
            n -= 1;
        }
        val fim = System.nanoTime();
        addh("strconcat",fim,ini);
    }
    def strprocess(o:Int){
        var n=o
        var s=new StringBuilder("");
        val ini = System.nanoTime();
        while(n!=0){
            s++="trbuhs";
            var find = s.indexOf("buh")
            while(find!= -1){
                s.replace(find,find+3,"   ")
                find=s.indexOf("buh",find+3)
            }
            n -= 1;
        }
        val fim = System.nanoTime();
        addh("strprocess",fim,ini);
    }
    def lappend(o:Int){
        var n =o
        var l = new ArrayBuffer[Int]();
        val ini = System.nanoTime();
        while(n!=0){
            l.append(n);
            n -= 1;
        }
        val fim = System.nanoTime();
        addh("lappend",fim,ini);
    }
    def linsert(o:Int):ArrayBuffer[Int]={
        var n=o
        var l = new ArrayBuffer[Int]();
        val ini = System.nanoTime();
        while(n!=0){
            l.insert(0,n);
            n -= 1;
        }
        val fim = System.nanoTime();
        addh("linsert",fim,ini);
        return l;
    }
    def lremove(l: ArrayBuffer[Int]){
        var le=l.length;
        val ini = System.nanoTime();
        while(l.nonEmpty){
            l.remove(le/2);
            le -= 1;
        }
        val fim = System.nanoTime();
        addh("lremove",fim,ini);
    }
    
    def tryCatch(n:Int){
        var ini = System.nanoTime();
        var k = n
        while(k != 0){

            try{
                k -= 1
            }catch{
                case e: Exception => ""
            }
        }
        var fim = System.nanoTime();
        var o = n
        addh("trycatch",fim,ini)
        ini = System.nanoTime();
        while(o!=0){
            try{
                throw new Exception("Teste")
            }catch{
                case e: Exception => {o -= 1}
            }
        }
        fim = System.nanoTime();
        addh("trycatche",fim,ini);

    }
    def to_json(times:ArrayBuffer[HashMap[String,Double]]):String={
        var json="["   
        var pri=true;
        times.foreach( time =>
            if(!pri)
                json+=","+to_json(time)
            else{
                json+=to_json(time)
                pri=false;
            }
        )
        json+="]"
        return json
    }
    def to_json(maps:HashMap[String,Double]):String = {
        var pri=true;
        var json="{"
        maps.foreach{ case(func,tim) =>
            if(!pri)
                json+=",\"" + func + "\":" + tim
            else{
                json+= "\"" + func + "\":" + tim
                pri=false;
            }
        }
        json+="}"
        return json
    }
    def main(args: Array[String]){
        val prec = args(0).toInt
        val fibo = args(1).toInt
        val tc = args(2).toInt
        val mtr = args(3).toInt
        val stg = args(4).toInt
        val lst = args(5).toInt
        val precision = new ArrayBuffer[HashMap[String,Double]]()
        for( i <- 0 to prec-1){
            var ini = System.nanoTime();
            fib(fibo);
            var fim = System.nanoTime();
            addh("fib",fim,ini);
                tryCatch(tc)
            pmatriz(mtr);
            strconcat(stg);
            strprocess(stg);
            lappend(lst);
            val l = linsert(lst);
            lremove(l);
            precision.append(stest.clone);
            stest.clear
        }
        println(to_json(precision))
    }
}
