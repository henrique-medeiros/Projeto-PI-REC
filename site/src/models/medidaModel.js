var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        cpuTotem as cpu, 
        memoriaTotem as memoria, 
        discoTotem as disco,
        memoriaTotem as memoria,
        dataHora,
        CONVERT(varchar, dataHora, 108) as momento_grafico
        from Leitura 
        where fkAtm = ${idAquario}
        order by idLeitura desc
        `;
        
    
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, 
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from leitura
                    where fkAtm = ${idAquario}
                    order by idLeitura desc ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }



    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, dataHora,
        CONVERT(varchar, dataHora, 108) as momento_grafico from Leitura join Atm on fkAtm = idAtm 
        order by idLeitura desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, 
        dataHora,
        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
        from leitura
        where fkAtm = ${idAquario}
         order by idLeitura desc ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidaIdle(idAtm, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas} cpuUso as uso, cpuIdle as inativo, cpuIO as entrada, dataHora,
        CONVERT(varchar, dataHora, 108) as momento,
        fkAtm 
        from MAUind, Atm
        where fkAtm = idAtm
        order by idLeitura desc`;
    
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, 
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from leitura
                    where fkAtm = ${idAquario}
                    order by idLeitura desc ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }



    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

function buscarMedidasTempoRealporAtm(fkAtm) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1 cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, dataHora,
        CONVERT(varchar, dataHora, 108) as momento_grafico from Leitura join Atm on fkAtm = ${fkAtm} 
        order by idLeitura desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        
        instrucaoSql = 
            `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, dataHora,
            CONVERT(varchar, dataHora, 108) as momento_grafico from Leitura join Atm on fkAtm = ${fkAtm} 
            order by idLeitura desc`;
        
    }
    else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidaAtm(fkAtm, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas} cpuTotem as cpu, memoriaTotem as memoria, dataHora,
        CONVERT(varchar, dataHora, 108) as momento_grafico
        from Leitura  from 
        Leitura where fkAtm = ${fkAtm} 
        order by idLeitura desc;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = 
            `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, 
            dataHora,
            DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
        from leitura
        where fkAtm = ${idAquario}
        order by idLeitura desc ${limite_linhas}`;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function toniniFofo() {
    instrucaoSql = ''
    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 7 t1.novaDate, avg(t2.memoriaTotem) as memoria from (select *, format(dataHora, 'd') as novaDate from Leitura) t1 join Leitura t2 on t1.idLeitura = t2.idLeitura group by novaDate order by novaDate desc`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

//Veio
function buscarMedidaTemp(fkTemp, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas} tMin as minimo, tMed as real, tMax as maximo, dataHora,
        CONVERT(varchar, dataHora, 108) as momento,
        fkAtm 
        from Temperatura, Atm
        where fkAtm = idAtm
        order by idTemp desc`;
    
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, 
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from leitura
                    where fkAtm = ${idAquario}
                    order by idLeitura desc ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }


    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMedidaIdle, 
    buscarMedidasTempoRealporAtm,
    buscarMedidaAtm,
    toniniFofo,
    buscarMedidaTemp
}
