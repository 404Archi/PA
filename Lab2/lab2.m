% a, G, H, R [m]
% h [m]
% q [m^3/s]
% c [(m^(5/2))/s]

clear all;
close all;
clc;

R1 = 1.59577;
H1 = 17;
c1 = 4.12311;
A1 = pi .* R1 .^ 2;

R2 = 2.98541;
H2 = 17;
c2 = 2.91548;
A2 = pi .* R2 .^ 2;

dq1 = 1;
q10 = c2 * sqrt(H2/2);
h10 = (q10 / c1) .^ 2;
h20 = 1/2 .* H2;

sim('lab2s');

% a2 = R2/H2 * h2^2 * pi;
% v2 = 1/3 * a2 * h2

% R2/H2 * h2^3 * pi * 1/3 = v2;
% v2 = 1/3 * R2/H2 * pi * 3*h2^2 * h2'(t);
% 1/3 * R2/H2 * pi * 3*h2^2 * h2'(t) - c2*sqrt(h2(t)) + q12(t) = 0
% h2'(t) = ( c2*sqrt(h2(t)) - q12(t) ) * H2 / ( R2 * pi * h2^2 )


