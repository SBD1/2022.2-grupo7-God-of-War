


| Data       | Versão | Alteração                                     | Autor(es)                                                |
| ---------- | ------ | --------------------------------------------- | -------------------------------------------------------- |
| 26/11/2022 | 1.0    | Criação do documento                          | [Pedro](https://github.com/phnog)                        |
| 13/01/2023 | 1.1    | Adição de novas entidades                     | [Mateus Caltabiano](https://github.com/MateusCaltabiano) |
| 06/02/2023 | 1.2    | Revisão do dicionário e correções necessárias | [Mateus Caltabiano](https://github.com/MateusCaltabiano) |
|    06/02/2023        |  1.3      |          Criação das colunas default e not null                                     |   [Pedro](https://github.com/phnog)                                                       |

# Dicionário de Dados

### Entidade: Jogador 
#### Descrição: Personagem jogavel criado pelo usuario. 


| Atributo    | Tipo    | Valores Possiveis | Descrição                              | DEFAULT | NOT NULL |
| ----------- | ------- | ----------------- | -------------------------------------- | ------- | -------- |
| id          | int  | 1 - 99            | Identificador do jogador               |         | x        |
| nome        | varchar | 64                | Nome do personagem                     |         |          |
| vidaAtual   | int     | 0 - 100         | Pontos de vida atual do jogador        | 100     | x        |
| vidaTotal   | int     | 100 - ...       | Pontos de vida total do jogador        | 100     | x        |
| experiencia | int     | 0 - 10000         | Pontos de experiencia atual do jogador | 0       | x        |
| forca       | int     | 10 - 300          | Valor do poder de ataque do jogador    | 10      | x        |
| defesa      | int     | 10 - 300          | Valor do poder de defesa do jogador    | 10      | x        |
| id_local    | int     | 1 - 50            | Posição do jogador no mapa             | 1       | x        |
| id_nivel    | int     | 1 - 9            | Nivel atual do jogador                 | 1       | x        |
| movimentos            |   int      |   0 - ...                | Quantidade de vezes que o jogador entrou em alguma sala |  0      |   x       |
|      mortes       |   int      |    0 - ...               | Quantidade de vezes que o jogador morreu                                        |     0    |     x     |
### Entidade: Nivel 
#### Descrição: Valor que identifica a progressão de experiência do jogador. 


| Atributo     | Tipo | Valores Possiveis | Descrição                                                 |   DEFAULT  |    NOT NULL |
| ------------ | ---- | ----------------- | --------------------------------------------------------- | --- | --- |
| id           | int  | 1 - 9              | Identificador do nivel                                    |  - - - - - - | x    |
| xpNecessario | int  | 10 - 90           | Quantidade de experiência para evoluir o personagem       |  - - - - - -   |   x  |
| forca        | int  | 10 - 90           | Valor do poder de ataque bonus que o jogador vai receber  |  - - - - - -   |  x   |
| defesa       | int  | 10 - 90           | Valor do poder de defesa bonus  que o jogador vai receber |  - - - - - -   |   x  |


### Entidade: Ataque 
#### Descrição: Lista de movimentos que o jogador pode performar. 


| Atributo      | Tipo     | Valores Possiveis | Descrição                                           | DEFAULT     | NOT NULL |
| ------------- | -------- | ----------------- | --------------------------------------------------- | ----------- | -------- |
| id            | int   | 0 - 99            | Identificador do movimento de ataque                |             |          |
| nome          | varchar  | 64                | Nome do ataque                                      | - - - - - - | x        |
| multiplicador | smallint | 1 - 10            | Valor para multiplicar o poder de ataque do jogador | 1           | x        |
| qntAlvos      | smallint | 1 - 5             | Quantidade de alvos que o ataque pode acertar       | 1           | x        |
| descricao     | varchar  | 500               | Descrição do ataque                                 | - - - - - - |          |
| id_tipoarma              |   int       |      0 - 7             |  Identificador do tipo da arma que tem esse ataque                                            |     - - - - - -        |          |


### Entidade: Item 
#### Descrição: Utensílios para auxiliar o jogador. 


| Atributo | Tipo    | Valores Possiveis | Descrição             | DEFAULT    |   NOT NULL  |
| -------- | ------- | ----------------- | --------------------- | --- | --- |
| id   | int     | 1 - 30          | Identificador do item |  - - - - - -   |     x |
| nome     | varchar | 64               | Nome do item          |  - - - - - -   |   x  |
| peso     | float     | 0 - 100           | Peso de cada item     |- - - - - -     |   x  |
| valor    | float     |0 - 9999          | Valor do item         | - - - - - -    |  x   |


### Entidade: Equipamento 
#### Descrição: Itens que podem ser equipados pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição                    | DEFAULT     | NOT NULL |
| -------- | ------- | ----------------- | ---------------------------- | ----------- | -------- |
| id       | int  | 1 - 100           | Identificador do equipamento | - - - - - - | x        |
| nome     | varchar | 64                | Nome do equipamento          | - - - - - - | x        |
| peso     | float   | 0 - 100           | Peso de cada equipamento     | - - - - - - | x        |
| valor    | float   | 0 - 9999          | Valor do equipamento         | - - - - - - | x        |
| nivel    | int     | 0 - 10            | Nivel do equipamento         | 1           | x        |
| id_item         |   int      |   1 - 100                |  Identificador do item que o equipamento se refere                            |      - - - - - -        |    x      |


### Entidade: Armadura 
#### Descrição: Itens defensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição                                         | DEFAULT     | NOT NULL |
| -------- | ------- | ----------------- | ------------------------------------------------- | ----------- | -------- |
| id       | int  | 1 - 100           | Identificador da armadura                         | - - - - - - | x        |
| nome     | varchar | 64                | Nome do armadura                                  | - - - - - - | x        |
| peso     | float   | 0 - 100           | Peso da armadura                                  | - - - - - - | x        |
| valor    | float   | 0 - 9999          | Valor da armadura                                 | - - - - - - | x        |
| nivel    | int     | 0 - 10            | Nivel da armadura                                 | 1           | x        |
| tipo         | tipo_armadura        |  Peitoral ou Cinto  | Identificador para saber se a arumadura é um peitoral ou um cinto | - - - - - -             |          |
|        defesa  |    int     |      0 - ...             |  Quantidade de defesa que a armadura fornece ao jogador                                                |     - - - - - -         |       x   |
|        vida  |   int      |        0 - ...           |   Quantidade de vida que a armadura fornece ao jogador                                                 |      - - - - - -          |     x     |
| id_equipamento  | int     | 1 - 100           | Identificador do equipamento que a armadura se refere | - - - - - - | x        |
### Entidade: Arma 
#### Descrição: Itens ofensivos que podem ser equipado pelo jogar. 


| Atributo | Tipo    | Valores Possiveis | Descrição                                         | DEFAULT     | NOT NULL |
| -------- | ------- | ----------------- | ------------------------------------------------- | ----------- | -------- |
| id       | int  | 1 - 100           | Identificador da arma                         | - - - - - - | x        |
| nome     | varchar | 64                | Nome do arma                                  | - - - - - - | x        |
| peso     | float   | 0 - 100           | Peso da arma                                  | - - - - - - | x        |
| valor    | float   | 0 - 9999          | Valor da arma                                 | - - - - - - | x        |
| nivel    | int     | 0 - 10            | Nivel da arma                                 | 1           | x        |
| dano     | int | 1 - 200      | Pontos de ataque da arma       | - - - - - - |x
| tipo     | varchar | 512      | Tipo da arma  (Cajado ,  Espada Longa, Adaga, Arco Flecha, Martelo e Especiais)    |- - - - - - |x|
| id_equipamento  | int     | 1 - 100           | Identificador do equipamento que a arma se refere | - - - - - - | x        |

### Entidade: Poção 
#### Descrição: Itens consumiveis pelo jogador. 


| Atributo | Tipo    | Valores Possiveis | Descrição                                         | DEFAULT     | NOT NULL |
| -------- | ------- | ----------------- | ------------------------------------------------- | ----------- | -------- |
| id       | int  | 1 - 100           | Identificador da poção                         | - - - - - - | x        |
| nome     | varchar | 64                | Nome do poção                                  | - - - - - - | x        |
| peso     | float   | 0 - 100           | Peso da poção                                  | - - - - - - | x        |
| valor    | float   | 0 - 9999          | Valor da poção                                 | - - - - - - | x        |
| vidaRegen     | int | 25, 50, 100      | Pontos de vida que a poção vai recuperar do jogador       |- - - - - -  | x |
| id_equipamento  | int     | 1 - 100           | Identificador do equipamento que a arma se refere | - - - - - - | x        |






### Entidade: NPC 
#### Descrição: Personagens com opção de interação não jogaveis. 


| Atributo  | Tipo    | Valores Possiveis | Descrição                                               | DEFAULT    | NOT NULL    |
| --------- | ------- | ----------------- | ------------------------------------------------------- | --- | --- |
| idNPC     | int     | 1 - 40            | Identificador do NPC                                    |   - - - - - -  |     |
| nome      | varchar | 512               | Nome do NPC                                             |   - - - - - -  |   x  |
| tipo      | int     | 1 - 4             | Tipo de NPC (1 - Inimigo, 2 - Personagem, 3 - Mercador ou 4 - Ferreiro) |   - - - - - -  |   x  |
| descricao | varchar | 512               | Descrição sobre o NPC                                   |    - - - - - - |   x  |
| pos       | int     | 1 - 10            | Posição do NPC no mapa                                  |    - - - - - - |  x   |
| dialogo   | varchar | 512               | Dialogo do NPC                                          |  - - - - - -   |   x  |


### Entidade: Inimigo 
#### Descrição: Personagens agressivos ao jogador. 


| Atributo  | Tipo      | Valores Possiveis | Descrição                                                                   | DEFAULT     | NOT NULL |
| --------- | --------- | ----------------- | --------------------------------------------------------------------------- | ----------- | -------- |
| id        | int       | 1 - 40            | Identificador do Inimigo                                                    | - - - - - - |          |
| nome      | varchar   | 512               | Nome do inimigo                                                             | - - - - - - | x        |
| tipo      | int       | 1                 | Tipo de Inimigo (1 - Inimigo, 2 - Personagem, 3 - Mercador ou 4 - Ferreiro) | - - - - - - | x        |
| descricao | varchar   | 512               | Descrição sobre o inimigo                                                   | - - - - - - | x        |
| pos       | int       | 1 - 10            | Posição do inimigo no mapa                                                  | - - - - - - | x        |
| dialogo   | varchar   | 512               | Dialogo do Inimigo                                                          | - - - - - - | x        |
| dano      | int       | 1 - 300           | Pontos de poder de ataque do inimigo                                        | - - - - - - | x        |
| defesa    | int       | 1 - 300           | Pontos de poder de defesa do inimigo                                        | - - - - - - | x        |
| ataque    | int       | 0 - 99            | Ataques do inimigo                                                          | - - - - - - | x        |
| vida      | int       | 10 - 10000        | Quantidade de vida do inimigo                                               | - - - - - - | x        |
| vidaAtual | int       | 10 - 10000        | Quantidade de vida do inimigo                                               | - - - - - - | x        |
| xpinimigo | int       | 0 - ...           | Quantidade de experiencia que o jogador vai receber ao matar esse inimigo   | - - - - - - | x        |
| idNPC     | int       | 1 - 40            | Identificador do NPC que o inimigo se refere                                | - - - - - - | x        |
| tempo     | TIMESTAMP | ...               | Hora da ultima morte do inimigo                                             | NOW( )      | x        |




### Entidade: Mercador 
#### Descrição: Personagens que auxilia o jogador com venda de itens.

| Atributo  | Tipo    | Valores Possiveis | Descrição                                               | DEFAULT    | NOT NULL    |
| --------- | ------- | ----------------- | ------------------------------------------------------- | --- | --- |
| id     | int     | 1 - 40            | Identificador do mercador                                    |   - - - - - -  |     |
| nome      | varchar | 512               | Nome do mercador                                             |   - - - - - -  |   x  |
| tipo      | int     | 3             | Tipo de NPC (1 - Inimigo, 2 - Personagem, 3 - Mercador ou 4 - Ferreiro) |   - - - - - -  |   x  |
| descricao | varchar | 512               | Descrição sobre o mercador                                   |    - - - - - - |   x  |
| pos       | int     | 1 - 10            | Posição do mercador no mapa                                  |    - - - - - - |  x   |
| dialogo   | varchar | 512               | Dialogo do mercador                                          |  - - - - - -   |   x  |
| multiVenda | int  | 0 - 10            | Multiplicador do preço do item que o jogador esta vendendo ao Mercador |   1  |   x  |
| itens      | int  | 0 - 10            | Itens disponiveis para venda                                           |  - - - - - -   |  x   |
| idNPC     | int       | 1 - 40            | Identificador do NPC que o mercador se refere                                | - - - - - - | x        |

### Entidade: Ferreiro 
#### Descrição: Personagens que auxilia o jogador com melhoria dos itens.


| Atributo  | Tipo    | Valores Possiveis | Descrição                                               | DEFAULT    | NOT NULL    |
| --------- | ------- | ----------------- | ------------------------------------------------------- | --- | --- |
| id     | int     | 1 - 40            | Identificador do ferreiro                                    |   - - - - - -  |     |
| nome      | varchar | 512               | Nome do ferreiro                                             |   - - - - - -  |   x  |
| tipo      | int     | 4             | Tipo de NPC (1 - Inimigo, 2 - Personagem, 3 - Mercador ou 4 - Ferreiro) |   - - - - - -  |   x  |
| descricao | varchar | 512               | Descrição sobre o ferreiro                                   |    - - - - - - |   x  |
| pos       | int     | 1 - 10            | Posição do ferreiro no mapa                                  |    - - - - - - |  x   |
| dialogo   | varchar | 512               | Dialogo do ferreiro                                          |  - - - - - -   |   x  |
| melhorias  | int  | 0 - 10            | Melhorias disponíveis para o equipamento do jogador |  - - - - - -     |    x |
| multiValor | int  | 1 - 10            | Multiplicador do valor de cada melhoria             |  1   |   x  |
| idNPC     | int       | 1 - 40            | Identificador do NPC que o ferreiro se refere                                | - - - - - - | x        |

### Entidade: Local 
#### Descrição: Lugar do mapa.

| Atributo  | Tipo    | Valores Possiveis | Descrição              | DEFAULT     | NOT NULL |
| --------- | ------- | ----------------- | ---------------------- | ----------- | -------- |
| id        | int     | 1 - 10            | Identificador do local | - - - - - - |          |
| descricao | varchar | 1024              | Descrição do local     | - - - - - - | x        |
| nome      | varchar | 512               | Nome do local          | - - - - - - | x        |
|     proxSala       |      int   |        0 - 5           |      Quantidade de ligações que a sala tem                  |     1        |   x       |

### Entidade: Baú 
#### Descrição: Caixa que contem uma recompensa para o jogador.

| Atributo | Tipo | Valores Possiveis | Descrição                                | DEFAULT     | NOT NULL |
| -------- | ---- | ----------------- | ---------------------------------------- | ----------- | -------- |
| id       | int  | 0 - 25            | Identificador do Baú                     | - - - - - - |          |
| id_local | int  | 1 - 10            | Local onde o báu esta no mapa            | - - - - - - |          |
| raridade | int  | 0 - 3             | Qualidade da recompensa                  | - - - - - - |        x  |
| tamanho  | int  | 1 - 3             | Quantidade de recompensas que tem no Baú | - - - - - - |      x    |
|   id_item        |   int   |     1 - 30              |  Identificador do item que sera a recompensa do baú                                        |      - - - - - -        |          |


### Entidade: Inventario 
#### Descrição: Compartimento para carregar itens.


| Atributo   | Tipo | Valores Possiveis | Descrição                                                 | DEFAULT     | NOT NULL |    
| ---------- | ---- | ----------------- | --------------------------------------------------------- | ----------- | -------- | 
| id_jogador | int  | 1 - 99            | Identificador do jogador ao qual o inventário pertence    | - - - - - - | x        |
| carga      | int  | 0 - 200           | Quantidade de peso que o jogador esta carregando          |      - - - - - -        |   x       |     
| capacidade | int  | 0 - 200           | Quantidade de peso que o jogador pode carregar            |     100        |   x       |     
| hacksilver | int  | 0 - 9999          | Dinheiro do jogo, utilizado para comprar e melhorar itens |     0        |      x    |     
| id_item           |   int   |      1 - 30             |   Identificador do item que esta no inventario |     - - - - - -         |          | 




| Atributo   | Tipo | Valores Possiveis | Descrição|     |             |     |
| ---------- | ---- | ----------------- | --------------------------------------------------------- | --- | ----------- | --- |
| id_jogador | int  | 1 - 99            | Identificador do jogador ao qual o inventário pertence    |     |             |     |
| carga      | int  | 0 - 200           | Quantidade de peso que o jogador esta carregando          |     |             |     |
| capacidade | int  | 0 - 200           | Quantidade de peso que o jogador pode carregar            |     |             |     |
| hacksilver | int  | 0 - 9999          | Dinheiro do jogo, utilizado para comprar e melhorar itens |     |             |       |     1 - 30              |  Identificador do item que esta no inventario                                        |      - - - - - -        |          |

### Entidade: Missão 
#### Descrição: Objetivos para o jogador completar e ganhar recompensas.

| Atributo  | Tipo    | Valores Possiveis | Descrição               |
| --------- | ------- | ------- | ----------------------- |
| id  | int     | 1 - 10       | Identificador da missão |
| descricao | varchar | 512      | Descrição da missão     |
| objetivo  | varchar | 512      | Objetivo da missão      |
| id_item|  int       |    1 - 30    |               Recompensa a ser ganha quando a missão for completa          |
| idNPC| int| 1 - 40| Identificador do NPC que vai entregar a missão ao jogador| 
