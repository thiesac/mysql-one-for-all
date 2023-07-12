SELECT COUNT(cancao_id) musicas_no_historico
FROM historico_reproducoes h
INNER JOIN pessoa_usuaria p ON p.pessoa_usuaria_id = h.pessoa_usuaria_id
WHERE p.nome_pessoa_usuaria = 'Barbara Liskov';
