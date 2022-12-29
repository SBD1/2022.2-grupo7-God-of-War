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