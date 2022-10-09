function [str_curr]=struct_current(struct,cant_neuro)
for i=1:cant_neuro
str_curr(i).in=struct(i).entradas;
str_curr(i).sal=struct(i).salidas;
str_curr(i).mode=struct(i).modo;
str_curr(i).type=struct(i).tipo;
str_curr(i).vect_entradas=zeros(1,struct(i).entradasact);
str_curr(i).vect_Icurr=0;
str_curr(i).vect_salidas=0;
end


