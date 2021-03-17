clear all;
clc;
close all;

addpath('../tools');

T = 5000;
a = 0.8*ones(1, T);

y = AR(a, 1);

theta_s = zeros(1, T+1);
theta = zeros(1, T+1);
y = [0; y];
P_s = 100000;
P = 100000;
lambda = 0.99;

Lt = ceil(1 / (1-  lambda));


for t = 2:1:T+1
    phi = y(t-1);
    [theta_s(:, t), P_s, ~] = sqrt_EWLS_step(y(t), phi, theta_s(:, t-1), P_s, lambda, 0);
    [theta(:, t), P, ~] = EWLS_step(y(t), phi, theta(:, t-1), P, lambda, 0);
end


%% Test MSE of EWLS 
e_s = a(Lt:end) - theta_s(Lt+1:end);
e = a(Lt:end) - theta(Lt+1:end);

error_s = e_s*e_s' / (T - Lt);
error = e*e' / (T - Lt);

assert(error_s <= 0.01);
assert(error <= 0.01);

%% Test EWLS and squared root EWLS

e = theta_s(Lt:end) - theta(Lt:end);
error = e*e' / (T - Lt);
assert(error <= eps);

%% Test Preestimates
preest0 = indirect_preestimates(y(2:end), y, @EWLS_step, 1, 0.8, 0);
preest1 = indirect_preestimates(y(2:end), y, @EWLS_step, 1, 0.8, 1);
e0 = mean(preest0) - a(1);
e1 = mean(preest1) - a(1);
assert(abs(e0) <= 0.1)
assert(abs(e1) <= 0.1);