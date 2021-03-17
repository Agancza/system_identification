function [theta_t, P_t, q_t] = sqrt_EWLS_step(y, phi, theta, P, lambda, q)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Estimates process parameters value for a current moment of time, using 
% Potter's square root version of EWLS algorithm (more robust than the 
% direct version);
%
% Inputs:
% y         signal value in a current moment of time;
% phi       current regression vector, (n, 1);
% theta     previous values of estimated parameters, (n, 1);
% P         square root of the inverse of regression matrix from the
%           previous time moment, (n, n);
% lambda    forgetting constant from range (0, 1];
% q         previous estimate of variance;
%
% Outputs:
% theta_t   estimated parameters values in a current moment of time (n, 1);
% P_t       square root of an inverse of regression matrix in a current 
%           moment of time (n, n);
% q_t       current estimate of variance;
%##########################################################################

    e = y - theta'*phi;
    r = P'*phi;
    bt = lambda + (r'*r);
    al = bt + sqrt(lambda*bt);
    k = P*r/bt;
    theta_t = theta + k*conj(e);
    P_t = (P - bt*k*r'/al)/sqrt(lambda); %Sherman-Morrison formula
    q_t = q + (1 - phi'*k)*abs(e)^2;
end