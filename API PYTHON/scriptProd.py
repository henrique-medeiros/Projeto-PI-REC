# GRUPO 1 - PI - REC.
# Eduardo Bengattini RA: 03221008
# Erika Mendes RA: 03221023
# Gabriel Antonio RA: 03221012
# Gustavo Golçalves RA: 03221046
# Mariana Cabral RA: 03221061
# Patrick Herold RA: 03221054

# Importações de Bibliotecas:
import psutil #
import time
from datetime import datetime
import platform #
import mysql.connector
from mysql.connector import errorcode
import pyodbc
import textwrap3


# Função captura de dados de maquina:

def captura(cnxn):

    cursor = cnxn.cursor()
    print("Seja bem-vindo ao sistema de captura de dados do seu Hardware \U0001F604")
    print("Menu de Opções: \n - CPU \n - Memoria \n - HD \n - Todos")

    componente = input(
        "\U0001F916 Qual componente do seu sistema operacional você deseja monitorar?")
    tempo = int(input("\U0001F916 Em quantos segundos você deseja acompanhar?"))

    desejo = bool(1)
    if (componente == "CPU" or componente == "cpu"):
        print("\U0001F750 Iniciando captura de dados da CPU...", "\n--------")
        while(desejo == 1):
            porcentagem = psutil.cpu_percent(interval=None, percpu=False)
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')

            print("\U0001F4BB - Porcentagem de Utilização da CPU: {:.1f}%".format(
                porcentagem), "\n\U0001F55B - Data e Hora:", dataHoraFormat, "\n--------",)

            time.sleep(tempo)
            desejo = 1

    if (componente == "HD" or componente == "hd" or componente == "Hd"):
        print("\U0001F750 Iniciando captura de dados do Disco...", "\n--------")
        while(desejo == 1):
            usoDisco = psutil.disk_usage('/')[3]
            porcentagem = psutil.cpu_percent(interval=None, percpu=False)
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')
            print("\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco,
                  '%', "\n\U0001F55B - Data e Hora:", dataHoraFormat, "\n--------")
            time.sleep(tempo)
            desejo = 1

    if (componente == "memoria" or componente == "MEMORIA" or componente == "Memoria"):
        print("Iniciando captura de dados da Memoria...\U0001F4AD", "\n--------")
        while(desejo == 1):
            porcentagem = psutil.cpu_percent(interval=None, percpu=False)
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%d/%m/%Y %H:%M:%S')
            print("\U0001F4BB - Porcentagem de Utilização da Memoria:", psutil.virtual_memory(
            ).percent, '%', "\n\U0001F55B - Data e Hora:", dataHoraFormat, "\n--------")
            time.sleep(tempo)
            desejo = 1

    if (componente == "TODOS" or componente == "todos" or componente == "Todos"):
        print("\U0001F750 Iniciando captura dos dados...", "\n--------")
        meu_sistema = platform.uname()
        sistema = meu_sistema.system
        maquina = meu_sistema.machine
        nomeMaquina = meu_sistema.node

        # ATM 1 (Maquina 1)
        if (sistema == "Windows"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, nomeMaquina, maquina, sistema))
        elif (sistema == "Linux"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, nomeMaquina, maquina, sistema))
        # ATM 2 (Maquina 2)
        if (sistema == "Windows"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, "Maquina 2", "AMD32", "Linux"))
        elif (sistema == "Linux"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, "Maquina 2", "AMD32", "Windows"))
        # ATM 3 (Maquina 3)
        if (sistema == "Windows"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, "Maquina 3", maquina, "MacOS"))
        elif (sistema == "Linux"):
            cursor.execute("INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (?, ?, ?, ?);",
                           (10, "Maquina 3", maquina, "Linux"))

        while(desejo == 1):
            dataHora = datetime.now()
            dataHoraFormat = dataHora.strftime('%Y/%m/%d %H:%M:%S')
            porcentagem = psutil.cpu_percent(interval=None, percpu=False)
            usoDisco = psutil.disk_usage('/')[3]
            memoria = psutil.virtual_memory().percent

            print("\U0001F4BB - Porcentagem de Utilização da CPU: {:.1f}%".format(porcentagem),
                  "\n\U0001F4BB - Porcentagem de Utilização do Disco:", usoDisco, '%',
                  "\n\U0001F4BB - Porcentagem de Utilização da Memoria:", psutil.virtual_memory().percent, '%', "\n\U0001F55B - Data e Hora:", dataHoraFormat, "\n--------")

            # Simulação de ATMs:

            CPU3 = porcentagem * 1.15
            CPU2 = CPU3 - 0.05

            M3 = memoria * 1.10
            M2 = memoria * 1.15

            D2 = usoDisco - 0.05
            D3 = D2 * 3

            cursor.execute("INSERT INTO Leitura (fkAtm, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (?, ?, ?, ?, ?);",
                           (1, porcentagem, memoria, usoDisco, dataHoraFormat))
            cursor.execute("INSERT INTO Leitura (fkAtm, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (?, ?, ?, ?, ?);",
                           (2, CPU2, M2, D2, dataHoraFormat))
            cursor.execute("INSERT INTO Leitura (fkAtm, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (?, ?, ?, ?, ?);",
                           (3, CPU3, M3, D3, dataHoraFormat))

            cnxn.commit()
            time.sleep(tempo)
            desejo = 1

try:
    # Conexão com o banco de dados
    driver= '{ODBC Driver 18 for SQL Server}'
    server_name = 'projeto-rec'
    database_name = 'REC'
    server = '{server_name}.database.windows.net,1433'.format(server_name=server_name)
    username = 'grupo09'
    password = 'M@umau03221'

    connection_string = textwrap3.dedent('''
    Driver={driver};
    Server={server};
    Database={database};
    Uid={username};
    Pwd={password};
    Encrypt=yes;
    TrustedServerCertificate=no;
    Connection Timeout=10;
    '''.format(
        driver=driver,
        server=server,
        database=database_name,
        username=username,
        password=password
    ))
    
    cnxn:pyodbc.Connection = pyodbc.connect(connection_string)

    global crsr
    crsr = cnxn.cursor
    print("Conexão com o Banco de Dados Azure efetuada com sucesso.")
    captura(cnxn)

    # Validações de Erro:
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Algo está errado com o Usuario do Banco ou a Senha.")
        time.sleep(10)
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Banco de dados não existe.")
        time.sleep(10)
    else:
        print(err)
        time.sleep(10)
else:
    cursor = cnxn.cursor()
