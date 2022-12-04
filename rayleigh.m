function rayleigh(magnitud,muestras,proporcion)
%% Lectura de la tabla
t = readtable('Valores_criticos.txt');
T = table2array(t);
%% Obtención de valores
r = magnitud;
n = muestras;
R = r*n;
z = R^2/n;
P = exp(sqrt(1+4*n+4*(n^2-R^2))-(1+2*n));
n_table = 0;

% n no puede ser menor a 6 porque así esta la tabla de Rayleigh
if n < 6
    disp('El numero de muestras es insuficiente para esta prueba')
end
for i=2:52
    if n >= T(i,1)
        n_table = i;
    end
end

mag_final = proporcion(1).magnitud;
nombre_final = proporcion(1).nombre;
for i=1:4
    if proporcion(i).magnitud > mag_final
        mag_final = proporcion(i).magnitud;
        nombre_final = proporcion(i).nombre;
    end
end


if z > T(n_table,5) 
    fprintf('Los valores son confiables, el usuario se encuentra en ondas %s\n',nombre_final);
    if mag_final == proporcion(1).magnitud
        disp('Es probable que el usuario esté dormido');
    end
    if mag_final == proporcion(2).magnitud
        disp('Es probable que el usuario esté somnoliento');
    end
    if mag_final == proporcion(3).magnitud
        disp('Es probable que el usuario esté en vigilia');
    end
    if mag_final == proporcion(4).magnitud
        disp('Es probable que el usuario esté en modo de exigencia');
    end
end
if z < T(n_table,5)
    disp('Los valores no son confiables');
end
end

