clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory
a=input('Enter the input bit stream:');
L=length(a);
x=0;
z=0;
t=0:1/(L*50):2;
x1=sin(2*pi*1*t);
x2=sin(2*pi*2*t);
for i=1:L %here we are generating the modulated wave
    if a(i)==1
        x=[x ones(1,L*100)];
        z=[z x1];
    else
        x=[x zeros(1,L*100)];
        z=[z -x1];
    end
end
s=scatterplot(z)
subplot(2,1,1); %For Plotting The Carrier wave
plot(x);
axis tight;
xlabel('Time(s)')
ylabel('Amplitude(V)')
title('Input Digital Data')
subplot(2,1,2); %For Plotting The Carrier wave
plot(z);
axis tight;
xlabel('Time(s)')
ylabel('Amplitude(V)')
title('Phase Shift Keying')

