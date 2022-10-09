clear all
clc
close all
%%neuronas
cant_neuro=input('¿Cuantas neuronas quieres asignar?\n');
while(cant_neuro < 10)
    msgbox("Error, el minimos de neuronas para asignar son 10");
    cant_neuro=input('¿Cuantas neuronas quieres asignar?\n');
end 
cant_entradas=input('¿Cuántos inputs tendrá cada neurona?\n');
cant_salidas=input('¿Cuántos outputs tendrá cada neurona?\n');
entradas=sprintf('inputs(%i)',cant_entradas);
salidas=sprintf('salidas(%i)',cant_salidas);
logicsal=cant_salidas*cant_neuro;
logicin=cant_entradas*cant_neuro;
while(logicin<logicsal)
    msgbox("Error, no hay suficiente espacio para enlaces, permita más entradas:")
    cant_entradas=input('¿Cuántos inputs tendrá cada neurona?\n');
    logicin=cant_entradas*cant_neuro;
end
vect_papel=zeros(1,cant_neuro);
cant_inhibit=input('¿Cuantas neuronas serán inhibidoras?\n');
cant_excit=input('¿Cuantas neuronas serán excitadoras?\n');
if (cant_inhibit+cant_excit)~=cant_neuro
    while (cant_inhibit+cant_excit)~=cant_neuro
        msgbox("Error, la cantidad de neuronas no coincide con tu cantidad de inhibidoras y excitadoras");        
        cant_inhibit=input('¿Cuantas neuronas serán inhibidoras?\n');
        cant_excit=input('¿Cuantas neuronas serán excitadoras?\n');
    end
end
vect_cell_excitadoras=zeros(1,cant_excit);
vect_papel(1,1:cant_inhibit)=-1;
vect_papel(1,cant_inhibit+1:(cant_inhibit+cant_excit))=1;
orden_papeles=randsample(vect_papel,length(vect_papel));
pos_vect=0;
for i=1:cant_neuro
    estructura(i).neurona=sprintf('neurona # %i',i);
    pep=zeros(1,cant_entradas);
    pap=zeros(1,cant_salidas);
    estructura(i).entradas=pep;
    estructura(i).salidas=pap;
    estructura(i).modo=orden_papeles(i);
    if orden_papeles(i)==1
    estructura(i).papel='excitadora';
    pos_vect=pos_vect+1; 
    vect_cell_excitadoras(pos_vect)=i;
    
    elseif orden_papeles(i)==-1
    estructura(i).papel='inhibidora';  
    end
end
 coloract=rand(1,3);
 coloract(1)=.8;
 coloract(3)=.6;
colorinh=rand(1,3);
 colorinh(1)=.3;
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

repet=0;
%%conexiones entrada y salidas
combinatoria=1:cant_neuro;
for i=1:cant_neuro
            a=1;    
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
                                      if a>=70
                                          break;
                                      end
                                end
                                      salidas_prueba(q)=neuronaeval; 
                                      estructura(neuronaeval).entradasact=estructura(neuronaeval).entradasact+1;
                                        posconect=estructura(neuronaeval).entradas;
                                        posconect(estructura(neuronaeval).entradasact)=i;
                                        estructura(neuronaeval).entradas=posconect; 

                                        estructura(i).salidasact=estructura(i).salidasact+1;
                                        possal=estructura(i).salidas;
                                        possal(estructura(i).salidasact)=neuronaeval;
                                        estructura(i).salidas=possal;
                end
end 
a=1;
                      




       for i=1:cant_neuro
    hold on
    grid on
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
 %%conexiones
  %%flechas 
 [flecx,flecy,flecz]=sphere(5);
 flecxor=flecx./3;
 flecyor=flecy./3;
 fleczor=flecz./3;

 for i=1:cant_neuro
linetext=zeros(1,3);
     for linebucle=1:cant_salidas
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

 
%%% legends
 figure('name','legends','NumberTitle','off','Color',[1,1,1])
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
%%%fin legends

 pause(1)
 clc
 cant_tipos=input('¿Cuántos tipos de neuronas quieres utilizar?\n');
 vect_tiempos=zeros(1,cant_tipos);
 orden=strings(1,cant_tipos);
 load('option_types.mat')
 i=1;
 while(i<=cant_tipos)
     clc
      fprintf('Los tipos de neurona son las siguientes:\n')
     for a=1:18
 fprintf('%i) %s  ',a,optiontype(a).nombres)
 if mod(a,3)==0
     fprintf("\n")
 end
     end
 fprintf("\n\n")
 fprintf('si necesitas visualizar alguna para elegir solo escribe el inciso\n y luego info')
 fprintf("\n\n")
 fprintf('para elegir asigna un inciso y da enter de uno en uno')
 fprintf("\n\n")
    escribio=input("selección:\n");
     
    len=length(escribio);
    sipasa=0;
            for q=1:18 

                if (double(q)==double(escribio(1))&&length(escribio)==1)||length(escribio)==6

                    for t=1:cant_tipos
                        if double(escribio(1))==double(orden(t))
                            fprintf("has repetido esta opción\n");
                            sipasa=2;
                            break;
                        end
                    end   
                    if sipasa==2
                        sipasa=0;
                        break;
                    end
                    sipasa=1;
                    fprintf("si pasa\n")

                    break;                   
                end                
            end
    if (sipasa==0)        
        disp('no has ingresado un archivo válido');
    end
    if (sipasa==1)
            if (length(escribio)==1&&sipasa==1)
              orden(1,i)=escribio;
              vect_tiempos(i)=optiontype(double(orden(i))).t_ms;
                i=i+1;
            elseif (escribio(1,end-3:end)=="info" && sipasa==1)      
              fprintf("%s\n",escribio(1,end-3:end))   
            end
    end
