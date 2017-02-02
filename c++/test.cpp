#include <iostream>
#include <map>
#include <vector>
#include <ctime>
#include <cstring>
#include <cstdlib>

#define N_TO_S 1000000000.0
#define aset(x,n) for(int i=0;i<n;i++){ for (int j =0; j< n; j++){x[i][j]=1;}} 

using namespace std;

map<string,double> ctest;
struct timespec ini,fim;

void addh(string func){
    ctest[func] = (fim.tv_sec-ini.tv_sec)+(fim.tv_nsec-ini.tv_nsec)/N_TO_S;
}

unsigned int fib(unsigned int n){
    if( n==0 or n==1 )
        return 1;
    return fib(n-1) + fib(n-2);
}
int soma(int n,int i){
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

void pmatriz(int n){
    int x[n][n];
    int y[n][n];
    int z[n][n];
    aset(x,n);
    aset(y,n);
    clock_gettime(CLOCK_MONOTONIC,&ini);
    for (int i=0; i<n;i++){
        for (int j=0; j<n; j++){
            for (int k=0; k<n; k++)
                z[i][j]+=x[i][k]*y[k][j];
        }
    }
        clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("pmatriz");
}
void strconcat(int n){
    string s="s";
    clock_gettime(CLOCK_MONOTONIC,&ini);
    while(n!=0){
        s+="abcebc";
        n-=1;
    }
    clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("strconcat");
}
void strprocess(int n){
    string s="";
    size_t f=0;
    clock_gettime(CLOCK_MONOTONIC,&ini);
    while(n!=0){
        s+="trbuhs";
        f = s.find("buh");
        while(f!=string::npos){
            s = s.replace(f,3,"   ");
            f = s.find("buh",f);
        }
        n-=1;
    }
    clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("strprocess");
}
void lappend(int n){
    vector<int> l;
    clock_gettime(CLOCK_MONOTONIC,&ini);
    while(n!=0){
        l.push_back(n);
        n-=1;
    }
    clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("lappend");
}
vector<int> linsert(int n){
    vector<int> l;
    clock_gettime(CLOCK_MONOTONIC,&ini);
    while(n!=0){
        l.insert(l.begin(),n);
        n-=1;
    }
    clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("linsert");
    return l;
}
void lremove(vector<int> l){
    int le=l.size();
    clock_gettime(CLOCK_MONOTONIC,&ini);
    while(!l.empty()){
        l.erase(l.begin()+le/2);
        le-=1;
    }
    clock_gettime(CLOCK_MONOTONIC,&fim);
    addh("lremove");
}
void to_jsons(map<string,double> time){
    cout <<"{";
    for( map<string,double>::iterator cmap = time.begin(); cmap != time.end(); cmap++){
        if( cmap == time.begin()){
            cout << " \"" << cmap->first << "\":" << cmap->second;
        }else{
            cout << ", \"" << cmap->first << "\":" << cmap->second;
        }
    }
    cout << "}";
}

void to_json(vector<map<string,double> > times){
    cout << "[";
    int len=times.size();
    for( int time=0;time<len;time++ ){
        if( !time ) {
            to_jsons(times[time]);
        }else{
            cout << ",";
            to_jsons(times[time]);
        }
    }
    
    cout << "]";
}
int main(int argc,char ** argv){
    int prec = atoi(argv[1]);
    int fibo = atoi(argv[2]);
    int som = atoi(argv[3]);
    int mtr = atoi(argv[4]);
    int stg = atoi(argv[5]);
    int lst = atoi(argv[6]);
    vector<map<string,double> > precision;
    for(int i=0;i<prec;i++){
        clock_gettime(CLOCK_MONOTONIC,&ini);
        fib(fibo);
        clock_gettime(CLOCK_MONOTONIC,&fim);
        addh("fib");
        try{
            clock_gettime(CLOCK_MONOTONIC,&ini);
            soma(fibo,som);
            clock_gettime(CLOCK_MONOTONIC,&fim);
        }catch(...){
            clock_gettime(CLOCK_MONOTONIC,&ini);
            fim=ini;
        }
        addh("soma");
        pmatriz(mtr);
        strconcat(stg);
        strprocess(stg);
        lappend(lst);
        vector<int> l = linsert(lst);
        lremove(l);
        precision.push_back(ctest);
        ctest= map<string,double>();
    }
    to_json(precision);
}
