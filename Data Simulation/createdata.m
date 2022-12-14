function  [X]=createdata()
MU1=[1 0]; MU2=[-1 -1];MU3=[-1 -3]; MU4=[3 -1]; 
MU5=[-1 1]; MU6=[2 -2];MU7=[1 2]; MU8=[3 1];
SIGMA=[.35^2 0;0 .35^2];
a=mvnrnd(MU1,SIGMA,37);b=mvnrnd(MU2,SIGMA,37);
c=mvnrnd(MU3,SIGMA,37); d=mvnrnd(MU4,SIGMA,37);
e=mvnrnd(MU5,SIGMA,38);f=mvnrnd(MU6,SIGMA,38);
g=mvnrnd(MU7,SIGMA,38);h=mvnrnd(MU8,SIGMA,38);
X=vertcat(a,b,c,d,e,f,g,h);
for i=0:3
    for j=1:37
        X(i*37+j,3)=i+1;
    end
end   
for i=4:7
    for j=1:38
        X(148+(i-4)*38+j,3)=i+1;
    end
end   
  scatter(X(:,1),X(:,2),30,'*');
end