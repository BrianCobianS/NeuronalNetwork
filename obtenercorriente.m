function [estructura]= obtenercorriente(estructura, estructura1,estructura2,estructura3,neurona)
vectcorr=zeros(1,length(estructura1(neurona).vect_entradas));
entradasactual=estructura2(neurona).entradas;
b=0;
long=estructura2(neurona).entradasact;
for i=1:long
                    currin=estructura1(entradasactual(i)).vect_salidas;
                    vectcorr(i)=currin;
                    b=b+1;
                    if isnan(vectcorr(i))
                vectcorr(i)=0;
                    end
end
entradasactivas=estructura2(neurona).entradasact;
corrientein=(sum(vectcorr)/entradasactivas)*double(estructura2(neurona).modo);
if corrientein>estructura3(estructura2(neurona).tipo).Imax
    corrientein=estructura3(estructura2(neurona).tipo).Imax;
end
estructura(neurona).vect_entradas=vectcorr;
estructura(neurona).vect_Icurr=corrientein;
estructura(neurona).vect_salidas=corrientein;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
