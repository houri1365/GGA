function [offspring]=mutation1(offspring,X,numcluster1)

[a,b]=size(X);
n=zeros(numcluster1);

for i=1:length(X)
    for j=1:numcluster1
        if offspring(i)==j
            n(j)=n(j)+1;
        end
    end
end
[C,I]=max(n);
dividingcluster=I(1);

l=1;
for i=1:length(X)
    if offspring(i)==dividingcluster
        for i2=1:b
           y(l,i2)=X(i,i2);
        end
         y(l,b+1)=i;
        l=l+1;
    end
end
z=y(:,1:b);
w=kmeans(z,2);

for j=1:l-1
    if w(j)==1
        w(j)=dividingcluster;
    elseif w(j)==2
        w(j)=numcluster1+1;
    end
end
for i=1:l-1
    offspring(y(i,b+1))=w(i);
end
end