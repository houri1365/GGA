function []=display1(X,offspring)

 hold on
for i=1:length(X)
    switch offspring(i)
        case 1
            scatter(X(i,1),X(i,2),50,'r*');
        case 2
             scatter(X(i,1),X(i,2),50,'g*');
        case 3
             scatter(X(i,1),X(i,2),50,'b*');
        case 4
             scatter(X(i,1),X(i,2),50,'c*');
        case 5
             scatter(X(i,1),X(i,2),50,'m*');
        case 6
             scatter(X(i,1),X(i,2),50,'ro');
        case 7
             scatter(X(i,1),X(i,2),50,'go');
        case 8
             scatter(X(i,1),X(i,2),50,'bo');
        case 9
             scatter(X(i,1),X(i,2),50,'co');
        case 10
             scatter(X(i,1),X(i,2),50,'mo');
         case 11
             scatter(X(i,1),X(i,2),30,'c+');
        case 12
             scatter(X(i,1),X(i,2),30,'r+');
        case 13
             scatter(X(i,1),X(i,2),30,'y+');
    end
end