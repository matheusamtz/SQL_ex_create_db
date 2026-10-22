-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: povoamento das tabelas (INSERT)
-- Modelo 3: Loja Online
-- Aluno: Matheus
-- =====================================================================

-- Executar no Query Tool conectado ao database "loja_online",
-- depois de rodar o 03_loja_online.sql.
--
-- Dados gerados com ajuda de IA a partir do meu script de criacao e
-- revisados antes de executar:
--   * toda FK aponta para um id que existe;
--   * nenhum par repetido na PK composta;
--   * nenhum valor viola as regras CHECK e UNIQUE;
--   * apostrofos escritos com aspa dobrada (ex.: 'Olhos d''Agua');
--   * precos sempre positivos e quantidades maiores que zero;
--   * todo cliente tem pelo menos um pedido;
--   * todo pedido tem pelo menos um item e todo produto aparece
--     em pelo menos um pedido;
--   * toda categoria tem pelo menos um produto.
--
-- Os ids SERIAL nao sao informados: o PostgreSQL gera 1, 2, 3... na
-- ordem dos VALUES. Por isso o script comeca com TRUNCATE ... RESTART
-- IDENTITY, que esvazia as tabelas e reinicia a contagem em 1. Assim o
-- script pode ser executado mais de uma vez sem quebrar as FKs.

TRUNCATE TABLE item_pedido, pedidos, produtos, categorias, clientes RESTART IDENTITY;

-- categorias: 10 registros (minimo 8)
INSERT INTO categorias (nome) VALUES
    ('Eletrônicos'),                                                  -- id 1
    ('Informática'),                                                  -- id 2
    ('Casa e Cozinha'),                                               -- id 3
    ('Esporte e Lazer'),                                              -- id 4
    ('Livros'),                                                       -- id 5
    ('Beleza e Perfumaria'),                                          -- id 6
    ('Brinquedos'),                                                   -- id 7
    ('Moda'),                                                         -- id 8
    ('Pet Shop'),                                                     -- id 9
    ('Papelaria');                                                    -- id 10

-- clientes: 60 registros (minimo 50)
INSERT INTO clientes (nome) VALUES
    ('Rafaela Martins Marques'),
    ('Thaís Oliveira Dias'),
    ('Alice Moreira Freitas'),
    ('Henrique Farias'),
    ('Lucas Pires'),
    ('Gustavo Barros'),
    ('Luana Soares Santana'),
    ('Valentina Marques Cavalcanti'),
    ('Alice Batista D''Almeida'),
    ('Paulo Dias'),
    ('Eduardo Monteiro'),
    ('Vitor Cavalcanti Souza'),
    ('Samuel Andrade D''Ângelo'),
    ('Paulo Rocha'),
    ('Elisa Andrade Fonseca'),
    ('Miguel Alves'),
    ('Rogério Farias'),
    ('Fábio Correia Pires'),
    ('Priscila Machado Correia'),
    ('Vinicius Dias'),
    ('Samuel Fonseca Costa'),
    ('Mariana Moura'),
    ('Daniel Oliveira'),
    ('Igor Rezende Moura'),
    ('Giovanna Siqueira Correia'),
    ('Mariana Lima Marques'),
    ('Thaís Freitas'),
    ('Raquel Moura Marques'),
    ('Fernanda Silva Cardoso'),
    ('Otávio Barros Almeida'),
    ('Fernanda Pinto'),
    ('Hugo Dias Almeida'),
    ('Larissa Pereira'),
    ('Luiza Pires D''Almeida'),
    ('Heitor Machado'),
    ('Marcelo Cardoso D''Almeida'),
    ('Tatiane Pinto Santos'),
    ('Igor Batista Pereira'),
    ('Débora Teixeira'),
    ('Fernando Almeida Martins'),
    ('Tatiane Costa'),
    ('Luana Pires'),
    ('Vanessa Campos Moura'),
    ('Antônio Fernandes D''Ávila'),
    ('Priscila Souza Cardoso'),
    ('Lorena Souza Queiroz'),
    ('Vanessa Souza D''Ávila'),
    ('Fernando Ferreira'),
    ('Heitor Rocha Rodrigues'),
    ('Raquel Barbosa Andrade'),
    ('Marina Pereira Lima'),
    ('Lucas Castro D''Ângelo'),
    ('Mariana Freitas Monteiro'),
    ('Renan Pires Oliveira'),
    ('Otávio Campos Ramos'),
    ('Leandro Brito Marques'),
    ('Diego Carvalho D''Almeida'),
    ('Priscila Machado Almeida'),
    ('Bruno Rocha Andrade'),
    ('Lucas Freitas Brito');

