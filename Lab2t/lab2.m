% a, G, H, R [m]
% h [m]
% q [m^3/s]
% c [(m^(5/2))/s]

clear all;
close all;
clc;

R1 = 1.59577;
H1 = 17;
C1 = 4.12311;
A1 = pi .* R1 .^ 2;

R2 = 2.98541;
H2 = 17;
C2 = 2.91548;
A2 = pi * (R2 ^ 2);

dq1 = 1;
q10 = C2 * sqrt(H2/2);
h10 = (q10 / C1) .^ 2;
h20 = 1/2 .* H2;

T3 = 4;

s = tf('s');
K = (2 * sqrt(h10));
K = K  * ((pi * R2^2 * h20^2 * s / H2^2) + (C2 / (2 * sqrt(h20))));
K = K * ((A1 * s) + (C1 / (2 * sqrt(h10))));

K = C1 / K;

Kw = 1/(T3*s+1);

kr = 2.702;

Kr_p = kr/(1+0*s);
Kr_pi = 

zpk(K)

[x,y] = tfdata(K, 'v');
[x1, y1] = tfdata(Kw, 'v');
[x2, y2] = tfdata(Kr_p,'v');

res = sim('lab2s', 150);

% figure;
% hold on;
% grid on;
% plot(res, simout1, 'r');
% plot(res, simout, 'g--');
% xlabel('time');
% ylabel('h2');

% a2 = R2/H2 * h2^2 * pi;
% v2 = 1/3 * a2 * h2

% R2/H2 * h2^3 * pi * 1/3 = v2;
% v2 = 1/3 * R2/H2 * pi * 3*h2^2 * h2'(t);
% 1/3 * R2/H2 * pi * 3*h2^2 * h2'(t) = q12(t) - c2*sqrt(h2(t))
% h2'(t) = ( -c2*sqrt(h2(t)) + q12(t) ) * H2^2 / ( R2^2 * pi * h2^2 )


