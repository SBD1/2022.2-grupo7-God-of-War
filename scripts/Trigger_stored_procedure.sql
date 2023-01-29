-- TRIGGERS PARA MANTER AS REGRAS DE GENERALIZAÇÃO E ESPECIALIZAÇÃO
create or replace function jogador_ja_existe() returns trigger 
as $jogador_ja_existe$
begin 
	perform * from tb_jogador where nome = new.nome;
	if found then 
		raise exception 'Este jogador já existe';
	end if;
	return new;
end
$jogador_ja_existe$ language plpgsql;

create trigger jogador_ja_existe
before update or insert on tb_jogador 
for each row execute procedure jogador_ja_existe();