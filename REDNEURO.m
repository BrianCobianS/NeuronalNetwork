clear all
clc
close all


                                %OBTENCIÓN TE PARÁMETROS\\PROTECCIONES%%
fprintf("\t\t\t\tRed neuronal biológica simulada\n\n")
pause(2)
fprintf("\t\t\t\t\t\tBienvenido(a)\n\n")
pause(2)
fprintf("Nota general: Todo número decimal ingresado se redondeara al valor entero más cercano\n\n")
pause(2)
fprintf("¿Cuántas neuronas quieres asignar?\n")
cant_neuro=input('-> ');
cant_neuro=round(cant_neuro);
fprintf("\nNeuronas asignadas: %i\n\n",cant_neuro);
while(isempty(cant_neuro) == 1 || cant_neuro < 2)
    if(cant_neuro < 2)
        msgbox("\n\nError, no puede haber 1 o menos neuronas\n\n");
    end
    if(isempty(cant_neuro) == 1)
        msgbox("\n\nError, no se ingresó ningún valor\n\n");
    end
    clc;
    fprintf("¿Cuántas neuronas quieres asignar?\n")
    cant_neuro=input('-> ');
end 
fprintf("¿Cuántas aferencias tendrá cada neurona?\n")
cant_entradas=input('-> ');
cant_entradas = round(cant_entradas);
while(isempty(cant_entradas) == 1 || cant_entradas < 1 || cant_entradas > cant_neuro)
    if(isempty(cant_entradas) == 1 || cant_entradas < 1)
        msgbox("Error, no puede haber valores menor a 1 o no se ingresó ningún valor");
    end
    if(cant_entradas > cant_neuro)
        msgbox("Error, no puede haber más entradas que neuronas")
    end
    fprintf("¿Cuántas aferencias tendrá cada neurona?\n")
    cant_entradas=input('-> ');
end
fprintf('¿Cuántas eferencias tendrá cada neurona?\n')
cant_salidas=input('-> ');
cant_salidas = round(cant_salidas);
while(isempty(cant_salidas) == 1 || cant_salidas < 1 || cant_salidas > cant_neuro)
     if(isempty(cant_salidas) == 1 || cant_salidas < 1)
        msgbox("Error, no puede haber valores menor a 1 o no se ingresó ningún valor");
     end
     if(cant_salidas > cant_neuro)
         msgbox("Error, no puede haber más salidas que neuronas")
     end
     fprintf('¿Cuántas eferencias tendrá cada neurona?\n')
     cant_salidas=input('-> ');
end
entradas=sprintf('inputs(%i)',cant_entradas);
salidas=sprintf('salidas(%i)',cant_salidas);
logicsal=cant_salidas*cant_neuro;
logicin=cant_entradas*cant_neuro;
while(logicin<logicsal)
    msgbox("Error, no hay suficiente espacio para enlaces, permita más entradas:");
    fprintf("¿Cuántas aferencias tendrá cada neurona?\n")
    cant_entradas=input('-> ');
    logicin=cant_entradas*cant_neuro;
end
vect_papel=zeros(1,cant_neuro);
fprintf('¿Cuantas neuronas serán inhibidoras?\n')
cant_inhibit=input('-> ');
cant_inhibit = round(cant_inhibit);
while(isempty(cant_inhibit) == 1 || cant_inhibit < 1)
    msgbox("Error, no puede haber valores menor a 1 o no se ingresó ningún valor");
    fprintf('¿Cuantas neuronas serán inhibidoras?\n')
    cant_inhibit=input('-> ');
end
fprintf('¿Cuantas neuronas serán excitadoras?\n')
cant_excit=input('-> ');
cant_excit = round(cant_excit);
while(isempty(cant_excit) == 1 || cant_excit < 1)
    msgbox("Error, no puede haber valores menor a 1 o no se ingresó ningún valor");
    fprintf('¿Cuantas neuronas serán excitadoras?\n')
    cant_excit=input('-> ');
