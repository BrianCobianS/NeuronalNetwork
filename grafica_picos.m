function grafica_picos(cant_neuro,corrientes_history)
[~,cant_barridos] = size(corrientes_history);
figure('Renderer', 'painters', 'Position', [0 50 1520 500])
ticks_y = 1:1:cant_neuro;
for i=2:cant_barridos
    for j=1:cant_neuro
    picos = corrientes_history(i).historial(j).local_picos;
    vector_y = j*ones(1,length(picos));
    scatter(picos,vector_y,'.')
    ylim([0 cant_neuro+1])
    xlim([0 corrientes_history(end).historial(end).tiempos(end)])
    yticks([ticks_y])
    ylabel("Neurona")
    xlabel("Tiempo (ms)")
    hold on
    end
    pause(1)
end







