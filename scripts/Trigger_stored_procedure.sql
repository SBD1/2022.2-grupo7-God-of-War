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


-- Quando voce vai comprar algo
CREATE OR REPLACE FUNCTION compra_mercador()
RETURNS TRIGGER AS $compra_mercador$
DECLARE
	qtd_hacksilver INT;
BEGIN
	SELECT hacksilver INTO qtd_hacksilver FROM inventario WHERE id_jogador = NEW.id_jogador;
	
	IF qtd_hacksilver >= NEW.valor THEN
		UPDATE inventario SET hacksilver = hacksilver - NEW.valor WHERE id_jogador = NEW.id_jogador;
		INSERT INTO inventario (id_jogador, id_item) VALUES (NEW.id_jogador, NEW.id_item);
		RETURN NEW;
	ELSE
		RAISE NOTICE 'Você não possui Hacksilver suficiente';
	END IF;
END;
$compra_mercador$ LANGUAGE plpgsql;
--falta a trigger


-- Utilizar a pocao
CREATE OR REPLACE FUNCTION usar_porcao()
RETURNS TRIGGER AS $usar_porcao$
DECLARE
  vida_pocao INT;
  vida INT;
  vida_atual INT;
  vida_total INT;
BEGIN
  SELECT vidaregen INTO vida_pocao FROM pocao WHERE pocao.id_item = old.id_item;
  SELECT vidaAtual INTO vida FROM jogador WHERE jogador.id = NEW.id_jogador;
  SELECT vidaAtual INTO vida_atual FROM jogador WHERE jogador.id = NEW.id_jogador;
  SELECT vidaTotal INTO vida_total FROM jogador WHERE jogador.id = NEW.id_jogador;

  UPDATE jogador
  SET vida_atual = vida + vida_pocao
  WHERE jogador.id = new.id_jogador;
  RAISE NOTICE 'Vida da poçãosf: ';

  IF vida_atual > vida_total THEN
    UPDATE jogador
    SET vidaAtual = vida_total
    WHERE id = NEW.id_jogador;
  END IF;

  RETURN NEW;
END;
$usar_porcao$ LANGUAGE plpgsql;


CREATE TRIGGER usar_porcao_trigger
AFTER DELETE ON inventario
FOR EACH ROW
EXECUTE FUNCTION usar_porcao();