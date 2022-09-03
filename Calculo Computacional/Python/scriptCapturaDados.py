# Eduardo Bengattini RA: 032210
# Erika Mendes RA: 03221023
# Gabriel Antonio RA: 03221012
# Gustavo Golçalves RA: 03221046
# Mariana Cabral RA: 03221061
# Patrick Herold RA: 03221054

import psutil
import time
from datetime import datetime

import mysql.connector
from mysql.connector import errorcode


def captura(conn):

      cursor = conn.cursor()
      print("Seja bem-vindo ao sistema de captura de dados do seu Hardware \U0001F604")
      print("Menu de Opções: \n - CPU \n - Memoria \n - HD \n - Todos")
      
      componente = input("\U0001F916 Qual componente do seu sistema operacional você deseja monitorar?")
      tempo = int(input("\U0001F916 Em quantos segundos você deseja acompanhar?"))
      
      porcentagem =  psutil.cpu_percent(interval = None , percpu = False)
      usoDisco = psutil.disk_usage('C:\\')[3]
      memoria = psutil.virtual_memory().percent
      
      # nucleos = psutil.cpu_count(logical=False)
      # processadoresLogicos = psutil.cpu_count()
      # frequencia =  psutil.cpu_freq(percpu=False)
      # cpu = psutil.cpu_times (percpu = False )
      desejo = bool(1)
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
              print("\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco,'%', "\n\U0001F55B - Data e Hora:", dataHoraFormat,"\n--------")
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
              dataHoraFormat = dataHora.strftime('%Y/%m/%d %H:%M:%S')
              
              print ("\U0001F4BB - Porcentagem de Utilização da CPU: {:.1f}%".format(porcentagem),
              "\n\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco,'%',
              "\n\U0001F4BB - Porcentagem de Utilização da Memoria:",psutil.virtual_memory().percent,'%',"\n\U0001F55B - Data e Hora:", dataHoraFormat,"\n--------")
              
              CPU3 = porcentagem * 1.15
              CPU2 = CPU3 - 0.05 
              
              
              M3 = memoria * 1.10
              M2 = memoria * 1.15

              D2 = usoDisco - 0.05
              D3 = D2 * 3
              cursor.execute("INSERT INTO Leitura (fkTotem, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (%s,%s, %s, %s,%s);", (1000, porcentagem , memoria, usoDisco,dataHoraFormat))
              cursor.execute("INSERT INTO Leitura (fkTotem, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (%s,%s, %s, %s,%s);", (1001, CPU2 , M2 , D2 ,dataHoraFormat))
              cursor.execute("INSERT INTO Leitura (fkTotem, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (%s,%s, %s, %s,%s);", (1002, CPU3  , M3, D3 ,dataHoraFormat))
                        
              conn.commit()
              time.sleep(tempo)
              desejo = 1        


try:
 
  conn = mysql.connector.connect(
  host='localhost',
  user='root',
  password='#Gf51363594800',
  database='rec'
  )
  print ("Conexão estabilizada")
  captura(conn)

except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Algo está errado com o username ou a senha")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Banco de dados não existe")
  else:
    print(err)
else:
  cursor = conn.cursor()