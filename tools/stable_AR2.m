function [y, k] = stable_AR2(a, v)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Generates T samples of a stable time-varying 2-nd order AR process

% Inputs:
% a     matrix of time-varying coefficients, (2, T)
% v     variance of a driving noise, scalar or (1, T)

% Returns:
% y     realization of an stable 2-nd order AR process
% k     scaling coefficients for parameters (if stabilization was not
%       needed k = 1)
%##########################################################################

    A = zeros(1, 3);
    A(1) = max(a(1,:) + a(2,:));
    A(2) = max(a(2,:) - a(1,:));
    A(3) = max(abs(a(2,:)));
    k = max(A);

    if k > 1
        p = k * 1.1;
        a = a / p;
        v = v / p;
    end

    y = AR(a, v);
end