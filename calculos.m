function [X,Y,r,s,s0]=calculos(ai,fi)
     Y = sum(fi.*sind(ai))/sum(fi);
     X =sum(fi.*cosd(ai))/sum(fi);
     r = sqrt(Y^2+X^2);
     s = (180/pi)*(sqrt(2*(1-r)));
     s0 = (180/pi)*(sqrt(-1*2*log(r)));
     firelativo = fi/sum(fi);
     polar(ai,firelativo)
     %rlim([0 1]);
     
     
end