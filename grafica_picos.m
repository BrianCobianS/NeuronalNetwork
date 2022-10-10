function grafica_picos(cant_neuro,corrientes_history)
[~,cant_barridos] = size(corrientes_history);
t_final = corrientes_history(end).historial(end).tiempos(end);
h=zeros(1,t_final);
    for i=1:t_final
        for j=2:cant_barridos
            for k=1:cant_neuro
                picos = ceil(corrientes_history(j).historial(k).local_picos);
                %picos(i)
                for l=1:length(picos)
	               if(i==ceil(corrientes_history(j).historial(k).local_picos(l)))	             
                       h(i)=h(i) +20 ;
                   end
        
                end
            end
            
        end
    end
tiempo=1:1:t_final;
% figure
% ylim([0 560])
% % envelope(h)
% plot(tiempo,envelope(h))


[~,cant_barridos] = size(corrientes_history);
figure('Renderer', 'painters', 'Position', [0 50 1520 500])
ticks_y = 1:1:cant_neuro;
for i=2:cant_barridos
    for j=1:cant_neuro
    picos = corrientes_history(i).historial(j).local_picos;
    vector_y = j*ones(1,length(picos));
    subplot(4,4,[1 12])
    scatter(picos,vector_y,'.')
    ylim([0 cant_neuro+1])
    xlim([0 corrientes_history(end).historial(end).tiempos(end)])
    yticks(ticks_y)
    ylabel("Neurona")
    xlabel("Tiempo (ms)")
    hold on

    end
    subplot(4,4,[13 16])
%     tiempo=linspace(1,200,length(h));
    plot(tiempo,envelope(h))
    pause(0.5)
end








