const pg = require('pg')
const fs = require('fs');
const readline = require('readline-sync');

var table = fs.readFileSync('scripts/ddl.sql').toString();
var data = fs.readFileSync('scripts/dml.sql').toString();
var trigger = fs.readFileSync('scripts/Trigger_stored_procedure.sql').toString();

class Jogador {
    constructor(id, nome, vidaAtual, vidaTotal, experiencia, forca, defesa, id_local, id_nivel) {
        this.id = id;
        this.nome = nome;
        this.vidaAtual = vidaAtual;
        this.vidaTotal = vidaTotal;
        this.experiencia = experiencia;
        this.forca = forca;
        this.defesa = defesa;
        this.id_local = id_local;
        this.id_nivel = id_nivel;

    }
}
class Api {

    db = new pg.Client({
        user: 'postgres',
        host: 'localhost',
        database: 'postgres',
        password: 'postgres',
        port: 5432
    });

    constructor() {
        this.db.connect();
    }

    getLogin = async (name) => {
        let response = [];
        await this.db.query(`SELECT * FROM jogador WHERE nome = '${name}'`)
            .then((results) => {
                response = results.rows
            })
        return response[0];

    };

    createNew = async(name) => {
        let response = []; 
        await this.db.query(`INSERT INTO jogador (nome) VALUES ('${name}')`)
            .then((results) => {
                response = results.rows
            })
        return;
    }

    getLugar = async (id) => {
        let response = [];
        await this.db.query(`SELECT * FROM localTab WHERE id ='${id}'`)
            .then((results) => {
                response = results.rows
            })
        //console.log(response[0]);
        return response[0];

    }

    getNPC = async (id) => {
        let response = [];
        await this.db.query(`SELECT * FROM npc WHERE pos ='${id}'`)
            .then((results) => {
                response = results.rows
            })
        //console.log(response[0]);
        return response[0];

    }

    getInimigo = async (pos) => {
        let response = [];
        await this.db.query(`SELECT * FROM inimigo WHERE pos ='${pos}'`)
            .then((results) => {
                response = results.rows
            })
        //console.log(response[0]);
        return response[0];

    }

    InimigoMorreu = async (id) => {
        let response = [];
        await this.db.query(`UPDATE inimigo set vidaatual = 0 where id = ${id}`)
            .then((results) => {
                response = results.rows
            })
        //console.log(response[0]);
        return response[0];

    }

    updateVidaJogador = async (vida, id) => {
        let response = []; 
        await this.db.query(`UPDATE jogador set vidaatual = ${vida} where id = ${id}`)
            .then((results) => {
                response = results.rows
            })
        return response[0];

    }

    criarTabelas = async () => {
        let response = false;
        await this.db.query(table)
            .then((results) => {
                response = true
            })
        return response;

    };

    carregarTabelas = async () => {
        let response = false;
        await this.db.query(data)
            .then((results) => {
                response = true
            })
        return response;
    };
    
    countMorte = async(x) => {

        if(x == 3){
            console.log("\nVocê realmente é um inciiante em jogos né?\n");
        }
        if(x == 6){
            console.log("\nMelhor procurar outro hobbie!\n");
        }
        if(x == 9) console.log("\nVoce ta parecendo o vasco\n");
    }

    criarTriggers =  async () => {
        let response = false;
        await this.db.query(trigger)
            .then((results) => {
                response = true
            })
        return response;
    };

    atualizarPosicao = async (id_jogador, id_posicao) => {
        let response = [];
        await this.db.query(`UPDATE jogador set id_local = ${id_posicao} where id = ${id_jogador}`)
            .then((results) => {
                response = results.rows
            })
        return response[0];
    };

    encontrarPosicao = async (id_posicao) => {
        let response = [];
        await this.db.query(`SELECT * from localTab where id=${id_posicao}`)
            .then((results) => {
                response = results.rows
            })
        return response[0];

    };

