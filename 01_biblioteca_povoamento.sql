-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: povoamento das tabelas (INSERT)
-- Modelo 1: Biblioteca
-- Aluno: Matheus
-- =====================================================================

-- Executar no Query Tool conectado ao database "biblioteca",
-- depois de rodar o 01_biblioteca.sql.
--
-- Dados gerados com ajuda de IA a partir do meu script de criacao e
-- revisados antes de executar:
--   * toda FK aponta para um id que existe;
--   * nenhum par repetido na PK composta;
--   * nenhum valor viola as regras CHECK e UNIQUE;
--   * apostrofos escritos com aspa dobrada (ex.: 'Olhos d''Agua');
--   * todo autor tem pelo menos um livro (Autor 1,N);
--   * as editoras Alfaguara (id 11) e Intrinseca (id 17) ficam sem livro
--     de proposito, para mostrar que Editora e (0,N).
--
-- Os ids SERIAL nao sao informados: o PostgreSQL gera 1, 2, 3... na
-- ordem dos VALUES. Por isso o script comeca com TRUNCATE ... RESTART
-- IDENTITY, que esvazia as tabelas e reinicia a contagem em 1. Assim o
-- script pode ser executado mais de uma vez sem quebrar as FKs.

TRUNCATE TABLE livros, autores, editoras RESTART IDENTITY;

-- editoras: 17 registros (minimo 10)
INSERT INTO editoras (nome) VALUES
    ('Companhia das Letras'),                                         -- id 1
    ('Record'),                                                       -- id 2
    ('Rocco'),                                                        -- id 3
    ('Nova Fronteira'),                                               -- id 4
    ('Todavia'),                                                      -- id 5
    ('Ática'),                                                        -- id 6
    ('Martin Claret'),                                                -- id 7
    ('L&PM Editores'),                                                -- id 8
    ('José Olympio'),                                                 -- id 9
    ('Globo Livros'),                                                 -- id 10
    ('Alfaguara'),                                                    -- id 11
    ('Pallas'),                                                       -- id 12
    ('Moderna'),                                                      -- id 13
    ('Penguin-Companhia'),                                            -- id 14
    ('Global Editora'),                                               -- id 15
    ('Melhoramentos'),                                                -- id 16
    ('Intrínseca');                                                   -- id 17

-- autores: 35 registros (minimo 30)
INSERT INTO autores (nome) VALUES
    ('Aluísio Azevedo'),                                              -- id 1
    ('Ana Maria Machado'),                                            -- id 2
    ('Ariano Suassuna'),                                              -- id 3
    ('Caio Fernando Abreu'),                                          -- id 4
    ('Carlos Drummond de Andrade'),                                   -- id 5
    ('Carolina Maria de Jesus'),                                      -- id 6
    ('Cecília Meireles'),                                             -- id 7
    ('Chico Buarque'),                                                -- id 8
    ('Clarice Lispector'),                                            -- id 9
    ('Conceição Evaristo'),                                           -- id 10
    ('Érico Veríssimo'),                                              -- id 11
    ('Euclides da Cunha'),                                            -- id 12
    ('Fernando Sabino'),                                              -- id 13
    ('Graciliano Ramos'),                                             -- id 14
    ('Hilda Hilst'),                                                  -- id 15
    ('Itamar Vieira Junior'),                                         -- id 16
    ('Jeferson Tenório'),                                             -- id 17
    ('João Guimarães Rosa'),                                          -- id 18
    ('Jorge Amado'),                                                  -- id 19
    ('José de Alencar'),                                              -- id 20
    ('Lima Barreto'),                                                 -- id 21
    ('Luis Fernando Verissimo'),                                      -- id 22
    ('Lygia Fagundes Telles'),                                        -- id 23
    ('Machado de Assis'),                                             -- id 24
    ('Manuel Bandeira'),                                              -- id 25
    ('Mário de Andrade'),                                             -- id 26
    ('Milton Hatoum'),                                                -- id 27
    ('Monteiro Lobato'),                                              -- id 28
    ('Oswald de Andrade'),                                            -- id 29
    ('Paulo Coelho'),                                                 -- id 30
    ('Rachel de Queiroz'),                                            -- id 31
    ('Raduan Nassar'),                                                -- id 32
    ('Rubem Fonseca'),                                                -- id 33
    ('Vinicius de Moraes'),                                           -- id 34
    ('Ziraldo');                                                      -- id 35

