function [s,fspec,tspect,fs] = get_spect(vectorfinal,tiempototal)
t_espect=tiempototal; %%variable del tiempo total
fs=length(vectorfinal)/t_espect;        %%obtención de frecuencia de muestreo


Nfft=2^nextpow2(length(vectorfinal));   %%encontrar el tamaño adecuado de muestras para no perder información
freqfft=(0:(Nfft/2-1)*(fs/Nfft));       %%frecuencias positivas, tomando la simetria real
Fourier_t=fft(vectorfinal,Nfft);       
%%produccion del espectograma
Nspec=300;
%%definir la ventana
wspec=hamming(Nspec);
Noverlap=Nspec/2;
[s,fspec,tspect]=spectrogram(vectorfinal,wspec,Noverlap,Nspec,fs);
figure()
spectrogram(vectorfinal,wspec,Noverlap,Nspec,fs);
%%%FIN ESPECTOGRAMA%%%