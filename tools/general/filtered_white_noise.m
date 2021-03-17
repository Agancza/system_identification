function y = filtered_white_noise(N, T, fs, fm)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Produces white sequence of filtered white noises
%
% Inputs:
% N     number of realizations
% T     number of samples
% fs    sampling frequency
% fm    cut-off frequency
%
% Returns:
% y     filtered white noise
%##########################################################################
    x = randn(N, T);
    x = whiten_data(x);
    X = fft(x, [], 2);
    n = fm * T / fs + 1;
    X = [X(:,1:n), zeros(N, T-2*n), X(:,T-n+1:end)];
    y = real(ifft(X, [], 2));
    y = whiten_data(y);
end