const pg = require('pg')
const fs = require('fs');
const readline = require('readline-sync');

var table = fs.readFileSync('scripts/ddl.sql').toString();
var data = fs.readFileSync('scripts/dml.sql').toString();

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

    getLugar = async (id) => {
        let response = [];
        await this.db.query(`SELECT * FROM localTab WHERE id ='${id}'`)
            .then((results) => {
                response = results.rows
            })
        //console.log(response[0]);
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
        if(x == 0){r = askAndReturn('1- Jogar\n2- Sair\n3- Criar e Popular Tabelas\n');}
        if(x == 1){r = askAndReturn('1- Jogar\n2- Sair\n');}
       
        if (r == 1) {
            while (aux == 1) {
                nome = askAndReturn('Bem vindo ao God of War - O bom de guerra!\nQual o nome do personagem?\n')
                try {
                    resultado = await api.getLogin(nome)

                    jogador = new Jogador(resultado['id'], resultado['nome'], resultado['vidaAtual'], resultado['vidaTotal'], resultado['experiencia'], resultado['forca'], resultado['defesa'], resultado['id_local'], resultado['id_nivel'])
                    console.log("Bem-vindo " + jogador.nome)
                    break;

                } catch (error) {
                    console.log(error)
                }
            }

            while (aux == 1) {
                let m = 0
                try {
                    result = await api.getLogin(nome)
                    lugar = await api.getLugar(result['id_local'])

                } catch (error) {
                    console.log(error)
                }
                m = askAndReturn(`Voce esta em ${lugar['nome']}, \n'${lugar['descricao']}'. \nPara onde voce gostaria de ir agora?\n 1-Norte \t  2-Leste \t 3-Menu Principal\n`)
                if (m == 1) {
                    try {
                        await api.atualizarPosicao(jogador.id, result['id_local'] + 1)
                    } catch (error) {
                        console.log(error)
                    }
                }
                if (m == 2) {
                    try {
                        await api.atualizarPosicao(jogador.id, result['id_local'] - 1)

                        //console.log("Você foi para a posição 2");
                    } catch (error) {
                        console.log(error)
                    }
                }
                if (m == 3) {
                    x = 1 
                    break;}
            }
        }
        if (r == 2){
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
        }
    }





}
main()