end
if (cant_inhibit+cant_excit)~=cant_neuro
    while (cant_inhibit+cant_excit)~=cant_neuro
        msgbox("Error, la cantidad de neuronas no coincide con tu cantidad de inhibidoras y excitadoras");  
        clc;
        fprintf("Neuronas: %i\n",cant_neuro);

        fprintf('¿Cuantas neuronas serán inhibidoras?\n')
        cant_inhibit=input('-> ');
        
        fprintf('¿Cuantas neuronas serán excitadoras?\n')
        cant_excit=input('-> ');
    end
end

                        %%FIN:BLOQUE 1%%

                        %%ASIG MODO RANDOM (EXCI/INHI)%% 

vect_cell_excitadoras=zeros(1,cant_excit);
vect_papel(1,1:cant_inhibit)=-1;
vect_papel(1,cant_inhibit+1:(cant_inhibit+cant_excit))=1;
orden_papeles=randsample(vect_papel,length(vect_papel));
pos_vect=0;
for i=1:cant_neuro
    estructura(i).neurona=sprintf('neurona # %i',i);
    estructura(i).entradas=[];
    estructura(i).salidas=[];
    estructura(i).modo=orden_papeles(i);
    if orden_papeles(i)==1
    estructura(i).papel='excitadora';
    pos_vect=pos_vect+1; 
    vect_cell_excitadoras(pos_vect)=i;
    
    elseif orden_papeles(i)==-1
    estructura(i).papel='inhibidora';  
    end
end

                    %%FIN :BLOQUE 2%%

                    %%ASIG REPRESENTACIONES (COLORES, POSICIONES, ESFERAS)%%
 coloract=rand(1,3);
 coloract(1)=.8;
 coloract(3)=.8;
colorinh=rand(1,3);
 colorinh(1)=.2;
 colorinh(3)=.2;
%%graficar 3D
for i=1:cant_neuro
    estructura(i).etiqueta=i;
    estructura(i).posicion=ceil(rand(1,3)*70);
    [estructura(i).formax,estructura(i).formay,estructura(i).formaz]=sphere(20);
    posmod=estructura(i).posicion;
    estructura(i).formax=estructura(i).formax+2*posmod(1);
    estructura(i).formay=estructura(i).formay+2*posmod(2);
    estructura(i).formaz=estructura(i).formaz+2*posmod(3);
    estructura(i).salidasact=0;
    estructura(i).entradasact=0;
    %% 
    %% 
    

end

                  %%FIN: BLOQUE 3%%

repet=0;

                    %%PRODUCCIÓN CONEXIONES AL AZAR \\ PROTECCIONES \\ EVALUACIÓN LÓGICA%%
%%conexiones entrada y salidas
combinatoria=1:cant_neuro;
for i=1:cant_neuro
    terminarya=0;
            a=1;    

                                         %%EVALUACIÓN DE FUNCIONALIDAD%%

                salidas_prueba = randsample(combinatoria,cant_salidas);                                
                for q=1:length(salidas_prueba) 
                            neuronaeval=salidas_prueba(q);
                            verneuro=estructura(neuronaeval).entradasact;
                            vectentradas=estructura(neuronaeval).entradas;

                                for qwer=1:length(vectentradas)
                                          if estructura(i).etiqueta==vectentradas(qwer)                                       
                                              repet=1;
                                          end
                                end
                                while(verneuro>=cant_entradas||neuronaeval==i||repet==1)
                                      repet=0;
                                      neuronaeval=randsample(combinatoria,1); 
                                        verneuro=estructura(neuronaeval).entradasact;
                                        vectentradas=estructura(neuronaeval).entradas;
                                      for qwer=1:verneuro
                                          if estructura(i).etiqueta==vectentradas(qwer)                                          
                                              repet=1;
                                          end
                                      end
                                      a=1+a;
                                      if a>=7000
                                          terminarya=1;
                                          break;
                                      end
                                end


                                %%CREACIÓN DE CONEXIÓN FUNCIONAL%%
                                  if terminarya==0
                                        salidas_prueba(q)=neuronaeval; 
                                        estructura(neuronaeval).entradasact=estructura(neuronaeval).entradasact+1;
                                        posconect=estructura(neuronaeval).entradas;
                                        posconect(estructura(neuronaeval).entradasact)=i;
                                        estructura(neuronaeval).entradas=posconect; 

                                        estructura(i).salidasact=estructura(i).salidasact+1;
                                        possal=estructura(i).salidas;
                                        possal(estructura(i).salidasact)=neuronaeval;
                                        estructura(i).salidas=possal;
                                  else
                                      break;
                                  end
                                  
                end
