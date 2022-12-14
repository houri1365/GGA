function  [X]=createdataa2()
MU1=[-1 -1]; MU2=[2 -1];MU3=[0 2];
SIGMA1=[1^2 0;0 .8^2];SIGMA2=[.6^2 0;0 .4^2];
SIGMA3=[.3^2 0;0 .5^2];
a=mvnrnd(MU1,SIGMA1,200);b=mvnrnd(MU2,SIGMA2,132);
c=mvnrnd(MU3,SIGMA3,68);
a(:,3)=1;
b(:,3)=2;
c(:,3)=3;
X=vertcat(a,b,c);
 scatter(X(:,1),X(:,2),30,'b*');
end