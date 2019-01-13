#include<iostream.h>
#include<math.h>
#include <stdlib.h>
using namespace std;
double gaussrand()
{
    static double V1, V2, S;
    static int phase = 0;
    double X;
    if ( phase == 0 ) {
        do {
            double U1 = (double)rand() / RAND_MAX;
            double U2 = (double)rand() / RAND_MAX;
            V1 = 2 * U1 - 1;
            V2 = 2 * U2 - 1;
            S = V1 * V1 + V2 * V2;
        } while(S >= 1 || S == 0);
        X = V1 * sqrt(-2 * log(S) / S);
    } else
        X = V2 * sqrt(-2 * log(S) / S);  
    phase = 1 - phase;
    return X;
}

double randomExponential(double lambda)
{
    double pV = 0.0;
    while(true)
    {
        pV = (double)rand()/(double)RAND_MAX;
        if (pV != 1)
        {
            break;
        }
    }
    pV = (-1.0/lambda)*log(1-pV);
    return pV;
}

double wblrand(double A,double B)
{
double r=0.0,pv;
pv = (double)rand()/(double)RAND_MAX;
r =A*pow(-log(pv),1./B);
return r;
}
void main()
{
	double a,b,c,d,e,f,g,h,k,l,j;
	char m,n;
	double x[5000],y[5000];
while(1)
{
cout<<"请输入应力分布类型"<<endl<<"A.正态分布  B.对数正态分布  C.指数分布  D.威布尔分布"<<endl;
while(1)
{
cin>>n;
switch(n)
{
case 'A' :
	cout<<"σ="<<endl;
	cin>>a;
	cout<<"μ="<<endl;
	cin>>b;
	for(int i=0;i<5000;i++)
   {
     double xx=gaussrand();	
     x[i]=b+sqrt(a)*xx;
   }
	break;
case 'B' :
    cout<<"σ="<<endl;
	cin>>a;
	cout<<"μ="<<endl;
	cin>>b;
	for(int i=0;i<5000;i++)
   {
     double xx=gaussrand();	
     x[i]=exp(b+sqrt(a)*xx);
   }
	break;
case 'C' :
    cout<<"λ="<<endl;
	cin>>c;
	for(int i=0;i<5000;i++)
   {
     double xx=randomExponential(c);	
     x[i]=xx;
   }
	break;
case 'D' :
    cout<<"t0="<<endl;
	cin>>d;
	cout<<"m="<<endl;
	cin>>e;
		for(int i=0;i<5000;i++)
   {
     double xx=wblrand(d,e);	
     x[i]=xx;
   }
	break;
default:
    cout<<"请输入A、B、C中的一个"<<endl;
    continue;
}
break;
}
cout<< "请输入强度分布类型" <<endl<< "A.正态分布  B.对数正态分布  C.指数分布  D.威布尔分布" <<endl;
while(1)
{
cin>>m;
switch(m)
{
case 'A' :
	cout<<"σ="<<endl;
	cin>>f;
	cout<<"μ="<<endl;
	cin>>g;
		for(int i=0;i<5000;i++)
   {
     double xx=gaussrand();	
     y[i]=g+sqrt(f)*xx;
   }
	break;
case 'B' :
    cout<<"σ="<<endl;
	cin>>f;
	cout<<"μ="<<endl;
	cin>>g;
		for(int i=0;i<5000;i++)
   {
     double xx=gaussrand();	
     y[i]=exp(g+sqrt(f)*xx);
   }
	break;
case 'C' :
    cout<<"λ="<<endl;
	cin>>h;
		for(int i=0;i<5000;i++)
   {
     double xx=randomExponential(h);	
     y[i]=xx;
   }
	break;
case 'D' :
    cout<<"t0="<<endl;
	cin>>k;
	cout<<"m="<<endl;
	cin>>l;
		for(int i=0;i<5000;i++)
   {
     double xx=wblrand(k,l);	
     y[i]=xx;
   }
	break;
default:
    cout<<"请输入A、B、C中的一个"<<endl;
    continue;
}
break;
}
j=0.0;
for(int i=0;i<5000;i++)
{
if(y[i]>x[i])
j++;
}
double r;
r=j/5000.;
cout<<"模拟系统可靠度为"<<r<<endl;
continue;
}
}

