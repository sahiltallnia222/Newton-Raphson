clc;
clearvars;
% user inputs
n=input("Enter the number of equations: ");
tlrn=input("Enter the tolerance: ");
X=input("Enter the initial approximation(in row matrix form):");
maxIter=input("Enter the max number of Iteration: ");
% B is the transpose of X
B=X.';
% U is the matrix in which we will store the values of xk
U=ones(1,n);
U=21474*U;
% define the variables
A=sym("x",[1 n]);
% F is the cell to store the functions
F=cell(n,1);
%equation store
E=cell(n,1);
% In J we are storing the value of diffrentiations (jacobian matrix)
J=cell(n,n);
disp("Variables are:");
S="x1";
% showing the variables to user seperated by commas
for i=2:n
    v=num2str(i);
    y=strcat("x",v);
    S = strcat(S, ",",y);
end
disp(S);
% taking user input for functions
for i=1:n
    s=input("Enter the equations:","s");
    E{i,1}=str2sym(s);
    str=sprintf("@(%s)(%s)",S,s);
    f=str2func(str);
    F{i}=f;
end
for i=1:n
    for j=1:n
        J{i,j}=diff(F{i},A(1,j));
   end
end
disp(J);
k=0;
while(isTrue(U,X,tlrn) && k<=maxIter)
%     calculating the value of jacobian inverse matrix
    J_inv=jacobianInverseValue(J,n,A,X);
    U=X;
    B=X.'-J_inv*funcMat(E,X,A,n);
    X=B.';
    k=k+1;
    mat=U-X;
    err=max(abs(mat(:)));
    fprintf("%f ",X);
    fprintf("                      Err - %d\n",err);
end

