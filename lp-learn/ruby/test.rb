require 'json'
require 'time'


$rtest={}
def addh(func,fim,ini)
    $rtest[func]=fim-ini
end
def fib(n)
    if( n==0 or n==1 )
        return 1
    end
    return fib(n-1) + fib(n-2)
end
def soma(n,i)
    if(i==0)
        return n
    end
    return soma(n+1,i-1)
end
#def laco():
#    i=1000000
#    while(i!=0):
#        i-=1
#    return i

def pmatriz(n)
    x=Array.new(n,Array.new(n,1))
    y=Array.new(n,Array.new(n,1))
    z=Array.new(n,Array.new(n,1))
    ini=Time.now
    for i in 0...n
        for j in 0...n
            for k in 0...n
                z[i][j]+=x[i][k]*y[k][j]
            end
        end
    end
    fim=Time.now
    addh('pmatriz',fim,ini)
end
def strconcat(n)
    s="s"
    ini=Time.now
    while(n!=0)
        s+="abcebc"
        n-=1
    end
    fim=Time.now
    addh('strconcat',fim,ini)
end
def strprocess(n)
    s=""
    ini=Time.now
    while(n!=0)
        s+="trbuhs"
        s=s.gsub("buh","   ")
        n-=1
    end
    fim=Time.now
    addh('strprocess',fim,ini)
end 
def lappend(n)
    l=[]
    ini=Time.now
    while(n!=0)
        l.push(n)
        n-=1
    end
    fim=Time.now
    addh('lappend',fim,ini)
end
def linsert(n)
    l=[]
    ini=Time.now
    while(n!=0)
        l.insert(0,n)
        n-=1
    end
    fim=Time.now
    addh('linsert',fim,ini)
    return l
end
def lremove(l)
    le=l.length
    ini=Time.now
    while(l.empty?)
        l.delete_at((le/2).to_i)
        le-=1
    end
    fim=Time.now
    addh('lremove',fim,ini)
end

if __FILE__ == $0
    prec = ARGV[0].to_i
    fibo = ARGV[1].to_i
    sm = ARGV[2].to_i
    mtr = ARGV[3].to_i
    stg = ARGV[4].to_i
    lst = ARGV[5].to_i
    precision = []
    prec.times {
        ini=Time.now
        fib(fibo)
        fim=Time.now
        addh('fib',fim,ini)
        begin
            ini=Time.now
            soma(fibo,sm)
            fim=Time.now
        rescue
            ini,fim=0,0
        end
        addh('soma',fim,ini)
        pmatriz(mtr)
        strconcat(stg)
        strprocess(stg)
        lappend(lst)
        l = linsert(lst)
        lremove(l)
        linsert(lst)
        precision.push($rtest)
        $rtest={}
    }
    puts(JSON.generate(precision))
end
