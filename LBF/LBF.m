function [theta, epsilon] = LBF(y, u, n, k, m, basis_f, weight_type, criterion)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Function computes LBF estimates (so far batch version only) for different
% values of m and k and evaluates error statistics for a given criterion
% (not ready yet). It works for both complex- and real-valued signals.
% 
% Inputs:
% y             output sequence (T, 1)
% u             input signal (T, 1)
% n             model order
% k             list of window half-width
% m             list of basis orders in descending order!
% basis_f       pointer to the basis function generator
% weight_type   type of the weighting sequance (for details see
%               generate_weight.m)
% criterion
% 
% Returns:
% theta         cell of LBF estimates
% epsilon       cell of error for a given statistics
%##########################################################################

    T = length(y);
    if length(u) == T
        u = [zeros(n-1, 1); u];
    end
    
    M = length(m);
    m = sort(m, 'desc');
    K = length(k);

    theta = cell(K, M);
    epsilon = cell(K, M);
    
    for ki = 1:1:K
        kt = k(ki);
        for mi = 1:1:M
            mt = m(mi);
            theta{ki, mi} = zeros(n, T);
            epsilon{ki, mi} = zeros(1, T);
            
            w = generate_weight(kt, weight_type);
            if mi == 1
                f = basis_f(mt, kt);
                f = w_orthonormalize_linear(f, w);
            else
                f = f(1:mt, :);
            end
            F_0 = eye_kron(n, f(:,kt+1)');
            
            for t = kt+1:1:T-kt
                P = zeros(n*mt);
                p = zeros(n*mt, 1);
                for ii = -kt:1:kt
                    id = ii+kt+1;
                    psi = col_kron(u(t+ii+n-1:-1:t+ii), f(:, id));
                    P = P + w(id)*(psi*psi');
                    p = p + w(id)*conj(y(t+ii))*psi;
                    if ii == 0 
                        psi_0 = psi;
                    end
                end
                
                alpha = P\p;
                theta{ki, mi}(:, t) = F_0*alpha;
                epsilon{ki, mi}(t) = y(t) - alpha'*psi_0;
            end
        end
    end                        
end