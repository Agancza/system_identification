function [G, Q] = w_orthonormalize_linear(F, w)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Computes w-orthonormal basis from given matrix of basis functions.
% Function uses the linear transform
%
% Inputs:
% F     matrix of row vectors to normalize, (m, T), m <= T
% w     row vector of weighting coefficients, (1, T)
% Outputs:
% G     w-orthonormal basis, (m, T)
% Q     projection matrix, (m, m)  
%##########################################################################
    H = (w.*F)*F';
    Q = chol(H, 'lower');
    G = Q \ F;
end