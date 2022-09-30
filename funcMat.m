function mat=funcMat(F,S,A,n)
    mat=zeros(n,1);
    for i=1:n
        mat(i,1)=subs(F{i,1},A,S);
    end
end