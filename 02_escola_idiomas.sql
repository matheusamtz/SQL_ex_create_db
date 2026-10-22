-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: do modelo logico ao fisico (CREATE)
-- Modelo 2: Escola de Idiomas
-- Aluno: Matheus
-- =====================================================================

-- Passo 1: criar o database (executar SOZINHO, conectado ao database postgres).
-- Fica comentado para que o script inteiro possa ser executado com F5.
-- CREATE DATABASE escola_idiomas;

-- Passo 2: abrir o Query Tool conectado ao database "escola_idiomas"
-- e executar este script inteiro (F5).

-- Decisao: o DROP permite rodar o script de novo enquanto corrijo erros.
-- A ordem e inversa a da criacao (filhas antes das pais).
-- Atencao: rodar de novo apaga os dados ja inseridos.
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS turmas;
DROP TABLE IF EXISTS disciplinas;
DROP TABLE IF EXISTS professores;


-- ---------------------------------------------------------------------
-- Tabelas pais
-- ---------------------------------------------------------------------

CREATE TABLE professores (
    -- Chave natural: o CPF ja identifica o professor, por isso nao e SERIAL.
    cpf   CHAR(11)     NOT NULL,
    nome  VARCHAR(80)  NOT NULL,

    CONSTRAINT pk_professores PRIMARY KEY (cpf),

    -- Regra CHECK: CPF guardado so com os 11 digitos, sem ponto e hifen.
    -- Como CHAR(11) completa com espacos, um CPF de 10 digitos passaria
    -- pelo tamanho; a expressao regular barra esse caso.
    CONSTRAINT ck_professores_cpf CHECK (cpf ~ '^[0-9]{11}$')
);

CREATE TABLE disciplinas (
    id_disciplina  SERIAL       NOT NULL,
    nome           VARCHAR(50)  NOT NULL,

    CONSTRAINT pk_disciplinas PRIMARY KEY (id_disciplina),

    -- Regra UNIQUE: a escola nao oferece o mesmo idioma duas vezes no cadastro.
    CONSTRAINT uq_disciplinas_nome UNIQUE (nome)
);


-- ---------------------------------------------------------------------
-- Turmas: recebe duas FKs (professor e disciplina)
-- ---------------------------------------------------------------------

CREATE TABLE turmas (
    id_turma       SERIAL       NOT NULL,
    -- Sem UNIQUE: a mesma sala atende turmas diferentes em outros horarios.
    sala           VARCHAR(20)  NOT NULL,
    -- CHAR(11) para bater com o tipo da PK de professores.
    -- NOT NULL: no conceitual a turma participa com (1,1) em "leciona".
    cpf_prof       CHAR(11)     NOT NULL,
    -- INTEGER porque aponta para um SERIAL.
    -- NOT NULL: a turma participa com (1,1) em "aborda".
    id_disciplina  INTEGER      NOT NULL,

    CONSTRAINT pk_turmas PRIMARY KEY (id_turma),

    CONSTRAINT fk_turmas_professor FOREIGN KEY (cpf_prof)
        REFERENCES professores (cpf),

    CONSTRAINT fk_turmas_disciplina FOREIGN KEY (id_disciplina)
        REFERENCES disciplinas (id_disciplina)
);


-- ---------------------------------------------------------------------
-- Alunos: recebe a FK da turma
-- ---------------------------------------------------------------------

CREATE TABLE alunos (
    -- Decisao: matricula fica INTEGER (sem SERIAL) porque e um numero
    -- definido pela secretaria (ex.: 20260001), nao uma chave artificial.
    matricula  INTEGER      NOT NULL,
    nome       VARCHAR(80)  NOT NULL,
    -- NOT NULL: o aluno participa com (1,1) em "tem".
    id_turma   INTEGER      NOT NULL,

    CONSTRAINT pk_alunos PRIMARY KEY (matricula),

    CONSTRAINT fk_alunos_turma FOREIGN KEY (id_turma)
        REFERENCES turmas (id_turma),

    -- Regra CHECK: matricula precisa ser um numero positivo.
    CONSTRAINT ck_alunos_matricula CHECK (matricula > 0)
);

-- Observacoes sobre a cardinalidade minima (lado 1,N):
-- * todo professor leciona pelo menos uma turma;
-- * toda disciplina e abordada por pelo menos uma turma;
-- * toda turma tem pelo menos um aluno.
-- O CREATE TABLE nao garante isso sozinho; a regra e respeitada nos dados.
