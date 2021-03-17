function y = whiten_data(x)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Whitens the realization of multivariate random variable
%
% Inputs:
% x     single realization of a multivariate random variable (n x T)
%
% Returns:
% y     whitened realization
%##########################################################################
    z = x - mean(x, 2);
    Q = z*z' / size(z,2);
    [V, D] = eig(Q);
    D = sqrt(abs(D));
    S = V*(D\V');
    y = S*z;
end