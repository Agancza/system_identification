function B = eye_kron(n, A)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Performes Kronecker product of an identity matrix and given matrix A, is
% faster than the general purpose matlab "kron" command.
%
% Inputs:
% n     dimension of the identity matrix
% A     input matrix, (m1, m2)

% Returns:
% B     Kronecker product of an identity matrix and A, (nm1, nm2)
%##########################################################################
    [m1, m2] = size(A);
    B = zeros(n*m1, n*m2);
    for ii = 1:1:n
        B((ii-1)*m1+1:ii*m1, (ii-1)*m2+1:ii*m2) = A;
    end
end