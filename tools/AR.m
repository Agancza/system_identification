function y = AR(a, v)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes T samples of an time-varying n-th order autoregressive
% process
%
% Inputs:
% a   matrix of coefficients, dimensions: (n, T)
% v   process noise variance (or vector of variances in time)
%
% Returns:
% y   single realization of an AR process, (1, T)
%##########################################################################

    [n, T] = size(a);
    e = randn(T, 1);
    e = e .* sqrt(v);
    y = zeros(T, 1);
    for t = (n+1):1:T
      y(t) = a(:,t)'*y(t-1:-1:t-n) + e(t);
    end
end