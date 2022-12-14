function  [X]=createdataa3()
MU1=[1 -1]; MU2=[-1.5 0];MU3=[0 1]; MU4=[-1 1]; 
MU5=[2 -1]; MU6=[-2 -1];MU7=[-0.5 2]; MU8=[-1 -1];MU9=[1.5 0];
SIGMA1=[.2^2 0;0 .2^2];
a=mvnrnd(MU1,SIGMA1,23);b=mvnrnd(MU2,SIGMA1,23);
c=mvnrnd(MU3,SIGMA1,22);d=mvnrnd(MU4,SIGMA1,22);
e=mvnrnd(MU5,SIGMA1,22);f=mvnrnd(MU6,SIGMA1,22);
g=mvnrnd(MU7,SIGMA1,22);h=mvnrnd(MU8,SIGMA1,22);
i=mvnrnd(MU9,SIGMA1,22);
a(:,3)=1;
b(:,3)=2;
c(:,3)=3;
d(:,3)=4;
e(:,3)=5;
f(:,3)=6;
g(:,3)=7;
h(:,3)=8;
i(:,3)=9;
X=vertcat(a,b,c,d,e,f,g,h,i);
 scatter(X(:,1),X(:,2),30,'b*');
end