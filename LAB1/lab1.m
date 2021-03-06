clc
close all
clear all

%Analiza ukladu otwartego
%PKT 1
s = tf('s');
k = 7; T1 = 2; T2 = 2 * T1; T3 = 3 * T1;
K = k / (1 + s * T1) / (1 + T2 * s) / (1 + T3 * s);
%PKT 2
zpk(K)
[zera, bieguny, wzm] = zpkdata(K, 'v')
[Licz, Mian] = tfdata(K, 'v')
pzmap(K);
ss(K)
[A, B, C, D]=tf2ss(Licz, Mian)
%PKT 3
figure;
step(K, 'r');
grid on;
title(['Odp. skokowa, k=' num2str(k)]);
ylabel('wyjsie ukladu');
xlabel('czas t');
%PKT 4
figure, nyquist(K);
figure, bodeplot(K);
%Analiza ukladu zamknietego
%PKT5
sisotool(K);
grid on;
rlocus(K);
grid on;
%PKT6
kr = 0.5 * 1.43
%PKT7
[DA, DF] = margin(kr*K)
%PKT8
minreal(K)
%PKT9

K2 = K * kr;
K_wy = minreal( K2 / (1 + K2) );
K_we = minreal( 1 / (1 + K2) );
figure;
zpk(K_wy);
zpk(K_we);
step(K_wy, 'k', K_we, '--m');
legend('y(t)','e(t)');
%PKT10
figure;
bodemag(K_we);
title('q(\omega)');
figure;
bodemag(K_wy);
title('M(\omega)');

%SIMULINK
a1 = 6;
h10 = 0;
c1 = 4;
q10 = 5;
res = sim('LAB1old',10);
figure, plot(res.tout, res.Flow); grid;
title('Flow');
xlabel('Czas');
ylabel('Wyjscie q12');
figure, plot(res.tout, res.Level1); grid;
title('Level1');
xlabel('Czas');
ylabel('Wyjscie h1');

%nie wpisywa� warto�ci w simulinku (wszystko w skrypcie nawet sta�e)
%prze�wiczy� tworzenie

% Raport -> Teczka z raportem
% Stworzy� model T1,T2,T3 > 0
% Pokaza� �e potrafimy u�ywa� tych funkcji
% Sformatowa�, opisa�, pokaza�, ...
% Raport umie�ci� w teczce