import numpy as np
import random
from random import sample
import os
import math
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

cant_neuro = input('cuantas neuronas quieres asignar?\n')
cant_entradas = input('cuantos inputs tendrá cada neurona?\n')
cant_salidas = input('cuantos outputs tendrá cada neurona?\n')
figu=plt.figure()
ax=plt.axes(projection='3d')

#ax.plot_surface(x,y,z,color='y')
#plt.show()
class Estructura:
                                        def __init__(estruct,cant_neuro,cant_entradas,cant_salidas):

                                                estruct.logicsal=int(cant_salidas)*int(cant_neuro)
                                                estruct.logicin=int(cant_entradas)*int(cant_neuro)
                                                while  estruct.logicin<estruct.logicsal:
                                                    print('error, no hay suficiente espacio para enlaces, permita más entradas:\n')
                                                    estruct.cant_entradas = input('cuantos inputs tendrá cada neurona?\n')
                                                    logicin = int(cant_entradas) * int(cant_neuro)
                                                estruct.vect_papel=np.zeros(int(cant_neuro),dtype=int)
                                                estruct.cant_inhibit=input('¿cuantas neuronas serán inhibidoras?\n')
                                                estruct.cant_excit=input('¿cuantas neuronas serán excitadoras?\n')
                                                estruct.suma=int(estruct.cant_inhibit)+int(estruct.cant_excit)
                                                estruct.cant_neces=int(cant_neuro)
                                                if estruct.suma != estruct.cant_neces:
                                                    while estruct.suma != estruct.cant_neces:
                                                        print('error,  la cantidad de neuronas no coincide con tu cantidad de inhibidoras y excitadoras\n')
                                                        estruct.cant_inhibit = input('¿cuantas neuronas serán inhibidoras?\n')
                                                        estruct.cant_excit = input('¿cuantas neuronas serán excitadoras?\n')
                                                        estruct.suma = int(estruct.cant_inhibit) + int(estruct.cant_excit)
                                                        print(estruct.suma)
                                                estruct.vect_papel[0:int(estruct.cant_inhibit)]=-1
                                                estruct.vect_papel[int(estruct.cant_inhibit):int(estruct.cant_inhibit+estruct.cant_excit)]=1



                                                ##esfera
                                                theta = np.arange(0, 2 * np.pi, 0.01)
                                                phi = np.arange(0, np.pi, 0.01)
                                                theta, phi = np.meshgrid(theta, phi)
                                                r = np.sqrt(1)
                                                x = r * np.sin(phi) * np.cos(theta)
                                                y = r * np.sin(phi) * np.sin(theta)
                                                z = r * np.cos(phi)
                                                esferadimen = [x, y, z]
                                                estruct.modos = estruct.mezclar_lista(estruct.vect_papel)
                                                estruct.mostrado=estruct.diseño3D(cant_neuro,cant_entradas,cant_salidas,esferadimen,estruct.vect_papel)


                                        def mezclar_lista(estruct,lista_original):
                                                    # Crear una copia, ya que no deberíamos modificar la original

                                                    estruct.lista = lista_original[:]
                                                    # Ciclo for desde 0 hasta la longitud de la lista -1
                                                    longitud_lista = len(estruct.lista)
                                                    for i in range(longitud_lista):
                                                        # Obtener un índice aleatorio

                                                        indice_aleatorio = random.randint(0, longitud_lista - 1)
                                                        # Intercambiar
                                                        temporal = estruct.lista[i]
                                                        estruct.lista[i] = estruct.lista[indice_aleatorio]
                                                        estruct.lista[indice_aleatorio] = temporal

                                                    estruct.lista=estruct.asignar(cant_neuro,cant_entradas,cant_salidas,estruct.lista)
                                                    # Regresarla
                                                    return estruct.lista

                                        def asignar(estruct,cant_neuro,cant_entradas,cant_salidas,vect_papel):
                                                        estruct.neurona=[]
                                                        estruct.entradas=[]
                                                        estruct.modo=[]
                                                        estruct.salidas=[]
                                                        modo1='excitadora'
                                                        modo2='inhibidora'

                                                        for i in range(int(cant_neuro)):
                                                            estruct.neuronum = "neurona #" + str(i + 1)
                                                            estruct.neurona.append(estruct.neuronum)
                                                            pep= np.zeros(int(cant_entradas))
                                                            pap=np.zeros(int(cant_salidas))
                                                            estruct.entradas.append(pep)
                                                            estruct.salidas.append(pap)

                                                            if int(estruct.lista[i])==1:
                                                                estruct.modo.append(modo1)
                                                            elif int(estruct.lista[i])==-1:
                                                                estruct.modo.append(modo2)
                                                        print(estruct.modo)
                                                        return estruct.modo

                                        def diseño3D(estruct,cant_neuro,cant_entradas,cant_salidas,esfera,neuronanum):
                                                        estruct.posiciones=[]
                                                        estruct.etiqueta=[]
                                                        print(cant_neuro)


                                                        for i in range(int(cant_neuro)):
                                                            estruct.etiqueta.append(i)
                                                            estruct.posiciones.append(np.random.rand(1,3)*70)
                                                        print(estruct.posiciones[4])
                                                            #estruct.posiciones.append(np.ceil(np.randin(1,3)*70))





Estructura(cant_neuro,cant_entradas,cant_salidas)






