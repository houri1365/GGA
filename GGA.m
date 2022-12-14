function []=GGA(numpopulation,numiteration,data)
clc

z=data;
X=z(:,1:end-1);
[x,y]=size(X);
[population,numcluster]=createpopulation(numpopulation,X);
newpopulation=zeros(numpopulation,length(X)+round((length(X)/2)^(1/2)));
newnumcluster=zeros(1,numpopulation);

for i=1:numiteration
    S=fitnessS(X,population,numcluster);

 %%%Elitism
    [C,I]=max(S);
  
    for k=1:length(population)
         newpopulation(1,k)=population(I,k);
    end
    newnumcluster(1)=numcluster(I);
     pc(1)=0.7;
     pc(2)=0.69;
     pm1(1)=0.08;
     pm1(2)=0.085;
     pm2(1)=0.01;
     pm2(2)=0.015;
     ps(1)=0.08;
     ps(2)=0.082;

    if i>2
         pc(i)=pc(1)-(i/numiteration)*(pc(i-1)-pc(1));
         pm1(i)=pm1(i-1)+(i/numiteration)*(pm1(i-1)-pm1(1));
         pm2(i)=pm2(i-1)+(i/numiteration)*(pm2(i-1)-pm2(1));
         ps(i)=ps(i-1)+(i/numiteration)*(ps(i-1)-ps(1));
    end

    for jcount=2:numpopulation
        [offspring,chosen]=selection(S,numpopulation,population);
         newnumcluster(jcount)=numcluster(chosen);
         for k=1:length(offspring)
             newpopulation(jcount,k)=offspring(1,k);
         end

        %%cross over
        if rand<pc(i)
           [offspring,newcluster]=crossover(X,population,numcluster,S);
           for i2=1:length(offspring)
            newpopulation(jcount,i2)=offspring(i2);
           end
           newnumcluster(jcount)=newcluster;
        end

        %%mutation
        if rand<pm1(i)
            for k=1:length(newpopulation)
               offspring(1,k)=newpopulation(jcount,k);
            end
            numcluster1=newnumcluster(jcount);
            [offspring]=mutation1(offspring,X,numcluster1);
             for k1=1:length(offspring)
                newpopulation(jcount,k1)=offspring(1,k1);
             end
            newnumcluster(jcount)=numcluster1+1;
        end
        if rand<pm2(i) && newnumcluster(jcount)>2
             for k=1:length(newpopulation)
               offspring(1,k)=newpopulation(jcount,k);
             end
            newcluster=newnumcluster(jcount);
            [offspring]=mutation2(offspring,X,newcluster);
            for k1=1:length(offspring)
                newpopulation(jcount,k1)=offspring(1,k1);
            end
            newnumcluster(jcount)=newcluster-1;
        end
       %local search
       if rand<ps(i)
           for k=1:length(newpopulation)
               offspring(1,k)=newpopulation(jcount,k);
           end
            newcluster=newnumcluster(jcount);
            offspring1=repair(X,offspring,newcluster);
             for k1=1:length(offspring1)
                newpopulation(jcount,k1)=offspring1(1,k1);
            end
       end
    end

    population=newpopulation;
    numcluster=newnumcluster;

 S=fitnessS(X,population,numcluster);
[G,I]=max(S);
end

S=fitnessS(X,population,numcluster);
[G,I]=max(S);
disp(G);

offspring=population(I,:);
newcluster=numcluster(I);
offspring1=repair(X,offspring,newcluster);
for j5=1:length(offspring1)
     population(I+1,j5)=offspring1(1,j5);
end
S=fitnessS(X,population,numcluster);
[F,H]=max(S);
if F>G
    offspring=population(H,:);
    newcluster=numcluster(H);
    disp(F);
elseif F<=G
     offspring=population(I,:);
     newcluster=numcluster(I);
    disp(G);
end    
display1(X,offspring);
display(numcluster(I));
RandIndex(offspring,z);

end