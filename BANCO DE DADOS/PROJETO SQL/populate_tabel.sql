use Projeto_BD;

DELETE FROM usuarios WHERE true;
INSERT INTO usuarios VALUES (1,'Joel Justice','tecnico','nec.urna.et@eueros.edu','chefe')
                             ,(2,'Fredericka Tate','analista','facilisis@metusfacilisislorem.edu','assistente')
                                                                ,(3,'Regan Fisher','analista','et@fringillaest.edu','assistente')
                                                                ,(4,'Colt Hinton','analista','orci.Phasellus@magnisdisparturient.net','assistente')
                                                                ,(5,'Kimberley Lopez','tecnico','sapien@idrisusquis.org','chefe')
                                                                ,(6,'Kato Mccray','analista','lectus@nislQuisque.ca','assistente')
                                                                ,(7,'Lysandra Summers','tecnico','augue.ac@id.com','assistente')
                                                                ,(8,'Minerva Obrien','tecnico','egestas.rhoncus.Proin@vel.edu','assistente')
                                                                ,(9,'Tate Daniels','analista','eget.tincidunt.dui@maurissit.org','BI')
                                                                ,(10,'Grace Bowman','tecnico','adipiscing@hymenaeosMaurisut.co.uk','BI');                                   
 
DELETE FROM relatorios WHERE true;
INSERT INTO relatorios VALUES (1,'sdasda', 'id,qnt,valor'),(2,'gghghhg','id,cargo,data' );
 
DELETE FROM requerimento_paineis WHERE true;
INSERT INTO requerimento_paineis VALUES (1,'descricao 1'),(2,'descricao 2');
 
DELETE FROM bi_usuario WHERE true;
INSERT INTO bi_usuario VALUES (9),(10);

DELETE FROM setor_usuario WHERE true;
INSERT INTO setor_usuario VALUES ('AGE',1)
								,('AGE', 2)
								,('AGE', 3)
								,('AGE', 4)
								,('AUDI',5)
								,('AUDI',6)
								,('AUDI',7)
								,('AUDI',8);

DELETE FROM atende WHERE true;
INSERT INTO atende VALUES (9,1),(10,2);

DELETE FROM chefe_setor WHERE true;
INSERT INTO chefe_setor VALUES (1),(5);

DELETE FROM assistente_setor WHERE true;
INSERT INTO assistente_setor VALUES (2),(3),(4),(6),(7),(8);


DELETE FROM requerer_painel WHERE true;
INSERT INTO requerer_painel VALUES (1,1),(5,2);

DELETE FROM criar_relatorio WHERE true;
INSERT INTO criar_relatorio VALUES (1,1),(5,2);

DELETE FROM remover_relatorio WHERE true;
INSERT INTO remover_relatorio VALUES (1,1),(5,2);


DELETE FROM ter_acesso_relatorio WHERE true;
INSERT INTO ter_acesso_relatorio VALUES (2,1),(3,1),(4,1),(6,2),(7,2),(8,2);


DELETE FROM relatorio_painel WHERE true;
INSERT INTO relatorio_painel VALUES (1,1),(2,2);