end 
a=1;

                        %%FIN BLOQUE 4%%

                        
                        %%PLOT 3D NEURONA --> VECTOR \\ ETIQUETA %%

       tamano=get(0,'ScreenSize');
       figure('name','Topología neuronal','position',[tamano(1)+10 ...
           tamano(2)+60 tamano(3)-600 tamano(4)-160]);
       view([-37.5 -30])
       xticks([])
       yticks([])
       zticks([])
       title("Mapa topográfico de conexiones neuronales")
       hold on
       
       for i=1:cant_neuro
         if estructura(i).modo==1
            plot3(estructura(i).formax,estructura(i).formay,estructura(i).formaz,'Color',coloract)
         elseif estructura(i).modo==-1
            plot3(estructura(i).formax,estructura(i).formay,estructura(i).formaz,'Color',colorinh)
         end        
         posmod=estructura(i).posicion;
        postext(1)=posmod(1)*2;
        postext(2)=posmod(2)*2;
        postext(3)=posmod(3)*2;
        postext=postext+2;
        neurona=strcat('#',sprintf('%i',estructura(i).etiqueta));
        text(postext(1),postext(2),postext(3),neurona, 'Rotation',+15)
       end

                                %%FIN: BLOQUE 5%%



                             %% CREACIÓN FLECHAS \\ GRÁFICA %%
 [flecx,flecy,flecz]=sphere(5);
 flecxor=flecx./3;
 flecyor=flecy./3;
 fleczor=flecz./3;
    hold on
    grid on
 for i=1:cant_neuro
linetext=zeros(1,3);
     for linebucle=1:estructura(i).salidasact
         origen=estructura(i).posicion*2;
         neuronadest=estructura(i).salidas;
         neuronatarget=neuronadest(linebucle);
         destino=estructura(neuronatarget).posicion*2;
         hold on
         l1=[origen(1),destino(1)];
         l1vect=linspace(origen(1),destino(1),20);
         posflecx=flecxor+l1vect(19);
         l2=[origen(2),destino(2)];
         l2vect=linspace(origen(2),destino(2),20);
         posflecy=flecyor+l2vect(19);
         l3=[origen(3),destino(3)];
         l3vect=linspace(origen(3),destino(3),20);
         posflecz=fleczor+l3vect(19);

         if estructura(i).modo==1
             line(l1,l2,l3,'Color',coloract)
             plot3(posflecx,posflecy,posflecz,'Color','red')  
         elseif estructura(i).modo==-1
         line(l1,l2,l3,'Color',colorinh)
            plot3(posflecx,posflecy,posflecz,'Color','red')        
         end  
         pause(.01)
     end
 end

                       %%FIN: BLOQUE 6%%

 
                      %%CREACIÓN DE  PESTAÑA REPRESENTATIVA%%

 tamano=get(0,'ScreenSize');
 figure('name','Simbología de conexiones neuronales','NumberTitle','off',...
     'Color',[1,1,1],'position',[tamano(1)+850 tamano(2)+60 tamano(3)-900 tamano(4)-160]);
 x=linspace(1,2,6);
 x1=linspace(1,2,6);
 y=ones(1,length(x));
 y1=ones(1,length(x1))*.5;
