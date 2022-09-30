clc
clearvars
syms x;
f(x)=input('Enter the function: ');
a=input('Enter initial approximation: ');
tlrc=input('Enter tolerance: ');
maxIter=input("Enter max iteration: ");
m=input("Enter the multiplicity: ");
df(x)=diff(f,x);
i=0;
A=zeros(maxIter,5);
u=intmax;
while(abs(f(a))>tlrc && i<=maxIter)
    i=i+1;
    A(i,1)=i;
    A(i,2)=a;
    A(i,3)=f(a);
%     itretive step for newton raphson
    a=a-m*(f(a)/df(a));
    A(i,4)=df(a);
    A(i,5)=a;
end
     sr=A((1:i),1);
     xo=A((1:i),2);
     fo=A((1:i),3);
     dfo=A((1:i),4);
     x1=A((1:i),5);
     table(sr,xo,fo,dfo,x1)
disp(i);
