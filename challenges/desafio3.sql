SELECT 
	pu.nome_pessoa_usuaria pessoa_usuaria,
	COUNT(hr.cancao_id) musicas_ouvidas,
	SUM(ROUND(c.duracao_segundos/60, 2)) total_minutos
FROM pessoa_usuaria pu
	INNER JOIN historico_reproducoes hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
    INNER JOIN cancoes c ON c.cancao_id = hr.cancao_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;