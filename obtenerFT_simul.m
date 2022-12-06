function [fourier,frec_vect]=obtenerFT_simul(vectorfinal,fs,tiempo)
[b,a] = butter(2,[1.7,25]/(fs/3),'bandpass');
vectorfinal = filter(b,a,vectorfinal);
fourier=abs(fft(vectorfinal));
fourier=fourier(1:end/2);
fourier=fourier/max(fourier);
frec_vect=1/tiempo:1/tiempo:fs;
frec_vect=frec_vect(1:end/2);
figure()
plot(frec_vect,fourier)
