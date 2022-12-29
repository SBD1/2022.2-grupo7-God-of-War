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