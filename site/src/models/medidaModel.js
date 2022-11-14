var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas} cpuTotem as cpu, memoriaTotem as memoria, discoTotem as disco, dataHora,
        CONVERT(varchar, dataHora, 108) as momento_grafico from Leitura where fkAtm = ${idAquario}
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



    // const hoje = new Date();
    // const horaInicial = 8;
    // const data = `${hoje.getFullYear()}-${hoje.getMonth()+1}-${hoje.getDate()}`;

    // instrucaoSql = 'select * from (';
    // instrucaoSql += `
    // (select SUM(chave) as contagem, '${horaInicial.toString().padStart(2, '0')}:00' as 'momento_grafico' from medida 
    //     where momento >= '${data} ${horaInicial}:00:00' and momento < '${data} ${horaInicial+1}:00:00')
    // `;


    // const horaFinal = new Date().getHours() + 1;
    // for (let hora = horaInicial+1; hora < horaFinal; hora++) {
    //     instrucaoSql += ` UNION 
    //     (select SUM(chave) as contagem, '${hora.toString().padStart(2, '0')}:00' as 'momento_grafico' from medida 
    //     where momento >= '${data} ${hora}:00:00' and momento < '${data} ${hora+1}:00:00')
    //    `
    // }

    // instrucaoSql += ') as u ORDER by u.momento_grafico;';

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    // return database.executar(instrucaoSql);
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


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
