-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: do modelo logico ao fisico (CREATE)
-- Modelo 1: Biblioteca
-- Aluno: Matheus
-- =====================================================================

-- Passo 1: criar o database (executar SOZINHO, conectado ao database postgres).
-- Fica comentado para que o script inteiro possa ser executado com F5.
-- CREATE DATABASE biblioteca;

-- Passo 2: abrir o Query Tool conectado ao database "biblioteca"
-- e executar este script inteiro (F5).

-- Decisao: o DROP permite rodar o script de novo enquanto corrijo erros.
-- A ordem e inversa a da criacao (filha antes das pais).
-- Atencao: rodar de novo apaga os dados ja inseridos.
DROP TABLE IF EXISTS livros;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS editoras;


-- ---------------------------------------------------------------------
-- Tabelas pais (nao dependem de nenhuma outra)
-- ---------------------------------------------------------------------

CREATE TABLE editoras (
    id_editora  SERIAL       NOT NULL,
    nome        VARCHAR(60)  NOT NULL,

    CONSTRAINT pk_editoras PRIMARY KEY (id_editora),

    -- Regra UNIQUE: nao faz sentido cadastrar a mesma editora duas vezes.
    CONSTRAINT uq_editoras_nome UNIQUE (nome)
);

CREATE TABLE autores (
    id_autor  SERIAL       NOT NULL,
    nome      VARCHAR(80)  NOT NULL,

    CONSTRAINT pk_autores PRIMARY KEY (id_autor)
    -- Sem UNIQUE no nome: dois autores diferentes podem ter o mesmo nome.
);


-- ---------------------------------------------------------------------
-- Tabela filha: recebe as duas FKs (dois 1:N em cadeia)
-- ---------------------------------------------------------------------

CREATE TABLE livros (
    id_livro    SERIAL       NOT NULL,
    titulo      VARCHAR(80)  NOT NULL,
    ano         INTEGER      NOT NULL,
    -- FKs apontam para SERIAL, entao sao INTEGER.
    -- NOT NULL porque no conceitual o livro participa com (1,1):
    -- todo livro tem exatamente uma editora e exatamente um autor.
    id_editora  INTEGER      NOT NULL,
    id_autor    INTEGER      NOT NULL,

    CONSTRAINT pk_livros PRIMARY KEY (id_livro),

    CONSTRAINT fk_livros_editora FOREIGN KEY (id_editora)
        REFERENCES editoras (id_editora),

    CONSTRAINT fk_livros_autor FOREIGN KEY (id_autor)
        REFERENCES autores (id_autor),

    -- Regra CHECK: ano de publicacao precisa ser plausivel.
    -- Antes de 1450 (prensa de Gutenberg) nao existe livro impresso,
    -- e 2100 evita erros de digitacao como 20219.
    CONSTRAINT ck_livros_ano CHECK (ano BETWEEN 1450 AND 2100)
);

-- Observacoes sobre a cardinalidade minima:
-- * Editora (0,N): pode existir editora sem livro cadastrado.
-- * Autor (1,N): todo autor precisa ter pelo menos um livro. O CREATE TABLE
--   nao consegue garantir isso sozinho; a regra e respeitada nos dados
--   (script de povoamento).
