function F = polynomial_basis(m, k)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes m-th order normalized polynomial basis

% Inputs:
% m  basis' order
% k  window context length

% Returns:
% F  matrix of basis functions, (m, 2k+1)

    F = ones(m, 2*k+1);
    t = (-k:1:k) ./ k;
    for ii = 2:1:m
	F(ii, :) = F(ii-1, :) .* t;
    end
end