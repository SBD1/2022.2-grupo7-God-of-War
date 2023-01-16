const pg = require('pg')
const fs = require('fs');
const readline = require('readline-sync');

var table = fs.readFileSync('scripts/ddl.sql').toString(); 
var data = fs.readFileSync('scripts/dml.sql').toString();

class Jogador {
    constructor(id, nome, vidaAtual, vidaTotal, experiencia, forca, defesa, id_local, id_nivel ){
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
class Api{

    db = new pg.Client({
        user: 'postgres',
        host: 'localhost', 
        database: 'postgres', 
        password: 'postgres', 
        port: 5432
    }); 

    constructor(){
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

    criarTabelas = async() =>{
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
            .then((results) =>{
                response = true
            })
        return response; 
    };

    atualizarPosicao = async (id_jogador, id_posicao) =>{
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

    consultarJogador = async() => {
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

main = async() => {
    const api = new Api();
    let jogador = new Jogador();
    let aux = 1
    //console.log('1- Jogar\n2- Sair\n3- Criar e Popular Tabelas\n');
    let r = askAndReturn('1- Jogar\n2- Sair\n3- Criar e Popular Tabelas\n'); 
    if( r == 1 ){
        while (aux == 1){
            nome = askAndReturn('Qual o nome do personagem?')
            try{
                resultado = await api.getLogin(nome)
                
                jogador = new Jogador(resultado['id'] , resultado['nome'], resultado['vidaAtual'], resultado['vidaTotal'], resultado['experiencia'], resultado['forca'], resultado['defesa'], resultado['id_local'], resultado['id_nivel'] )
                console.log("Bem-vindo " + jogador.nome)
                break;

            }catch (error) {
                console.log(error)
            }}

        while (aux == 1){
            let m = 0
            try {
                result = await api.getLogin(nome)
            }catch (error) {
                console.log(error)
            }
            m = askAndReturn(`Você está em '${result['id_local']}', para onde você gostaria de ir agora?\n 1-Norte \t  2-Leste`)
            if (m == 1){
            try{
                await api.atualizarPosicao(jogador.id,4)
            } catch (error) {
                console.log(error)
            }}
            if (m == 2){
                try{
                    await api.atualizarPosicao(jogador.id,2)

                    console.log("Você foi para a posição 2");
                } catch (error) {
                    console.log(error)
                }}
            if ( m == 3) break;
        }
    }
    if( r == 3 ){
        console.log('entrou')
        try {
            let res = await api.criarTabelas()
            if(res) {console.log("Tabelas Criadas com Sucesso!!!! :D")}
        }
        catch (error) {
            console.log(error);
        } 
        try {
            let res = await api.carregarTabelas()
            if (res) {console.log("As tabelas foram carregadas com sucesso!!! XD")}
        }
        catch (error) {
            console.log(error)
        }
       r = askAndReturn('1- Jogar\n2- Sair\n')
    }
    api.consultarJogador();




}
main()