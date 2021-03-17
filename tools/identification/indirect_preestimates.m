function [theta, e] = indirect_preestimates(y, u, ewls_func, n, lambda, mode)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Computes indirect preestimates of a time-varying AR/FIR system parameters
%
% Inputs:
% y         output signal (T x 1);
% u         input signal (n x 1) or (T+n x 1);
% ewls_func pointer to a function computing ewls estimates;
% n         model order;
% lambda    forgetting constant from range (0, 1];
% mode      0 for transient mode, 1 for steady-state mode
%
% Outputs:
% theta     preestimated parameters (n x T);
% e         vector of preestimation errors (1 x T);
%##########################################################################
    P = 10e06*eye(n);
    T = length(y);
    if length(u) == T
        u = [zeros(n, 1); u];
    end
    theta = zeros(n, T);
    e = zeros(n, 1);
    if mode == 0
        Lt = [1, lambda + 1];
    else
        Lt = [1, 1] / (1 - lambda);
    end
    theta_ewls = zeros(n, 2);
    for t = 1:1:T
        phi = u(t+n-1:-1:t);
        [theta_ewls(:,end), P, ~] = ewls_func(y(t), phi, theta_ewls(:,1), P, lambda, 0);
        theta(:, t) = Lt(end)*theta_ewls(:,end) - lambda*Lt(1)*theta_ewls(:,1);
        e(t) = y(t) - theta(:,t)'*phi;
        theta_ewls(:,1) = theta_ewls(:,end);
        Lt(1) = Lt(end);
        Lt(end) = lambda*Lt(1) + 1;
    end
end
    