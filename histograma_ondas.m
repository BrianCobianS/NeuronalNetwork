function [proporcion,r,n]=histograma_ondas(freq_picos,picos_eeg,eje_angular,rangos)
cortar=zeros(1,4);
cortar(1)=1;
for i=1:4
    limites=rangos(i).rango;
    proporcion(i).nombre=rangos(i).tipo;
    proporcion(i).rangos=rangos(i).rango;
    for j=1:length(freq_picos)
        cursor=freq_picos(j);
        if cursor>limites(1)&&cursor<limites(2)
            cortar(i+1)=j; 
        end
    end
end
freq_picos=freq_picos(1:length(picos_eeg));
delta = picos_eeg(freq_picos>0.5 & freq_picos<=3);
theta = picos_eeg(freq_picos>3 & freq_picos<=7);
alpha = picos_eeg(freq_picos>7 & freq_picos<=13);
beta = picos_eeg(freq_picos>13);

proporcion(1).vector_hor = freq_picos(freq_picos<=3);
proporcion(2).vector_hor = freq_picos(freq_picos>3 & freq_picos<=7);
proporcion(3).vector_hor = freq_picos(freq_picos>7 & freq_picos<=13);
proporcion(4).vector_hor = freq_picos(freq_picos>13);


proporcion(1).vector_amp = delta;
proporcion(2).vector_amp = theta;
proporcion(3).vector_amp = alpha;
proporcion(4).vector_amp = beta;

angulo_medio=zeros(1,4);
amp_media=zeros(1,4);
cosenoalpha=zeros(1,4);
senoalpha=zeros(1,4);

cosenofi=zeros(1,4);
senofi=zeros(1,4);
vector_freq_mag=zeros(1,4);
vector_cursor=zeros(1,4);
proporcion(5).magnitud=[];
proporcion(i).vect_angul=[];
proporcion(i).coseno_a = [];
proporcion(i).seno_a = [];
proporcion(i).coseno_fi=[];
proporcion(i).seno_fi = [];
%vector_cursor(1)=[];


   mag=zeros(1,4);
k=1;
for i=1:4
   cont=0;
    vector_freq_mag(i)=360*(mean(proporcion(i).vector_hor)/40);
    sumatoria_ang_X=zeros(1,4);
    sumatoria_ang_Y=zeros(1,4);  
    vect_amp_act=proporcion(i).vector_amp;
                num_picos = length(proporcion(i).vector_hor);


                for j=1:num_picos
                    %% 
                    cur_amp=picos_eeg(k);
                    if cur_amp>0
                            sumatoria_ang_X(i)=cosd(eje_angular(k))+sumatoria_ang_X(i);
                            sumatoria_ang_Y(i)=sind(eje_angular(k))+sumatoria_ang_Y(i);
                            mag(i)=cur_amp+mag(i);              
                    cont=cont+1;
                    k=k+1;
                    end
                end
                if mag(i)>0
                        X_ang=sumatoria_ang_X(i)/cont;
                        Y_ang=sumatoria_ang_Y(i)/cont;
                        mag(i)=mag(i)/cont;
        
                        angulo_medio(i)=sqrt(X_ang^2+Y_ang^2);                    
                    
                        cosenoalpha(i)=X_ang/angulo_medio(i);
                        senoalpha(i)=Y_ang/angulo_medio(i);
                                          
                        cosenofi(i)=mag(i)*cosenoalpha(i);
                        senofi(i)=mag(i)*senoalpha(i);
                    
                        proporcion(i).magnitud=mag(i);
                        proporcion(i).vect_angul=vector_freq_mag(i);
                        
                        proporcion(i).coseno_a=cosenoalpha(i);
                        proporcion(i).seno_a=senoalpha(i);
                        proporcion(i).coseno_fi=cosenofi(i);
                        proporcion(i).seno_fi=senofi(i); 
                end
                if isempty(proporcion(i).magnitud) == 1
                    proporcion(i).magnitud = 0;
                end
                if isempty(proporcion(i).vect_angul) == 1
                    proporcion(i).vect_angul = 0;
                end
                if isempty(proporcion(i).coseno_a) == 1
                    proporcion(i).coseno_a = 0;
                end
                if isempty(proporcion(i).seno_a) == 1
                    proporcion(i).seno_a = 0;
                end
                if isempty(proporcion(i).coseno_fi) == 1
                    proporcion(i).coseno_fi = 0;
                end
                if isempty(proporcion(i).seno_fi) == 1
                    proporcion(i).seno_fi = 0;
                end
