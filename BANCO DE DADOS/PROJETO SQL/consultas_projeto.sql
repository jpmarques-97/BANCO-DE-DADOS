Quantidade de usuarios por setor
SELECT su.setor, COUNT(*) 
FROM  usuarios u
INNER JOIN setor_usuario su ON u.id_usuario = su.usuarios_id_usuario
GROUP BY su.setor


arquivos e seus respectivos responsaveis pela criacao
SELECT r.nome_arquivo, su.setor
FROM criar_relatorio cr
INNER JOIN relatorios r ON r.id_relatorio = cr.relatorios_id_relatorio
INNER JOIN chefe_setor cs ON cr.chefe_setor_setor_usuario_usuarios_id_usuario = cs.setor_usuario_usuarios_id_usuario
INNER JOIN setor_usuario su ON su.usuarios_id_usuario = cs.setor_usuario_usuarios_id_usuario


Nome, cargo, funcao, email e relaorios de usuarios que podem acessar determinados relatorios
SELECT nome, cargo, funcao, email, relatorios_id_relatorio
FROM ter_acesso_relatorio tar
INNER JOIN assistente_setor asis ON asis.setor_usuario_usuarios_id_usuario = tar.assistente_setor_setor_usuario_usuarios_id_usuario
INNER JOIN setor_usuario su ON su.usuarios_id_usuario = asis.setor_usuario_usuarios_id_usuario
INNER JOIN usuarios u ON u.id_usuario = su.usuarios_id_usuario

Quantidade de relatorios que podem ser assessados por cargo
SELECT  cargo, COUNT(relatorios_id_relatorio) AS qt_relatorios
FROM ter_acesso_relatorio tar
INNER JOIN assistente_setor asis ON asis.setor_usuario_usuarios_id_usuario = tar.assistente_setor_setor_usuario_usuarios_id_usuario
INNER JOIN setor_usuario su ON su.usuarios_id_usuario = asis.setor_usuario_usuarios_id_usuario
INNER JOIN usuarios u ON u.id_usuario = su.usuarios_id_usuario
GROUP BY cargo

Chefes que sao do setor AGE
SELECT setor, COUNT(*) as qt_chefes
FROM chefe_setor cs
INNER JOIN setor_usuario su ON su.usuarios_id_usuario = cs.setor_usuario_usuarios_id_usuario
GROUP BY su.setor


Selecionando nome, cargo e email de usuarios que possuem funcao de assistente
Select nome,funcao,email
FROM usuarios
WHERE funcao = 'assistente'


Selecionando nome, cargo e email de usuarios que possuem cargo de tecnico
Select nome,cargo,email
FROM usuarios
WHERE cargo = 'tecnico'

Nome dos arquivos
SELECT r.nome_arquivo
FROM criar_relatorio cr
INNER JOIN relatorios r ON r.id_relatorio = cr.relatorios_id_relatorio


Seleciona os paineis requeridos que possuem descricao
SELECT *  
FROM requerimento_paineis rp
WHERE rp.desceicaoo IS NOT NULL

Quantidade de usuarios agrupados por funcao e cargo
SELECT u.cargo, u.funcao, COUNT(*) as qt_usuarios
FROM  usuarios u
GROUP BY u.cargo, u.funcao
