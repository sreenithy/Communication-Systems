clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory
a=input('Enter the input bit stream:');
L=length(a);
x=0;
z=0;
t=0:1/(L*50):2;
x1=sin(2*pi*1*t);
for i=1:L %here we are generating the modulated wave
    if a(i)==1
        x=[x ones(1,L*100)];
    else
        x=[x zeros(1,L*100)];
    end
end
for i=1:L %here we are generating the modulated wave
    if i==1
        p(i)=xor(a(i),0);
    else
       p(i)=xor(a(i),a(i-1));
   end
end
P=0;
for i=1:L %here we are generating the modulated wave
    if (p(i)==1)
        z=[z x1];
        P=[P ones(1,L*100)];
    else
      z=[z -x1];
      P=[P zeros(1,L*100)];
   end
end

subplot(3,1,1); %For Plotting The Carrier wave
plot(x);
axis tight;
xlabel('Time(s)')
ylabel('Amplitude(V)')
title('Input Digital Data')
subplot(3,1,2); %For Plotting The Carrier wave
plot(P);
axis tight;
xlabel('Time(s)')
ylabel('Amplitude(V)')
title('XOR stream')
subplot(3,1,3); %For Plotting The Carrier wave
plot(z);
axis tight;
xlabel('Time(s)')
ylabel('Amplitude(V)')
title('Differential Phase Shift Keying')
