function w = generate_weight(k, type)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Generates weighting sequence
%
% Inputs:
% k     window half width
% type  "cos" for cosinusoidal, "hann" for Hann window and "rect" for
%       rectangular
%
% Returns:
% w   weighting sequence (1, 2*k+1)
%##########################################################################
    if strcmp(type, "cos")
        t = (-k:1:k);
        w = cos(pi*t / (2*k));
    elseif strcmp(type, "hann")
        w = hann(2*k+1).';
    else
        w = ones(1, 2*k+1);
    end
end