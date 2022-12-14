function [S]=fitnessS(X,population,numcluster)

 [x,y]=size(population);
 numpopulation=x;

 for i=1:numpopulation
    sum1=zeros(1,numcluster(i));
    l=zeros(1,numcluster(i));
    ave=zeros(1,numcluster(i));
    group=population(i,1:length(X));
    s1=silhouette(X,group,'sqEuclidean');
    for i2=1:length(X)
       for i3=1:numcluster(i)
           if population(i,i2)==i3;
               sum1(i3)=sum1(i3)+s1(i2);
               l(i3)=l(i3)+1;
           end
       end
    end
    for j=1:numcluster(i)
        ave(j)=sum1(j)/l(j);
    end
    S(i)=(sum(ave)/numcluster(i));
   
 end
 disp(S);
end