-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: povoamento das tabelas (INSERT)
-- Modelo 4: Streaming
-- Aluno: Matheus
-- =====================================================================

-- Executar no Query Tool conectado ao database "streaming",
-- depois de rodar o 04_streaming.sql.
--
-- Dados gerados com ajuda de IA a partir do meu script de criacao e
-- revisados antes de executar:
--   * toda FK aponta para um id que existe;
--   * nenhum par repetido na PK composta;
--   * nenhum valor viola as regras CHECK e UNIQUE;
--   * apostrofos escritos com aspa dobrada (ex.: 'Olhos d''Agua');
--   * e-mails unicos e precos de plano positivos e diferentes;
--   * todo plano tem pelo menos um usuario;
--   * todo genero e todo diretor tem pelo menos um filme;
--   * assistidos e (0,N) dos dois lados, entao alguns usuarios e
--     filmes ficam sem registro de proposito.
--
-- Os ids SERIAL nao sao informados: o PostgreSQL gera 1, 2, 3... na
-- ordem dos VALUES. Por isso o script comeca com TRUNCATE ... RESTART
-- IDENTITY, que esvazia as tabelas e reinicia a contagem em 1. Assim o
-- script pode ser executado mais de uma vez sem quebrar as FKs.

TRUNCATE TABLE assistidos, filmes, usuarios, diretores, generos, planos RESTART IDENTITY;

-- planos: 4 registros (minimo 4)
-- O modelo nao tem nome de plano; o nome comercial fica so no comentario.
INSERT INTO planos (preco) VALUES
    (20.90),                                                          -- id 1: Básico com anúncios
    (29.90),                                                          -- id 2: Básico
    (44.90),                                                          -- id 3: Padrão
    (59.90);                                                          -- id 4: Premium 4K

-- generos: 12 registros (minimo 10)
INSERT INTO generos (nome) VALUES
    ('Ação'),                                                         -- id 1
    ('Animação'),                                                     -- id 2
    ('Aventura'),                                                     -- id 3
    ('Comédia'),                                                      -- id 4
    ('Documentário'),                                                 -- id 5
    ('Drama'),                                                        -- id 6
    ('Fantasia'),                                                     -- id 7
    ('Ficção Científica'),                                            -- id 8
    ('Musical'),                                                      -- id 9
    ('Romance'),                                                      -- id 10
    ('Suspense'),                                                     -- id 11
    ('Terror');                                                       -- id 12

-- diretores: 36 registros (minimo 30)
INSERT INTO diretores (nome) VALUES
    ('Alfonso Cuarón'),                                               -- id 1
    ('Anna Muylaert'),                                                -- id 2
    ('Bong Joon-ho'),                                                 -- id 3
    ('Carlos Saldanha'),                                              -- id 4
    ('Céline Sciamma'),                                               -- id 5
    ('Christopher Nolan'),                                            -- id 6
    ('Damien Chazelle'),                                              -- id 7
    ('Denis Villeneuve'),                                             -- id 8
    ('Eduardo Coutinho'),                                             -- id 9
    ('Fernando Meirelles'),                                           -- id 10
    ('Francis Ford Coppola'),                                         -- id 11
    ('Glauber Rocha'),                                                -- id 12
    ('Greta Gerwig'),                                                 -- id 13
    ('Guel Arraes'),                                                  -- id 14
    ('Guillermo del Toro'),                                           -- id 15
    ('Hayao Miyazaki'),                                               -- id 16
    ('Hector Babenco'),                                               -- id 17
    ('James Cameron'),                                                -- id 18
    ('Jane Campion'),                                                 -- id 19
    ('Jean-Pierre Jeunet'),                                           -- id 20
    ('Jordan Peele'),                                                 -- id 21
    ('José Padilha'),                                                 -- id 22
    ('Kleber Mendonça Filho'),                                        -- id 23
    ('Martin Scorsese'),                                              -- id 24
    ('Pedro Almodóvar'),                                              -- id 25
    ('Pete Docter'),                                                  -- id 26
    ('Peter Jackson'),                                                -- id 27
    ('Quentin Tarantino'),                                            -- id 28
    ('Ridley Scott'),                                                 -- id 29
    ('Rob Marshall'),                                                 -- id 30
    ('Robert Wise'),                                                  -- id 31
    ('Sofia Coppola'),                                                -- id 32
    ('Stanley Kubrick'),                                              -- id 33
    ('Steven Spielberg'),                                             -- id 34
    ('Walter Salles'),                                                -- id 35
    ('Wes Anderson');                                                 -- id 36

