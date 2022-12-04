function [ultima_amp,nuevo_t,ultima_fre,last_amp]=funcional_1(vectorfinal,tiempo_vect,fs)
der=zeros(1,length(vectorfinal));
salir=0;
r=0;
            for i=1:length(vectorfinal)-1
                if salir==1
                    break;
                end
                        der(i)=vectorfinal(i)-vectorfinal(i+1);                         
                        valor=der(i);
                        if (der(i)<(max(vectorfinal)/1000) && (der(i))>(-max(vectorfinal)/1000)) 
                            r=r+1;
                            if r>(0.1*fs)
                                salir=1;
                            end
                        else 
                            r=0;
                        end
                        if salir==1
                            corte=i;
                        end
                        i=i+1;  

            end
if salir==0
    corte=length(vectorfinal);
end
   
corte_vect=vectorfinal(1:corte);
time=1/fs:1/fs:tiempo_vect;
corte_tiempo=time(1:corte);
tiempo_interp=linspace(corte_tiempo(1),corte_tiempo(end),3*(length(vectorfinal)/tiempo_vect(end)));
amp_interpo=interp1(corte_tiempo,corte_vect,tiempo_interp);
[nuevo_amp,nueva_freq,nuevo_t]= get_spect(amp_interpo,tiempo_interp(end));
ultima_amp=nuevo_amp(1:19,1:length(nuevo_t));
ultima_fre=nueva_freq(1:19);
ultima_fre=[ultima_fre;70];
nuevo_t_conc=length(nuevo_t)/100;
nuevo_t=[nuevo_t,nuevo_t(end)+nuevo_t_conc];
ultima_amp=abs(ultima_amp);
[hor,ver]=size(ultima_amp);
agregar_hor=ones(hor,1)*-3;
agregar_ver=ones(1,length(nuevo_t))*-(mean(mean(ultima_amp))/length(ultima_amp));
last_amp=[ultima_amp,agregar_hor];
last_amp=[last_amp;agregar_ver];

for i=1:hor
    for j=1:ver
            if last_amp(i,j)>5000
                last_amp(i,j)=last_amp(i,j)*.35;
           end

    end
end