hold on
plot(x,y,'Color',coloract,'DisplayName',"excitadoras")
plot(x(1,1),y(1,1),'ob','DisplayName',"neurona 1")
plot(x(1,6),y(1,6),'om','DisplayName',"neurona 2")
legend
plot(x(1,5),y(1,5),'*r','DisplayName',"ind. eferencia 1-->2")
plot(x1,y1,'Color',colorinh,'DisplayName',"inhibidoras")
plot(x1(1,1),y1(1,1),'ok','DisplayName',"neurona 3")
plot(x1(1,6),y1(1,6),'oc','DisplayName',"neurona 4")
legend
plot(x1(1,2),y1(1,2),'*r','DisplayName',"ind. aferencia 3<--4")
axis([1 2 0 1.5])
axis off
grid off

                                        %% FIN: BLOQUE 7%%

                                        
 pause(1)
 clc

                   %%OBTENCIÓN PARÁMETROS ( TIPOS, CANTIDADES) \\ PROTECCIONES %%
 fprintf("¿Cuántos tipos de neuronas quieres utilizar?\n")
 cant_tipos=input('-> ');
 cant_tipos = round(cant_tipos);
 fprintf("\n\nCantidad tipos: %i\n",cant_tipos);
 while(isempty(cant_tipos) == 1 || cant_tipos < 2 || cant_tipos > 5)
    msgbox("Error, no puede haber menos de 2 o más de 5 tipos o no se ingresó ningún valor");
    clc;
    fprintf("¿Cuántos tipos de neuronas quieres utilizar?\n")
    cant_tipos=input('-> ');
    cant_tipos = round(cant_tipos);
    fprintf("\n\nCantidad tipos: %i\n",cant_tipos);
 end
 pause(1)
 vect_tiempos=zeros(1,cant_tipos);
 orden=strings(1,cant_tipos);
 load('option_types.mat')
 i=1;
 fprintf("\n\nA continuación, se muestran los tipos de neuronas")
 pause(2)
 while(i<=cant_tipos)
     clc
     fprintf('Los tipos de neuronas son los siguientes:\n')
     for a=1:18
 fprintf('%i) %s  ',a,optiontype(a).nombres)
 if mod(a,2)==0
     fprintf("\n")
 end
     end
 fprintf('\n\nPara cada tipo de neurona, selecciona un inciso y presiona Enter')
 fprintf("\n\nSelección:\n")
 escribio=input("-> ");
    while(isempty(escribio) == 1)
        msgbox("No se ingresó ningún valor");
        fprintf("\n\nSelección:\n")
        escribio=input("-> ");
    end
     
    len=length(escribio);
    sipasa=0;
            for q=1:18 

                if (double(q)==double(escribio(1))&&length(escribio)==1)||length(escribio)==6

                    for t=1:cant_tipos
                        if double(escribio(1))==double(orden(t))
                            fprintf("Has repetido esta opción\n");
                            sipasa=2;
                            break;
                        end
                    end   
                    if sipasa==2
                        sipasa=0;
                        break;
                    end
                    sipasa=1;
                    break;                   
                end                
            end
    if (sipasa==0)        
        disp('No has ingresado un archivo válido');
    end
    if (sipasa==1)
            if (length(escribio)==1&&sipasa==1)
              orden(1,i)=escribio;
              vect_tiempos(i)=optiontype(double(orden(i))).t_ms;
                i=i+1;
            end
    end
if i>cant_tipos
    fprintf("\nTipos de neuronas seleccionadas:\n")
    for asignar=1:cant_tipos
        fprintf("\n'%s'\t",optiontype(double(orden(asignar))).nombres);
    end
end
input("\n\nPresione enter para continuar...")
end

clc

