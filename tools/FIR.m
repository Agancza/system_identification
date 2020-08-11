function [y, snr_y] = FIR(b, u, v)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes T samples of an time-varying n-th FIR system contaminated
% with Gaussian white noise.
% 
% Inputs:
% b   matrix of system parameters, dimensions: (n, T)
% u   vector of steering signal, (1, T)
% v   desired variance of Gaussian noice, sclaar or (1, T)
% 
% Returns:
% y        single realization of n-th order FIR process
% snr_y    signal to noise ratio for the process [dB]
%##########################################################################

  [n, T] = size(b);
  e = randn(1, T);
  e = e .* sqrt(v);
  y = zeros(1, T);
  for t = (n+1):1:T
    y(t) = u(t:-1:t-n+1)*b(:,t);
  end
  snr_y = snr(y, e);
  y = y + e;
end