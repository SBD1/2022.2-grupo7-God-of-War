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

-- Procedure para quando um inimigo morre
CREATE OR REPLACE PROCEDURE inimigo_morre(id_jogador_param INTEGER, idNPC_param INTEGER, nome_param VARCHAR(30) ) AS $inimigo_morre$
DECLARE

vida_inimigo INTEGER;
experiencia_jogador INTEGER;
exeperiencia_inimigo INTEGER;

BEGIN
 
    SELECT vidaAtual INTO vida_inimigo FROM inimigo WHERE idNPC = OLD.idNPC; -- pega a vida do inimigo
    SELECT experiencia INTO experiencia_jogador FROM jogador WHERE id_jogador = id_jogador_param; -- pega a experiencia do jogador
    SELECT xpinimigo INTO exeperiencia_inimigo FROM inimigo WHERE idNPC = idNPC_param; -- pega a experiencia do inimigo
    
    IF vida_inimigo <= 0 THEN UPDATE jogador SET experiencia = experiencia_jogador + exeperiencia_inimigo
    WHERE  id_jogador = id_jogador_param
    AND nome = nome_param;
    END IF;
END;
$inimigo_morre$ LANGUAGE plpgsql;
