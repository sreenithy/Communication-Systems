clc;
clear all;
N=4*10^5;

data = randi([0 1],1,N)
modObj = modem.genqammod('INPUTTYPE', 'bit');
modObj.disp;
d1= reshape(data,4,N/4);

y = modulate(modObj,d1);
scatterplot(y);
grid on