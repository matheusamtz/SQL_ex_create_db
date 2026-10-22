-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: povoamento das tabelas (INSERT)
-- Modelo 2: Escola de Idiomas
-- Aluno: Matheus
-- =====================================================================

-- Executar no Query Tool conectado ao database "escola_idiomas",
-- depois de rodar o 02_escola_idiomas.sql.
--
-- Dados gerados com ajuda de IA a partir do meu script de criacao e
-- revisados antes de executar:
--   * toda FK aponta para um id que existe;
--   * nenhum par repetido na PK composta;
--   * nenhum valor viola as regras CHECK e UNIQUE;
--   * apostrofos escritos com aspa dobrada (ex.: 'Olhos d''Agua');
--   * CPFs com exatamente 11 digitos (e digitos verificadores validos);
--   * todo professor leciona pelo menos uma turma, e sempre do idioma dele;
--   * toda disciplina tem pelo menos uma turma;
--   * toda turma tem pelo menos um aluno.
--
-- Os ids SERIAL nao sao informados: o PostgreSQL gera 1, 2, 3... na
-- ordem dos VALUES. Por isso o script comeca com TRUNCATE ... RESTART
-- IDENTITY, que esvazia as tabelas e reinicia a contagem em 1. Assim o
-- script pode ser executado mais de uma vez sem quebrar as FKs.

TRUNCATE TABLE alunos, turmas, disciplinas, professores RESTART IDENTITY;

-- disciplinas: 8 registros (minimo 6)
INSERT INTO disciplinas (nome) VALUES
    ('Inglês'),                                                       -- id 1
    ('Espanhol'),                                                     -- id 2
    ('Francês'),                                                      -- id 3
    ('Alemão'),                                                       -- id 4
    ('Italiano'),                                                     -- id 5
    ('Japonês'),                                                      -- id 6
    ('Mandarim'),                                                     -- id 7
    ('Libras');                                                       -- id 8

-- professores: 18 registros (minimo 15)
-- cpf e a PK natural, entao e informado no INSERT.
INSERT INTO professores (cpf, nome) VALUES
    ('96437859121', 'Rodrigo Carvalho Monteiro'),
    ('95454061190', 'Gabriel Siqueira'),
    ('47448888951', 'Juliana Costa Azevedo'),
    ('43070677380', 'Vinicius Batista'),
    ('06892175015', 'Luiz Freitas'),
    ('31102313017', 'Renan Ramos Gonçalves'),
    ('31824330677', 'André Gonçalves'),
    ('05914570409', 'Bruno Araújo Ribeiro'),
    ('02221738071', 'Bernardo Medeiros'),
    ('31510728953', 'Heitor Farias'),
    ('78904692768', 'Luana Ribeiro Lima'),
    ('00552301132', 'Adriana Fernandes Oliveira'),
    ('10005422205', 'Carolina Moreira'),
    ('02066218170', 'Daniela Azevedo Freitas'),
    ('50310904994', 'Fernanda Machado Campos'),
    ('74863366850', 'Heitor Freitas Nascimento'),
    ('41939954614', 'Sandra Fonseca Mendes'),
    ('44960820470', 'Lucas Cunha');

-- turmas: 36 registros (minimo 30)
-- cpf_prof sempre e um dos CPFs acima; id_disciplina vai de 1 a 8.
INSERT INTO turmas (sala, cpf_prof, id_disciplina) VALUES
    ('Sala 101', '74863366850', 6),                                   -- id 1
    ('Sala 104', '44960820470', 3),                                   -- id 2
    ('Sala 204', '06892175015', 7),                                   -- id 3
    ('Sala 203', '02066218170', 5),                                   -- id 4
    ('Sala 103', '50310904994', 1),                                   -- id 5
    ('Sala 102', '95454061190', 8),                                   -- id 6
    ('Auditório', '05914570409', 2),                                  -- id 7
    ('Sala 204', '02066218170', 5),                                   -- id 8
    ('Laboratório 1', '31102313017', 5),                              -- id 9
    ('Sala 101', '10005422205', 1),                                   -- id 10
    ('Sala 101', '31824330677', 1),                                   -- id 11
    ('Sala 201', '05914570409', 2),                                   -- id 12
    ('Sala 204', '05914570409', 2),                                   -- id 13
    ('Sala 205', '95454061190', 8),                                   -- id 14
    ('Sala 105', '41939954614', 4),                                   -- id 15
    ('Sala 205', '74863366850', 6),                                   -- id 16
    ('Sala 203', '02221738071', 3),                                   -- id 17
    ('Sala 102', '44960820470', 3),                                   -- id 18
    ('Sala 205', '00552301132', 1),                                   -- id 19
    ('Sala 201', '78904692768', 2),                                   -- id 20
    ('Sala 203', '31510728953', 2),                                   -- id 21
    ('Sala 202', '78904692768', 2),                                   -- id 22
    ('Sala 205', '43070677380', 8),                                   -- id 23
    ('Sala 202', '31824330677', 1),                                   -- id 24
    ('Auditório', '47448888951', 1),                                  -- id 25
    ('Sala 103', '31510728953', 2),                                   -- id 26
    ('Auditório', '41939954614', 4),                                  -- id 27
    ('Sala 104', '96437859121', 1),                                   -- id 28
    ('Sala 101', '50310904994', 1),                                   -- id 29
    ('Sala 102', '06892175015', 7),                                   -- id 30
    ('Sala 205', '74863366850', 6),                                   -- id 31
    ('Laboratório 2', '44960820470', 3),                              -- id 32
    ('Sala 204', '41939954614', 4),                                   -- id 33
    ('Laboratório 2', '96437859121', 1),                              -- id 34
    ('Sala 104', '02221738071', 3),                                   -- id 35
    ('Sala 204', '47448888951', 1);                                   -- id 36

