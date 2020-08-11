function G = gram_schmidt(F, w)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Computes w-orthonormal basis from given matrix of basis functions.
% Function uses Gram-Schmidt procedure

% Inputs:
% F     matrix of row vectors to normalize, (m, T), m <= T
% w     row vector of weighting coefficients, (1, T)
% Outputs:
% G     w-orthonormal basis, (m, T)
%##########################################################################

    F = F';
    G = F;
    m = size(F, 2);
    ws = sqrt(w');
    G(:,1) = G(:,1) / norm(ws.*G(:,1));
    for jj = 2:1:m
      for ii = 1:1:jj-1
        G(:,jj) = G(:,jj) - G(:,ii)*(G(:,ii)'*(w'.*F(:,jj)));
      end
    G(:,jj) = G(:,jj) / norm(ws.*G(:,jj));
    end
    G = G';
end