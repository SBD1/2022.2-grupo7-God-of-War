-- Carga da tabela tipoarma

insert into tipoarma (nome) values 
('cajado'),('espada'),('adaga'),('arcoflecha'),('martelo'),('lanca'),('especial');

insert into item (nome, peso, valor)
	values ('Cajado de Elfo Negro', 2, 100), --equipamento arma 
		   ('Espada de Heimdall', 15, 200),
		   ('Adaga de Loki', 4, 200),
		   ('Arco e Flecha de Atreus', 10, 200),
		   ('Martelo de Thor', 30, 300),
		   ('Espada Gram', 13, 150),
		   ('lanca Gungnir',16,170),
		   ('Lamina do Caos', 15, 1000),
		   ('Peitoral do Exilado', 20, 40), --equipamento armadura
		   ('Cinto do Exilado', 10, 20),
		   ('Peitoral do Arcano', 15, 30),
		   ('Cinto do Arcano', 5, 30),
		   ('Peitoral Volunder', 50, 100),
		   ('Cinto Volunder', 25, 80),
		   ('Pocao Media', 5, 10), --pocao
		   ('Pocao Pequena', 2, 10),
		   ('Pocao Grande', 10, 25);

insert into equipamento (nome, peso, valor, nivel, id_item)
	values ('Cajado de Elfo Negro', 2, 100, 2, 1), --arma
		   ('Espada de Heimdall', 15, 200, 2, 2),
		   ('Adaga de Loki', 4, 200, 2, 3),
		   ('Arco e Flecha de Atreus', 10, 200, 2, 4),
		   ('Martelo de Thor', 30, 300, 2, 5),
		   ('Espada Gram', 13, 150, 2, 6),
		   ('lanca Gungnir',16,170, 2, 7),
		   ('Lamina do Caos', 15, 1000, 2, 8),
		   ('Peitoral do Exilado', 20, 40, 1, 9), --armadura
		   ('Cinto do Exilado', 10, 20, 1, 10),
		   ('Peitoral do Arcano', 15, 30, 5, 11),
		   ('Cinto do Arcano', 5, 30, 5, 12),
		   ('Peitoral Volunder', 50, 100, 10, 13),
		   ('Cinto Volunder', 25, 80, 10, 14);

-- Carga da tabela arma 

insert into arma (nome,peso,valor,dano,id_tipoarma, nivel, id_equipamento) 
	values ('Cajado de Elfo Negro', 2, 100, 15, 1, 2, 1),
		   ('Espada de Heimdall', 15, 200, 25, 2, 2, 2),
		   ('Adaga de Loki', 4, 200, 20, 3, 2, 3),
		   ('Arco e Flecha de Atreus', 10, 200, 30, 4, 2, 4),
		   ('Martelo de Thor', 30, 300, 40, 5, 2, 5),
		   ('Espada Gram', 13, 150, 20, 2, 2, 6),
		   ('lanca Gungnir',16, 170, 22, 6, 2, 7),
		   ('Lamina do Caos', 15, 1000, 100, 7, 2, 8);

-- Carga da tabela armadura 

insert into armadura (nome, peso, valor, tipo, defesa, vida, nivel, id_equipamento)
	values ('Peitoral do Exilado', 20, 40, 'peitoral', 20, 100, 1, 9),
		   ('Cinto do Exilado', 10, 20, 'cinto', 20, 100, 1, 10),
		   ('Peitoral do Arcano', 15, 30, 'peitoral', 15, 100, 5, 11),
		   ('Cinto do Arcano', 5, 30, 'cinto', 10, 50, 5, 12),
		   ('Peitoral Volunder', 50, 100, 'peitoral', 40, 200, 10, 13),
		   ('Cinto Volunder', 25, 80, 'cinto', 100, 150, 10, 14);

-- Carga da tabela poçao 

insert into pocao (nome, peso, valor, vidaregen, id_item)
	values ('Pocao Media', 5, 10, 50, 15),
		   ('Pocao Pequena', 2, 10, 25, 16),
		   ('Pocao Grande', 10, 25, 100, 17);

-- Carga da tabela ataque
 
