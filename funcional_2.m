function [corte_vect,corte_tiempo]=funcional_2(vectorfinal,tiempo_vect,fs)
der=zeros(1,length(vectorfinal));
salir=0;
r=0;
corte = length(vectorfinal);

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
time=1/fs:1/fs:tiempo_vect(end);
corte_tiempo=time(1:corte);




