function [chosen]=roulettewheel(F,numpopulation)
r=rand;
w(1)=F(1);
for i=2:numpopulation
      w(i)=w(i-1)+F(i);
end
for i=1:numpopulation
    if r<w(i)
            chosen=i;
            return
    end
    
end
end