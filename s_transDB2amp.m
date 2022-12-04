function [s_org]=s_transDB2amp(s_org)
[a,b]=size(s_org);
for i=1:a
    for j=1:b
        s_org(i,j)=10^(s_org(i,j)/20);
    end
end