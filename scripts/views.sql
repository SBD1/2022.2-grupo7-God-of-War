create view vw_inimigo_local as
select localtab.nome as Localização, inimigo.nome as Inimigo from localtab, inimigo
where inimigo.pos = localtab.id;

create view vw_personagem_local as
select localtab.nome as Localização, personagem.nome as Personagem from localtab, personagem
where personagem.pos = localtab.id;

create view vw_mercador_local as
select localtab.nome as Localização, mercador.nome as Mercador from localtab, mercador
where mercador.pos = localtab.id;

create view vw_ferreiro_local as
select localtab.nome as Localização, ferreiro.nome as Ferreiro from localtab, ferreiro
where ferreiro.pos = localtab.id;

create view vw_jogador_inventario as
select jogador.nome as Jogador, inventario.id_item as Item from jogador, inventario
where jogador.id = inventario.id_jogador;

create view vw_arma_ataque as
select arma.nome as Arma, ataque.nome as "Ataque Especial" from arma, ataque
where arma.id_tipoarma = ataque.id_tipoarma;

create view vw_jogador_nivel as
select jogador.nome as Jogador, jogador.id_nivel as Nível from jogador;

create view vw_jogador_mortes as
select jogador.nome as Jogador, jogador.mortes as Mortes from jogador;

create view vw_local_bau as
select localtab.nome as Localização, bau.raridade as Raridade, bau.tamanho as Tamanho from localtab, bau
where localtab.id = bau.id_local;