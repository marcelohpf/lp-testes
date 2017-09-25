import time
from datetime import datetime
import sys
import json

pytest={}
def addh(func,fim,ini):
    pytest[func.__name__]= (fim-ini).total_seconds()

def fib(n):
    if( n==0 or n==1 ):
        return 1
    return fib(n-1) + fib(n-2)
def soma(n,i):
    if(i==0):
        return n
    return soma(n+1,i-1)

#def laco():
#    i=1000000
#    while(i!=0):
#        i-=1
#    return i

def pmatriz(n):
    x=[[1 for i in range(n)] for j in range(n)]
    y=[[1 for i in range(n)] for j in range(n)]
    z=[[0 for i in range(n)] for j in range(n)]
    ini=datetime.now()
    for i in range(n):
        for j in range(n):
            for k in range(n):
                z[i][j]+=x[i][k]*y[k][j]
    fim=datetime.now()
    addh(pmatriz,fim,ini)
def strconcat(i):
    s="s"
    ini=datetime.now()
    while(i!=0):
        s+="abcebc"
        i-=1
    fim=datetime.now()
    addh(strconcat,fim,ini)
def strprocess(i):
    s=""
    ini=datetime.now()
    while(i!=0):
        s+="trbuhs"
        s=s.replace("buh","   ")
        i-=1
    fim=datetime.now()
    addh(strprocess,fim,ini)
 
def lappend(i):
    l=[]
    ini=datetime.now()
    while(i!=0):
        l.append(i)
        i-=1
    fim=datetime.now()
    addh(lappend,fim,ini)
def linsert(i):
    l=[]
    ini=datetime.now()
    while(i!=0):
        l.insert(0,i)
        i-=1
    fim=datetime.now()
    addh(linsert,fim,ini)
    return l
def lremove(l):
    le=len(l)
    ini=datetime.now()
    while(l):
        l.pop(int(le/2))
        le-=1
    fim=datetime.now()
    addh(lremove,fim,ini)

if (__name__=="__main__"):
    prec = int(sys.argv[1])
    fibo = int(sys.argv[2])
    sm = int(sys.argv[3])
    mtr = int(sys.argv[4])
    stg = int(sys.argv[5])
    lst = int(sys.argv[6])
    precision=[]

    for i in range(prec):
        ini=datetime.now()
        fib(fibo)
        fim=datetime.now()
        addh(fib,fim,ini)
        try:
            ini=datetime.now()
            soma(fibo,sm)
            fim=datetime.now()
        except:
            ini=datetime.now()
            fim=ini
        addh(soma,fim,ini)
        pmatriz(mtr)
        strconcat(stg)
        strprocess(stg)
        lappend(lst)
        l = linsert(lst)
        lremove(l)
        precision.append(pytest)
        pytest={}
    print(json.dumps(precision))