    consultarJogador = async () => {
        let response = [];
        await this.db.query(`SELECT * from jogador`).then((result) => {
            response = result.rows
        })
        console.log(response[0]['vidaatual']);

    }

}

function askAndReturn(texto) {
    return readline.question(texto)
}

main = async () => {
    const api = new Api();
    let jogador = new Jogador();
    let aux = 1
    let vas = 0;
    let x = 0;
    let r;
    //console.log('1- Jogar\n2- Sair\n3- Criar e Popular Tabelas\n');
    while (vas == 0) {
        if (x == 0) { r = askAndReturn('===========================\n1- Jogar\n2- Sair\n3- Criar e Popular Tabelas\n'); }
        if (x == 1) { r = askAndReturn('1- Jogar\n2- Sair\n'); }
        rep = 0
        if (r == 1) {
            temp = askAndReturn('1 - Entrar em um personagem existente \t 2 - Criar um novo personagem\n');
            if (temp == 1) {
                while (aux == 1) {
                    nome = askAndReturn('Bem vindo ao God of War - O bom de guerra!\nQual o nome do personagem?\n')
                    
                    try {
                        resultado = await api.getLogin(nome)
                        console.log("Entrou")
                        jogador = new Jogador(resultado['id'], resultado['nome'], resultado['vidaAtual'], resultado['vidaTotal'], resultado['experiencia'], resultado['forca'], resultado['defesa'], resultado['id_local'], resultado['id_nivel'])
                        console.log("Bem-vindo " + jogador.nome)
                        break;

                    } catch (error) {
                        console.log("Usuario não existe. Tente novamente ou crie um personagem.")
                        if(askAndReturn("1 - Voltar para o menu inicial \t 2 - Tentar novamente\n") == 1) main();
                    }
                    
                }
            }
            
            if (temp == 2){
                nome = askAndReturn('Qual o nome do personagem a ser criado?\n'); 
                try{
                    
                    await api.createNew(nome);
                    console.log("Jogador criado com sucesso.")
                    
                }
                catch(error){
                    console.log(error)
                };
                main(); 

            }
            while(rep == 0){
            if (aux == 1) {
                let m = 0
                try {
                    //console.log(`\n '${nome}'`)
                    result = await api.getLogin(nome)
                    lugar = await api.getLugar(result['id_local'])
                    npc = await api.getNPC(result['id_local'])

                } catch (error) {
                    console.log(error)
                }
                if(npc == undefined){console.log("Undefineeeeeeeeed")}
                console.log(`Voce esta em ${lugar['nome']}, \n'${lugar['descricao']}'.`)
                lig = lugar['proxsala'];
                jogador_vidaatual = result['vidaatual']
                jogador_forca = result['forca']
                
                //console.log("Locais que pode ir" + lig)
                //console.log(npc);
                
                if(npc != undefined){
                    if(npc['tipo'] == 1 ){
                       try{
                        inimigo = await api.getInimigo(result['id_local']);
                    }
                    catch (error) {
                        console.log(error)
                    }
                        if(inimigo['vidaatual'] != 0) {
                        inimigo_vidaatual = inimigo['vidaatual']
                        inimigo_dano = inimigo['dano']
                        console.log(`Ao entrar, voce se depara com um ${inimigo['nome']},${inimigo['descricao']}. A criatura percebe sua presenca e ruge "${inimigo['dialogo']}".\n`)
                        while(inimigo_vidaatual > 0){
                            act = askAndReturn(`O jogador esta com ${jogador_vidaatual} e o inimigo  esta com ${inimigo_vidaatual}\nO que voce deseja fazer:\n1 - Atacar\n2 - Usar pocao\n`)
                            if(act == 1){
                               dano = Math.floor(Math.random() * jogador_forca)
                               console.log("Voce deu " + dano + " de dano")
                               inimigo_vidaatual = inimigo_vidaatual -  dano 
                               if(inimigo_vidaatual <= 0) {
                               console.log("\nO Inimigo morreu!\n")
                               await api.InimigoMorreu(inimigo['id'])
                               api.updateVidaJogador(jogador_vidaatual, result['id'])
                               break; 
                            }
                               sofrido = Math.floor(Math.random() * inimigo_dano)
                               console.log("Voce recebeu " + sofrido + " de dano") 
                               jogador_vidaatual = jogador_vidaatual - sofrido
                               if(jogador_vidaatual <= 0) {
                                console.log("\nVoce morreu!\n Mais sorte na proxima vez!\n")
                                api.updateVidaJogador(0, result['id'])
                                api.countMorte(result['mortes'] + 1)
                                process.exit()
                                
                             }
                            }
                        }
                    }}

                    if(npc['tipo'] == 3){
                        console.log("Voce encontrou um mercador");
                    }
                }
                if(lig == 1) {
                    resp = askAndReturn("1 - Seguir em frente.\t2 - Status do personagem.\t3 - Sair.\n")
                    if(resp == 1) m = 1; 
                    if(resp == 2) m = 4; 
                    if(resp == 3) m = 5; 
            }
                if(lig == 2) { 
                    resp = askAndReturn("1 - Seguir em frente.\t2 - Voltar.\t3 - Status do personagem.\t4 - Sair.\n")
                    if(resp == 1) m = 1;
                    if(resp == 2) m = 3;
                    if(resp == 3) m = 4; 
                    if(resp == 4) m = 5;  
                }
                if(lig == 3) {
                    resp = askAndReturn("1 - Seguir a direita.\t2 - Seguir a esquerda.\t3 - Voltar\t4 - Status do personagem.\t5 - Sair.\n")
                    if(resp == 1) m = 1;
                    if(resp == 2) m = 2; 
                    if(resp == 3) m = 3;
                    if(resp == 4) m = 4; 
                    if(resp == 5) m = 5;  
                }
                //m = askAndReturn(`Voce esta em ${lugar['nome']}, \n'${lugar['descricao']}'. \nPara onde voce gostaria de ir agora?\n 1-Norte \t  2-Leste \t 3-Status do Jogador \t \t 4-Menu Principal\n`)
                //console.log("jogador" + jogador.id)
                if (m == 1) {
                    try {
                        await api.atualizarPosicao(jogador.id, result['id_local'] + 1)
                    } catch (error) {
                        console.log(error)
                    }
                }
                if (m == 2) {
                    try {
                        await api.atualizarPosicao(jogador.id, result['id_local'] + 2)
                    } catch (error) {
                        console.log(error)
                    }
                }
                if (m == 3) {
                    try {
                        await api.atualizarPosicao(jogador.id, result['id_local'] - 1)
                    } catch (error) {
                        console.log(error)
                    }
                }
                if (m == 4){
                        result = await api.getLogin(nome)
                        console.log(`\n${result['nome']} possui os seguintes status:\nVida - ${result['vidaatual']}/${result['vidatotal']}\nExperiencia - ${result['experiencia']}\nDefesa - ${result['defesa']}\nDano - ${result['forca']}\n`)
                        //console.log(result);

                }
                if (m == 5) {
                    process.exit();
                }
            }
        }}
        if (r == 2) {
            console.log("Voce saiu!")
            vas = 1
            process.exit();
        }
        if (r == 3) {

            x = 1;
            try {
                let res = await api.criarTabelas()
                if (res) { console.log("Tabelas Criadas com Sucesso!!!! :D") }
            }
            catch (error) {
                console.log(error);
            }
            try {
                let res = await api.carregarTabelas()
                if (res) { console.log("As tabelas foram carregadas com sucesso!!! XD") }
            }
            catch (error) {
                console.log(error)
            }
            try{
                let res = await api.criarTriggers()
                if (res) { console.log("Triggers criados com sucesso! :o")}
            }
            catch (error) {
                console.log(error)
            }
        }
    }





}
main()