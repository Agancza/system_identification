function y = AR(a, v)
%########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%########################################################################
% Function computes T samples of an time-varying n-th order autoregressive
% process

% Inputs:
% a   matrix of coefficients, dimensions: (n, T)
% v   process noise variance (or vector of variances in time)

% Returns:
% y   single realization of an AR process, (1, T)
%########################################################################

    [n, T] = size(a);
    e = randn(1, T);
    e = e .* sqrt(v);
    y = zeros(1, T);
    for t = (n+1):1:T
      y(t) = y(t-1:-1:t-n)*a(:,t) + e(t);
    end
end