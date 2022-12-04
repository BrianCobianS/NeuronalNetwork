function [x] = picos(v,tpolar)
        [pks,loc] = findpeaks(v,tpolar);
        c = 1;
        c2 = 1;
        while c <= length(pks)
            if pks(c) >= 0.1
                %picos(c2)=pks(c);
                x(c2)=loc(c);
                c2=c2+1;
            end
            c=c+1;
        end
                
   end

    


