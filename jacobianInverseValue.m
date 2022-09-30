% J is the jacobian matrix
% n is the number of equations
% X is the values for which we will calculate the value of jacobian inverse
% matrix
% A is the matrix of variables
function J_inv=jacobianInverseValue(J,n,A,X)
    j_inv=zeros(size(J));
    for k=1:n
        for l=1:n
%             calculating and storing the values for jacobain inverse
%             matrix
           j_inv(k,l)= subs(J{k,l},A,X);
        end
    end
    J_inv=inv(j_inv);
end