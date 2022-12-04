function [h,tiempo]=grafica_picos(cant_neuro,corrientes_history,pausa)
[~,cant_barridos] = size(corrientes_history);
t_final = corrientes_history(end).historial(end).tiempos(end);
h=zeros(1,t_final);
    for i=1:t_final
        for j=1:cant_barridos
            for k=1:cant_neuro
                picos = ceil(corrientes_history(j).historial(k).local_picos);
                %picos(i)
                for l=1:length(picos)
	               if(i==ceil(corrientes_history(j).historial(k).local_picos(l)))	             
                       h(i)=h(i) +max((corrientes_history(j).historial(k).vectpicos(l))) ;  
                   end
        
                end
            end
            
        end
    end
tiempo=1:1:t_final; 
h=envelope(h);
% figure
% ylim([0 560])
% % envelope(h)
% plot(tiempo,envelope(h))


[~,cant_barridos] = size(corrientes_history);
tamano=get(0,'ScreenSize');
figure('position',[tamano(1)+10 tamano(2)+50 tamano(3)-20 tamano(4)-150]);
%figure('Renderer', 'painters', 'Position', [20 40 1400 650])
ticks_y = 1:1:cant_neuro;

muestras_por_vector = length(h)/cant_barridos;
aa=1;
bb=muestras_por_vector;

for i=1:cant_barridos
    for j=1:cant_neuro
    picos = corrientes_history(i).historial(j).local_picos;
    vector_y = j*ones(1,length(picos));
    subplot(100,100,[1 6200])
    scatter(picos,vector_y,'.','ColorVariable','k')
    ylim([0 cant_neuro+1])
    xlim([0 corrientes_history(end).historial(end).tiempos(end)])
    ax = gca;
    ax.YAxis.FontSize = 7;
    yticks(ticks_y)

    title('Picos de activación','FontSize',8)
    ylabel("Neurona",'FontSize',8,'FontWeight','bold','Color','r')
    xlabel('Tiempo (ms)','FontSize',8,'FontWeight','bold','Color','r')
    hold on
    end
   
   

 

    subplot(100,100,[7201 10000])
    plot(tiempo(aa:bb),(h(aa:bb)),'b')
    title("Potencial de campo",'FontSize',8)
    xlabel("Tiempo (ms)",'FontSize',8,'FontWeight','bold','Color','b')
    ylabel("Amplitud (mV)",'FontSize',8,'FontWeight','bold','Color','b')
    ylim([-10 max(h)+10])
    xlim([0 max(tiempo)])
    hold on
    if pausa==0.7
    pause(0.7)
    end

   aa=aa+muestras_por_vector;
   bb=bb+muestras_por_vector;


end