-- produtos: 110 registros (minimo 100)
-- id_categoria vai de 1 a 10.
INSERT INTO produtos (nome, preco, id_categoria) VALUES
    ('Prancha Alisadora Gama', 189.90, 6),                            -- id 1
    ('Hidratante Corporal Nivea 400ml', 29.90, 6),                    -- id 2
    ('Tapete de Yoga 6mm Antiderrapante', 89.90, 4),                  -- id 3
    ('Hub USB-C 7 em 1 Ugreen', 189.90, 2),                           -- id 4
    ('Sérum Facial Vitamina C Principia', 69.90, 6),                  -- id 5
    ('Luva de Boxe Everlast 12oz', 229.90, 4),                        -- id 6
    ('Secador de Cabelo Taiff 2000W', 249.90, 6),                     -- id 7
    ('Barraca de Camping 4 Pessoas Nautika', 459.90, 4),              -- id 8
    ('Pelúcia Urso 40cm', 69.90, 7),                                  -- id 9
    ('Mordedor de Corda para Cães', 19.90, 9),                        -- id 10
    ('Jogo de Cama Queen 4 Peças Algodão', 189.90, 3),                -- id 11
    ('Panela de Pressão Elétrica Electrolux 6L', 549.00, 3),          -- id 12
    ('Kit Pincéis de Maquiagem 12 Peças', 69.90, 6),                  -- id 13
    ('Perfume O Boticário Malbec 100ml', 219.90, 6),                  -- id 14
    ('O Pequeno Príncipe', 29.90, 5),                                 -- id 15
    ('Corda de Pular com Rolamento', 39.90, 4),                       -- id 16
    ('Pista Hot Wheels Looping', 199.90, 7),                          -- id 17
    ('Dom Casmurro - Edição de Bolso', 19.90, 5),                     -- id 18
    ('O Avesso da Pele - Jeferson Tenório', 59.90, 5),                -- id 19
    ('Fone Apple AirPods 4', 1299.00, 1),                             -- id 20
    ('Smartphone Samsung Galaxy A55 128GB', 2199.00, 1),              -- id 21
    ('Shampoo Elseve 400ml', 24.90, 6),                               -- id 22
    ('Perfume Natura Kaiak 100ml', 159.90, 6),                        -- id 23
    ('Cafeteira Nespresso Essenza Mini', 499.00, 3),                  -- id 24
    ('Tablet Samsung Galaxy Tab A9', 1099.00, 1),                     -- id 25
    ('Post-it 3M Kit 4 Blocos', 29.90, 10),                           -- id 26
    ('Boné New Era Aba Curva', 179.90, 8),                            -- id 27
    ('Raquete de Beach Tennis Kona', 399.00, 4),                      -- id 28
    ('Ensaio sobre a Cegueira - José Saramago', 69.90, 5),            -- id 29
    ('Monitor LG 24 Polegadas Full HD IPS', 749.00, 2),               -- id 30
    ('Fone de Ouvido Bluetooth JBL Tune 520BT', 299.90, 1),           -- id 31
    ('Carregador Turbo USB-C 25W Samsung', 129.90, 1),                -- id 32
    ('Webcam Logitech C920 Full HD', 399.00, 2),                      -- id 33
    ('Pai Rico, Pai Pobre', 49.90, 5),                                -- id 34
    ('Quebra-Cabeça 1000 Peças Grow', 79.90, 7),                      -- id 35
    ('Smartwatch Xiaomi Redmi Watch 4', 549.90, 1),                   -- id 36
    ('Calculadora Científica Casio fx-82MS', 89.90, 10),              -- id 37
    ('Tapete Higiênico 30 Unidades', 54.90, 9),                       -- id 38
    ('Câmera de Segurança Wi-Fi Intelbras', 249.90, 1),               -- id 39
    ('Kit 10 Canetas BIC Cristal', 19.90, 10),                        -- id 40
    ('Vestido Midi Floral', 159.90, 8),                               -- id 41
    ('Camiseta Básica Algodão Hering', 59.90, 8),                     -- id 42
    ('Impressora Epson EcoTank L3250', 1149.00, 2),                   -- id 43
    ('Teclado Mecânico Redragon Kumara', 229.90, 2),                  -- id 44
    ('Batom Matte Ruby Rose', 12.90, 6),                              -- id 45
    ('Box Harry Potter 7 Volumes', 299.90, 5),                        -- id 46
    ('Tênis de Corrida Olympikus Corre 4', 349.99, 4),                -- id 47
    ('Jogo Banco Imobiliário Estrela', 149.90, 7),                    -- id 48
    ('HD Externo Seagate 2TB', 459.90, 2),                            -- id 49
    ('Bicicleta Aro 29 Caloi Explorer 21 Marchas', 1899.00, 4),       -- id 50
    ('Cama Pet Média Lavável', 119.90, 9),                            -- id 51
    ('Ventilador de Mesa Arno 40cm', 229.90, 3),                      -- id 52
    ('Liquidificador Philips Walita 1200W', 279.90, 3),               -- id 53
    ('Jaqueta Corta-Vento Unissex', 199.90, 8),                       -- id 54
    ('Ração Golden Cães Adultos 15kg', 189.90, 9),                    -- id 55
    ('Par de Halteres 5kg Emborrachados', 139.90, 4),                 -- id 56
    ('Kit 6 Pares de Meias Lupo', 59.90, 8),                          -- id 57
    ('Jogo de Panelas Tramontina 5 Peças', 399.90, 3),                -- id 58
    ('Garrafa Squeeze 750ml', 34.90, 4),                              -- id 59
    ('Estojo Triplo', 39.90, 10),                                     -- id 60
    ('Mouse sem Fio Logitech M280', 89.90, 2),                        -- id 61
    ('Aspirador de Pó Vertical WAP 2 em 1', 299.90, 3),               -- id 62
    ('Jogo de Tabuleiro Detetive Estrela', 129.90, 7),                -- id 63
    ('Smart TV LG 50 Polegadas 4K', 2499.00, 1),                      -- id 64
    ('Notebook Lenovo IdeaPad Slim 3 Ryzen 5', 3299.00, 2),           -- id 65
    ('Kit Elásticos de Resistência 5 Níveis', 59.90, 4),              -- id 66
    ('Pendrive SanDisk 64GB', 39.90, 2),                              -- id 67
    ('Olhos d''Água - Conceição Evaristo', 49.90, 5),                 -- id 68
    ('Chinelo Havaianas Top', 39.99, 8),                              -- id 69
    ('Quarto de Despejo - Carolina Maria de Jesus', 44.90, 5),        -- id 70
    ('Agenda Planner Semanal 2026', 59.90, 10),                       -- id 71
    ('Relógio Casio Vintage A168', 349.00, 8),                        -- id 72
    ('Sanduicheira Britânia', 109.90, 3),                             -- id 73
    ('Caixa de Som JBL Flip 6', 699.00, 1),                           -- id 74
    ('Bola de Futebol Nike Strike', 159.99, 4),                       -- id 75
    ('Echo Dot 5ª Geração', 379.00, 1),                               -- id 76
    ('Fichário A4 com 4 Argolas', 69.90, 10),                         -- id 77
    ('Roteador TP-Link Archer C6 AC1200', 249.90, 2),                 -- id 78
    ('Caderno Universitário 10 Matérias Tilibra', 49.90, 10),         -- id 79
    ('Shampoo Pet Neutro 500ml', 29.90, 9),                           -- id 80
    ('Hábitos Atômicos - James Clear', 54.90, 5),                     -- id 81
    ('Barbeador Elétrico Philips OneBlade', 229.90, 6),               -- id 82
    ('Mochila Casual Impermeável', 149.90, 8),                        -- id 83
    ('Óculos de Sol Chilli Beans', 249.90, 8),                        -- id 84
    ('Coleira Peitoral com Guia', 59.90, 9),                          -- id 85
    ('Headset Gamer HyperX Cloud Stinger 2', 299.00, 2),              -- id 86
    ('Tênis Vans Old Skool', 449.99, 8),                              -- id 87
    ('Sapiens - Yuval Noah Harari', 74.90, 5),                        -- id 88
    ('Arranhador para Gatos 3 Andares', 179.90, 9),                   -- id 89
    ('Areia Higiênica Pipicat 12kg', 34.90, 9),                       -- id 90
    ('Lápis de Cor Faber-Castell 48 Cores', 79.90, 10),               -- id 91
    ('Comedouro Duplo Inox', 49.90, 9),                               -- id 92
    ('Ração Premier Gatos Castrados 7,5kg', 219.90, 9),               -- id 93
    ('Air Fryer Mondial 4L', 349.90, 3),                              -- id 94
    ('Garrafa Térmica Stanley 1L', 289.00, 3),                        -- id 95
    ('Boneca Barbie Fashionista', 89.90, 7),                          -- id 96
    ('Kit 6 Taças de Vinho Cristal', 159.90, 3),                      -- id 97
    ('Marca-Texto Stabilo Boss Kit 6 Cores', 44.90, 10),              -- id 98
    ('Smartphone Motorola Moto G85 256GB', 1599.00, 1),               -- id 99
    ('Mochila Escolar com Rodinhas', 189.90, 10),                     -- id 100
    ('Power Bank Anker 10000mAh', 199.90, 1),                         -- id 101
    ('Massinha Play-Doh Kit 12 Potes', 59.90, 7),                     -- id 102
    ('Calça Jeans Masculina Levi''s 511', 349.90, 8),                 -- id 103
    ('Protetor Solar La Roche-Posay FPS 60', 99.90, 6),               -- id 104
    ('Drone Infantil com Câmera', 349.90, 7),                         -- id 105
    ('Torto Arado - Itamar Vieira Junior', 64.90, 5),                 -- id 106
    ('SSD Kingston NV2 1TB', 429.90, 2),                              -- id 107
    ('LEGO Classic Caixa Criativa 484 Peças', 299.90, 7),             -- id 108
    ('Jogo Uno Copag', 24.90, 7),                                     -- id 109
    ('Jogo de Facas Tramontina Plenus 6 Peças', 119.90, 3);           -- id 110

