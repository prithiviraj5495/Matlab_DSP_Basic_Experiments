clc;
close all;
clear all;

%design of analog low pass chebyshev filter
wp=input('enter the passband freq : ');
ws=input('enter the stopband freq : ');
Ap=input('enter the passband attenuation in dB: ');
As=input('enter the stopband attenuation in dB: ');
[N,wc]=cheb1ord(wp,ws,Ap,As,'s');
disp('order = ');
disp(N);
disp('cut-off freq = ');
disp(wc);
[b,a]=cheby1(N,Ap,wc);
disp(tf(b,a));
figure(1);
freqz(b,a);

   %digital lowpass filter

%bilinear technique
[b1,a1]=bilinear(b,a,10)
disp('bilinear technique');
disp(tf(b1,a1));
figure(2);
freqz(b1,a1,10);

%impulse invariant technique
[b2,a2]=impinvar(b,a,10);
disp('impulse invariant technique');
disp(tf(b2,a2));
figure(3);
freqz(b2,a2,10);