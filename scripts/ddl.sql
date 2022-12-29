create type tipo_armadura as enum ('peitoral','cinto');
create type tipo_arma as enum ('cajado','espada','adaga','arcoflecha','martelo','especial');

-- Item

create table item(
	id serial constraint pk_id_item primary key, 
	nome varchar(64),
	peso float, 
	valor float
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
)inherits(item); 

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
)inherits(item);

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

create table localTab(
	id serial constraint pk_idLocal primary key,
	descricao varchar(512),
	nome varchar(512)
);

create table npc(
	idNPC serial constraint pk_idNPC primary key,
	nome varchar(512),
	tipo varchar(512),
	descricao varchar(512),
	pos int,
	dialogo varchar(512),
	constraint fk_idLocal foreign key (pos) references localTab(id)
);

create table inimigo(
	dano int,
	defesa int,
	ataque int,
	vida int,
	vidaAtual int
) inherits(npc);

create table personagem(
) inherits(npc);

create table mercador(
	multiVenda int,
	itens int
) inherits(npc);

create table ferreiro(
	melhorias int,
	multiValor int
) inherits (npc);

--inventario

create table inventario(
	carga int,
	capacidade int,
	hacksilver int
);

--missao

create table missao(
	id serial constraint pk_idMissao primary key,
	descricao varchar(512),
	objetivo varchar(512),
	recompensa varchar(512),
	idNPC int
);

-- bau

create table bau(
	id serial constraint pk_idBau primary key,
	pos int,
	raridade int,
	tamanho int
);

create table nivel (
	id serial constraint pk_id_nivel primary key,
	xpNecessario int,
	forca int,
	defesa int
)