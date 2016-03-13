%**Linear Block Codes**%
clc;
clear ;
n=7;
k=4;
%**Encoding**%
disp('Message bits');
m=randint(1,k,[0,1]);
disp(m);
disp('Coefficient Matrix');
p=randint(k,n-k,[0,1]);
disp(p);
disp('Generator Matrix');
g=[[p],eye(k)];
disp(g);
disp('Codeword Matrix');
x=encode(m,n,k,'linear',g);
disp(x);
disp('Parity Matrix');
h=gen2par(g);
disp(h);
%**Decoding**%
disp('Error Checking');
ch=rem(x*h',2);
disp(ch);
disp('Error Pattern Generator');
e=randint(1,n);
disp(e);
disp('Received Vector');
r=rem(plus(x,e),2);
disp(r);
disp('Syndrome');
s=rem(r*h',2);
disp(s);
disp('Decoding Table');
t=syndtable(h);
disp(t);
disp('Decoded message Bits');
msg=decode(r,n,k,'linear/fmt',g,t);
disp(msg);