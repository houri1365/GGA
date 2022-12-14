function [offspring]=mutation2(offspring,X,newcluster)

numcluster=newcluster;
n=zeros(1,numcluster);

for i=1:length(X)
    for j=1:numcluster
        if offspring(i)==j
            n(j)=n(j)+1;
        end
    end
end
[C,I]=min(n);
firstcluster=I;

if I>1
  secondcluster=I-1;
else
   secondcluster=I+1;
end

if secondcluster<firstcluster
    temp=firstcluster;
    firstcluster=secondcluster;
    secondcluster=temp;

for i=1:length(X)
    if offspring(i)==secondcluster
         offspring(i)=firstcluster;
    end
end

for m=length(X)+secondcluster:length(offspring)-1
    offspring(m)=offspring(m+1);
end
offspring(length(offspring))=[];

%%sort 
k=1;
for i=length(X)+1:length(offspring)
    sort=offspring(i);
    offspring(i)=k;
    for j=1:length(X)
       if offspring(j)==sort
           offspring(j)=k;
       end
    end
        k=k+1;
end
  
end