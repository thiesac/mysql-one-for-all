SELECT 
	ar.artista artista,
    al.album album,
    COUNT(s.artista_id) pessoas_seguidoras
FROM
	artistas ar
    INNER JOIN albuns al ON ar.artista_id = al.artista_id
    INNER JOIN seguindo_artistas s ON s.artista_id = ar.artista_id
    GROUP BY ar.artista, al.album
    ORDER BY pessoas_seguidoras DESC, artista, album;