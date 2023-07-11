DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	plano_id INT auto_increment PRIMARY KEY NOT NULL,
    plano VARCHAR(30) NOT NULL,
    valor_plano VARCHAR(512) NOT NULL
);

CREATE TABLE SpotifyClone.artistas(
	artista_id INT auto_increment PRIMARY KEY NOT NULL, 
    artista VARCHAR(100)
);

CREATE TABLE SpotifyClone.albuns(
	album_id INT auto_increment PRIMARY KEY NOT NULL,
    album VARCHAR(100),
    artista_id INT,
    ano_lancamento YEAR,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE SpotifyClone.cancoes(
	cancao_id INT auto_increment PRIMARY KEY NOT NULL,
    cancoes VARCHAR(200),
    duracao_segundos INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

CREATE TABLE SpotifyClone.pessoa_usuaria(
	pessoa_usuaria_id INT auto_increment PRIMARY KEY NOT NULL,
    nome_pessoa_usuaria VARCHAR(200),
    idade INT,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id),
    data_assinatura DATE
);

CREATE TABLE SpotifyClone.seguindo_artistas(
	pessoa_usuaria_id INT,
    artista_id INT,
    PRIMARY KEY (pessoa_usuaria_id, artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE SpotifyClone.historico_reproducoes(
    data_reproducao TIMESTAMP,
    pessoa_usuaria_id INT,
    cancao_id INT,
    PRIMARY KEY (pessoa_usuaria_id, data_reproducao),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (CANCAO_ID) REFERENCES cancoes(cancao_id)
);

INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('1', 'gratuito', '0');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('2', 'familiar', '7.99');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('3', 'universitário', '5.99');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('4', 'pessoal', '6.99');

INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('1', 'Barbara Liskov', '82', '1', '2019-10-20');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('2', 'Robert Cecil Martin', '58', '1', '2017-01-06');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('3', 'Ada Lovelace', '37', '2', '2017-12-30');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('4', 'Martin Fowler', '46', '2', '2017-01-17');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('5', 'Sandi Metz', '58', '2', '2018-04-29');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('6', 'Paulo Freire', '19', '3', '2018-02-14');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('7', 'Bell Hooks', '26', '3', '2018-01-05');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('8', 'Christopher Alexander', '85', '4', '2019-06-05');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('9', 'Judith Butler', '45', '4', '2020-05-13');
INSERT INTO pessoa_usuaria (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES ('10', 'Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO artistas (artista, artista_id) VALUES ('Beyoncé', '1');
INSERT INTO artistas (artista, artista_id) VALUES ('Queen', '2');
INSERT INTO artistas (artista, artista_id) VALUES ('Metallica', '3');
INSERT INTO artistas (artista, artista_id) VALUES ('Elis Regina', '4');
INSERT INTO artistas (artista, artista_id) VALUES ('Los Hermanos', '5');
INSERT INTO artistas (artista, artista_id) VALUES ('Baco Exu do Blues', '6');
INSERT INTO artistas (artista, artista_id) VALUES ('Blind Guardian', '7');
INSERT INTO artistas (artista, artista_id) VALUES ('Nina Simone', '8');

INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('1', 'Renaissance', '1', '2022');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('2', 'Jazz', '2', '1978');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('3', 'Hot Space', '3', '1982');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('4', 'Falso Brilhante', '4', '1998');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('5', 'Vento de Maio', '5', '2001');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('6', 'QVVJFA?', '6', '2003');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('7', 'Somewhere Far Beyond', '7', '2007');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('8', 'I Put A Spell On You', '8', '2012');

INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('1', '"BREAK MY SOUL" ', '279', '1');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('2', '"VIRGOS GROOVE"', '369', '1');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('3', '"ALIEN SUPERSTAR"', '116', '1');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('4', `"Don\'t Stop Me Now"`, '203', '2');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('5', '"Under Pressure"', '152', '2');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('6', '"Como Nossos Pais"', '105', '4');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('7', '"O Medo de Amar é o Medo de Ser Livre"', '207', '5');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('8', '"Samba em Paris"', '267', '6');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('9', `"The Bard\'s Song"`, '244', '7');
INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES ('10', '"Feeling Good"', '100', '8');

INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('8', '2022-02-28 10:45:55', '1');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('2', '2020-05-02 05:30:35', '1');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('10', '2020-03-06 11:22:33', '1');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('10', '2022-08-05 08:05:17', '2');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('7', '2020-01-02 07:40:33', '2');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('10', '2020-11-13 16:55:13', '3');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('2', '2020-12-05 18:38:30', '3');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('8', '2021-08-15 17:10:10', '4');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('8', '2022-01-09 01:44:33', '5');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('5', '2020-08-06 15:23:43', '5');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('7', '2017-01-24 00:31:17', '6');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('1', '2017-10-12 12:35:20', '6');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('4', '2011-12-15 22:30:49', '7');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('4', '2012-03-17 14:56:41', '8');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('9', '2022-02-24 21:14:22', '9');
INSERT INTO historico_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES ('3', '2015-12-13 08:30:22', '10');

INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('1', '1');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('1', '2');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('1', '4');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('2', '1');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('2', '5');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('3', '2');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('4', '6');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('5', '7');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('5', '8');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('6', '1');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('6', '1');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('7', '8');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('8', '3');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('9', '5');
INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES ('10', '3');