-- pedidos: 150 registros (minimo 100), em ordem de data
-- id_cliente vai de 1 a 60.
INSERT INTO pedidos (data, id_cliente) VALUES
    ('2025-01-04', 34),
    ('2025-01-21', 7),
    ('2025-01-28', 37),
    ('2025-02-01', 20),
    ('2025-02-01', 42),
    ('2025-02-05', 36),
    ('2025-02-08', 50),
    ('2025-02-14', 58),
    ('2025-02-14', 55),
    ('2025-02-22', 7),
    ('2025-02-25', 46),
    ('2025-03-07', 13),
    ('2025-03-12', 37),
    ('2025-03-13', 43),
    ('2025-03-13', 16),
    ('2025-03-22', 11),
    ('2025-03-22', 55),
    ('2025-03-24', 55),
    ('2025-03-25', 6),
    ('2025-04-02', 16),
    ('2025-04-14', 1),
    ('2025-04-14', 12),
    ('2025-04-21', 36),
    ('2025-04-22', 43),
    ('2025-04-22', 19),
    ('2025-04-23', 57),
    ('2025-04-26', 15),
    ('2025-04-26', 36),
    ('2025-04-26', 45),
    ('2025-04-27', 31),
    ('2025-05-08', 56),
    ('2025-05-13', 34),
    ('2025-05-19', 59),
    ('2025-05-20', 21),
    ('2025-05-21', 38),
    ('2025-05-26', 44),
    ('2025-05-31', 57),
    ('2025-06-06', 37),
    ('2025-06-07', 14),
    ('2025-06-15', 43),
    ('2025-06-25', 32),
    ('2025-06-28', 37),
    ('2025-07-01', 57),
    ('2025-07-04', 45),
    ('2025-07-04', 12),
    ('2025-07-06', 2),
    ('2025-07-10', 1),
    ('2025-07-12', 51),
    ('2025-07-14', 44),
    ('2025-07-16', 25),
    ('2025-07-19', 36),
    ('2025-07-19', 29),
    ('2025-07-24', 23),
    ('2025-07-25', 36),
    ('2025-07-26', 6),
    ('2025-07-27', 2),
    ('2025-07-31', 17),
    ('2025-08-06', 16),
    ('2025-08-16', 8),
    ('2025-08-29', 47),
    ('2025-08-29', 16),
    ('2025-09-12', 2),
    ('2025-09-15', 34),
    ('2025-10-01', 55),
    ('2025-10-05', 7),
    ('2025-10-06', 41),
    ('2025-10-06', 10),
    ('2025-10-19', 22),
    ('2025-10-29', 7),
    ('2025-11-04', 5),
    ('2025-11-05', 24),
    ('2025-11-15', 18),
    ('2025-11-17', 34),
    ('2025-11-21', 30),
    ('2025-11-21', 46),
    ('2025-11-28', 33),
    ('2025-12-04', 52),
    ('2025-12-07', 9),
    ('2025-12-08', 48),
    ('2025-12-15', 4),
    ('2025-12-19', 25),
    ('2025-12-20', 6),
    ('2025-12-29', 52),
    ('2025-12-30', 10),
    ('2026-01-04', 12),
    ('2026-01-05', 4),
    ('2026-01-15', 47),
    ('2026-01-16', 50),
    ('2026-01-29', 3),
    ('2026-01-29', 60),
    ('2026-02-06', 27),
    ('2026-02-06', 33),
    ('2026-02-07', 53),
    ('2026-02-13', 54),
    ('2026-02-19', 7),
    ('2026-02-23', 54),
    ('2026-02-24', 19),
    ('2026-03-04', 39),
    ('2026-03-08', 40),
    ('2026-03-25', 31),
    ('2026-04-01', 47),
    ('2026-04-02', 21),
    ('2026-04-05', 23),
    ('2026-04-12', 26),
    ('2026-04-15', 49),
    ('2026-04-18', 49),
    ('2026-04-25', 53),
    ('2026-05-01', 6),
    ('2026-05-07', 3),
    ('2026-05-10', 26),
    ('2026-05-12', 28),
    ('2026-05-13', 53),
    ('2026-05-20', 16),
    ('2026-05-26', 35),
    ('2026-05-26', 46),
    ('2026-05-26', 52),
    ('2026-05-27', 53),
    ('2026-05-29', 20),
    ('2026-06-02', 43),
    ('2026-06-04', 3),
    ('2026-06-13', 27),
    ('2026-06-22', 8),
    ('2026-06-26', 12),
    ('2026-06-27', 37),
    ('2026-06-28', 38),
    ('2026-07-07', 30),
    ('2026-07-10', 7),
    ('2026-07-12', 31),
    ('2026-07-13', 38),
    ('2026-07-21', 51),
    ('2026-07-23', 25),
    ('2026-07-24', 35),
    ('2026-07-29', 48),
    ('2026-08-02', 50),
    ('2026-08-04', 24),
    ('2026-08-05', 17),
    ('2026-08-07', 21),
    ('2026-08-14', 25),
    ('2026-08-22', 26),
    ('2026-08-29', 39),
    ('2026-08-31', 8),
    ('2026-09-05', 40),
    ('2026-09-09', 60),
    ('2026-09-09', 5),
    ('2026-09-16', 45),
    ('2026-09-27', 42),
    ('2026-10-02', 54),
    ('2026-10-04', 8),
    ('2026-10-12', 56),
    ('2026-10-13', 22);

