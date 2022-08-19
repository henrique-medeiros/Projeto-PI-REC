
import psutil
import time
from datetime import datetime


def captura():
    print("Seja bem-vindo ao sistema de captura de dados do seu Hardware \U0001F604")
    print("Menu de Opções: \n - CPU \n - Memoria \n - HD \n - Todos")
    desejo = bool(1)
    componente = input("\U0001F916 Qual componente do seu sistema operacional você deseja monitorar?")
    tempo = int(input("\U0001F916 Em quantos segundos você deseja acompanhar?"))
    
    porcentagem =  psutil.cpu_percent(interval = None , percpu = False)
    usoDisco = psutil.disk_usage('C:\\')
    
    # nucleos = psutil.cpu_count(logical=False)
    # processadoresLogicos = psutil.cpu_count()
    # frequencia =  psutil.cpu_freq(percpu=False)
    # cpu = psutil.cpu_times (percpu = False )

    if (componente == "CPU" or componente == "cpu"):
        print("\U0001F750 Iniciando captura de dados da CPU...", "\n--------")
        while(desejo == 1):
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')

            print("\U0001F4BB - Porcentagem de Utilização da CPU: {:.1f}%".format(porcentagem) ,"\n\U0001F55B - Data e Hora:", dataHoraFormat,"\n--------",)
            # ,"\nNucleos:", nucleos, "\nProcessadores Logicos:{:.2f}".format(processadoresLogicos),
            #        "\nFrequencia da CPU:", frequencia, "\n--------", "\nUsuário", cpu[0], "\ntempo Sistema:{:.2f} Hrs".format(cpu[1]/3600), "\ntempo inativo:{:.2f}Hrs".format(cpu[2]/3600), "\nChamadas de procedimento adiadas:{:.2f}".format(cpu[3])
            time.sleep(tempo)
            desejo = 1

    if (componente == "HD" or componente == "hd" or componente == "Hd"):
        print("\U0001F750 Iniciando captura de dados do Disco...", "\n--------")
        while(desejo == 1):
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')
            print("\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco[3],'%', "\n\U0001F55B - Data e Hora:", dataHoraFormat,"\n--------")
            # "\nEspaço total:",usoDisco[0], "\nUsado:", usoDisco[1], "\nLivre:", usoDisco[2],
            time.sleep(tempo)
            desejo = 1
            
    if (componente == "memoria" or componente == "MEMORIA" or componente == "Memoria"):
        print("Iniciando captura de dados da Memoria...\U0001F4AD", "\n--------")
        while(desejo == 1):
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')
            print ("\U0001F4BB - Porcentagem de Utilização da Memoria:",psutil.virtual_memory().percent, '%',"\n\U0001F55B - Data e Hora:", dataHoraFormat, "\n--------")
            time.sleep(tempo)
            desejo = 1

    if (componente == "TODOS" or componente == "todos" or componente == "Todos"):
        print("\U0001F750 Iniciando captura dos dados...", "\n--------")
        while(desejo == 1):
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')
            print ("\U0001F4BB - Porcentagem de Utilização da CPU: {:.1f}%".format(porcentagem),
            "\n\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco[3],'%',
            "\n\U0001F4BB - Porcentagem de Utilização da Memoria:",psutil.virtual_memory().percent,'%',"\n\U0001F55B - Data e Hora:", dataHoraFormat,"\n--------")
            time.sleep(tempo)
            desejo = 1        


captura()