fprintf("Tienes %i tipos de neuronas y %i neuronas\n",cant_tipos,cant_neuro)
fprintf("¿Cuantas quieres para cada tipo?\n")
correcto=0;
ordentipos=zeros(1,cant_tipos);
vectorsuma=zeros(1,cant_tipos);
while correcto==0
    for asignar=1:cant_tipos
        fprintf("Cantidad para el tipo %s:\n",optiontype(double(orden(asignar))).nombres);
        vacio_o_no=input('');
            while(isempty(vacio_o_no) == 1 || vacio_o_no < 1)
                msgbox("Error, no puede haber valores menor a 1 o no se ingresó ningún valor");
                clc;
                fprintf("Tienes %i tipos de neuronas y %i neuronas\n",cant_tipos,cant_neuro);
                fprintf("Cantidad para el tipo %s:\n",optiontype(double(orden(asignar))).nombres);
                vacio_o_no=input('');
            end
        ordentipos(asignar)=vacio_o_no;
        ordentipos(asignar)=round(ordentipos(asignar));
        vectorsuma(asignar)=ordentipos(asignar);
    end
    if sum(vectorsuma)==cant_neuro
        correcto=1;
    else
        correcto=0;
        msgbox("Error,cantidad de neuronas no coincide");
    end
    
end

                        %%FIN: BLOQUE 8%%


                        %% VECTOR ALEATORIO DE TIPO/CANTIDAD \\ ASIGNACIÓN A NEURONAS %%
for i=1:cant_tipos
    vectstring=zeros(1,double(ordentipos(i)));
    vectstring(1,:)=orden(i);
    
    tipoestruct(i).vectasig=vectstring;   
    if i==1
    ordentype=tipoestruct(i).vectasig;
    elseif i>1
        ordentype=[ordentype,tipoestruct(i).vectasig];
    end
end

ordenasignacion=randsample(ordentype,cant_neuro);
for i=1:cant_neuro
    
estructura(i).tipo=ordenasignacion(i);
estructura(i).tiponombre=optiontype(ordenasignacion(i)).nombres;
estructura(i).tiempo_trabajo=optiontype(estructura(i).tipo).t_ms;
end
                    %%FIN: BLOQUE 9%%


                   %% OBTENCIÓN DE PERÍODO MÁXIMO%%
load('reporte_caracter.mat')
for i=1:length(double(orden))
    temp(i)=optiontype(double(orden(i))).t_ms;
end
caracter_programa.NeuronaTiempoMax=max(temp);
                    %%FIN: BLOQUE 10%%


                    %%OBTENCIÓN PARÁMETROS DE TIEMPO%%
caracter_programa.tiempototal=input('¿Cuánto tiempo quieres correr la simulación (en segundos)?:\n');
while(isempty(caracter_programa.tiempototal) == 1 || caracter_programa.tiempototal <= 0)
    msgbox("Error, no puedes poner 0 o menos segundos o no se ingresó ningún valor");
    caracter_programa.tiempototal=input('¿Cuánto tiempo quieres correr la simulación (en segundos)?:\n');
end
caracter_programa.barridos=double((caracter_programa.tiempototal*1000)/caracter_programa.NeuronaTiempoMax);
caracter_programa.batchestime=(caracter_programa.tiempototal/caracter_programa.barridos);
clc
                    %%FIN: BLOQUE 11%%



                    %%VECTOR IMP INICIALES%%
fprintf("Tienes %i opciones para iniciar un impulso excitador\n",pos_vect);
caracter_programa.impinicialcant=input('¿Cuántos impulsos quieres iniciar?\n');
while(isempty(caracter_programa.impinicialcant) == 1 || caracter_programa.impinicialcant < 1 || caracter_programa.impinicialcant > cant_excit)
    msgbox("Error, no puedes poner más impulsos que neuronas excitadoras o no se ingresó ningún valor");
    clc;
    fprintf("Opciones: %i\n",cant_excit);
    caracter_programa.impinicialcant=input('¿Cuántos impulsos quieres iniciar?\n');
end

%caracter_programa.aleator_selec=input(['deseas seleccionar donde van a iniciar o que sea aleatorio?\n' ...
%    '1.aleatorio\n2.seleccionar\n']);

caracter_programa.veciniciar=randsample(vect_cell_excitadoras,caracter_programa.impinicialcant);
                %%FIN: BLOQUE 12%%


caracter_programa.estructura=estructura;
vect_ini=caracter_programa.veciniciar;

    %%FUNCIÓN PARA CREAR ESTRUCTURA DE CORRIENTE (PARA EL HISTORIAL)%%