-- usuarios: 120 registros (minimo 100)
-- id_plano vai de 1 a 4.
INSERT INTO usuarios (email, id_plano) VALUES
    ('luana.cardoso@outlook.com', 3),
    ('cvieira@gmail.com', 2),
    ('leandro1985@gmail.com', 1),
    ('sandra.soares64@bol.com.br', 3),
    ('joanapires@gmail.com', 1),
    ('marina.vieira@gmail.com', 4),
    ('paulo1984@gmail.com', 4),
    ('adriana.pinto15@bol.com.br', 2),
    ('cristinafernandes@outlook.com', 2),
    ('natalia.araujo@uol.com.br', 3),
    ('vdalmeida@uol.com.br', 1),
    ('vitor_goncalves@gmail.com', 4),
    ('helena_machado@bol.com.br', 2),
    ('dpires@yahoo.com.br', 3),
    ('gabriela.santana@gmail.com', 1),
    ('joao.gomes@icloud.com', 4),
    ('samuel.campos66@gmail.com', 3),
    ('paulo_azevedo@icloud.com', 1),
    ('mateus2002@hotmail.com', 3),
    ('patriciafernandes@gmail.com', 2),
    ('leandro_pereira@gmail.com', 2),
    ('cecilia1993@bol.com.br', 4),
    ('simone.vieira53@gmail.com', 3),
    ('fabio.vieira33@gmail.com', 1),
    ('lorena_marques@outlook.com', 1),
    ('otavio2001@gmail.com', 1),
    ('carlos_costa@gmail.com', 2),
    ('cecilia.costa@uol.com.br', 2),
    ('sandra1988@gmail.com', 3),
    ('patricia.pereira@yahoo.com.br', 1),
    ('jmonteiro@outlook.com', 3),
    ('samuel.teixeira@gmail.com', 3),
    ('gabriel.pereira@gmail.com', 3),
    ('igor.correia41@outlook.com', 3),
    ('ingrid1984@gmail.com', 1),
    ('fernandamachado@uol.com.br', 3),
    ('joanalopes@yahoo.com.br', 2),
    ('igor.gomes@outlook.com', 4),
    ('lorena_dalmeida@uol.com.br', 1),
    ('sabrina_cunha@gmail.com', 3),
    ('wesleymachado@gmail.com', 3),
    ('jessica1985@gmail.com', 3),
    ('debora1988@yahoo.com.br', 3),
    ('bfarias@gmail.com', 1),
    ('priscilarodrigues@hotmail.com', 1),
    ('renata.oliveira62@hotmail.com', 1),
    ('andre_pinto@hotmail.com', 2),
    ('juliana.freitas@icloud.com', 2),
    ('luizcarvalho@gmail.com', 2),
    ('anasoares@gmail.com', 4),
    ('sabrinamoreira@outlook.com', 4),
    ('kmartins@gmail.com', 1),
    ('daniela.queiroz@gmail.com', 1),
    ('felipeoliveira@outlook.com', 4),
    ('vinicius.monteiro@gmail.com', 1),
    ('tiago1989@uol.com.br', 2),
    ('bferreira@gmail.com', 4),
    ('jose2005@icloud.com', 2),
    ('lauranunes@hotmail.com', 4),
    ('patricia_pires@gmail.com', 2),
    ('sandra1994@gmail.com', 4),
    ('tiago1980@icloud.com', 4),
    ('pmachado@gmail.com', 4),
    ('tatiane_ribeiro@outlook.com', 4),
    ('vitor.soares@hotmail.com', 4),
    ('jose.silva21@gmail.com', 3),
    ('rafael.cunha24@gmail.com', 3),
    ('wesley.lopes77@gmail.com', 1),
    ('arthur.ribeiro@hotmail.com', 2),
    ('paulo.dalmeida56@gmail.com', 2),
    ('alicecunha@gmail.com', 1),
    ('luizcunha@hotmail.com', 4),
    ('carlos.soares95@yahoo.com.br', 1),
    ('rogerio1985@gmail.com', 2),
    ('bianca.farias87@yahoo.com.br', 3),
    ('otavio_andrade@outlook.com', 2),
    ('ingrid.ferreira@outlook.com', 4),
    ('leticia.ribeiro20@bol.com.br', 2),
    ('csantos@bol.com.br', 4),
    ('murilo1982@outlook.com', 3),
    ('simonecosta@outlook.com', 1),
    ('giovanna.rodrigues92@bol.com.br', 1),
    ('leandro_ribeiro@bol.com.br', 1),
    ('renan.almeida@icloud.com', 3),
    ('otavio.fonseca78@gmail.com', 3),
    ('thiago.ramos@gmail.com', 3),
    ('vitor_rocha@gmail.com', 3),
    ('joao_pires@outlook.com', 3),
    ('antonio.rocha@gmail.com', 1),
    ('sofia.soares@gmail.com', 3),
    ('giovanna.batista45@bol.com.br', 1),
    ('sandragomes@hotmail.com', 3),
    ('hcampos@icloud.com', 3),
    ('raquelmedeiros@bol.com.br', 2),
    ('marinacardoso@gmail.com', 4),
    ('murilo.rodrigues@gmail.com', 3),
    ('valentina_cunha@outlook.com', 3),
    ('msoares@gmail.com', 3),
    ('camila1996@gmail.com', 3),
    ('fernanda1985@gmail.com', 3),
    ('rafael.brito66@gmail.com', 2),
    ('elisa.lima@gmail.com', 1),
    ('vitor.brito@icloud.com', 1),
    ('ana.goncalves67@gmail.com', 3),
    ('arthurcardoso@outlook.com', 1),
    ('gustavo.goncalves75@yahoo.com.br', 1),
    ('andre.dias80@gmail.com', 4),
    ('eduarda_fernandes@outlook.com', 1),
    ('samuel_davila@outlook.com', 2),
    ('marianasiqueira@outlook.com', 1),
    ('bcardoso@gmail.com', 3),
    ('wesleymendes@hotmail.com', 3),
    ('enzo.brito84@gmail.com', 3),
    ('aline.cavalcanti75@gmail.com', 2),
    ('helena1998@outlook.com', 4),
    ('yasmin1999@hotmail.com', 3),
    ('miguel_carvalho@gmail.com', 4),
    ('manuela_cavalcanti@uol.com.br', 2),
    ('ydias@outlook.com', 3),
    ('mariana_alves@bol.com.br', 1);

