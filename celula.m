function [VV,tspan]=celula(tipo,estructura)
optiontype=estructura;
a=optiontype(tipo).a; b=optiontype(tipo).b;  c=optiontype(tipo).c;  d=optiontype(tipo).d;
V=optiontype(tipo).Voltaje;  u=b*V;
VV=[];  uu=[];
tau=optiontype(tipo).Tau; tspan = 0:tau:160;
T1=tspan(end)/optiontype(tipo).Imp_max;
for t=tspan
    if (t>T1) 
        I=10;
    else
        I=0;
    end
    V = V + tau*(0.04*V^2+5*V+140-u+I);
    u = u + tau*a*(b*V-u);
    if V > 30
        VV(end+1)=30;
        V = c;
        u = u + d;
    else
        VV(end+1)=V;
    end
    uu(end+1)=u;
end
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis on;
grid on;
return;