function C = col_kron(A, B)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Performes Kronecker product on two column vectors, is faster then the 
% general purpose matlab "kron" command.
%
% Inputs:
% A     first input vector, (n, 1)
% B     second input vector, (m, 1)
%
% Returns:
% C     Kronecker product of A x B, (nm, 1)
%##########################################################################
    n = length(A);
    m = length(B);
    C = ones(n*m, 1);
    for ii = 1:1:n
        C((ii-1)*m+1:ii*m) = A(ii)*B;
    end
end