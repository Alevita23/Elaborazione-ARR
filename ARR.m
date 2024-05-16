clear;
clc;
close all;

load resp.mat;

fs=125;
N=length(resp);
f=(1:N)*fs/N;
t=(1:N)./fs;

Xf=fft(resp);

[peak, n_max]=max(abs(Xf(1:50)));

f_max=f(n_max);
time_max=1/f(n_max);
breath_min=60/time_max;

figure(1)
subplot(211);
plot(t,resp, 'b');
xlabel('Tempo (s)');
ylabel('Resp.(unità arbitraria');
title('segnale respiratorio');
xlim([0 5]);
ylim([0 1.5]);
grid;
subplot(212);
plot(f(2:50), abs(Xf(2:50)), 'r');
xlabel('Frequenza(hz)');
ylabel('abs(Xf)');
title('segnale respiratorio');
grid;
display(breath_min);
display(f_max ...
    )