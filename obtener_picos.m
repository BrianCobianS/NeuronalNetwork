function [vect_picos,vect_tiempo,cantpicos,localizacion,currsal]=obtener_picos(estructura,estructura1,proptype,neurona,periodo,num_barrido)
corriente_in=estructura(neurona).vect_salidas;
tiponeuro=estructura1(neurona).tipo;
imp_max=proptype(tiponeuro).Imax;
                                %% OBTENEMOS VECTOR DE LOS VOLTAJES  REFERENTES AL TIEMPO%%
[vect_picos,tiempo]=vector_voltajes(proptype,tiponeuro,corriente_in);

                                %%NORMALIZAMOS EL TIEMPO PROPORCIONAL AL
                                %%BARRIDO
vect_tiempo=linspace(((periodo)*(num_barrido-1)),((periodo)*num_barrido),length(vect_picos));
                
                                  %%OBTENEMOS PICOS Y SU LOCALIZACIÓN%%
[cant_picosvect,localizacion]=findpeaks(vect_picos,vect_tiempo,'MinPeakHeight',20);

                                %%CANTIDAD DE PICOS%%
cantpicos=length(cant_picosvect);

                                %%CORRIENTE SALIDAS PROP A LOS PICOS%%
currsal=getcurr_x_peaks(imp_max,cantpicos);



