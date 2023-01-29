create type tipo_armadura as enum ('peitoral','cinto');
create type tipo_arma as enum ('cajado','espada','adaga','arcoflecha','martelo','especial', 'lanca');

-- Item

create table if not exists item(
	id serial constraint pk_id_item primary key, 
	nome varchar(64) not null,
	peso float not null, 
	valor float not null
);

-- Equipamento 

create table if not exists equipamento(
	nivel int default 1 not null
)inherits(item);

-- Poção 

create table if not exists pocao(
	vidaRegen int not null
)inherits(item);  

-- Armadura

create table if not exists armadura(
	tipo tipo_armadura,
	defesa int not null, 
	vida int not null
)inherits(equipamento); 

-- Tipo Arma

create table if not exists tipoArma(
	id serial constraint pk_id_tipoarma primary key, 
	nome tipo_arma not null
);

-- Arma 

create table if not exists arma(
	dano int not null,
	id_tipoarma int not null,
	constraint fk_int_tipoarma foreign key (id_tipoarma) references tipoArma (id)
)inherits(equipamento);

-- Ataque 

create table if not exists ataque(
	id serial constraint pk_id_ataque primary key, 
	nome varchar(64) not null, 
	multiplicador smallint default 1 not null, 
	qntAlvos smallint default 1 not null, 
	descricao varchar(500), 
	id_tipoarma int not null,
	constraint fk_int_tipoarma foreign key (id_tipoarma) references tipoArma (id)
);

-- Local

create table if not exists localTab(
	id serial constraint pk_idLocal primary key,
	descricao varchar(512) not null,
	nome varchar(512) not null,
	proxSala int default 1 not null
);

-- Nivel

create table if not exists nivel (
	id serial constraint pk_id_nivel primary key,
	xpNecessario int not null,
	forca int not null,
	defesa int not null
);


-- Jogador 

create table if not exists jogador(

	id serial constraint pk_id_jogador primary key, 
	nome varchar(64),
	vidaAtual int DEFAULT 100 not null, 
	vidaTotal int DEFAULT 100 not null, 
	experiencia int default 0 not null, 
	forca int default 10 not null, 
	defesa int default 10 not null, 
	id_local int default 1 not null, 
	id_nivel int default 1 not null,
	movimentos int default 0 not null,
	mortes int default 0 not null,
	constraint fk_id_local foreign key (id_local) references localTab (id),
	constraint fk_id_nivel foreign key (id_nivel) references nivel (id)
	);


-- NPC

create table if not exists npc(
	idNPC serial constraint pk_idNPC primary key,
	nome varchar(512) not null,
	tipo int not null,
	descricao varchar(512) not null,
	pos int not null,
	dialogo varchar(512) not null,
	constraint fk_idLocal foreign key (pos) references localTab(id)
);

-- Inimigo

create table if not exists inimigo(
	dano int not null,
	defesa int not null,
	ataque int not null,
	vida int not null,
	vidaAtual int not null,
	xpinimigo int not null
) inherits(npc);

-- Personagem

create table if not exists personagem(
) inherits(npc);

-- Mercador

create table if not exists mercador(
	multiVenda int default 1 not null,
	itens int not null
) inherits(npc);

-- Ferreiro

create table if not exists ferreiro(
	melhorias int not null,
	multiValor int default 1 not null
) inherits (npc);

-- Inventario

create table if not exists inventario(

    id_jogador int not null, 
	carga int not null,
	capacidade int default 100 not null,
	hacksilver int default 0 not null,
	id_item int, 
	constraint fk_id_jogador foreign key (id_jogador) references jogador(id), 
	constraint fk_id_item foreign key (id_item) references item (id)
);

-- Missao

create table if not exists missao(
	id serial constraint pk_idMissao primary key,
	descricao varchar(512) not null,
	objetivo varchar(512) not null,
	id_item int not null,
	idNPC int not null,
	constraint fk_id_npc foreign key (idNPC) references npc(idNPC),
	constraint fk_id_item foreign key (id_item) references item(id)
);

