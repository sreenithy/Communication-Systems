clc();
clear all();
close all;
 
sysorder=5;
N=2000;
inp=randn(N,1);  %pseudo random values drawn from standard normal distributions
n=rand(N,1);
[b,a]=butter(2,0.25);%designs an order 2 lpf with cut off frequency 0.25
Gz=tf(b,a,-1);
 
h=[0.0976;0.2873;0.3360;0.2210;0.0964;];
y=lsim(Gz,inp);%time response
n=n*std(y)/(10*std(n));
d=y+n;
 
N=60;
w=zeros(sysorder,1);
for n=0:N
    u=inp(n:-1:n-sysorder+1);
    y(n)=w'*u;
    e(n)=d(n)-y(n);
    if n<20
        mu=0.32;
    else
        mu=0.15;
    end
    w=w+mu*u*e(n);
end
hold on
plot(d)
plot(y,'r');
legend('channel response with noise','channel response');
title('system output');
xlabel('samples');
ylabel('true and estimated output');
figure
plot(h,'b+');
hold on
plot(w,'r*');
legend('actual weights','estimated weights');
title('comparison of actual and estimated weights');
axis([0 6 0.05 0.35]);
figure
semilogy(e.^2);
 
xlabel('samples');
ylabel('error value');


