DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
	plano_id INT auto_increment PRIMARY KEY NOT NULL,
    plano VARCHAR(30) NOT NULL,
    valor_plano DECIMAL(3, 2) NOT NULL
);

CREATE TABLE artistas(
	artista_id INT auto_increment PRIMARY KEY NOT NULL, 
    artista VARCHAR(100)
);

CREATE TABLE albuns(
	album_id INT auto_increment PRIMARY KEY NOT NULL,
    album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE cancoes(
	cancao_id INT auto_increment PRIMARY KEY NOT NULL,
    cancoes VARCHAR(200) NOT NULL,
    duracao_segundos SMALLINT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

CREATE TABLE pessoa_usuaria(
	pessoa_usuaria_id INT auto_increment PRIMARY KEY NOT NULL,
    nome_pessoa_usuaria VARCHAR(200) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

CREATE TABLE seguindo_artistas(
	pessoa_usuaria_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE historico_reproducoes(
    data_reproducao DATETIME NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
);

INSERT INTO planos (plano, valor_plano) 
VALUES ('gratuito', 0);
('familiar', 7.99);
('universitário', 5.99);
('pessoal', 6.99);

INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Barbara Liskov', 82, 1, '2019-10-20');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Robert Cecil Martin', 58, 1, '2017-01-06');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Ada Lovelace', 37, 2, '2017-12-30');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Martin Fowler', 46, 2, '2017-01-17');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Sandi Metz', 58, 2, '2018-04-29');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Paulo Freire', 19, 3, '2018-02-14');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Bell Hooks', 26, 3, '2018-01-05');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Christopher Alexander', 85, 4, '2019-06-05');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Judith Butler', 45, 4, '2020-05-13');
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO artistas (artista) VALUES ('Beyoncé');
INSERT INTO artistas (artista) VALUES ('Queen');
INSERT INTO artistas (artista) VALUES ('Queen');
INSERT INTO artistas (artista) VALUES ('Elis Regina');
INSERT INTO artistas (artista) VALUES ('Elis Regina');
INSERT INTO artistas (artista) VALUES ('Baco Exu do Blues');
INSERT INTO artistas (artista) VALUES ('Blind Guardian');
INSERT INTO artistas (artista) VALUES ('Nina Simone');

INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Renaissance', '1', '2022');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Jazz', '2', '1978');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Hot Space', '3', '1982');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Falso Brilhante', '4', '1998');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Vento de Maio', '5', '2001');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('QVVJFA?', '6', '2003');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('Somewhere Far Beyond', '7', '2007');
INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES ('I Put A Spell On You', '8', '2012');

INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('BREAK MY SOUL', '279', '1');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('VIRGOS GROOVE', '369', '1');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('ALIEN SUPERSTAR', '116', '1');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('Dont Stop Me Now', '203', '2');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('Under Pressure', '152', '2');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('Como Nossos Pais', '105', '4');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('O Medo de Amar é o Medo de Ser Livre', '207', '5');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('Samba em Paris', '267', '6');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('The Bards Song', '244', '7');
INSERT INTO cancoes (cancoes, duracao_segundos, album_id) VALUES ('Feeling Good', '100', '8');

INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (8, '2022-02-28 10:45:55', 1);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (2, '2020-05-02 05:30:35', 1);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (10, '2020-03-06 11:22:33', 1);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (10, '2022-08-05 08:05:17', 2);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (7, '2020-01-02 07:40:33', 2);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (10, '2020-11-13 16:55:13', 3);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (2, '2020-12-05 18:38:30', 3);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (8, '2021-08-15 17:10:10', 4);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (8, '2022-01-09 01:44:33', 5);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (5, '2020-08-06 15:23:43', 5);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (7, '2017-01-24 00:31:17', 6);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (1, '2017-10-12 12:35:20', 6);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (4, '2011-12-15 22:30:49', 7);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (4, '2012-03-17 14:56:41', 8);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (9, '2022-02-24 21:14:22', 9);
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES (3, '2015-12-13 08:30:22', 10);

INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (1, 1);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (1, 2);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (1, 4);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (2, 1);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (2, 5);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (3, 2);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (4, 6);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (5, 7);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (5, 8);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (6, 1);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (6, 1);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (7, 8);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (8, 3);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (9, 5);
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES (10, 3);
