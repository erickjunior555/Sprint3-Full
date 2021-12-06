var database = require("../database/config");


function buscarUltimasMedidas(idBarril, limite_linhas) {
    instrucaoSql = `select top(15)
    idSensor,
    temperatura_lm35, 
    convert(varchar(8), momento, 108) as momento_grafico
    from leitura join sensor on idSensor = 200
    order by idLeitura desc;`;

    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMedidasEmTempoReal(idBarril) {
    instrucaoSql = `select top(15)
                        idSensor,
                        temperatura_lm35, 
                        convert(varchar(8), momento, 108) as momento_grafico
                        from leitura join sensor on idSensor = 200
                        order by idLeitura asc;
    `;
                    
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}