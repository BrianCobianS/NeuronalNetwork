% function [eje_amp,eje_freq,picos,freq_picos,amp_fun,picos_f,freq_picos_f]=obtenerFT_util(vector_amp,vector_freq)
function [picos,freq_picos,amp_fun,picos_f,freq_picos_f]=obtenerFT_util(vector_amp,vector_freq)

for i=1:length(vector_amp)
    if vector_freq(i)>40
        corte=i;
        break;
    end
end

vector_amp_util=vector_amp(1:corte);
vector_freq_util=vector_freq(1:corte);

eje_freq=vector_freq_util(1):1/(length(vector_freq_util)*2):vector_freq_util(end);

eje_amp=interp1(vector_freq_util,vector_amp_util,eje_freq);


for i=1:length(eje_freq)
    if eje_freq(i)>1.4
        corte=i;
        break;
    end
end

eje_freq=eje_freq(corte:end);
eje_amp=eje_amp(corte:end);
eje_freq(1)=0;
eje_amp(1)=0;

eje_amp=eje_amp./max(max(eje_amp));
amp_fun=eje_amp>.3;
amp_fun=amp_fun.*eje_amp;
[picos,freq_picos]=findpeaks(amp_fun,eje_freq,'MinPeakHeight',.3);

amp_fun=[0,amp_fun];
eje_freq = [0,eje_freq];


for i=1:length(picos)
    for j=1:length(amp_fun)
        if picos(i) == amp_fun(j)
            a_picos(i) = amp_fun(j-2);
            p_picos(i) = amp_fun(j+2);
        end
    end
end

for i=1:length(freq_picos)
    for j=1:length(eje_freq)
        if freq_picos(i) == eje_freq(j)
            a_freq_picos(i) = eje_freq(j-2);
            p_freq_picos(i) = eje_freq(j+2);
        end
    end
end

sz_picos = size(a_picos,2)+size(picos,2)+size(p_picos,2);
sz_picos = zeros(1,sz_picos);
sz_freq_picos = size(a_freq_picos,2)+size(freq_picos,2)+size(p_freq_picos,2);
sz_freq_picos = zeros(1,sz_freq_picos);

h = 1;
for i=1:3:length(sz_picos)
    picos_f(i) = a_picos(h);
    picos_f(i+1) = picos(h);
    picos_f(i+2) = p_picos(h);
    h = h+1;
end
k = 1;
for i=1:3:length(sz_freq_picos)
    freq_picos_f(i) = a_freq_picos(k);
    freq_picos_f(i+1) = freq_picos(k);
    freq_picos_f(i+2) = p_freq_picos(k);
    k = k+1;
end

picos_f = picos_f(2:end);
freq_picos_f = freq_picos_f(2:end);

%% Limites de confianza
varianza_amp = var(picos_f);
media_muestreal = mean(picos_f);
ext_inf = (-1.96*varianza_amp/(sqrt(length(picos_f))))+media_muestreal;
ext_sup = (1.96*varianza_amp/(sqrt(length(picos_f))))+media_muestreal;
for i=1:length(picos_f)
    if ext_inf < picos_f(i) && picos_f(i) < ext_sup
        picos_f(i) = picos_f(i);
    end
end
picos_f(picos_f==0) = [];
for i=1:length(picos_f)
    if ext_inf < picos_f(i) && picos_f(i) < ext_sup
        freq_picos_f(i) = freq_picos_f(i);
    end
end
freq_picos_f(freq_picos_f==0) = [];