-- item_pedido: 313 registros (minimo 100)
-- id_pedido vai de 1 a 150, id_produto de 1 a 110; nenhum par se repete.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade) VALUES
    (1, 19, 4),
    (1, 28, 1),
    (1, 67, 3),
    (2, 106, 3),
    (3, 52, 2),
    (3, 108, 2),
    (4, 71, 2),
    (5, 31, 2),
    (5, 36, 2),
    (6, 3, 2),
    (6, 57, 2),
    (7, 99, 1),
    (8, 28, 1),
    (8, 92, 3),
    (9, 22, 2),
    (9, 96, 2),
    (10, 96, 1),
    (11, 28, 2),
    (11, 73, 1),
    (11, 79, 4),
    (11, 95, 3),
    (12, 24, 1),
    (12, 92, 2),
    (13, 33, 1),
    (13, 54, 1),
    (13, 110, 1),
    (14, 21, 1),
    (14, 25, 1),
    (15, 53, 1),
    (15, 62, 2),
    (15, 86, 1),
    (16, 45, 2),
    (16, 61, 2),
    (17, 5, 1),
    (17, 38, 1),
    (17, 66, 3),
    (18, 43, 1),
    (19, 98, 1),
    (20, 60, 5),
    (21, 16, 1),
    (22, 20, 1),
    (22, 38, 3),
    (22, 65, 1),
    (22, 67, 3),
    (23, 82, 3),
    (24, 6, 1),
    (24, 25, 1),
    (25, 27, 2),
    (25, 36, 2),
    (25, 63, 2),
    (25, 110, 2),
    (26, 5, 1),
    (26, 72, 1),
    (27, 4, 2),
    (27, 60, 3),
    (28, 26, 1),
    (28, 96, 1),
    (28, 101, 2),
    (28, 107, 2),
    (29, 19, 3),
    (29, 49, 1),
    (30, 57, 4),
    (31, 48, 1),
    (31, 53, 2),
    (32, 10, 2),
    (32, 53, 3),
    (33, 75, 2),
    (34, 42, 5),
    (35, 98, 4),
    (35, 104, 1),
    (36, 37, 3),
    (36, 49, 1),
    (36, 76, 1),
    (36, 104, 1),
    (37, 21, 1),
    (37, 48, 1),
    (37, 56, 1),
    (37, 94, 2),
    (38, 6, 2),
    (38, 60, 1),
    (39, 62, 3),
    (39, 68, 2),
    (40, 22, 4),
    (40, 29, 3),
    (40, 47, 1),
    (41, 37, 1),
    (41, 47, 1),
    (42, 88, 1),
    (43, 34, 2),
    (43, 48, 1),
    (44, 83, 2),
    (44, 104, 1),
    (45, 32, 2),
    (45, 96, 1),
    (46, 2, 3),
    (46, 17, 2),
    (46, 23, 2),
    (47, 3, 2),
    (47, 20, 2),
    (47, 68, 1),
    (47, 69, 1),
    (48, 7, 2),
    (49, 11, 2),
    (50, 63, 2),
    (51, 46, 2),
    (51, 81, 5),
    (52, 5, 1),
    (52, 71, 1),
    (53, 24, 1),
    (53, 95, 2),
    (54, 2, 2),
    (55, 56, 1),
    (55, 85, 1),
    (56, 46, 1),
    (56, 107, 2),
    (57, 78, 1),
    (58, 13, 1),
    (58, 29, 2),
    (58, 104, 2),
    (59, 40, 1),
    (59, 80, 2),
    (60, 32, 3),
    (60, 57, 5),
    (61, 40, 2),
    (61, 54, 3),
    (61, 64, 2),
    (61, 103, 1),
    (62, 4, 1),
    (62, 6, 1),
    (62, 34, 2),
    (62, 44, 2),
    (63, 5, 1),
    (63, 39, 2),
    (64, 22, 2),
    (64, 31, 1),
    (64, 87, 1),
    (64, 98, 3),
    (65, 18, 2),
    (65, 32, 1),
    (65, 96, 1),
    (66, 9, 1),
    (66, 66, 1),
    (67, 13, 1),
    (67, 71, 1),
    (68, 14, 2),
    (69, 3, 1),
    (69, 74, 1),
    (70, 30, 1),
    (71, 38, 1),
    (72, 78, 1),
    (73, 83, 2),
    (73, 104, 1),
    (74, 103, 1),
    (75, 60, 1),
    (75, 82, 1),
    (76, 86, 2),
    (76, 97, 3),
    (76, 105, 1),
    (77, 54, 2),
    (77, 58, 1),
    (77, 66, 4),
    (78, 55, 1),
    (78, 67, 5),
    (79, 10, 4),
    (79, 22, 5),
    (79, 24, 1),
    (79, 38, 2),
    (80, 18, 2),
    (80, 28, 2),
    (80, 71, 1),
    (80, 107, 2),
    (81, 37, 2),
    (82, 56, 1),
    (82, 100, 2),
    (83, 57, 1),
    (83, 68, 2),
    (84, 36, 1),
    (84, 90, 3),
    (85, 37, 1),
    (85, 58, 1),
    (86, 20, 1),
    (86, 41, 2),
    (86, 74, 1),
    (87, 5, 2),
    (88, 5, 1),
    (88, 53, 1),
    (88, 63, 2),
    (89, 102, 1),
    (90, 75, 2),
    (90, 79, 5),
    (91, 4, 1),
    (91, 27, 2),
    (92, 74, 1),
    (92, 77, 1),
    (93, 15, 2),
    (93, 17, 1),
    (93, 63, 2),
    (94, 65, 1),
    (94, 101, 2),
    (95, 14, 3),
    (95, 35, 3),
    (95, 64, 1),
    (95, 97, 2),
    (96, 86, 1),
    (96, 108, 1),
    (97, 69, 4),
    (98, 5, 3),
    (98, 66, 4),
    (99, 97, 1),
    (99, 106, 1),
    (100, 25, 1),
    (100, 40, 5),
    (100, 45, 4),
    (100, 58, 1),
    (101, 84, 1),
    (102, 10, 5),
    (102, 107, 1),
    (103, 7, 1),
    (103, 41, 2),
    (104, 5, 2),
    (104, 28, 1),
    (105, 7, 3),
    (105, 41, 1),
    (106, 37, 3),
    (106, 51, 2),
    (106, 72, 2),
    (107, 87, 1),
    (108, 97, 1),
    (109, 33, 1),
    (109, 41, 3),
    (110, 11, 2),
    (110, 89, 1),
    (111, 30, 1),
    (111, 109, 4),
    (112, 54, 2),
    (113, 11, 1),
    (113, 59, 3),
    (113, 68, 3),
    (113, 90, 1),
    (114, 61, 2),
    (115, 16, 5),
    (115, 79, 1),
    (115, 81, 1),
    (115, 108, 1),
    (116, 1, 2),
    (116, 8, 2),
    (116, 105, 1),
    (116, 108, 1),
    (117, 26, 2),
    (117, 89, 2),
    (118, 84, 3),
    (119, 35, 2),
    (119, 62, 1),
    (120, 35, 1),
    (120, 100, 2),
    (121, 50, 1),
    (121, 70, 2),
    (122, 7, 2),
    (122, 23, 1),
    (122, 31, 2),
    (123, 19, 3),
    (123, 22, 2),
    (124, 70, 3),
    (125, 23, 2),
    (125, 35, 1),
    (125, 60, 2),
    (125, 89, 2),
    (126, 2, 5),
    (126, 51, 3),
    (126, 83, 3),
    (126, 101, 2),
    (127, 32, 1),
    (128, 7, 2),
    (128, 20, 1),
    (129, 51, 3),
    (130, 23, 2),
    (130, 25, 1),
    (130, 40, 4),
    (130, 84, 1),
    (131, 19, 2),
    (132, 15, 5),
    (133, 20, 1),
    (133, 28, 1),
    (133, 69, 5),
    (134, 14, 1),
    (134, 100, 2),
    (135, 24, 1),
    (135, 50, 2),
    (136, 36, 1),
    (137, 91, 1),
    (138, 2, 2),
    (139, 44, 1),
    (140, 18, 5),
    (141, 17, 1),
    (141, 77, 1),
    (142, 1, 2),
    (142, 46, 1),
    (143, 10, 2),
    (143, 17, 3),
    (143, 25, 1),
    (144, 48, 1),
    (145, 105, 1),
    (146, 12, 1),
    (146, 32, 2),
    (147, 46, 1),
    (148, 14, 1),
    (148, 25, 1),
    (148, 63, 1),
    (149, 41, 1),
    (149, 61, 1),
    (149, 93, 1),
    (149, 109, 4),
    (150, 67, 2);

