function [estructura]= obtenercorriente(estructura, estructura1,estructura2,estructura3,neurona)
vectcorr=zeros(1,length(estructura1(neurona).vect_entradas));
entradasactual=estructura2(neurona).entradas;
b=0;
long=estructura2(neurona).entradasact;
activos=0;
for i=1:long
                                

                    currin=estructura1(entradasactual(i)).vect_salidas;
                    vectcorr(i)=currin*estructura2(entradasactual(i)).modo;
                                %%OBTUVIMOS MAGNITUD DE LA CORRIENTE Y SI
                                %%ES INHI O EXCI%%

                    b=b+1;
                    if isnan(vectcorr(i))
                vectcorr(i)=0;
                    end
                    %%EVACULACIÓN NEURONA ACTIVA O NO %%
                    if vectcorr(i)~=0
                        activos=activos+1;
                    end
end
if activos>1
corrientein=(sum(vectcorr)/activos);
                        %%CORRIENTE PROMEDIO ENTRE ACTIVAS%%
else 
    corrientein=0;
end
                            %%ASIGNACIÓN CORRIENTE MAXIMA DEPEND TIPO
                            %%NEURO%%
if corrientein>estructura3(estructura2(neurona).tipo).Imax
    corrientein=estructura3(estructura2(neurona).tipo).Imax;
end


                        %%ACTUALIZAMOS LA ESTRUCTURA DE SALIDA%%
estructura(neurona).vect_entradas=vectcorr;
estructura(neurona).vect_ACTIVEIN=activos;
estructura(neurona).vect_Icurr=corrientein;
estructura(neurona).vect_salidas=corrientein;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
