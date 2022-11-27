


| Data | Versão | Alteração |  Autor(es)   |
| -------- | -------- | -------- | --- |
| 26/11/2022     | 1.0     | Criação do documento  | [Pedro](https://github.com/phnog)     |

# Dicionário de Dados

### Entidade: Jogador 
#### Descrição: Personagem jogavel. 


| Atributo  | Tipo    | Tamanho | Descrição                              |
| --------- | ------- | ------- | -------------------------------------- |
| idJogador | int     | 3       | Identificador do jogador               |
| nome      | varchar | 64      | Nome do personagem                     |
| vidaatual | int     | 3       | Pontos de vida atual do jogador        |
| vidatotal | int     | 3       | Pontos de vida total do jogador        |
| exp       | int     | 3       | Pontos de experiencia atual do jogador |
| forca      | int     | 3       | Valor do poder de ataque do jogador    |
| defesa    | int     | 3       | Valor do poder de defesa do jogador    |
| pos       | int     | 3       | Posição do jogador no mapa             |
### Entidade: Nivel 
#### Descrição: . 


| Atributo     | Tipo | Tamanho | Descrição                                                 |
| ------------ | ---- | ------- | --------------------------------------------------------- |
| xpNecessario | int  | 3       | Quantidade de experiência para evoluir o personagem       |
| forca        | int  | 3       | Valor do poder de ataque bonus que o jogador vai receber  |
| defesa       | int  | 3       | Valor do poder de defesa bonus  que o jogador vai receber |


### Entidade: Ataques 
#### Descrição: Lista de movimentos que o jogador pode performar. 


| Atributo      | Tipo    | Tamanho | Descrição                                           |
| ------------- | ------- | ------- | --------------------------------------------------- |
| idAtaque      | int     | 3       | Identificador do movimento de ataque                |
| nome          | varchar | 64      | Nome do ataque                                      |
| multiplicador | int     | 3       | Valor para multiplicar o poder de ataque do jogador |
| qntAlvos      | int     | 3       | Quantidade de alvos que o ataque pode acertar       |
| desc              |  varchar       |   64      |  Descrição do ataque   |

### Entidade: Ataques 
#### Descrição: Lista de movimentos que o jogador pode performar. 


| Atributo      | Tipo    | Tamanho | Descrição                                           |
| ------------- | ------- | ------- | --------------------------------------------------- |
| idAtaque      | int     | 3       | Identificador do movimento de ataque                |
| nome          | varchar | 64      | Nome do ataque                                      |
| multiplicador | int     | 3       | Valor para multiplicar o poder de ataque do jogador |
| qntAlvos      | int     | 3       | Quantidade de alvos que o ataque pode acertar       |
| desc              |  varchar       |   64      |  Descrição do ataque   |

### Entidade: Itens 
#### Descrição: Utensílios para auxiliar o jogador. 


| Atributo | Tipo    | Tamanho | Descrição             |
| -------- | ------- | ------- | --------------------- |
| idItem   | int     | 3       | Identificador do item |
| nome     | varchar | 64      | Nome do item          |
| peso     | int     | 3       | Peso de cada item     |
| valor    | int     | 3       | Valor do item         |

### Entidade: Equipamentos 
#### Descrição: Itens que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Tamanho | Descrição             |
| -------- | ------- | ------- | --------------------- |
| nivel   | int     | 3       | Nivel necessario para utilização do item |

### Entidade: Armadura 
#### Descrição: Itens defensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Tamanho | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| tipo     | varchar | 64      | Tipo da armadura (Peitoral ou Cinto)       |
| defesa   | int     | 3       | Quantidade de pontos de defesa da armadura |
| vida     | int     | 3       | Quantidade de pontos de vida da armadura   |

### Entidade: Arma 
#### Descrição: Itens ofensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Tamanho | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| dano     | int | 3      | Pontos de ataque da arma       |

### Entidade: Poção 
#### Descrição: Itens consumiveis pelo jogador. 

| Atributo | Tipo    | Tamanho | Descrição                                  |
| -------- | ------- | ------- | ------------------------------------------ |
| vidaRegen     | int | 3      | Pontos de vida que a poção vai recuperar do jogador       |






### Entidade: NPC 
#### Descrição: Personagens com opção de interação não jogaveis. 


| Atributo  | Tipo    | Tamanho | Descrição              |
| --------- | ------- | ------- | ---------------------- |
| idNPC     | int     | 3       | Identificador do NPC   |
| nome      | varchar | 64      | Nome do NPC            |
| tipo      | varchar | 64      | Tipo de NPC (Inimigo, Personagem, Mercador ou Ferreiro)          |
| descricao | varchar | 64      | Descrição sobre o NPC  |
| pos       | int     | 3       | Posição do NPC no mapa |
| dialogo   | varchar | 64      | Dialogo do NPC         |


### Entidade: Inimigo 
#### Descrição: Personagens agressivos ao jogador. 


| Atributo | Tipo | Tamanho | Descrição                            |
| -------- | ---- | ------- | ------------------------------------ |
| dano     | int  | 3       | Pontos de poder de ataque do inimigo |
| defesa   | int  | 3       | Pontos de poder de defesa do inimigo |
| ataque   | int  | 3       | Ataques do inimigo                   |
| vida     | int  | 3       | Identificador do NPC                 |

### Entidade: Personagem 
#### Descrição: Tipo de NPC neutro em relação ao jogador. 

### Entidade: Mercador 
#### Descrição: Personagens que auxilia o jogador com venda de itens.

| Atributo   | Tipo | Tamanho | Descrição                                                              |
| ---------- | ---- | ------- | ---------------------------------------------------------------------- |
| multiVenda | int  | 3       | Multiplicador do preço do item que o jogador esta vendendo ao Mercador |
| itens      | int  | 3       | Itens disponiveis para venda                                           |


### Entidade: Ferreiro 
#### Descrição: Personagens que auxilia o jogador com melhoria dos itens.

| Atributo   | Tipo | Tamanho | Descrição                                           |
| ---------- | ---- | ------- | --------------------------------------------------- |
| melhorias  | int  | 3       | Melhorias disponíveis para o equipamento do jogador |
| multiValor | int  | 3       | Multiplicador do valor de cada melhoria             |


### Entidade: Local 
#### Descrição: Lugar do mapa.

| Atributo  | Tipo    | Tamanho | Descrição              |
| --------- | ------- | ------- | ---------------------- |
| idLocal   | int     | 3       | Identificador do local |
| descricao | varchar | 64      | Descrição do local     |
| nome      | varchar | 64      | Nome do local          |

### Entidade: Báu 
#### Descrição: Caixa que contem uma recompensa para o jogador.

| Atributo | Tipo | Tamanho | Descrição                                |
| -------- | ---- | ------- | ---------------------------------------- |
| idBau    | int  | 3       | Identificador do báu                     |
| pos      | int  | 3       | Local onde o báu esta no mapa            |
| raridade | int  | 3       | Qualidade da recompensa                  |
| tamanho  | int  | 3       | Quantidade de recompensas que tem no báu |


### Entidade: Inventario 
#### Descrição: Compartimento para carregar itens.

| Atributo   | Tipo | Tamanho | Descrição                                                 |
| ---------- | ---- | ------- | --------------------------------------------------------- |
| capacidade | int  | 3       | Quantidade de peso que o jogador pode carregar            |
| hacksilver | int  | 3       | Dinheiro do jogo, utilizado para comprar e melhorar itens |

### Entidade: Missão 
#### Descrição: Objetivos para o jogador completar e ganhar recompensas.

| Atributo  | Tipo    | Tamanho | Descrição               |
| --------- | ------- | ------- | ----------------------- |
| idMissao  | int     | 3       | Identificador da missão |
| descricao | varchar | 64      | Descrição da missão     |
| objetivo  | varchar | 64      | Objetivo da missão      |
| recompensa          |  varchar       |     64    |               Recompensa a ser ganha quando a missão for completa          |
|iniciador| int| 3| Identificador do NPC que vai entregar a missão ao jogador| 
