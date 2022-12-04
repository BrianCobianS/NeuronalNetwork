function [corte_vect,corte_tiempo]=funcional(vectorfinal,tiempo_vect,fs)
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

corte_vect=vectorfinal(1:corte);
time=1/fs:1/fs:tiempo_vect;
corte_tiempo=time(1:corte);
%[nuevo_amp,nueva_freq,nuevo_t]= get_spect(corte_vect,corte_tiempo(end));
%ultima_amp=nuevo_amp(1:19,1:length(nuevo_t));
%ultima_fre=nueva_freq(1:19);
%ultima_fre=[ultima_fre;70];
%nuevo_t=[length(nuevo_t),length(nuevo_t)+length(nuevo_t)/100];




