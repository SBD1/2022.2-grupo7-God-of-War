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

--caso o jogador morra
CREATE OR REPLACE FUNCTION jogador_morre()
RETURNS TRIGGER AS $jogador_morre$
DECLARE
	morte INT;
begin
	SELECT mortes INTO morte FROM jogador WHERE jogador.id = NEW.id;
  UPDATE jogador
  SET id_local = DEFAULT,
      vidaAtual = default ,
      vidaTotal = DEFAULT,
      experiencia = DEFAULT,
      id_nivel = DEFAULT,
      mortes = morte + 1
  WHERE id = NEW.id;
  RAISE NOTICE 'Voce morreu';
  DELETE FROM inventario
  WHERE id_jogador = NEW.id;

  RETURN NEW;
END;
$jogador_morre$ LANGUAGE plpgsql;

CREATE trigger jogador_morre_trigger
AFTER UPDATE ON jogador
FOR EACH ROW
WHEN (NEW.vidaAtual <= 0)
EXECUTE procedure jogador_morre();

update jogador 
set vidaAtual = 0
where id = 1


-- Quando voce vai comprar algo
CREATE OR REPLACE FUNCTION atualiza_hacksilver()
RETURNS TRIGGER AS $atualiza_hacksilver$
DECLARE
	qtd_hacksilver INT;
BEGIN
	SELECT hacksilver INTO qtd_hacksilver FROM inventario WHERE id_jogador = NEW.id_jogador;
	
	IF qtd_hacksilver >= NEW.valor THEN
		UPDATE inventario SET hacksilver = hacksilver - NEW.valor WHERE id_jogador = NEW.id_jogador;
		INSERT INTO inventario (id_jogador, id_item) VALUES (NEW.id_jogador, NEW.id_item);
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Você não possui Hacksilver suficiente';
	END IF;
END;
$atualiza_hacksilver$ LANGUAGE plpgsql;
--falta a trigger

