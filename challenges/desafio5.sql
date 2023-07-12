SELECT 
	c.cancoes cancao,
    COUNT(h.cancao_id) reproducoes
FROM cancoes c
	INNER JOIN historico_reproducoes h ON h.cancao_id = c.cancao_id
GROUP BY h.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;