-- alunos: 120 registros (minimo 100)
-- matricula e informada (nao e SERIAL); id_turma vai de 1 a 36.
INSERT INTO alunos (matricula, nome, id_turma) VALUES
    (20260001, 'Gabriel Brito Farias', 13),
    (20260002, 'Vinicius Siqueira', 23),
    (20260003, 'Marcelo Teixeira Gomes', 2),
    (20260004, 'Bernardo Farias', 9),
    (20260005, 'Rafael Vieira D''Ângelo', 8),
    (20260006, 'Laura Dias', 3),
    (20260007, 'Carlos Gomes Teixeira', 22),
    (20260008, 'Joaquim Lopes Barros', 24),
    (20260009, 'Heitor Freitas', 22),
    (20260010, 'Vitor Nascimento', 10),
    (20260011, 'Leandro Mendes Castro', 35),
    (20260012, 'Carolina Azevedo Ribeiro', 15),
    (20260013, 'André Nunes Soares', 26),
    (20260014, 'Vitor Correia Cardoso', 17),
    (20260015, 'Sandra Azevedo Pinto', 30),
    (20260016, 'Mariana Almeida', 16),
    (20260017, 'João Pinto Moreira', 36),
    (20260018, 'Pedro Santana Barros', 16),
    (20260019, 'Eduardo Santos', 18),
    (20260020, 'Antônio Monteiro', 27),
    (20260021, 'Cristina Alves', 19),
    (20260022, 'Cristina Martins', 16),
    (20260023, 'Renata Martins', 21),
    (20260024, 'Gabriel Batista Farias', 35),
    (20260025, 'Caio Ribeiro Freitas', 31),
    (20260026, 'Wesley Rodrigues', 23),
    (20260027, 'Raquel Ramos D''Almeida', 26),
    (20260028, 'Rodrigo Ramos', 14),
    (20260029, 'Samuel Gonçalves Freitas', 5),
    (20260030, 'Carolina Nascimento', 10),
    (20260031, 'Elisa Nunes', 4),
    (20260032, 'Manuela Castro', 6),
    (20260033, 'Bianca Ramos D''Ângelo', 35),
    (20260034, 'Eduardo Vieira Araújo', 11),
    (20260035, 'Eduardo Teixeira Fonseca', 20),
    (20260036, 'Aline Farias Barbosa', 18),
    (20260037, 'Guilherme Teixeira Barros', 28),
    (20260038, 'Valentina Barbosa', 4),
    (20260039, 'Cecília Correia', 12),
    (20260040, 'Rafael Ferreira', 33),
    (20260041, 'Heitor Santana Fonseca', 9),
    (20260042, 'Clara Barbosa', 32),
    (20260043, 'Gabriela Almeida Santana', 20),
    (20260044, 'Renata Farias Siqueira', 9),
    (20260045, 'Aline Nascimento Rodrigues', 14),
    (20260046, 'Cecília Mendes Vieira', 14),
    (20260047, 'Eduardo Mendes', 34),
    (20260048, 'Pedro Costa Alves', 28),
    (20260049, 'Luana Fonseca', 25),
    (20260050, 'Adriana Lima Almeida', 17),
    (20260051, 'Priscila Nunes', 4),
    (20260052, 'Hugo Monteiro', 34),
    (20260053, 'Gustavo Rocha', 28),
    (20260054, 'Hugo Barros', 4),
    (20260055, 'Paulo Vieira', 13),
    (20260056, 'João Andrade', 7),
    (20260057, 'Yasmin Nascimento Mendes', 18),
    (20260058, 'Fernando Rocha', 10),
    (20260059, 'Aline Nascimento Costa', 33),
    (20260060, 'Simone Castro', 33),
    (20260061, 'Leandro Rocha Lopes', 26),
    (20260062, 'Miguel Campos Gomes', 24),
    (20260063, 'Sandra Alves', 1),
    (20260064, 'Bruna Gomes Marques', 14),
    (20260065, 'Sandra Lopes Barros', 25),
    (20260066, 'Luana Andrade Correia', 30),
    (20260067, 'Rogério Ribeiro', 26),
    (20260068, 'Larissa Lima', 1),
    (20260069, 'Lorena Dias', 15),
    (20260070, 'Rafael Nunes', 22),
    (20260071, 'Laura Cardoso Ramos', 9),
    (20260072, 'Otávio Batista Monteiro', 16),
    (20260073, 'Natália Ramos Nunes', 29),
    (20260074, 'Thiago Santana Mendes', 25),
    (20260075, 'Gabriela Cavalcanti Lima', 32),
    (20260076, 'Tatiane Ribeiro', 34),
    (20260077, 'Letícia Barros Silva', 36),
    (20260078, 'Manuela Ribeiro Santos', 16),
    (20260079, 'Bruna Dias', 30),
    (20260080, 'Renan Cardoso', 27),
    (20260081, 'Luana Santos Lima', 15),
    (20260082, 'Vinicius Martins Teixeira', 3),
    (20260083, 'Ana Farias Santana', 9),
    (20260084, 'Luana Lima Teixeira', 31),
    (20260085, 'Sabrina Pires Souza', 21),
    (20260086, 'Nicolas Batista Correia', 24),
    (20260087, 'Tiago Alves Rezende', 31),
    (20260088, 'Clara Moreira Martins', 26),
    (20260089, 'Valentina Lima Nunes', 28),
    (20260090, 'Alice Araújo', 31),
    (20260091, 'Patrícia Medeiros Ramos', 7),
    (20260092, 'Renata Brito', 15),
    (20260093, 'Leonardo Araújo Medeiros', 35),
    (20260094, 'Ingrid Oliveira Correia', 2),
    (20260095, 'Bianca Brito', 10),
    (20260096, 'Davi Queiroz Siqueira', 5),
    (20260097, 'Karina Oliveira', 7),
    (20260098, 'Thiago Campos Brito', 3),
    (20260099, 'José Ferreira', 6),
    (20260100, 'Sérgio Vieira Carvalho', 15),
    (20260101, 'Daniela Fernandes', 7),
    (20260102, 'Henrique Marques Pinto', 2),
    (20260103, 'Davi Barbosa D''Almeida', 36),
    (20260104, 'Tatiane Santos', 8),
    (20260105, 'Joana Castro Nunes', 26),
    (20260106, 'Mateus Martins', 6),
    (20260107, 'Caio Cunha', 4),
    (20260108, 'Daniel Moreira', 20),
    (20260109, 'Felipe Cavalcanti', 33),
    (20260110, 'Felipe Fonseca', 4),
    (20260111, 'Marcelo Andrade Monteiro', 31),
    (20260112, 'Paulo Batista Correia', 19),
    (20260113, 'Ricardo Barbosa Carvalho', 35),
    (20260114, 'João Silva Cunha', 36),
    (20260115, 'Carolina Rocha Teixeira', 24),
    (20260116, 'Manuela Siqueira', 7),
    (20260117, 'Carlos Barros Santos', 16),
    (20260118, 'Sofia Gomes Costa', 34),
    (20260119, 'Murilo Campos', 19),
    (20260120, 'Mateus Ferreira Ramos', 18);