-- filmes: 119 registros (minimo 100), em ordem de lancamento
-- id_genero vai de 1 a 12 e id_diretor de 1 a 36.
INSERT INTO filmes (titulo, ano, id_genero, id_diretor) VALUES
    ('Deus e o Diabo na Terra do Sol', 1964, 6, 12),                  -- id 1
    ('A Noviça Rebelde', 1965, 9, 31),                                -- id 2
    ('Terra em Transe', 1967, 6, 12),                                 -- id 3
    ('2001: Uma Odisseia no Espaço', 1968, 8, 33),                    -- id 4
    ('Laranja Mecânica', 1971, 6, 33),                                -- id 5
    ('O Poderoso Chefão', 1972, 6, 11),                               -- id 6
    ('O Poderoso Chefão: Parte II', 1974, 6, 11),                     -- id 7
    ('Tubarão', 1975, 11, 34),                                        -- id 8
    ('Taxi Driver', 1976, 6, 24),                                     -- id 9
    ('Alien, o Oitavo Passageiro', 1979, 12, 29),                     -- id 10
    ('Apocalypse Now', 1979, 6, 11),                                  -- id 11
    ('O Iluminado', 1980, 12, 33),                                    -- id 12
    ('Pixote, a Lei do Mais Fraco', 1980, 6, 17),                     -- id 13
    ('Blade Runner, o Caçador de Androides', 1982, 8, 29),            -- id 14
    ('E.T.: O Extraterrestre', 1982, 8, 34),                          -- id 15
    ('Cabra Marcado para Morrer', 1984, 5, 9),                        -- id 16
    ('O Exterminador do Futuro', 1984, 8, 18),                        -- id 17
    ('O Beijo da Mulher Aranha', 1985, 6, 17),                        -- id 18
    ('Meu Amigo Totoro', 1988, 2, 16),                                -- id 19
    ('Os Bons Companheiros', 1990, 6, 24),                            -- id 20
    ('A Lista de Schindler', 1993, 6, 34),                            -- id 21
    ('Jurassic Park: O Parque dos Dinossauros', 1993, 3, 34),         -- id 22
    ('O Piano', 1993, 10, 19),                                        -- id 23
    ('Pulp Fiction: Tempo de Violência', 1994, 11, 28),               -- id 24
    ('Princesa Mononoke', 1997, 2, 16),                               -- id 25
    ('Titanic', 1997, 10, 18),                                        -- id 26
    ('Central do Brasil', 1998, 6, 35),                               -- id 27
    ('O Resgate do Soldado Ryan', 1998, 1, 34),                       -- id 28
    ('Tudo Sobre Minha Mãe', 1999, 6, 25),                            -- id 29
    ('Amnésia', 2000, 11, 6),                                         -- id 30
    ('Gladiador', 2000, 1, 29),                                       -- id 31
    ('O Auto da Compadecida', 2000, 4, 14),                           -- id 32
    ('A Viagem de Chihiro', 2001, 2, 16),                             -- id 33
    ('Abril Despedaçado', 2001, 6, 35),                               -- id 34
    ('E Sua Mãe Também', 2001, 6, 1),                                 -- id 35
    ('Monstros S.A.', 2001, 2, 26),                                   -- id 36
    ('O Fabuloso Destino de Amélie Poulain', 2001, 10, 20),           -- id 37
    ('O Senhor dos Anéis: A Sociedade do Anel', 2001, 7, 27),         -- id 38
    ('Os Excêntricos Tenenbaums', 2001, 4, 36),                       -- id 39
    ('Chicago', 2002, 9, 30),                                         -- id 40
    ('Cidade de Deus', 2002, 6, 10),                                  -- id 41
    ('Edifício Master', 2002, 5, 9),                                  -- id 42
    ('Fale com Ela', 2002, 6, 25),                                    -- id 43
    ('O Senhor dos Anéis: As Duas Torres', 2002, 7, 27),              -- id 44
    ('Ônibus 174', 2002, 5, 22),                                      -- id 45
    ('Carandiru', 2003, 6, 17),                                       -- id 46
    ('Encontros e Desencontros', 2003, 10, 32),                       -- id 47
    ('Kill Bill: Volume 1', 2003, 1, 28),                             -- id 48
    ('Lisbela e o Prisioneiro', 2003, 10, 14),                        -- id 49
    ('Memórias de um Assassino', 2003, 11, 3),                        -- id 50
    ('O Senhor dos Anéis: O Retorno do Rei', 2003, 7, 27),            -- id 51
    ('Diários de Motocicleta', 2004, 3, 35),                          -- id 52
    ('Harry Potter e o Prisioneiro de Azkaban', 2004, 7, 1),          -- id 53
    ('O Castelo Animado', 2004, 2, 16),                               -- id 54
    ('O Jardineiro Fiel', 2005, 11, 10),                              -- id 55
    ('A Era do Gelo 2', 2006, 2, 4),                                  -- id 56
    ('Filhos da Esperança', 2006, 8, 1),                              -- id 57
    ('Maria Antonieta', 2006, 6, 32),                                 -- id 58
    ('O Grande Truque', 2006, 11, 6),                                 -- id 59
    ('O Hospedeiro', 2006, 12, 3),                                    -- id 60
    ('O Labirinto do Fauno', 2006, 7, 15),                            -- id 61
    ('Os Infiltrados', 2006, 11, 24),                                 -- id 62
    ('Volver', 2006, 6, 25),                                          -- id 63
    ('Jogo de Cena', 2007, 5, 9),                                     -- id 64
    ('Tropa de Elite', 2007, 1, 22),                                  -- id 65
    ('Batman: O Cavaleiro das Trevas', 2008, 1, 6),                   -- id 66
    ('Ensaio sobre a Cegueira', 2008, 6, 10),                         -- id 67
    ('Avatar', 2009, 8, 18),                                          -- id 68
    ('Bastardos Inglórios', 2009, 1, 28),                             -- id 69
    ('Micmacs: Um Plano Complicado', 2009, 4, 20),                    -- id 70
    ('O Fantástico Sr. Raposo', 2009, 2, 36),                         -- id 71
    ('Up: Altas Aventuras', 2009, 2, 26),                             -- id 72
    ('A Origem', 2010, 8, 6),                                         -- id 73
    ('Incêndios', 2010, 6, 8),                                        -- id 74
    ('Tropa de Elite 2', 2010, 1, 22),                                -- id 75
    ('A Pele que Habito', 2011, 11, 25),                              -- id 76
    ('Rio', 2011, 2, 4),                                              -- id 77
    ('Django Livre', 2012, 1, 28),                                    -- id 78
    ('O Som ao Redor', 2012, 6, 23),                                  -- id 79
    ('Círculo de Fogo', 2013, 1, 15),                                 -- id 80
    ('Gravidade', 2013, 8, 1),                                        -- id 81
    ('O Lobo de Wall Street', 2013, 4, 24),                           -- id 82
    ('Os Suspeitos', 2013, 11, 8),                                    -- id 83
    ('Caminhos da Floresta', 2014, 9, 30),                            -- id 84
    ('Interestelar', 2014, 8, 6),                                     -- id 85
    ('O Grande Hotel Budapeste', 2014, 4, 36),                        -- id 86
    ('Rio 2', 2014, 2, 4),                                            -- id 87
    ('Whiplash: Em Busca da Perfeição', 2014, 6, 7),                  -- id 88
    ('Divertida Mente', 2015, 2, 26),                                 -- id 89
    ('Perdido em Marte', 2015, 8, 29),                                -- id 90
    ('Que Horas Ela Volta?', 2015, 6, 2),                             -- id 91
    ('A Chegada', 2016, 8, 8),                                        -- id 92
    ('Aquarius', 2016, 6, 23),                                        -- id 93
    ('La La Land: Cantando Estações', 2016, 9, 7),                    -- id 94
    ('Mãe Só Há Uma', 2016, 6, 2),                                    -- id 95
    ('A Forma da Água', 2017, 7, 15),                                 -- id 96
    ('Blade Runner 2049', 2017, 8, 8),                                -- id 97
    ('Corra!', 2017, 12, 21),                                         -- id 98
    ('Dunkirk', 2017, 1, 6),                                          -- id 99
    ('Lady Bird: A Hora de Voar', 2017, 4, 13),                       -- id 100
    ('O Touro Ferdinando', 2017, 2, 4),                               -- id 101
    ('O Primeiro Homem', 2018, 6, 7),                                 -- id 102
    ('Roma', 2018, 6, 1),                                             -- id 103
    ('Adoráveis Mulheres', 2019, 6, 13),                              -- id 104
    ('Bacurau', 2019, 11, 23),                                        -- id 105
    ('Dois Papas', 2019, 6, 10),                                      -- id 106
    ('Nós', 2019, 12, 21),                                            -- id 107
    ('Parasita', 2019, 11, 3),                                        -- id 108
    ('Retrato de uma Jovem em Chamas', 2019, 10, 5),                  -- id 109
    ('Soul', 2020, 2, 26),                                            -- id 110
    ('Ataque dos Cães', 2021, 6, 19),                                 -- id 111
    ('Duna', 2021, 8, 8),                                             -- id 112
    ('Petite Maman', 2021, 6, 5),                                     -- id 113
    ('Não! Não Olhe!', 2022, 12, 21),                                 -- id 114
    ('Pinóquio por Guillermo del Toro', 2022, 2, 15),                 -- id 115
    ('Barbie', 2023, 4, 13),                                          -- id 116
    ('Oppenheimer', 2023, 6, 6),                                      -- id 117
    ('Ainda Estou Aqui', 2024, 6, 35),                                -- id 118
    ('O Agente Secreto', 2025, 11, 23);                               -- id 119

