-- Carga da tabela tipoarma

insert into tipoarma (nome) values 
('cajado'),('espada'),('adaga'),('arcoflecha'),('martelo'),('lanca'),('especial');

-- Carga da tabela arma 

insert into arma (nome,peso,valor,dano,id_tipoarma, nivel) values
('Cajado de Aprediz', 2, 100, 15, 1, 2),('Espada de Ragidal', 15, 200, 25, 2, 2),
('Adaga de Loki', 4, 200, 20, 3, 2),('Arco e Flecha de Atreus', 10, 200, 30, 4, 2),
('Martelo de Thor', 30, 300, 40, 5, 2),('Espada Gram', 13, 150, 20, 2, 2),
('lança Gungnir',16,170,22,6,2 ),('Lamina do Caos', 15, 1000, 100, 7, 2);

-- Carga da tabela armadura 

insert into armadura (nome, peso, valor, tipo, defesa, vida, nivel) values 
('Peitoral do Exilado', 20, 40, 'peitoral', 20, 100, 1),('Cinto do Exilado', 10, 20, 'cinto', 20, 100, 1),
('Peitoral do Arcano', 15, 30, 'peitoral', 15, 100, 5),('Cinto do Arcano', 5, 30, 'cinto', 10, 50, 5),
('Peitoral Volunder', 50, 100, 'peitoral', 40, 200, 10),('Cinto Volunder', 25, 80, 'cinto', 100, 150, 10);

-- Carga da tabela poçao 

insert into pocao (nome, peso, valor, vidaregen) values 
('Poção Media', 5, 10, 50), ('Poção Pequena', 2, 10, 25),('Poção Grande', 10, 25, 100);

-- Carga da tabela ataque
 
insert into ataque (nome, multiplicador, qntalvos, descricao, id_tipoarma) values 
('Bola de Fogo', 2, 1, 'Seu cajado começa a trocar de cor, começa a ficar avermelhado, presetes a derreter, então uma bola de fogo é disparada contra seu inimigo, causando o dobro do seu ataque.', 1)
,('Ataque Vertical', 3, 1, 'Você segura sua espada com toda a força do seu corpo, com as duas mãos voce a levanta e executa um corte, partido seu inimiog ao meio.',2),
('Apunhalar pelas costas', 3, 1,'Você passar para as costas do inimigo, de uma forma que ele nao te percebe, apunhalando-o nas costas', 3);


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
	values ('Você está na Floresta Selvagem, escura e com um clima frio. O chão está coberto de neve e você escuta um pequeno rio correndo por perto.', 'Floresta Selvagem'),
		   ('Após uma curta caminhada, você chega no rio. A água é limpa e convidativa.', 'Beira do rio'),
		   ('Ao longo de um caminho sinuoso, você avista uma tartaruga gigante que aparenta estar adormecida. Ao lado dela tem um pequeno jardim
			de onde uma mulher colhe alguns ingredientes.', 'Casa da Bruxa'),
		   ('Ao longo do horizonte você avista uma torre, com um elevador em sua base. Você caminha até lá e sobe. A vista do alto da torre
			revela o grande Lago dos Nove, com uma enorme construção no centro e várias outras torres iguais as que você acabou de subir
			rodeando o lago. Nas suas costas, um pouco distante, uma enorme montanha aparenta guardar algum segredo.', 'Torre do Vigia'),
		   ('A entrada da montanha, um pouco acima da sua localização atual, está infestada de uma névoa escura. É necessário escalar para chegar até lá.
			Em sua base, à direita, você avista um baú.', 'A Montanha'), 
		   ('Pegando um pequeno barco a remo na margem do lago, você segue até a enorme construção do centro. Logo ao lado da doca, tem uma escadaria que leva
			até o topo, onde tem uma ponte à sua direita e o prédio central à esquerda', 'O Lago dos Nove');

insert into jogador (nome, vidaatual, vidatotal, experiencia, forca, defesa, id_local, id_nivel)
	values ('dummy', 100, 100, 5, 10, 10, 1, 1);

insert into inimigo (nome, tipo, descricao, pos, dialogo, dano, defesa, ataque, vida, vidaatual)
	values ('Draugr', 1, 'descricao do inimigo', 2, 'ROAR!', 2, 1, 1, 5, 5),
		   ('Troll', 1, 'descricao do inimigo', 5, 'ROAR!', 8, 6, 1, 20, 20), 
		   ('Lobo', 1, 'descricao do inimigo', 4, 'AUUUUUUU!', 1, 1, 1, 3, 3),
		   ('Ogro', 1, 'descricao do inimigo', 6, 'GRRRRAAAA!', 6, 5, 15, 15, 15);

insert into personagem (nome, tipo, descricao, pos, dialogo)
	values ('Freya', 2, 'descricao da personagem', 3, 'dialogo do personagem'),
		   ('Jörmungandr', 2, 'descricao da personagem', 4, 'dialogo da personagem'),
		   ('Atreus', 2, 'descricao da personagem', 3, 'dialogo da personagem');

insert into mercador (nome, tipo, descricao, pos, dialogo, multiVenda, itens)
	values ('Mercador da cidade', 3, 'descricao do mercador', 3, 'dialogo do mercador', 2, 4),
		   ('Mercador da floresta', 3, 'descricao do mercador', 5, 'dialogo do mercador', 5, 7);

insert into ferreiro (nome, tipo, descricao, pos, dialogo, melhorias, multiValor)
	values ('Sindri', 4, 'descricao do sindri', 3, 'dialogo do sindri', 4, 3),
		   ('Brok', 4, 'descricao do brok', 6, 'dialogo do brok', 2, 2);

--insert into missao (descricao, objetivo, id_item, idnpc)
--	values ('missao da Freya', 'objetivo da missao', 1, 5),
--		   ('missao do Jörmungandr', 'objetivo da missao', 3, 6);

insert into bau (id_local, raridade, tamanho)
	values (6, 2, 1),
		   (5, 0, 3),
		   (1, 1, 3);