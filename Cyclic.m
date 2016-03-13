%**Cyclic Codes**%
clc;
clear ;
n=7;
k=4;
%**Encoding**%
disp('Message bits');
m=randint(2,k,[0,1]);
disp(m);
disp('Cyclic Polynomial');
pol=cyclpoly(n,k,'min');
disp(pol);
disp('code Vector');
code=encode(m,n,k,'cyclic',pol);
disp(code);
%**Decoding**%
disp('Error Pattern Generation');
err=randerr(2,n,[0,1;.8 .2]);
disp(err);
disp('Received Matrix');
r=rem(plus(code,err),2);
disp(r);
disp('Decoded Message Bits');
newmsg=decode(r,n,k,'cyclic');
disp(newmsg);