-- assistidos: 362 registros (minimo 100)
-- id_usuario vai de 1 a 120, id_filme de 1 a 119; nenhum par se repete.
INSERT INTO assistidos (id_usuario, id_filme) VALUES
    (1, 52),
    (2, 111),
    (2, 117),
    (4, 34),
    (4, 54),
    (4, 101),
    (4, 116),
    (5, 76),
    (6, 31),
    (6, 53),
    (6, 104),
    (6, 106),
    (6, 107),
    (6, 108),
    (7, 9),
    (7, 52),
    (7, 73),
    (8, 29),
    (9, 16),
    (9, 34),
    (9, 104),
    (9, 107),
    (10, 21),
    (10, 53),
    (10, 61),
    (10, 105),
    (11, 11),
    (11, 23),
    (11, 82),
    (11, 102),
    (11, 105),
    (12, 36),
    (12, 78),
    (12, 80),
    (12, 84),
    (12, 103),
    (13, 10),
    (13, 31),
    (13, 55),
    (13, 61),
    (14, 28),
    (14, 43),
    (14, 46),
    (14, 102),
    (15, 12),
    (15, 31),
    (15, 35),
    (15, 103),
    (15, 107),
    (16, 48),
    (16, 70),
    (17, 91),
    (17, 96),
    (17, 106),
    (18, 13),
    (18, 26),
    (19, 10),
    (19, 115),
    (21, 12),
    (21, 45),
    (21, 113),
    (22, 12),
    (22, 45),
    (22, 87),
    (22, 90),
    (23, 65),
    (24, 24),
    (24, 58),
    (24, 84),
    (24, 90),
    (25, 102),
    (25, 115),
    (26, 28),
    (26, 53),
    (26, 67),
    (26, 78),
    (26, 111),
    (26, 119),
    (27, 38),
    (27, 63),
    (28, 42),
    (28, 71),
    (29, 84),
    (29, 107),
    (30, 5),
    (31, 13),
    (31, 22),
    (31, 35),
    (32, 11),
    (32, 13),
    (32, 18),
    (32, 22),
    (32, 89),
    (32, 101),
    (33, 23),
    (34, 7),
    (34, 104),
    (35, 19),
    (35, 55),
    (35, 107),
    (36, 70),
    (36, 78),
    (36, 115),
    (39, 1),
    (39, 10),
    (39, 31),
    (39, 61),
    (39, 70),
    (39, 89),
    (40, 53),
    (40, 55),
    (40, 56),
    (40, 80),
    (40, 104),
    (41, 60),
    (41, 66),
    (41, 82),
    (42, 57),
    (42, 68),
    (42, 72),
    (42, 119),
    (44, 27),
    (44, 45),
    (44, 50),
    (44, 105),
    (45, 68),
    (45, 70),
    (45, 85),
    (46, 81),
    (47, 12),
    (47, 18),
    (47, 28),
    (47, 56),
    (47, 67),
    (47, 98),
    (48, 10),
    (48, 16),
    (48, 22),
    (48, 90),
    (48, 118),
    (49, 37),
    (49, 95),
    (50, 51),
    (51, 61),
    (51, 109),
    (51, 116),
    (52, 53),
    (52, 56),
    (52, 75),
    (52, 96),
    (53, 34),
    (53, 90),
    (53, 116),
    (54, 24),
    (54, 88),
    (55, 18),
    (55, 28),
    (55, 31),
    (55, 45),
    (56, 3),
    (56, 20),
    (56, 62),
    (56, 76),
    (57, 3),
    (57, 55),
    (57, 61),
    (57, 75),
    (57, 94),
    (58, 92),
    (58, 101),
    (59, 24),
    (60, 15),
    (60, 97),
    (61, 97),
    (62, 26),
    (62, 34),
    (62, 67),
    (62, 87),
    (62, 96),
    (63, 48),
    (63, 105),
    (64, 37),
    (64, 104),
    (65, 31),
    (66, 24),
    (66, 33),
    (66, 67),
    (66, 88),
    (66, 102),
    (66, 106),
    (67, 4),
    (67, 35),
    (67, 45),
    (67, 76),
    (67, 107),
    (67, 116),
    (68, 52),
    (68, 82),
    (68, 88),
    (68, 113),
    (69, 48),
    (69, 71),
    (69, 77),
    (69, 105),
    (70, 94),
    (71, 17),
    (71, 41),
    (71, 62),
    (71, 72),
    (72, 56),
    (72, 98),
    (72, 104),
    (73, 43),
    (73, 101),
    (74, 13),
    (74, 32),
    (74, 50),
    (75, 101),
    (77, 106),
    (78, 13),
    (78, 26),
    (78, 37),
    (78, 45),
    (78, 88),
    (78, 99),
    (79, 3),
    (79, 35),
    (79, 49),
    (79, 58),
    (79, 86),
    (79, 104),
    (80, 2),
    (80, 28),
    (80, 55),
    (80, 75),
    (80, 83),
    (81, 66),
    (81, 91),
    (81, 115),
    (82, 104),
    (83, 61),
    (83, 96),
    (83, 109),
    (83, 114),
    (83, 115),
    (84, 55),
    (84, 77),
    (85, 36),
    (85, 41),
    (85, 57),
    (85, 93),
    (85, 113),
    (86, 28),
    (86, 47),
    (87, 8),
    (87, 31),
    (87, 53),
    (87, 77),
    (87, 92),
    (87, 101),
    (89, 23),
    (89, 57),
    (89, 80),
    (89, 96),
    (90, 99),
    (90, 107),
    (91, 35),
    (91, 36),
    (91, 43),
    (91, 58),
    (91, 98),
    (91, 109),
    (92, 47),
    (92, 49),
    (92, 57),
    (92, 80),
    (92, 113),
    (93, 20),
    (93, 23),
    (93, 26),
    (93, 69),
    (93, 82),
    (93, 111),
    (95, 61),
    (96, 61),
    (96, 89),
    (96, 104),
    (97, 61),
    (97, 73),
    (97, 102),
    (97, 118),
    (97, 119),
    (98, 13),
    (98, 17),
    (98, 61),
    (98, 101),
    (99, 8),
    (99, 10),
    (99, 57),
    (100, 16),
    (100, 37),
    (100, 65),
    (100, 115),
    (100, 119),
    (102, 26),
    (102, 56),
    (102, 69),
    (103, 37),
    (104, 70),
    (104, 76),
    (105, 28),
    (105, 66),
    (108, 43),
    (108, 69),
    (108, 83),
    (108, 92),
    (108, 105),
    (109, 8),
    (109, 24),
    (109, 31),
    (109, 32),
    (109, 35),
    (109, 107),
    (110, 58),
    (110, 100),
    (111, 12),
    (111, 74),
    (111, 100),
    (113, 20),
    (113, 54),
    (113, 76),
    (113, 85),
    (113, 88),
    (113, 113),
    (114, 52),
    (114, 57),
    (115, 8),
    (115, 31),
    (115, 75),
    (115, 80),
    (115, 102),
    (115, 113),
    (116, 2),
    (116, 21),
    (116, 94),
    (116, 100),
    (116, 101),
    (116, 104),
    (117, 24),
    (117, 68),
    (118, 3),
    (118, 35),
    (118, 46),
    (118, 58),
    (118, 111),
    (119, 16),
    (119, 24),
    (119, 104),
    (120, 12),
    (120, 52),
    (120, 72),
    (120, 83);

