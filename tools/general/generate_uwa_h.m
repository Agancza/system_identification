function h = generate_uwa_h(N, T, fs, fm, gamma, nR, mode)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Generates simulated realizations of self-interference channel 
% coefficients in UWA full-duplex communication (realizations of
% amplitudes)
%
% Inputs:
% N         number of realizations
% T         number of samples
% fs        sampling frequency
% fm        cut-off frequency
% gamma     factor describing the decay of parameters variance
% nR        number of realizations
% mode      "real" for real-valued parameters, "complex" for complex-valued
%           ones
%
% Returns:
% h         cell of "nR" time-varying impulse responses of size (N x T)
%##########################################################################
    d = gamma.^((0:1:N-1)');
    if nargin < 6
        nR = 1;
    end
    x = filtered_white_noise(N, T, fs, fm) + 1i*filtered_white_noise(N, T, fs, fm);
    if strcmp(mode, "complex")
        x = x / sqrt(2);
    else
        x = real(x);
    end
    A = randn(N, nR) .* d;
    A = A ./ (sqrt(abs(A)));
    h = cell(1, nR);
    for ii = 1:1:nR
        h{ii} = A(:, ii) .* x;
    end
end