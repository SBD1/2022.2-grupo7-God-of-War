-- inventário

select carga, capacidade, hacksilver 
	from inventario join jogador
					on inventario.id_jogador = jogador.id;
					
-- arma do jogador
					  
select jogador.nome, arma.nome, arma.valor, arma.nivel, arma.peso, arma.dano
	from inventario join jogador
					on jogador.id = inventario.id_jogador 
					inner join item on inventario.id_item = item.id
					inner join arma on arma.nome = item.nome;
					
-- missao

select personagem.nome, missao.objetivo, missao.descricao, missao.id_item
	from personagem join missao
				on missao.idnpc = personagem.idnpc;
			
-- itens do mercador
			
select item.nome
	from mercador join item
				  on mercador.itens = item.id;
				 
-- localização do personagem
				 
select jogador.nome, localtab.nome, localtab.descricao
	from jogador join localtab
				 on jogador.id_local = localtab.id;
				
-- checar atributos do nivel
				
select jogador.nome,nivel.id, jogador.experiencia, nivel.xpnecessario, nivel.forca, nivel.defesa
	from jogador join nivel
				 on jogador.id_nivel = nivel.id;
				
-- checar vida

select jogador.nome, jogador.vidaatual, jogador.vidatotal
	from jogador;

-- checar ataque da arma

select arma.nome, ataque.nome, arma.dano, ataque.multiplicador, ataque.qntalvos
	from arma join ataque
			  on arma.id = ataque.id_tipoarma;
			 
-- filtrar itens no inventario alfabeticamente	