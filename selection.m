function [chosenchorom,chosen]=selection(S,numpopulation,population)
[A,numchorom]=sort(S);
i=numpopulation;
while i~=0
    R(numchorom(1,i))=i;
    F(numchorom(1,i))=(2*R(numchorom(1,i)))/(numpopulation*(numpopulation+1));
    i=i-1;
end
chosen=roulettewheel(F,numpopulation);
chosenchorom=population(chosen,:);
end