


| Data | Versão | Alteração |  Autor(es)   |
| -------- | -------- | -------- | --- |
| 26/11/2022     | 1.0     | Criação do documento  | [Pedro](https://github.com/phnog)     |

# Dicionário de Dados

### Entidade: Jogador 
#### Descrição: Personagem jogavel. 


| Atributo  | Tipo    | Valores Possiveis | Descrição                              |
| --------- | ------- | ------- | -------------------------------------- |
| idJogador | int     | 0 - 99       | Identificador do jogador               |
| nome      | varchar | 64      | Nome do personagem                     |
| vidaAtual | int     | 0 - 10000       | Pontos de vida atual do jogador        |
| vidaTotal | int     | 1 - 10000      | Pontos de vida total do jogador        |
| exp       | int     | 0 - 10000       | Pontos de experiencia atual do jogador |
| forca      | int     | 1 - 300       | Valor do poder de ataque do jogador    |
| defesa    | int     | 1 - 300      | Valor do poder de defesa do jogador    |
| pos       | int     | 1 - 50       | Posição do jogador no mapa             |
### Entidade: Nivel 
#### Descrição: Valor que identifica a progressão de experiência do jogador. 


| Atributo     | Tipo | Valores Possiveis | Descrição                                                 |
| ------------ | ---- | ------- | --------------------------------------------------------- |
| idNivel | int  | 0-9       | Identificador do nivel       |
| xpNecessario | int  | 100 - 10000       | Quantidade de experiência para evoluir o personagem       |
| forca        | int  | 10 - 100       | Valor do poder de ataque bonus que o jogador vai receber  |
| defesa       | int  | 10 - 100       | Valor do poder de defesa bonus  que o jogador vai receber |


### Entidade: Ataque 
#### Descrição: Lista de movimentos que o jogador pode performar. 


| Atributo      | Tipo    | Valores Possiveis | Descrição                                           |
| ------------- | ------- | ------- | --------------------------------------------------- |
| idAtaque      | int     | 0 - 99       | Identificador do movimento de ataque                |
| nome          | varchar | 64      | Nome do ataque                                      |
| multiplicador | int     | 1 - 10       | Valor para multiplicar o poder de ataque do jogador |
| qntAlvos      | int     | 1 - 5       | Quantidade de alvos que o ataque pode acertar       |
| desc              |  varchar       |   64      |  Descrição do ataque   |


### Entidade: Item 
#### Descrição: Utensílios para auxiliar o jogador. 


| Atributo | Tipo    | Valores Possiveis | Descrição             |
| -------- | ------- | ------- | --------------------- |
| idItem   | int     | 0 - 99      | Identificador do item |
| nome     | varchar | 64      | Nome do item          |
| peso     | int     | 1 - 100      | Peso de cada item     |
| valor    | int     | 1 - 9999       | Valor do item         |

### Entidade: Equipamento 
#### Descrição: Itens que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição             |
| -------- | ------- | ------- | --------------------- |
| nivel   | int     | 1 - 10       | Nivel necessario para utilização do item |

### Entidade: Armadura 
#### Descrição: Itens defensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| tipo     | varchar | 64      | Tipo da armadura (Peitoral ou Cinto)       |
| defesa   | int     | 1 - 200       | Quantidade de pontos de defesa da armadura |
| vida     | int     | 0 - 1000       | Quantidade de pontos de vida da armadura   |

### Entidade: Arma 
#### Descrição: Itens ofensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| dano     | int | 1 - 200      | Pontos de ataque da arma       |

### Entidade: Poção 
#### Descrição: Itens consumiveis pelo jogador. 

| Atributo | Tipo    | Valores Possiveis | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| vidaRegen     | int | 0 - 1000      | Pontos de vida que a poção vai recuperar do jogador       |






### Entidade: NPC 
#### Descrição: Personagens com opção de interação não jogaveis. 


| Atributo  | Tipo    | Valores Possiveis | Descrição              |
| --------- | ------- | ------- | ---------------------- |
| idNPC     | int     | 0 - 40      | Identificador do NPC   |
| nome      | varchar | 64      | Nome do NPC            |
| tipo      | varchar | 64      | Tipo de NPC (Inimigo, Personagem, Mercador ou Ferreiro)          |
| descricao | varchar | 64      | Descrição sobre o NPC  |
| pos       | int     | 1 - 50       | Posição do NPC no mapa |
| dialogo   | varchar | 64      | Dialogo do NPC         |


### Entidade: Inimigo 
#### Descrição: Personagens agressivos ao jogador. 


| Atributo | Tipo | Valores Possiveis | Descrição                            |
| -------- | ---- | ------- | ------------------------------------ |
| dano     | int  | 1 - 300       | Pontos de poder de ataque do inimigo |
| defesa   | int  | 1 - 300       | Pontos de poder de defesa do inimigo |
| ataque   | int  | 0 - 99       | Ataques do inimigo                   |
| vida     | int  | 10 - 10000     | Quantidade de vida do Inimigo |

### Entidade: Personagem 
#### Descrição: Tipo de NPC neutro em relação ao jogador. 

### Entidade: Mercador 
#### Descrição: Personagens que auxilia o jogador com venda de itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                                              |
| ---------- | ---- | ------- | ---------------------------------------------------------------------- |
| multiVenda | int  | 0 - 10       | Multiplicador do preço do item que o jogador esta vendendo ao Mercador |
| itens      | int  | 0 - 10       | Itens disponiveis para venda                                           |


### Entidade: Ferreiro 
#### Descrição: Personagens que auxilia o jogador com melhoria dos itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                           |
| ---------- | ---- | ------- | --------------------------------------------------- |
| melhorias  | int  | 0 - 10 | Melhorias disponíveis para o equipamento do jogador |
| multiValor | int  | 1 - 10      | Multiplicador do valor de cada melhoria             |


### Entidade: Local 
#### Descrição: Lugar do mapa.

| Atributo  | Tipo    | Valores Possiveis | Descrição              |
| --------- | ------- | ------- | ---------------------- |
| idLocal   | int     | 0 - 50      | Identificador do local |
| descricao | varchar | 64      | Descrição do local     |
| nome      | varchar | 64      | Nome do local          |

### Entidade: Báu 
#### Descrição: Caixa que contem uma recompensa para o jogador.

| Atributo | Tipo | Valores Possiveis | Descrição                                |
| -------- | ---- | ------- | ---------------------------------------- |
| idBau    | int  | 0 - 25       | Identificador do báu                     |
| pos      | int  | 0 - 50       | Local onde o báu esta no mapa            |
| raridade | int  | 0 - 3       | Qualidade da recompensa                  |
| Valores Possiveis  | int  | 1 - 3     | Quantidade de recompensas que tem no báu |


### Entidade: Inventario 
#### Descrição: Compartimento para carregar itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                                 |
| ---------- | ---- | ------- | --------------------------------------------------------- |
| capacidadeAtual | int  | 0 - 200       | Quantidade de peso que o jogador esta carregando            |
| capacidade | int  | 0 - 200       | Quantidade de peso que o jogador pode carregar            |
| hacksilver | int  | 0 - 9999       | Dinheiro do jogo, utilizado para comprar e melhorar itens |

### Entidade: Missão 
#### Descrição: Objetivos para o jogador completar e ganhar recompensas.

| Atributo  | Tipo    | Valores Possiveis | Descrição               |
| --------- | ------- | ------- | ----------------------- |
| idMissao  | int     | 0 - 10       | Identificador da missão |
| descricao | varchar | 64      | Descrição da missão     |
| objetivo  | varchar | 64      | Objetivo da missão      |
| recompensa          |  varchar       |     64    |               Recompensa a ser ganha quando a missão for completa          |
|iniciador| int| 0 - 40| Identificador do NPC que vai entregar a missão ao jogador| 
