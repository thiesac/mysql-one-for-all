SELECT 
	p.nome_pessoa_usuaria pessoa_usuaria,
    IF(year(MAX(h.data_reproducao)) >= 2021, 'Ativa', 'Inativa') status_pessoa_usuaria
FROM
	pessoa_usuaria p
		INNER JOIN historico_reproducoes h ON h.pessoa_usuaria_id = p.pessoa_usuaria_id
	GROUP BY pessoa_usuaria
    ORDER BY pessoa_usuaria;