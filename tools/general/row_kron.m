function C = row_kron(A, B)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Performes Kronecker product on two row vectors, is faster then the 
% general purpose matlab "kron" command.
%
% Inputs:
% A     first input vector, (1, n)
% B     second input vector, (1, m)
%
% Returns:
% C     Kronecker product of A x B, (1, nm)
%##########################################################################
    n = length(A);
    m = length(B);
    C = ones(1, n*m);
    for ii = 1:1:n
        C((ii-1)*m+1:ii*m) = A(ii)*B;
    end
end