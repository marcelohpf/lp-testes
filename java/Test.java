import java.util.*;
import java.lang.StringBuilder;

public class Test{
    static HashMap<String,Double> jtest = new HashMap<String,Double>();

    static void addh(String func,Long fim, Long ini){
        jtest.put(func, (fim-ini)/1000000000.0);

    }

    static  int fib( int n){
        if( n==0 || n==1 )
            return 1;
        return fib(n-1) + fib(n-2);
    }

    static int soma(int n,int i){
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

    static void pmatriz(int n){
        int x[][]=new int[n][n];
        int y[][]=new int[n][n];
        int z[][]=new int[n][n];
        for(int i=0;i<n;i++){
            Arrays.fill(x[i],1);
            Arrays.fill(y[i],1);
        }
        Long ini = System.nanoTime();
        for (int i=0; i<n;i++){
            for (int j=0; j<n; j++){
                for (int k=0; k<n; k++)
                    z[i][j]+=x[i][k]*y[k][j];
            }
        }
        Long fim = System.nanoTime();
        addh("pmatriz",fim,ini);
    }
    
    static void strconcat(int n){
        StringBuilder s=new StringBuilder("s");
        Long ini = System.nanoTime();
        while(n!=0){
            s.append("abcebc");
            n-=1;
        }
        Long fim = System.nanoTime();
        addh("strconcat",fim,ini);
    }
    static void strprocess(int n){
        StringBuilder s=new StringBuilder("");
        Long ini = System.nanoTime();
        int find=0;
        while(n!=0){
            s.append("trbuhs");
            find=s.indexOf("buh");
            while(find!= -1){
                s.replace(find,3+find,"   ");
                find=s.indexOf("buh",find+3);
            }
            n-=1;
        }
        Long fim = System.nanoTime();
        addh("strprocess",fim,ini);
    }
    static void lappend(int n){
        ArrayList<Integer> l = new ArrayList<Integer>();
        Long ini = System.nanoTime();
        while(n!=0){
            l.add(n);
            n-=1;
        }
        Long fim = System.nanoTime();
        addh("lappend",fim,ini);
    }
    static ArrayList<Integer> linsert(int n){
        ArrayList<Integer> l= new ArrayList<Integer>();
        Long ini = System.nanoTime();
        while(n!=0){
            l.add(0,n);
            n-=1;
        }
        Long fim = System.nanoTime();
        addh("linsert",fim,ini);
        return l;
    }
    static void lremove(ArrayList<Integer> l){
        int le=l.size();
        Long ini = System.nanoTime();
        while(!l.isEmpty()){
            l.remove(le/2);
            le-=1;
        }
        Long fim = System.nanoTime();
        addh("lremove",fim,ini);
    }
 
    static void tryCatch(int n){
        int k = n;
        Long ini = System.nanoTime();
        while(k!=0){
            try{
                k--;
            }catch(Exception e){}
        }
        Long fim = System.nanoTime();
        addh("trycatch",fim,ini);
        ini = System.nanoTime();
        while( n!= 0){
            try{
                throw new Exception("Teste");
            }catch(Exception e){
                n--;
            }
        }
        fim = System.nanoTime();
        addh("trycatche",fim,ini);
    }

    static void to_json(ArrayList<HashMap<String,Double>> times){
        StringBuilder json = new StringBuilder("[");
        boolean pri=true;
        for(HashMap<String,Double> time : times ){
            if(!pri)
                json.append( ","+to_json(time));
            else{
                json.append( to_json(time));
                pri=false;
            }
        }
        json.append( "]");
        System.out.println(json);
    }
    static String to_json(HashMap<String,Double> time){
        StringBuilder json = new StringBuilder("{");
        boolean pri=true;
        for(String k : time.keySet() ){
            if(!pri)
                json.append( ",\"" + k + "\":" + time.get(k));
            else{
                json.append( "\"" + k + "\":" + time.get(k));
                pri=false;
            }
        }
        json.append("}");
        return json.toString();
    }

    public static void main(String []args){
        int prec = Integer.parseInt(args[0]);
        int fibo = Integer.parseInt(args[1]);
        int tc = Integer.parseInt(args[2]);
        int mtr = Integer.parseInt(args[3]);
        int stg = Integer.parseInt(args[4]);
        int lst = Integer.parseInt(args[5]);
        ArrayList<HashMap<String,Double>> precision = new ArrayList<HashMap<String,Double>>();
        for(int i=0; i<prec;i++){
            Long ini = System.nanoTime();
            fib(fibo);
            Long fim = System.nanoTime();
            addh("fib",fim,ini);
            tryCatch(tc);           
            pmatriz(mtr);
            strconcat(stg);
            strprocess(stg);
            lappend(lst);
            ArrayList<Integer> l = linsert(lst);
            lremove(l);
            precision.add( jtest);
            jtest = new HashMap<String,Double>();
        }
        to_json(precision);
    }
}
