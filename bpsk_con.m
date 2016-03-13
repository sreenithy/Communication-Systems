clc;
clear all;

N=10^3;                         % number of bits

data=randi([0,1],1,N)             % generate data
modobj=modem.pskmod(2);
modobj.disp;
y=modulate(modobj,data); 
scatterplot(y);
grid on
