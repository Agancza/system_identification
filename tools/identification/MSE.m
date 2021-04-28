function J = MSE(theta_o, theta)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes the MSE score for the estimates of time-varying system
%
% Inputs:
% theta_o   true parameters trajectories
% theta     estimated trajectories
%
% Returns:
% J         the MSE score
%##########################################################################
    
    err = abs(theta_o - theta);
    J = mean(err.^2, 2);
end