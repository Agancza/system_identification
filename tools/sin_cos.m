function F = sin_cos(m, k)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes sine cosine basis of order m and length 2k+1
%
% Inputs:
% t    t \in [-k; k]
% m    number of basis functions
% k    context length
%
% Returns:
% F    matrix of basis functions, (m, 2k+1)
%##########################################################################
    F = ones(m,1);
    t = -k:1:k;
    for i = 2:1:m
        l = floor(i/2);
        if mod(i,2) == 0
            F(i) = sin(pi*l*t/k);
        else
            F(i) = cos(pi*l*t/k);
        end
    end
end