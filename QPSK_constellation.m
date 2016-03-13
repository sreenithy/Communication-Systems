clc;
clear all;
N=10^5;

data = randi([0 1],1,N);
modObj = modem.pskmod('M',4,'PHASEOFFSET',0,'INPUTTYPE', 'bit');
d1= reshape(data,2,N/2);

y = modulate(modObj,d1);
scatterplot(y);
grid on