estructura_corrientes=struct_current(estructura,cant_neuro);
tiempobarr_ms=caracter_programa.NeuronaTiempoMax;
                        %%FIN: BLOQUE 13%%

                        %%GENERAR LOS 1# IMPULSOS%%
fprintf("El impulso iniciará en las siguientes neuronas:\n");
disp(caracter_programa.veciniciar)
input('presione enter para continuar...\n')
clc
                             %%FIN: BLOQUE 14%%
                     %%FORMA DE MOSTRAR%%
while(1) 

    T_real_final=input('Deseas visualizar los datos en:\n1.Tiempo real\n2.Completo al final\n3.Salir\n');
    round(T_real_final);
    while(isempty(T_real_final) == 1 || T_real_final < 1 || T_real_final > 3)
        msgbox("Error, ingresa un dígito válido");
        T_real_final=input('quieres ver los datos en:\n1.tiempo real\n2.al final\n3.Salir\n');
    end
    if T_real_final==1
        pausa=0.7;
    elseif T_real_final==2
        pausa=0;
    elseif T_real_final==3
        break
    end
    
                                 %%FIN: BLOQUE 15%%
    
                            %%INTENSIDAD IMPULSO  INICIAL%%
    pote_impin=.01*input('¿A que porcentaje de intensidad de gustaría que fuera el primer pulso de 10%-100%?\n');
    while(isempty(pote_impin) == 1 || pote_impin < 0.1)
        msgbox("Error, no puedes poner menos que 10 o no se ingresó ningún dato");
        pote_impin=.01*input('¿A que porcentaje de intensidad de gustaría que fuera el primer pulso de 10%-100%?\n');
    end
                                        %%FIN: BLOQUE 16%%
                                
    
    
                                        %%INICIALIZAR LAS SALIDAS DE LAS
                                        %%NEURONAS GATILLO%%
    for i=1:length(vect_ini)
        estructura_corrientes(vect_ini(i)).vect_salidas=optiontype(estructura(vect_ini(i)).tipo).Imax*pote_impin; 
    end
                                        %%FIN: BLOQUE 17%%
    
    
                                        %%GENERAR VECTOR DE PICOS DEL IMPULSO
                                                     %%SIN ENTRADAS%%
    estructura_corrientesev=estructura_corrientes;
    for i=1:cant_neuro
       [vectorpicos_picos,tiempos,cant_picos,local,salidacurr]=obtener_picos(estructura_corrientes,estructura,optiontype,i,tiempobarr_ms,1);
       estructura_corrientes(i).per_type=strcat(sprintf('%i',double(optiontype(estructura(i).tipo).t_ms)),' ms');
       estructura_corrientes(i).vectpicos=vectorpicos_picos;
       estructura_corrientes(i).tiempos=tiempos;
       estructura_corrientes(i).cantpicos=cant_picos;
       estructura_corrientes(i).local_picos=local;
       estructura_corrientes(i).voltaje=double(optiontype(estructura(i).tipo).Voltaje);
    end
    
    corrientes_history(1).historial=estructura_corrientes;
    
                                      %%FIN: BLOQUE 18%%
    
    
    
    
    warning ('off','all');
                                       %%INICIO DEL IMPULSOS DESENCADENADOS%%%
    
    repit=1;
    barrido=2;
    while repit<=caracter_programa.barridos-1
        estructura_corrientesev=corrientes_history(repit).historial;
        
    for i=1:cant_neuro
        estructura_corrientes=obtenercorriente(estructura_corrientes,estructura_corrientesev,estructura,optiontype,i);
       [vectorpicos_picos,tiempos,cant_picos,local,salidacurr]=obtener_picos(estructura_corrientes,estructura,optiontype,i,tiempobarr_ms,barrido);
       estructura_corrientes(i).per_type=strcat(sprintf('%i',double(optiontype(estructura(i).tipo).t_ms)),' ms');
       estructura_corrientes(i).vectpicos=vectorpicos_picos;
       estructura_corrientes(i).tiempos=tiempos;
       estructura_corrientes(i).cantpicos=cant_picos;
       estructura_corrientes(i).local_picos=local;
       estructura_corrientes(i).voltaje=double(optiontype(estructura(i).tipo).Voltaje);
    end
    barrido=barrido+1;
    corrientes_history(repit+1).historial=estructura_corrientes;
    repit=1+repit;
    end
                                                %%FIN: BLOQUE 19%%
    
    
    
                            %%GRAFICA DE BARRIDO Y POTENCIAL DE CAMPO%%

      msgbox("Imprimiendo grafica");
    [vectorfinal,tiempofinal]=grafica_picos(cant_neuro,corrientes_history,pausa);
    clc
                                                %%FIN: BLOQUE 20%%


