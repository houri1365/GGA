function []=RandIndex(offspring,z)
ans1=z(:,end);
X=z(:,1:end-1);
a=0;c=0;
b=0;d=0;
for i=1:length(X)
    for j=1:length(X)
      if i~=j
        if offspring(i)==offspring(j)  && ans1(i)==ans1(j)
            a=a+1;
        elseif offspring(i)~=offspring(j)  && ans1(i)~=ans1(j)
            b=b+1;
        elseif offspring(i)~=offspring(j)  && ans1(i)==ans1(j)
            c=c+1;
        elseif offspring(i)==offspring(j)  && ans1(i)~=ans1(j)
            d=d+1;
        end 
      end
    end
end
R=(a+b)/(a+b+c+d);
disp(R);
end