-- Bau

create table if not exists bau(
	id serial constraint pk_idBau primary key,
	id_local int,
	raridade int not null,
	tamanho int not null, 
	id_item int,
	constraint fk_id_item foreign key (id_item) references item (id),
	constraint fk_id_local foreign key (id_local) references localTab(id)
);

/*create type tipo_armadura as enum ('peitoral','cinto');
create type tipo_arma as enum ('cajado','espada','adaga','arcoflecha','martelo','especial', 'lanca');

-- Item

create table item(
	id serial constraint pk_id_item primary key, 
	nome varchar(64) not null,
	peso float not null, 
	valor float not null
);

-- Equipamento 

create table equipamento(
	nivel int
)inherits(item); 

-- Poção 

create table pocao(
	vidaRegen int
)inherits(item);  

-- Armadura

create table armadura(
	tipo tipo_armadura,
	defesa int, 
	vida int
)inherits(equipamento); 

-- Tipo Arma 

create table tipoArma(
	id serial constraint pk_id_tipoarma primary key, 
	nome tipo_arma
);

-- Arma 

create table arma(
	dano int,
	id_tipoarma int,
	constraint fk_int_tipoarma foreign key (id_tipoarma) references tipoArma (id)
)inherits(equipamento);

-- Ataque 

create table ataque(
	id serial constraint pk_id_ataque primary key, 
	nome varchar(64), 
	multiplicador smallint, 
	qntAlvos smallint, 
	descricao varchar(500), 
	id_tipoarma int,
	constraint fk_int_tipoarma foreign key (id_tipoarma) references tipoArma (id)
);

-- Local

create table localTab(
	id serial constraint pk_idLocal primary key,
	descricao varchar(512),
	nome varchar(512)
);

-- Nivel

create table nivel (
	id serial constraint pk_id_nivel primary key,
	xpNecessario int,
	forca int,
	defesa int
);


-- Jogador 

create table jogador(

	id serial constraint pk_id_jogador primary key, 
	nome varchar(64),
	vidaAtual int DEFAULT 100, 
	vidaTotal int DEFAULT 100, 
	experiencia int default 0, 
	forca int default 10, 
	defesa int default 10, 
	id_local int default 1, 
	id_nivel int default 1, 
	constraint fk_id_local foreign key (id_local) references localTab (id),
	constraint fk_id_nivel foreign key (id_nivel) references nivel (id)

);


-- NPC

create table npc(
	idNPC serial constraint pk_idNPC primary key,
	nome varchar(512),
	tipo int,
	descricao varchar(512),
	pos int,
	dialogo varchar(512),
	constraint fk_idLocal foreign key (pos) references localTab(id)
);

-- Inimigo

create table inimigo(
	dano int,
	defesa int,
	ataque int,
	vida int,
	vidaAtual int
) inherits(npc);

-- Personagem

create table personagem(
) inherits(npc);

-- Mercador

create table mercador(
	multiVenda int,
	itens int
) inherits(npc);

-- Ferreiro

create table ferreiro(
	melhorias int,
	multiValor int
) inherits (npc);

-- Inventario

create table inventario(

    id_jogador int, 
	carga int,
	capacidade int,
	hacksilver int,
	id_item int, 
	constraint fk_id_jogador foreign key (id_jogador) references jogador(id), 
	constraint fk_id_item foreign key (id_item) references item (id)
);

-- Missao

create table missao(
	id serial constraint pk_idMissao primary key,
	descricao varchar(512),
	objetivo varchar(512),
	id_item int,
	idNPC int,
	constraint fk_id_npc foreign key (idNPC) references npc(idNPC),
	constraint fk_id_item foreign key (id_item) references item(id)
);

-- Bau

create table bau(
	id serial constraint pk_idBau primary key,
	id_local int,
	raridade int,
	tamanho int, 
	id_item int,
	constraint fk_id_item foreign key (id_item) references item (id),
	constraint fk_id_local foreign key (id_local) references localTab(id)
);