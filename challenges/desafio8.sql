SELECT 
	ar.artista artista,
    al.album album
FROM artistas ar
	INNER JOIN albuns al ON ar.artista_id = al.artista_id
    HAVING ar.artista = 'Elis Regina';