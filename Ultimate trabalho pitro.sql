USE Mentalista;
SELECT id_suspeito, nome_suspeito, profissao, sexo, altura
FROM tbSuspeitos
WHERE ficha_criminal = 1 -- Pista 1
	AND altura >=1.70 -- Pista 2
    AND (
    profissao like '%restaurador%' OR
    profissao like '%arte%' OR 
    profissao like '%restauradora%'); -- pista 3
    
SELECT id_movimentacao, id_suspeito_FK, valor, descricao, nome_suspeito -- Pista 4
    FROM tbDadosBancarios
    INNER JOIN tbSuspeitos on tbDadosBancarios.id_suspeito_FK = tbSuspeitos.id_suspeito
    WHERE tbDadosBancarios.saque_deposito = 1
    AND tbDadosBancarios.valor > 20000.00;
    
SELECT tipo_evidencia, descricao, id_suspeito, id_suspeito_FK, nome_suspeito -- pista 5
	FROM tbEvidencia
	INNER JOIN  tbSuspeitos on id_suspeito_FK = id_suspeito
	WHERE tipo_evidencia like '%Perfume%';

SELECT nome_suspeito, data_hora_ocorrencia, tipo_ocorrencia -- Pista 6
	FROM tbOcorrencia 
	INNER JOIN tbSuspeitos on tbOcorrencia.id_suspeito_FK= tbSuspeitos.id_suspeito
	WHERE tbOcorrencia.local_ocorrencia like '%painel de energia%'
    AND tbOcorrencia.data_hora_ocorrencia LIKE '%2026-10-15%';

SELECT tbsuspeitos.nome_suspeito, data_hora, local_acesso, entrada_saida -- 
FROM tbAcessos
INNER JOIN tbsuspeitos on tbAcessos.id_suspeito_FK = tbSuspeitos.id_suspeito
WHERE tbAcessos.data_hora >= '2026-10-15 21:00:00'
	AND tbAcessos.data_hora <= '2026-10-15 22:00:00'
    AND tbAcessos.local_acesso like '%sala do acervo%'
    AND tbAcessos.entrada_saida = 1;
    

