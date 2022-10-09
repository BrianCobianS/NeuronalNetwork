function [vect_picos,vect_tiempo,cantpicos,localizacion,currsal]=obtener_picos(estructura,estructura1,proptype,neurona,periodo,num_barrido)
corriente_in=estructura(neurona).vect_salidas;
tiponeuro=estructura1(neurona).tipo;
imp_max=proptype(tiponeuro).Imax;
[vect_picos,tiempo]=vector_voltajes(proptype,tiponeuro,corriente_in);
vect_tiempo=linspace(((periodo)*(num_barrido-1)),((periodo)*num_barrido),length(vect_picos));
[cant_picosvect,localizacion]=findpeaks(vect_picos,vect_tiempo,'MinPeakHeight',20);
cantpicos=length(cant_picosvect);
currsal=getcurr_x_peaks(imp_max,cantpicos);