insert into ataque (nome, multiplicador, qntalvos, descricao, id_tipoarma) 
	values ('Bola de Fogo', 2, 1, 'Seu cajado comeca a trocar de cor, comeca a ficar avermelhado, prestes a derreter, entao uma bola de fogo eh disparada
		   contra seu inimigo, causando o dobro do seu ataque.', 1),
		   ('Ataque Vertical', 3, 1, 'Você segura sua espada com toda a forca do seu corpo, com as duas maos voce a levanta e executa um corte,
		   partido seu inimigo ao meio.',2),
		   ('Apunhalar pelas costas', 3, 1,'Voce passar para as costas do inimigo, de uma forma que ele nao te percebe, apunhalando-o nas costas', 3);


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

insert into localtab (descricao, nome, proxsala)
	values ('Voce esta na Floresta Selvagem, escura e com um clima frio. O chao esta coberto de neve e voce escuta um pequeno rio correndo por perto. Olhando diretamente para frente, voce ve uma estreita trilha por entre as altas arvores que te rodeiam.', 
		   'Floresta Selvagem', 1),
		   ('Apos uma curta caminhada, você chega no rio. A agua e limpa e convidativa, parece ser uma boa ideia tomar um gole para saciar sua sede. Seguir o leito do rio pode ser uma boa ideia para encontrar uma cidade.',
		    'Beira do rio', 2),
		   ('Ao longo de um caminho sinuoso, voce avista uma tartaruga gigante que aparenta estar adormecida. Ao lado dela tem um grande jardim, todo florido e meticulosamente organizado. Olhando depois do enorme animal, voce enxerga uma alta torre que parece ser rapidamente alcancada a pe', 'Casa da Bruxa', 2),
		   ('Voce chega mais perto da torre e ve que ela tem um elevador de madeira em sua base. Voce caminha ate la e sobe. A vista do alto da torre revela o grande Lago dos Nove, com uma enorme construcao redonda no centro e uma ponte saindo dela. Oito torres iguais as que você acabou de subir circulam o lago. Você avista um pequeno barco a remo do lado oposto ao que você subiu que pode ser facilmente utilizado para alcançar a construcao no centro do lado. Olhando pelas suas costas, um pouco distante, uma enorme montanha a alguns quilometros da sua posicao aparenta guardar algum segredo.',
		   	'Torre do Vigia', 3),
		   ('Pegando o pequeno barco a remo na margem do lago, voce segue ate a enorme construcao do centro. A agua do lago se movimenta de uma maneira incomum, como se algo estivesse se movimentando no fundo. Logo ao lado da doca, tem uma escadaria que leva ate o topo, onde tem uma ponte a sua direita e o predio central a esquerda', 'O Lago dos Nove', 3),
		   ('A entrada da montanha, um pouco acima da sua localizacao atual, esta infestada de uma nevoa escura. Eh necessario escalar para chegar ate la.
			Em sua base, a direita, voce avista um bau.', 'A Montanha', 1),
		   ('Seguindo a ponte, voce passa por um elevador bem no centro dela que leva ate uma pequena torre, pouco mais alta do que 3 metros, e possui o que parece ser um enorme instrumento de sopro. Seria uma boa ideia assopra-lo?', 'A Ponte', 2),
		   ('Voce sobe o elevador e com um pouco de receio sopra o instrumento. Um barulho grave ecoa pelo vale do Lago dos Nove e voce sente o chao tremer. A cabeça de um gigantesco animal emerge do fundo do lago e se aproxima da torre onde voce se encontra.', 'A torre da ponte', 0),
		   ('Seguindo ate o final da ponte voce ve que eh um caminho sem saida, a ponte esta partida no meio, mas uma atmosfera pesada parece assombrar o local.', 'O fim da ponte', 1);
		   

insert into jogador (nome, vidaatual, vidatotal, experiencia, forca, defesa, id_local, id_nivel, movimentos, mortes)
	values ('dummy', 100, 100, 5, 10, 10, 1, 1, 0, 0);

insert into inventario (id_jogador, carga, capacidade, hacksilver)
	values(1, 0, 100, 0);

insert into npc (nome, tipo, descricao, pos, dialogo)
	values ('Draugr', 1, 'sao cadaveres reanimados que assombram os campos de batalha', 2, 'ROAR!'),
		   ('Troll', 1, 'sao enormes criaturas que carregam pilares como armas. Possuem um gigante par de presas nas laterais do rosto.', 7, 'ROAR!'),
		   ('Lobo', 1, 'Na maioria das vezes aparecem em bandos e podem aparecer aliados com bruxas. Atacam com bastante rapidez, nao seja cercado.', 4, 'AUUUUUUU!'),
		   ('Ogro', 1, 'sao seres grandes e burros, mas possuem forca suficiente para bater de frente com um Troll. Nao os julgue pela sua inteligencia', 6, 'GRRRRAAAA!'),
		   ('Pesadelo', 1, 'sao pequenos seres voadores compostos por um grande olho e varios tentaculos que permitem sua locomocao.', 9, ''),
		   ('Freya', 2, 'tambem conhecida como a bruxa da floresta, e uma deusa Vanir e ex-esposa do proprio Odin.', 3, 'Voce parece perdido, viajante. Te ajudo se me ajudar'),
		   ('Jormungandr', 2, 'tambem conhecido como a serpente do mundo. Eh o ultimo dos Jotnar e esta destinado a batalhar com Thor no Ragnarok.', 4, 'dialogo da personagem'),
		   ('Atreus', 2, 'filho do deus grego Kratos e sua segunda mulher, Faye. Ainda jovem, mas apresenta brilhante maestria com um arco e flecha.', 3, 'dialogo da personagem'),
		   ('Mercador da Torre', 3, 'um simples mercador com sua pequena tenda na base da torre.', 3, 'Saudacoes viajante, como posso te ajudar?'),
		   ('Mercador da montanha', 3, 'um homem com uma tunica negra e carregando uma pequena trouxa em suas costas.', 5, 'Tocou, comprou.'),
		   ('Sindri', 4, 'descricao do sindri', 3, 'dialogo do sindri'),
		   ('Brok', 4, 'descricao do brok', 6, 'dialogo do brok');

insert into inimigo (nome, tipo, descricao, pos, dialogo, dano, defesa, ataque, vida, vidaatual, xpinimigo, idnpc)
	values ('Draugr', 1, 'Draugrs sao cadaveres reanimados que assombram os campos de batalha', 2, 'WRAWWWR!', 15, 15, 15, 20, 20, 20, 1),
		   ('Troll', 1, 'Trolls sao enormes criaturas que carregam pilares como armas. Possuem um gigante par de presas nas laterais do rosto', 5, 'ROOOOAAAR!', 20, 20, 20, 40, 40, 30, 2), 
		   ('Lobo', 1, 'Na maioria das vezes aparecem em bandos e podem aparecer aliados com bruxas. Atacam com bastante rapidez, não seja cercado.', 4, 'AUUUUUUU!', 12, 12, 12, 15, 15, 15, 3),
		   ('Ogro', 1, 'Ogros sao seres grandes e burros, mas possuem forca suficiente para bater de frente com um Troll. Nao os julgue pela sua inteligencia', 6, 'GRRRRAAAA!', 30, 30, 30, 50, 50, 30, 4),
		   ('Pesadelo', 1, 'sao pequenos seres voadores compostos por um grande olho e varios tentaculos que permitem sua locomocao.', 9, '', 10, 10, 10, 10, 10, 5, 5);

insert into personagem (nome, tipo, descricao, pos, dialogo, idnpc)
	values ('Freya', 2, 'Tambem conhecida como a bruxa da floresta, e uma deusa Vanir e ex-esposa do proprio Odin.', 3, 'Voce parece perdido, viajante. Te ajudo se me ajudar', 5),
		   ('Jormungandr', 2, 'Tambem conhecido como a serpente do mundo. Eh o ultimo dos Jotnar e esta destinado a batalhar com Thor no Ragnarok.', 4, 'dialogo da personagem', 6),
		   ('Atreus', 2, 'Filho do deus grego Kratos e sua segunda mulher, Faye. Ainda é jovem, mas apresenta brilhante maestria com um arco e flecha.', 3, 'Nao aguento mais ser chamado de garoto. Se voce matar o velho, eu te dou uma recompensa', 7);

insert into mercador (nome, tipo, descricao, pos, dialogo, multiVenda, itens, idnpc)
	values ('Mercador da cidade', 3, 'descricao do mercador', 3, 'dialogo do mercador', 2, 4, 8),
		   ('Mercador da floresta', 3, 'descricao do mercador', 5, 'dialogo do mercador', 5, 7, 9);

insert into ferreiro (nome, tipo, descricao, pos, dialogo, melhorias, multiValor, idnpc)
	values ('Sindri', 4, 'descricao do sindri', 3, 'dialogo do sindri', 4, 3, 10),
		   ('Brok', 4, 'descricao do brok', 6, 'dialogo do brok', 2, 2, 11);

insert into missao (descricao, objetivo, id_item, idnpc)
	values ('missao da Freya', 'objetivo da missao', 1, 5),
		   ('missao do Jormungandr', 'objetivo da missao', 3, 6);

insert into bau (id_local, raridade, tamanho)
	values (6, 2, 1),
		   (5, 0, 3),
		   (1, 1, 3);
		  
-- backup

/*-- Carga da tabela tipoarma

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
		   (1, 1, 3);*/