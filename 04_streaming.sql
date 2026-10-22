-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: do modelo logico ao fisico (CREATE)
-- Modelo 4: Streaming
-- Aluno: Matheus
-- =====================================================================

-- Passo 1: criar o database (executar SOZINHO, conectado ao database postgres).
-- Fica comentado para que o script inteiro possa ser executado com F5.
-- CREATE DATABASE streaming;

-- Passo 2: abrir o Query Tool conectado ao database "streaming"
-- e executar este script inteiro (F5).

-- Decisao: o DROP permite rodar o script de novo enquanto corrijo erros.
-- A ordem e inversa a da criacao (filhas antes das pais).
-- Atencao: rodar de novo apaga os dados ja inseridos.
DROP TABLE IF EXISTS assistidos;
DROP TABLE IF EXISTS filmes;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS diretores;
DROP TABLE IF EXISTS generos;
DROP TABLE IF EXISTS planos;


-- ---------------------------------------------------------------------
-- Tabelas pais
-- ---------------------------------------------------------------------

CREATE TABLE planos (
    id_plano  SERIAL        NOT NULL,
    preco     DECIMAL(8,2)  NOT NULL,

    CONSTRAINT pk_planos PRIMARY KEY (id_plano),

    -- Regra CHECK: plano de assinatura precisa ter preco positivo.
    CONSTRAINT ck_planos_preco CHECK (preco > 0),

    -- Regra UNIQUE: o modelo logico nao tem nome de plano, entao o preco
    -- e o que diferencia um plano do outro. Dois planos com o mesmo preco
    -- seriam indistinguiveis.
    CONSTRAINT uq_planos_preco UNIQUE (preco)
);

CREATE TABLE generos (
    id_genero  SERIAL       NOT NULL,
    nome       VARCHAR(40)  NOT NULL,

    CONSTRAINT pk_generos PRIMARY KEY (id_genero),

    -- Regra UNIQUE: o mesmo genero nao pode aparecer duas vezes no catalogo.
    CONSTRAINT uq_generos_nome UNIQUE (nome)
);

CREATE TABLE diretores (
    id_diretor  SERIAL       NOT NULL,
    nome        VARCHAR(80)  NOT NULL,

    CONSTRAINT pk_diretores PRIMARY KEY (id_diretor)
);


-- ---------------------------------------------------------------------
-- Tabelas filhas de 1:N
-- ---------------------------------------------------------------------

CREATE TABLE usuarios (
    id_usuario  SERIAL        NOT NULL,
    email       VARCHAR(120)  NOT NULL,
    -- INTEGER porque aponta para um SERIAL.
    -- NOT NULL: o usuario participa com (1,1) em "assina".
    id_plano    INTEGER       NOT NULL,

    CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),

    CONSTRAINT fk_usuarios_plano FOREIGN KEY (id_plano)
        REFERENCES planos (id_plano),

    -- Regra UNIQUE: o e-mail e o login do usuario, nao pode se repetir.
    CONSTRAINT uq_usuarios_email UNIQUE (email),

    -- Regra CHECK: formato minimo de e-mail (algo@algo.algo).
    CONSTRAINT ck_usuarios_email CHECK (email LIKE '%_@_%._%')
);

CREATE TABLE filmes (
    id_filme    SERIAL       NOT NULL,
    titulo      VARCHAR(80)  NOT NULL,
    ano         INTEGER      NOT NULL,
    -- NOT NULL nas duas FKs: o filme participa com (1,1) em "tem"
    -- (genero) e em "dirige" (diretor).
    id_genero   INTEGER      NOT NULL,
    id_diretor  INTEGER      NOT NULL,

    CONSTRAINT pk_filmes PRIMARY KEY (id_filme),

    CONSTRAINT fk_filmes_genero FOREIGN KEY (id_genero)
        REFERENCES generos (id_genero),

    CONSTRAINT fk_filmes_diretor FOREIGN KEY (id_diretor)
        REFERENCES diretores (id_diretor),

    -- Regra CHECK: o primeiro filme da historia e de 1888,
    -- entao nenhum ano anterior faz sentido.
    CONSTRAINT ck_filmes_ano CHECK (ano BETWEEN 1888 AND 2100)
);


-- ---------------------------------------------------------------------
-- Tabela associativa do N:N entre usuarios e filmes
-- ---------------------------------------------------------------------

CREATE TABLE assistidos (
    id_usuario  INTEGER  NOT NULL,
    id_filme    INTEGER  NOT NULL,
    -- Sem atributos proprios, como no modelo logico.

    -- PK composta: o par usuario/filme aparece uma vez so.
    CONSTRAINT pk_assistidos PRIMARY KEY (id_usuario, id_filme),

    -- Decisao: ON DELETE CASCADE nas duas FKs. Se o usuario cancela a conta
    -- ou o filme sai do catalogo, o historico daquele par perde o sentido.
    CONSTRAINT fk_assistidos_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario) ON DELETE CASCADE,

    CONSTRAINT fk_assistidos_filme FOREIGN KEY (id_filme)
        REFERENCES filmes (id_filme) ON DELETE CASCADE
);

-- Observacoes sobre a cardinalidade minima:
-- * todo plano tem pelo menos um usuario (1,N);
-- * todo genero e todo diretor tem pelo menos um filme (1,N);
-- * "assiste" e (0,N) dos dois lados: pode haver usuario que nao assistiu
--   nada e filme que ninguem assistiu.
-- O CREATE TABLE nao garante o (1,N) sozinho; a regra e respeitada nos dados.