-- ---------------------------------------------------------------------
-- Conferencia: quantidade por tabela e checagens de cardinalidade minima.
-- As linhas "(deve ser 0)" precisam mostrar 0.
-- ---------------------------------------------------------------------

SELECT 'disciplinas' AS conferencia, (SELECT COUNT(*) FROM disciplinas) AS total
UNION ALL SELECT 'professores', (SELECT COUNT(*) FROM professores)
UNION ALL SELECT 'turmas', (SELECT COUNT(*) FROM turmas)
UNION ALL SELECT 'alunos', (SELECT COUNT(*) FROM alunos)
UNION ALL SELECT 'professores sem turma (deve ser 0)', (SELECT COUNT(*) FROM professores p WHERE NOT EXISTS (SELECT 1 FROM turmas t WHERE t.cpf_prof = p.cpf))
UNION ALL SELECT 'disciplinas sem turma (deve ser 0)', (SELECT COUNT(*) FROM disciplinas d WHERE NOT EXISTS (SELECT 1 FROM turmas t WHERE t.id_disciplina = d.id_disciplina))
UNION ALL SELECT 'turmas sem aluno (deve ser 0)', (SELECT COUNT(*) FROM turmas t WHERE NOT EXISTS (SELECT 1 FROM alunos a WHERE a.id_turma = t.id_turma));
