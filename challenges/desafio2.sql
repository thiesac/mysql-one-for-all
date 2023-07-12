   SELECT 
    COUNT(DISTINCT c.cancao_id) AS 'cancoes',
    COUNT(DISTINCT ar.artista_id) AS 'artistas',
    COUNT(DISTINCT al.album_id) AS 'albuns'
FROM 
    cancoes c
    RIGHT JOIN albuns al ON c.album_id = al.album_id
    INNER JOIN artistas ar ON al.artista_id = ar.artista_id;