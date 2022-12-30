-- Carga da tabela tipoarma

insert into tipoarma (nome) values 
('cajado'),('espada'),('adaga'),('arcoflecha'),('martelo'),('especial');




insert into nivel (xpnecessario, forca, defesa)
	values (10, 10, 10),
		   (20, 20, 20), 
		   (30, 30, 30), 
		   (40, 40, 40), 
		   (50, 50, 50), 
		   (60, 60, 60), 
		   (70, 70, 70), 
		   (80, 80, 80), 
		   (90, 90, 90);

insert into localtab (descricao, nome)
	values ('descricao do local', 'planicie'),
		   ('descricao do local', 'montanha'),
		   ('descricao do local', 'cidade'),
		   ('descricao do local', 'beira do lago'), 
		   ('descricao do local', 'floresta'), 
		   ('descricao do local', 'clareira');

insert into jogador (nome, vidaatual, vidatotal, experiencia, forca, defesa, id_local, id_nivel)
	values ('dummy', 100, 100, 5, 10, 10, 1, 1);

insert into inimigo (nome, tipo, descricao, pos, dialogo, dano, defesa, ataque, vida, vidaatual)
	values ('Draugr', 1, 'descricao do inimigo', 2, 'ROAR!', 2, 1, 1, 5, 5),
		   ('Troll', 1, 'descricao do inimigo', 5, 'ROAR!', 8, 6, 1, 20, 20), 
		   ('Lobo', 1, 'descricao do inimigo', 4, 'AUUUUUUU!', 1, 1, 1, 3, 3),
		   ('Ogro', 1, 'descricao do inimigo', 6, 'GRRRRAAAA!', 6, 5, 15, 15, 15);