if i>cant_tipos
    fprintf("estos son los tipo que has elegido")
    disp(orden)
end
input("presione enter para continuar")
 end


clc

fprintf("tienes %i tipos de neuronas y %i cantidad de neuronas\n",cant_tipos,cant_neuro)
fprintf("¿Cuantas quieres para cada tipo:\n")
correcto=0;
ordentipos=zeros(1,cant_tipos);
vectorsuma=zeros(1,cant_tipos);
while correcto==0
    for asignar=1:cant_tipos
        fprintf("cantidad para el tipo %s:\n",optiontype(double(orden(asignar))).nombres);
        ordentipos(asignar)=input('');
        vectorsuma(asignar)=ordentipos(asignar);
    end
    if sum(vectorsuma)==cant_neuro
        correcto=1;
    else
        correcto=0;
        msgbox("Error,cantidad de neuronas no coincide");
    end
    
end

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
load('reporte_caracter.mat')
for i=1:length(double(orden))
    temp(i)=optiontype(double(orden(i))).t_ms;
end
caracter_programa.NeuronaTiempoMax=max(temp);
caracter_programa.tiempototal=input('¿Cuánto tiempo quieres correr la simulación (en segundos)?:\n');
caracter_programa.barridos=input('¿Cuántos barridos te gustaría observar:\n');
caracter_programa.batchestime=(caracter_programa.tiempototal/caracter_programa.barridos);
clc
fprintf("tienes %i opciones para iniciar un impulso excitador\n",pos_vect);
caracter_programa.impinicialcant=input('¿Cuántos impulsos quieres iniciar?\n');
caracter_programa.aleator_selec=input(['deseas seleccionar donde van a iniciar o que sea aleatorio?\n' ...
    '1.aleatorio\n2.seleccionar\n']);
caracter_programa.veciniciar=randsample(vect_cell_excitadoras,caracter_programa.impinicialcant);
caracter_programa.estructura=estructura;
vect_ini=caracter_programa.veciniciar;
estructura_corrientes=struct_current(estructura,cant_neuro);
tiempobarr_ms=caracter_programa.NeuronaTiempoMax;

fprintf("el impulso iniciaría en las siguientes neuronas:\n");
disp(caracter_programa.veciniciar)
input('presione enter para continuar:\n')
pote_impin=.01*input('¿A que porcentaje de intensidad de gustaría que fuera el primer pulso de 0%-100%?\n');

for i=1:length(vect_ini)
    estructura_corrientes(vect_ini(i)).vect_salidas=optiontype(estructura(vect_ini(i)).tipo).Imax*pote_impin*estructura(vect_ini(i)).modo;
end
corrientes_history(1).historial=estructura_corrientes;
%%%%INICIO DEL IMPULSO%%%%%
repit=1;
barrido=1;
while repit<=caracter_programa.barridos
    estructura_corrientesev=corrientes_history(repit).historial;
for i=1:cant_neuro
    estructura_corrientes=obtenercorriente(estructura_corrientes,estructura_corrientesev,estructura,optiontype,i);
   [vectorpicos_picos,tiempos,cant_picos,local,salidacurr]=obtener_picos(estructura_corrientes,estructura,optiontype,i,tiempobarr_ms,barrido);
   estructura_corrientes(i).per_type=strcat(sprintf('%i',double(optiontype(estructura(i).tipo).t_ms)),' ms');
   estructura_corrientes(i).vectpicos=vectorpicos_picos;
   estructura_corrientes(i).tiempos=tiempos;
   estructura_corrientes(i).cantpicos=cant_picos;
   estructura_corrientes(i).local_picos=local;
end
barrido=barrido+1;
corrientes_history(repit+1).historial=estructura_corrientes;
repit=1+repit;
end
%%%%FIN DE IMPULSOS





