
import psutil
import time

def captura():
    
    desejo = bool(1)
    componente = input("Qual componente do sistema operacional você deseja monitorar?")
    tempo = int(input("Em quantos segundos você deseja acompanhar?"))
    
    porcentagem =  psutil.cpu_percent(interval = None , percpu = False)
    nucleos = psutil.cpu_count(logical=False)
    processadoresLogicos = psutil.cpu_count()
    frequencia =  psutil.cpu_freq(percpu=False)
    cpu = psutil.cpu_times (percpu = False )

    if (componente == "CPU" or componente == "cpu"):
        print("Iniciando captura de dados da CPU...", "\n--------")
        while(desejo == 1):
            print("Porcentagem de Utilização:{:.2f}".format(porcentagem),"\nNucleos:", nucleos, "\nProcessadores Logicos:{:.2f}".format(processadoresLogicos),
                   "\nFrequencia da CPU:", frequencia, "\n--------", "\nUsuário", cpu[0], "\ntempo Sistema:{:.2f} Hrs".format(cpu[1]/3600), "\ntempo inativo:{:.2f}Hrs".format(cpu[2]/3600), "\nChamadas de procedimento adiadas:{:.2f}".format(cpu[3]))
            time.sleep(tempo)
            desejo = 1
            
    usoDisco = psutil.disk_usage('C:\\')
    particoes = psutil. disk_partitions (all = False)

    if (componente == "HD" or componente == "hd" or componente == "Hd"):
        print("Iniciando captura de dados do HD...", "\n--------")
        while(desejo == 1):
            print("\nEspaço total:",usoDisco[0], "\nUsado:", usoDisco[1], "\nLivre:", usoDisco[2], "\nPorcentagem de uso:", usoDisco[3], "\n Partições:", particoes, "\n--------")
            time.sleep(tempo)
            desejo = 1
            
    if (componente == "memoria" or componente == "MEMORIA"):
        print("Iniciando captura de dados da Memoria...", "\n--------")
        while(desejo == 1):
            print ("Memoria virtual:",psutil.virtual_memory(), "\n--------")
            time.sleep(tempo)
            desejo = 1

captura()