-- ---------------------------------------------------------------------
-- Conferencia: quantidade por tabela e checagens de cardinalidade minima.
-- As linhas "(deve ser 0)" precisam mostrar 0.
-- ---------------------------------------------------------------------

SELECT 'planos' AS conferencia, (SELECT COUNT(*) FROM planos) AS total
UNION ALL SELECT 'generos', (SELECT COUNT(*) FROM generos)
UNION ALL SELECT 'diretores', (SELECT COUNT(*) FROM diretores)
UNION ALL SELECT 'usuarios', (SELECT COUNT(*) FROM usuarios)
UNION ALL SELECT 'filmes', (SELECT COUNT(*) FROM filmes)
UNION ALL SELECT 'assistidos', (SELECT COUNT(*) FROM assistidos)
UNION ALL SELECT 'planos sem usuario (deve ser 0)', (SELECT COUNT(*) FROM planos p WHERE NOT EXISTS (SELECT 1 FROM usuarios u WHERE u.id_plano = p.id_plano))
UNION ALL SELECT 'generos sem filme (deve ser 0)', (SELECT COUNT(*) FROM generos g WHERE NOT EXISTS (SELECT 1 FROM filmes f WHERE f.id_genero = g.id_genero))
UNION ALL SELECT 'diretores sem filme (deve ser 0)', (SELECT COUNT(*) FROM diretores d WHERE NOT EXISTS (SELECT 1 FROM filmes f WHERE f.id_diretor = d.id_diretor))
UNION ALL SELECT 'usuarios sem nada assistido (pode, e 0,N)', (SELECT COUNT(*) FROM usuarios u WHERE NOT EXISTS (SELECT 1 FROM assistidos a WHERE a.id_usuario = u.id_usuario))
UNION ALL SELECT 'filmes nunca assistidos (pode, e 0,N)', (SELECT COUNT(*) FROM filmes f WHERE NOT EXISTS (SELECT 1 FROM assistidos a WHERE a.id_filme = f.id_filme));