-- ---------------------------------------------------------------------
-- Conferencia: quantidade por tabela e checagens de cardinalidade minima.
-- As linhas "(deve ser 0)" precisam mostrar 0.
-- ---------------------------------------------------------------------

SELECT 'categorias' AS conferencia, (SELECT COUNT(*) FROM categorias) AS total
UNION ALL SELECT 'clientes', (SELECT COUNT(*) FROM clientes)
UNION ALL SELECT 'produtos', (SELECT COUNT(*) FROM produtos)
UNION ALL SELECT 'pedidos', (SELECT COUNT(*) FROM pedidos)
UNION ALL SELECT 'item_pedido', (SELECT COUNT(*) FROM item_pedido)
UNION ALL SELECT 'clientes sem pedido (deve ser 0)', (SELECT COUNT(*) FROM clientes c WHERE NOT EXISTS (SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id_cliente))
UNION ALL SELECT 'pedidos sem item (deve ser 0)', (SELECT COUNT(*) FROM pedidos p WHERE NOT EXISTS (SELECT 1 FROM item_pedido i WHERE i.id_pedido = p.id_pedido))
UNION ALL SELECT 'produtos nunca vendidos (deve ser 0)', (SELECT COUNT(*) FROM produtos p WHERE NOT EXISTS (SELECT 1 FROM item_pedido i WHERE i.id_produto = p.id_produto))
UNION ALL SELECT 'categorias sem produto (deve ser 0)', (SELECT COUNT(*) FROM categorias c WHERE NOT EXISTS (SELECT 1 FROM produtos p WHERE p.id_categoria = c.id_categoria));
