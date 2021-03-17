addpath('../tools/general');

x = randn(20, 2000);
Cx = cov(x.');

y = whiten_data(x);
Cy = cov(y.');

%% Test data whitening
assert(abs(norm(Cx) - 1) > abs(norm(Cy) - 1))