end

figure()
proporcion(5).nombre="resultante";
dominante=max(mag);
sumatoria_ang_X=0;
sumatoria_ang_Y=0;
resultante_mag=0;
  cont=0;
                for i=1:4

                    if proporcion(i).coseno_a>0||proporcion(i).seno_a>0
                    sumatoria_ang_X=proporcion(i).coseno_a+sumatoria_ang_X;
                    sumatoria_ang_Y=proporcion(i).seno_a+sumatoria_ang_Y;
                    amplitud=proporcion(i).magnitud;
                    resultante_mag=amplitud+resultante_mag; 
                    cont=cont+1;
                    end
                end
                X_ang_res=sumatoria_ang_X/cont;
                Y_ang_res=sumatoria_ang_Y/cont;
                resultante_magnitud=resultante_mag/cont;

     sum_mag=0;
     
for i=1:4
    magni=proporcion(i).magnitud;
    if dominante==magni
        dominio=i;
    end
    
   r=[0,magni];
   rang_freq_ang=[0,vector_freq_mag(i)];
   polarpattern(rang_freq_ang,r,'-','MagnitudeTick',[0.2,0.4,0.6,0.8,1],'MagnitudeLim',[0 1])
   hold on
   sum_mag=proporcion(i).magnitud+sum_mag;
end
eje_angular=eje_angular(1:length(picos_eeg));
polarpattern(eje_angular,picos_eeg,'-b')

tit_dominante=["delta", "theta", "alfa", "beta"];
proporcion(5).nombre="resultante";
text_prop_dom=strcat("el rango con m??s magnitud es: ",tit_dominante(dominio));
proporcion(5).rangos=text_prop_dom;
proporcion(5).magnitud=resultante_magnitud;
proporcion(5).coseno_a=X_ang_res;
proporcion(5).seno_a=Y_ang_res;
proporcion(5).coseno_fi=X_ang_res*resultante_magnitud;
proporcion(5).seno_fi=Y_ang_res*resultante_magnitud;

proporcion(5).vect_angul=acosd(X_ang_res);
r=sqrt(proporcion(5).coseno_fi^2 + proporcion(5).seno_fi^2); 

for i=1:4
    propor=proporcion(i).magnitud/sum_mag;
    proporcion(i).prop_norm_1=propor;
    propor=propor*100;
    propor=sprintf("%.2f",propor);
    propor=strcat(propor,'%');
    proporcion(i).prop_norm_porcen=propor;
end



dimensiones = 0;
n=0;
if isempty(proporcion(4).vector_amp) == 1
    for i=1:3
    n = length(proporcion(i).vector_amp);
    n = n+n;
    end
end
if isempty(proporcion(4).vector_amp) == not(1)

    for i=1:4
        dimensiones = length(proporcion(i).vector_amp);
        n= n+dimensiones;
    end
    listo=1;
end
   magni=proporcion(5).magnitud;
   r=[0,magni];
   rang_freq_ang=[0,proporcion(5).vect_angul];
   polarpattern(rang_freq_ang,r,'-k','MagnitudeTick',[0.2,0.4,0.6,0.8,1],'MagnitudeLim',[0 1])
   legend(upper('delta'),upper('theta'),upper('alfa'),upper('beta'),upper('general'),upper('resultante'))
   r=magni;