-- livros: 105 registros (minimo 100)
-- id_editora vai de 1 a 17 e id_autor de 1 a 35, conforme os ids acima.
INSERT INTO livros (titulo, ano, id_editora, id_autor) VALUES
    ('Vidas Secas', 1938, 2, 14),
    ('Laços de Família', 1960, 3, 9),
    ('Alguma Poesia', 1930, 1, 5),
    ('Agosto', 1990, 4, 33),
    ('Sentimento do Mundo', 1940, 1, 5),
    ('Cinzas do Norte', 2005, 1, 27),
    ('Budapeste', 2003, 1, 8),
    ('Mar Morto', 1936, 1, 19),
    ('Bisa Bia, Bisa Bel', 1982, 13, 2),
    ('Caetés', 1933, 2, 14),
    ('Os Sertões', 1902, 7, 12),
    ('Urupês', 1918, 10, 28),
    ('Angústia', 1936, 2, 14),
    ('O Avesso da Pele', 2020, 1, 17),
    ('Macunaíma', 1928, 14, 26),
    ('O Picapau Amarelo', 1939, 10, 28),
    ('Grande Sertão: Veredas', 1956, 1, 18),
    ('Ciranda de Pedra', 1954, 1, 23),
    ('As Meninas', 1973, 1, 23),
    ('Romanceiro da Inconfidência', 1953, 15, 7),
    ('Senhora', 1875, 6, 20),
    ('Dôra, Doralina', 1975, 9, 31),
    ('O Alquimista', 1988, 3, 30),
    ('Lucíola', 1862, 7, 20),
    ('A Paixão Segundo G.H.', 1964, 3, 9),
    ('Perto do Coração Selvagem', 1943, 3, 9),
    ('O Menino Maluquinho', 1980, 16, 35),
    ('Primeiras Estórias', 1962, 4, 18),
    ('Auto da Compadecida', 1955, 4, 3),
    ('Memórias Sentimentais de João Miramar', 1924, 10, 29),
    ('Amar, Verbo Intransitivo', 1927, 4, 26),
    ('Helena', 1876, 7, 24),
    ('Feliz Ano Novo', 1975, 4, 33),
    ('Olhai os Lírios do Campo', 1938, 1, 11),
    ('Reinações de Narizinho', 1931, 10, 28),
    ('Água Viva', 1973, 3, 9),
    ('A Obscena Senhora D', 1982, 1, 15),
    ('O Tempo e o Vento: O Continente', 1949, 1, 11),
    ('São Bernardo', 1934, 2, 14),
    ('Memorial de Maria Moura', 1992, 9, 31),
    ('Benjamim', 1995, 1, 8),
    ('Brida', 1990, 3, 30),
    ('Clara dos Anjos', 1948, 7, 21),
    ('Flicts', 1969, 16, 35),
    ('A Grande Arte', 1983, 4, 33),
    ('Salvar o Fogo', 2023, 5, 16),
    ('Leite Derramado', 2009, 1, 8),
    ('Morangos Mofados', 1982, 1, 4),
    ('O Guarani', 1857, 6, 20),
    ('Estela sem Deus', 2018, 1, 17),
    ('Pauliceia Desvairada', 1922, 4, 26),
    ('A Rosa do Povo', 1945, 1, 5),
    ('Romance d''A Pedra do Reino', 1971, 9, 3),
    ('Memórias do Cárcere', 1953, 2, 14),
    ('O Grande Mentecapto', 1979, 2, 13),
    ('Capitães da Areia', 1937, 1, 19),
    ('Veronika Decide Morrer', 1998, 3, 30),
    ('Quincas Borba', 1891, 14, 24),
    ('Estorvo', 1991, 1, 8),
    ('Comédias da Vida Privada', 1994, 8, 22),
    ('O Alienista', 1882, 8, 24),
    ('Casa de Alvenaria', 1961, 1, 6),
    ('Com os Meus Olhos de Cão', 1986, 1, 15),
    ('O Analista de Bagé', 1981, 8, 22),
    ('Torto Arado', 2019, 5, 16),
    ('Relato de um Certo Oriente', 1989, 1, 27),
    ('Orfeu da Conceição', 1954, 1, 34),
    ('Dona Flor e Seus Dois Maridos', 1966, 1, 19),
    ('Becos da Memória', 2006, 12, 10),
    ('Borges e os Orangotangos Eternos', 2000, 1, 22),
    ('Esaú e Jacó', 1904, 7, 24),
    ('Terras do Sem-Fim', 1943, 1, 19),
    ('Ponciá Vicêncio', 2003, 12, 10),
    ('O Quinze', 1930, 9, 31),
    ('Casa de Pensão', 1884, 6, 1),
    ('Antes do Baile Verde', 1970, 1, 23),
    ('Estrela da Manhã', 1936, 15, 25),
    ('O Cortiço', 1890, 14, 1),
    ('Serafim Ponte Grande', 1933, 10, 29),
    ('Infância', 1945, 2, 14),
    ('Quarto de Despejo', 1960, 6, 6),
    ('Dom Casmurro', 1899, 14, 24),
    ('Olhos d''Água', 2014, 12, 10),
    ('O Encontro Marcado', 1956, 2, 13),
    ('Lavoura Arcaica', 1975, 1, 32),
    ('O Mulato', 1881, 7, 1),
    ('Libertinagem', 1930, 15, 25),
    ('Gabriela, Cravo e Canela', 1958, 1, 19),
    ('Corpo de Baile', 1956, 4, 18),
    ('Raul da Ferrugem Azul', 1979, 13, 2),
    ('Recordações do Escrivão Isaías Caminha', 1909, 14, 21),
    ('Claro Enigma', 1951, 1, 5),
    ('A Hora da Estrela', 1977, 3, 9),
    ('Sagarana', 1946, 4, 18),
    ('Dois Irmãos', 2000, 1, 27),
    ('Iracema', 1865, 6, 20),
    ('Tieta do Agreste', 1977, 1, 19),
    ('Triste Fim de Policarpo Quaresma', 1915, 14, 21),
    ('Viagem', 1939, 15, 7),
    ('Incidente em Antares', 1971, 1, 11),
    ('Onde Andará Dulce Veiga?', 1990, 1, 4),
    ('Um Copo de Cólera', 1978, 1, 32),
    ('Para Viver um Grande Amor', 1962, 1, 34),
    ('Memórias Póstumas de Brás Cubas', 1881, 14, 24),
    ('Ou Isto ou Aquilo', 1964, 15, 7);

-- ---------------------------------------------------------------------
-- Conferencia: quantidade por tabela e checagens de cardinalidade minima.
-- As linhas "(deve ser 0)" precisam mostrar 0.
-- ---------------------------------------------------------------------

SELECT 'editoras' AS conferencia, (SELECT COUNT(*) FROM editoras) AS total
UNION ALL SELECT 'autores', (SELECT COUNT(*) FROM autores)
UNION ALL SELECT 'livros', (SELECT COUNT(*) FROM livros)
UNION ALL SELECT 'autores sem livro (deve ser 0)', (SELECT COUNT(*) FROM autores a WHERE NOT EXISTS (SELECT 1 FROM livros l WHERE l.id_autor = a.id_autor))
UNION ALL SELECT 'editoras sem livro (pode, e 0,N)', (SELECT COUNT(*) FROM editoras e WHERE NOT EXISTS (SELECT 1 FROM livros l WHERE l.id_editora = e.id_editora));
