function [tiempo,fs,idn,sumador]=eeg()
arduin=arduino("COM7");
sumador=readVoltage(arduin,'A5');
pause(1)
puerto_Dis=serialportlist;
fprintf("tienes disponibles:\n")
for i=1:length(puerto_Dis)
fprintf("%i.%s\n",i,puerto_Dis(i))
end
puerto=input("elija su puerto: \n");
delete(instrfind({'port'},{'COM4'}))
pause(1)
s=serialport(puerto_Dis(puerto),19200);
i=1;
pause(1)
fprintf("3\n");
pause(1)
fprintf("2\n");
pause(1)
fprintf("1\n");
figure()
yticks([-5 5])
title("TIEMPO REAL")
pause(2)
fopen(s);
flush(s);
pause(.8)
tic
while toc<=30
idn(i) = (fscanf(s,'%d\n')*5/1023)-sumador;
   if mod(i,30)==0
plot(idn)
drawnow;
   end
i=i+1;
end
fs=length(idn)/30;
tiempo=1/fs:1/fs:30;
fclose(s);
delete(s);




