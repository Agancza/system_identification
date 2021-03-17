
addpath('../tools/general');
addpath('../tools/identification');

%% Test small square matrix
A = randn(3);
B = w_orthonormalize_linear(A, ones(1,3));
C = gram_schmidt(A, ones(1,3));

assert(all(abs(B*B' - eye(3)) <= 100*eps, 'all'));
assert(all(abs(C*C' - eye(3)) <= 100*eps, 'all'));

%##########################################################################
%% Test large square matrix
A = randn(60);
B = w_orthonormalize_linear(A, ones(1,60));
C = gram_schmidt(A, ones(1,60));

assert(all(abs(B*B' - eye(60)) <= 10000*eps, 'all'));
assert(all(abs(C*C' - eye(60)) <= 10000*eps, 'all'));

%##########################################################################
%% Test rectangular small matrix
A = randn(3, 6);
B = w_orthonormalize_linear(A, ones(1,6));
C = gram_schmidt(A, ones(1,6));

assert(all(abs(B*B' - eye(3)) <= 100*eps, 'all'));
assert(all(abs(C*C' - eye(3)) <= 100*eps, 'all'));
%##########################################################################  
%% Test rectangular large matrix
A = randn(30, 600);
B = w_orthonormalize_linear(A, ones(1,600));
C = gram_schmidt(A, ones(1,600));

assert(all(abs(B*B' - eye(30)) <= 100*eps, 'all'));
assert(all(abs(C*C' - eye(30)) <= 100*eps, 'all'));

%##########################################################################
%% Test rectangular small matrix with weighting
A = randn(3, 6);
w = rand(1, 6);
B = w_orthonormalize_linear(A, w);
C = gram_schmidt(A, w);

assert(all(abs(w.*B*B' - eye(3)) <= 100*eps, 'all'));
assert(all(abs(w.*C*C' - eye(3)) <= 100*eps, 'all'));

%##########################################################################
%% Test rectangular large matrix with weighting
A = randn(30, 600);
w = rand(1, 600);
B = w_orthonormalize_linear(A, w);
C = gram_schmidt(A, w);

assert(all(abs(w.*B*B' - eye(30)) <= 100*eps, 'all'));
assert(all(abs(w.*C*C' - eye(30)) <= 100*eps, 'all'));
