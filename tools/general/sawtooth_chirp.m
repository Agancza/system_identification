function y = sawtooth_chirp(T, L, alpha)
%##########################################################################
% Author: Artur Gancza
% email: artur.gancza@pg.edu.pl
%##########################################################################
% Generates sawtooth chirp
%
% Inputs:
% T         signal length
% L         initial length
% alpha     decaying factor, if < 1, then chirp frequency increses,
%           otherwise decreses
%
% Returns:
% y         sawtooth chirp (1 x T)
%##########################################################################
    y = zeros(1,T);
   
    i = 1;
    A = -1;
    B = -1*A;
   
    t1 = 0;
    t2 = L;
    
    for t=1:T

        u    = (t-t1)/(t2-t1);
        y(t) = (1-u)*A + u*B;
        
        if (y(t) == 1 || y(t) == -1) && t>1
            
            A  = B;
            B  = (-1)*A;
            t1 = t2;
            t2 = t2 + round(L*alpha^i);
            i = i+1;
        end

    end

end