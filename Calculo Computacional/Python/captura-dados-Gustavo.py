
print("Exercicio - Coleta de Dados Python")

import psutil
import time

def captura():
    
    desejo = bool(1)
    componente = input("Qual componente do sistema operacional você deseja monitorar?")
    tempo = int(input("Em quantos segundos você deseja acompanhar?"))
    
    if (componente == "CPU" or componente == "cpu"):
        print("Iniciando captura de dados da CPU...", "\n--------")
        while(desejo == 1):
            print("Porcentagem de Utilização:", psutil.cpu_percent(interval = None , percpu = False ),"\nNucleos:", psutil.cpu_count(logical=False), "\nProcessadores Logicos:",
                  psutil.cpu_count(),"\nFrequencia da CPU:",psutil.cpu_freq(percpu=False), "\n--------")
            time.sleep(tempo)
            desejo = 1
            
    if (componente == "HD" or componente == "hd" or componente == "Hd"):
        print("Iniciando captura de dados do HD...", "\n--------")
        while(desejo == 1):
            print("Uso do Disco:",psutil.disk_usage('C:\\'), "\n Partições:", psutil. disk_partitions (all = False), "\n--------")
            time.sleep(tempo)
            desejo = 1
            
    if (componente == "memoria" or componente == "MEMORIA"):
        print("Iniciando captura de dados da Memoria...", "\n--------")
        while(desejo == 1):
            print ("Memoria virtual:",psutil.virtual_memory(), "\n--------")
            time.sleep(tempo)
            desejo = 1

captura()