end

%%proyecto 2da parte

[s_org,fspec_org,tspect_org,fs] = get_spect(vectorfinal,caracter_programa.tiempototal);
%[abs_amp,nuevo_t,ultima_fre,adj_amp]=funcional_1(vectorfinal,caracter_programa.tiempototal,fs);
[fun_amp,fun_t]=funcional_2(vectorfinal,caracter_programa.tiempototal,fs);
[vector_amp,vector_freq]=obtenerFT_simul(fun_amp,fs,fun_t(end));
% [vector_amp_util,vector_freq_util,picos,freq_picos,amp_util]=obtenerFT_util(vector_amp,vector_freq);
% [vector_amp_util,vector_freq_util,picos,freq_picos,amp_util,picos_f,freq_picos_f]=obtenerFT_util(vector_amp,vector_freq);
[picos,freq_picos,amp_util,picos_f,freq_picos_f]=obtenerFT_util(vector_amp,vector_freq);
% [eje_angular]=normalizacion_pol(freq_picos);
[eje_angular]=normalizacion_pol(freq_picos_f);

load('rango_ondas.mat')
% [proporcion,r,n]=histograma_ondas(freq_picos,picos,eje_angular,rango_ondas);
[proporcion,r,n]=histograma_ondas(freq_picos_f,picos_f,eje_angular,rango_ondas);
dispersion=dispersion_angular(r);
rayleigh(r,n,proporcion);







%%%EEG%%%%%%

[tiempo_eeg,fs_org,idn_eeg,sumador]=eeg;
[s_org_eeg,fspec_org_eeg,tspect_org_eeg,fs] = get_spect(idn_eeg,tiempo_eeg(end));
%[abs_amp,nuevo_t,ultima_fre,adj_amp]=funcional_1(vectorfinal,caracter_programa.tiempototal,fs);
[fun_amp_eeg,fun_t_eeg]=funcional_2(idn_eeg,tiempo_eeg,fs_org);
[vector_amp_eeg,vector_freq_eeg]=obtenerFT(fun_amp_eeg,fs_org,fun_t_eeg(end));
% [vector_amp_util,vector_freq_util,picos,freq_picos,amp_util]=obtenerFT_util(vector_amp,vector_freq);
% [vector_amp_util,vector_freq_util,picos,freq_picos,amp_util,picos_f,freq_picos_f]=obtenerFT_util(vector_amp,vector_freq);
[picos_eeg,freq_picos_eeg,amp_util_eeg,picos_f_eeg,freq_picos_f_eeg]=obtenerFT_util(vector_amp_eeg,vector_freq_eeg);
% [eje_angular]=normalizacion_pol(freq_picos);
[eje_angular_eeg]=normalizacion_pol(freq_picos_f_eeg);

load('rango_ondas.mat')
% [proporcion,r,n]=histograma_ondas(freq_picos,picos,eje_angular,rango_ondas);
[proporcion_eeg,r_eeg,n_eeg]=histograma_ondas(freq_picos_eeg,picos_eeg,eje_angular_eeg,rango_ondas);
dispersion_eeg=dispersion_angular(r_eeg);
rayleigh(r_eeg,n_eeg,proporcion_eeg);




