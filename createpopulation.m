function  [population,numcluster]=createpopulation(numpopulation,x)

 [x,y]=size(X);
 population=zeros(numpopulation,x);

 for i=1:numpopulation
      numcluster(i)=1;
      while numcluster(i)==1
         numcluster(i)=randi(round((length(X)/2)^(1/2)));
      end
 
      [I,c] = kmeans(X,numcluster(i));
      I=inv(I);
      population(i,:)=I;

      for m=1:numcluster(i)
         population(i,length(X)+m)=m;
       end

     %%modification of population
     for k=length(X)+1:length(population(i))
         temp=population(i,k);
         count=0;
         for j=1:length(X)
            if population(i,j)==temp
               count=count+1;
            end
         
            if count==0
               for m=k:length(population(i))-1
                  population(i,m)=population(i,m+1);
               end
            population(length(population(i)))=0;
          end
       end
    a=length(population(i))-length(X);
    for k=1:a
       if population(length(population(i)))==0
         population(length(population(i)))=[];
      end
   end

 end


