function [dispersion]=dispersion_angular(r)

medida_disp=1-r;
var_ang=2*(medida_disp);
var_estandar=-2*(log(r));
desv_ang=(180/pi)*sqrt(var_ang);
desv_circu_estan=(180/pi)*sqrt(var_estandar);
dispersion.medida_disp=medida_disp;
dispersion.varianza_angular=var_ang;
dispersion.varianza_estandar=var_estandar;
dispersion.desviacion_angular=desv_ang;
dispersion.desviacion_circular_estandar=desv_circu_estan;