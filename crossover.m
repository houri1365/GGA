function [offspring,newcluster]=crossover(X,population,numcluster,S)

[x,y]=size(population);
[p,q]=size(X);
numpopulation=x;

%%step1
[ind1,chosen1]=selection(S,numpopulation,population);
[ind2,chosen2]=selection(S,numpopulation,population);
crosspointind11=randi(numcluster(chosen1)+1);
crosspointind12=randi(numcluster(chosen1)+1);
while (crosspointind11==crosspointind12)
    crosspointind12=randi(numcluster(chosen1)+1);
end
if crosspointind11>crosspointind12
   swap=crosspointind11;
   crosspointind11=crosspointind12;
   crosspointind12=swap;
end
crosspointind21=randi(numcluster(chosen2)+1);
crosspointind22=randi(numcluster(chosen2)+1);
while (crosspointind21==crosspointind22)
    crosspointind22=randi(numcluster(chosen2)+1);
end
if crosspointind21>crosspointind22
   swap=crosspointind21;
   crosspointind21=crosspointind22;
   crosspointind22=swap;
end

%%step 2
offspring=zeros(1,length(X)+(crosspointind12-crosspointind11)+(crosspointind22-crosspointind21));
for i=1:length(X)
    if population(chosen1,i)>=crosspointind11 && population(chosen1,i)<=(crosspointind12-1)
        offspring(i)=population(chosen1,i);
    else offspring(i)=0;
    end
end
l=1;
for i=crosspointind11:(crosspointind12-1)
    offspring(length(X)+l)=i;
    l=l+1;
end

%%step 3
for i=1:length(X)
    if offspring(i)==0 && population(chosen2,i)>=crosspointind21 && population(chosen2,i)<=(crosspointind22-1)
        offspring(i)=(population(chosen2,i)+1000);
    end
end
for i=crosspointind21:(crosspointind22-1)
     offspring(length(X)+l)=i+1000;
     l=l+1;
end

%%step 4
for  i=1:length(X)
    if offspring(i)==0
       temp=randi(length(offspring)-length(X))+length(X);
       offspring(i)=offspring(temp);
    end
end

%%step 5

for i=length(X)+1:length(offspring)
    sort=offspring(1,i);
    count=0;
    for j=1:length(X)
       if offspring(j)==sort
          count=count+1;
       end
    end
    if count==0
        offspring(i)=0;
    end
end
m=length(offspring);
while m~=length(X)
    if offspring(m)==0
       offspring(m)=[];
    end
     m=m-1;
end

%%step 6
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
    newcluster=k-1;

end