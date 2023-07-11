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
    ano_lancamento DATE,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE SpotifyClone.cancoes(
	cancao_id INT auto_increment PRIMARY KEY NOT NULL,
    cancoes VARCHAR(200),
    duracao_segundos INT,
    album_id INT,
    ano_lancamento DATE,
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
    data_reproducao DATE,
    pessoa_usuaria_id INT,
    cancao_id INT,
    PRIMARY KEY (pessoa_usuaria_id, cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (CANCAO_ID) REFERENCES cancoes(cancao_id)
);

-- planos
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('1', 'gratuito', '0');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('2', 'familiar', '7.99');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('3', 'universitário', '5.99');
INSERT INTO planos (plano_id, plano, valor_plano) VALUES ('4', 'pessoal', '6.99');

-- pessoa usuária
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

-- artistas
INSERT INTO artistas (artista, artista_id) VALUES ('Beyoncé', '1');
INSERT INTO artistas (artista, artista_id) VALUES ('Queen', '2');
INSERT INTO artistas (artista, artista_id) VALUES ('Queen', '3');
INSERT INTO artistas (artista, artista_id) VALUES ('Elis Regina', '4');
INSERT INTO artistas (artista, artista_id) VALUES ('Elis Regina', '5');
INSERT INTO artistas (artista, artista_id) VALUES ('Baco Exu do Blues', '6');
INSERT INTO artistas (artista, artista_id) VALUES ('Blind Guardian', '7');
INSERT INTO artistas (artista, artista_id) VALUES ('Nina Simone', '8');

-- albuns
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('1', 'Renaissance', '1', '2022');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('2', 'Jazz', '2', '1978');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('3', 'Hot Space', '3', '1982');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('4', 'Falso Brilhante', '4', '1998');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('5', 'Vento de Maio', '5', '2001');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('6', 'QVVJFA?', '6', '2003');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('7', 'Somewhere Far Beyond', '7', '2007');
INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES ('8', 'I Put A Spell On You', '8', '2012');
