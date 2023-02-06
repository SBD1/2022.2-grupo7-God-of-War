| Data | Versão | Alteração |  Autor(es)   |
| -------- | -------- | -------- | --- |
| 26/11/2022     | 1.0     | Criação do documento  | [Pedro](https://github.com/phnog)     |
| 13/01/2023     | 1.1     | Adição de novas entidades | [Mateus Caltabiano](https://github.com/MateusCaltabiano) |
| 06/02/2023     | 1.2     | Revisão do dicionário e correções necessárias | [Mateus Caltabiano](https://github.com/MateusCaltabiano) |

# Dicionário de Dados

### Entidade: Jogador 
#### Descrição: Personagem jogável. 

| Atributo    | Tipo    | Valores Possiveis | Descrição                              |
| ----------- | ------- | ----------------- | -------------------------------------- |
| id          | int     | 1 - 99            | Identificador do jogador               |
| nome        | varchar | 64                | Nome do personagem                     |
| vidaAtual   | int     | 0 - 100           | Pontos de vida atual do jogador        |
| vidaTotal   | int     | 1 - 100           | Pontos de vida total do jogador        |
| experiencia | int     | 0 - 10000         | Pontos de experiencia atual do jogador |
| forca       | int     | 1 - 300           | Valor do poder de ataque do jogador    |
| defesa      | int     | 1 - 300           | Valor do poder de defesa do jogador    |
| id_local    | int     | 1 - 50            | Posição do jogador no mapa             |
| id_nivel    | int     | 1 - 9             | Nível do jogador                       | 
| movimentos  | int     | 1 - ...           | Quantas vezes o jogador andou          |
| mortes      | int     | 1 - ...           | Quantas vezes o jogador morreu         |

### Entidade: Nivel 
#### Descrição: Valor que identifica a progressão de experiência do jogador. 

| Atributo     | Tipo | Valores Possiveis | Descrição                                                 |
| ------------ | ---- | ----------------- | --------------------------------------------------------- |
| id           | int  | 1-9               | Identificador do nivel                                    |
| xpNecessario | int  | 10 - 90           | Quantidade de experiência para evoluir o personagem       |
| forca        | int  | 10 - 90           | Valor do poder de ataque bonus que o jogador vai receber  |
| defesa       | int  | 10 - 90           | Valor do poder de defesa bonus  que o jogador vai receber |

### Entidade: Ataque 
#### Descrição: Lista de movimentos que o jogador pode performar. 

| Atributo      | Tipo     | Valores Possiveis | Descrição                                           |
| ------------- | -------- | ----------------- | --------------------------------------------------- |
| id            | int      | 0 - 99            | Identificador do movimento de ataque                |
| nome          | varchar  | 64                | Nome do ataque                                      |
| multiplicador | smallint | 1 - 10            | Valor para multiplicar o poder de ataque do jogador |
| qntAlvos      | smallint | 1 - 5             | Quantidade de alvos que o ataque pode acertar       |
| descricao     | varchar  | 512               | Descrição do ataque                                 |

### Entidade: Item 
#### Descrição: Utensílios para auxiliar o jogador. 

| Atributo | Tipo    | Valores Possiveis | Descrição             |
| -------- | ------- | ----------------- | --------------------- |
| id       | int     | 1 - 30            | Identificador do item |
| nome     | varchar | 64                | Nome do item          |
| peso     | float   | 1 - 100           | Peso de cada item     |
| valor    | floatt  | 1 - 9999          | Valor do item         |

### Entidade: Equipamento 
#### Descrição: Itens que podem ser equipados pelo jogador. 

| Atributo | Tipo    | Valores Possiveis | Descrição                                |
| -------- | ------- | ----------------- | ---------------------------------------- |
| nivel    | int     | 1 - 10            | Nivel necessario para utilização do item |

### Entidade: Armadura 
#### Descrição: Itens defensivos que podem ser equipado pelo jogar. 

| Atributo | Tipo    | Valores Possiveis | Descrição                                  |
| -------- | ------- | ----------------- | ------------------------------------------ |
| tipo     | varchar | 64                | Tipo da armadura (Peitoral ou Cinto)       |
| defesa   | int     | 1 - 200           | Quantidade de pontos de defesa da armadura |
| vida     | int     | 1 - 1000          | Quantidade de pontos de vida da armadura   |

### Entidade: Arma 
#### Descrição: Itens ofensivos que podem ser equipado pelo jogar. 

| Atributo | Tipo    | Valores Possiveis | Descrição                                                                     |
| -------- | ------- | ----------------- | ----------------------------------------------------------------------------- |
| dano     | int     | 1 - 200           | Pontos de ataque da arma                                                      |
| tipo     | varchar | 64                | Tipo da arma  (Cajado, Espada Longa, Adaga, Arco Flecha, Martelo e Especiais) |

### Entidade: Poção 
#### Descrição: Itens consumiveis pelo jogador. 

| Atributo  | Tipo    | Valores Possiveis | Descrição                                           |
| --------- | ------- | ----------------- | --------------------------------------------------- |
| vidaRegen | int     | 25, 50, 100       | Pontos de vida que a poção vai recuperar do jogador |

### Entidade: NPC 
#### Descrição: Personagens com opção de interação não jogaveis. 

| Atributo  | Tipo    | Valores Possiveis | Descrição                                                               |
| --------- | ------- | ----------------- | ----------------------------------------------------------------------- |
| idNPC     | int     | 1 - 40            | Identificador do NPC                                                    |
| nome      | varchar | 512               | Nome do NPC                                                             |
| tipo      | int     | 1 - 4             | Tipo de NPC (1 - Inimigo, 2 - Personagem, 3 - Mercador ou 4 - Ferreiro) |
| descricao | varchar | 512               | Descrição sobre o NPC                                                   |
| pos       | int     | 1 - 10            | Posição do NPC no mapa                                                  |
| dialogo   | varchar | 512               | Dialogo do NPC                                                          |


### Entidade: Inimigo 
#### Descrição: Personagens agressivos ao jogador. 

| Atributo  | Tipo      | Valores Possiveis | Descrição                                                 |
| --------- | --------- | ----------------- | --------------------------------------------------------- |
| dano      | int       | 1 - 300           | Pontos de poder de ataque do inimigo                      |
| defesa    | int       | 1 - 300           | Pontos de poder de defesa do inimigo                      |
| ataque    | int       | 0 - 99            | Ataques do inimigo                                        |
| vida      | int       | 10 - 10000        | Quantidade de vida do Inimigo                             |
| vidaAtual | int       | 0 - 10000         | Quantidade de vida do Inimigo                             |
| xpinimigo | int       | 5 - 50            | Quantidade de experiência que o inimigo concede ao morrer |
| tempo     | timestamp | ----------------- | Tempo para o inimigo renascer                             |             

### Entidade: Personagem 
#### Descrição: Tipo de NPC neutro em relação ao jogador. 

### Entidade: Mercador 
#### Descrição: Personagens que auxilia o jogador com venda de itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                                              |
| ---------- | ---- | ----------------- | ---------------------------------------------------------------------- |
| multiVenda | int  | 0 - 10            | Multiplicador do preço do item que o jogador esta vendendo ao Mercador |
| itens      | int  | 0 - 10            | Itens disponiveis para venda                                           |


### Entidade: Ferreiro 
#### Descrição: Personagens que auxilia o jogador com melhoria dos itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                           |
| ---------- | ---- | ----------------- | --------------------------------------------------- |
| melhorias  | int  | 0 - 10            | Melhorias disponíveis para o equipamento do jogador |
| multiValor | int  | 1 - 10            | Multiplicador do valor de cada melhoria             |


### Entidade: Local 
#### Descrição: Lugar do mapa.

| Atributo  | Tipo    | Valores Possiveis | Descrição                  |
| --------- | ------- | ----------------- | -------------------------- |
| id        | int     | 1 - 50            | Identificador do local     |
| descricao | varchar | 1024              | Descrição do local         |
| nome      | varchar | 512               | Nome do local              |
| proxSala  | int     | 0 - 5             | Número de salas acessíveis |

### Entidade: Baú 
#### Descrição: Caixa que contem uma recompensa para o jogador.

| Atributo | Tipo | Valores Possiveis | Descrição                                |
| -------- | ---- | ----------------- | ---------------------------------------- |
| id       | int  | 0 - 5             | Identificador do Baú                     |
| id_local | int  | 1 - 10            | Local onde o báu esta no mapa            |
| raridade | int  | 0 - 3             | Qualidade da recompensa                  |
| tamanho  | int  | 1 - 3             | Quantidade de recompensas que tem no Baú |
| id_item  | int  | 1 - 30            | Identificador do item dado pelo baú      |


### Entidade: Inventário 
#### Descrição: Compartimento para carregar itens.

| Atributo   | Tipo | Valores Possiveis | Descrição                                                 |
| ---------- | ---- | ----------------- | --------------------------------------------------------- |
| id_jogador | int  | 1 - 99            | Identificador do jogador ao qual o inventário pertence    |
| carga      | int  | 0 - 200           | Quantidade de peso que o jogador esta carregando          |
| capacidade | int  | 0 - 200           | Quantidade de peso que o jogador pode carregar            |
| hacksilver | int  | 0 - 99990         | Dinheiro do jogo, utilizado para comprar e melhorar itens |
| id_item    | int  | 1 - 30            | Identificador do item que o jogador carrega               |

### Entidade: Missão 
#### Descrição: Objetivos para o jogador completar e ganhar recompensas.

| Atributo  | Tipo    | Valores Possiveis | Descrição                                                 |
| --------- | ------- | ----------------- | --------------------------------------------------------- |
| id        | int     | 1 - 10            | Identificador da missão                                   |
| descricao | varchar | 512               | Descrição da missão                                       |
| objetivo  | varchar | 512               | Objetivo da missão                                        |
| id_item   | varchar | 512               | Recompensa a ser ganha quando a missão for completa       |
| idNPC     | int     | 1 - 40            | Identificador do NPC que vai entregar a missão ao jogador | 
