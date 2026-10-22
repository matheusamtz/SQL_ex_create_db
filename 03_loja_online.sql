-- =====================================================================
-- Banco de Dados I - CEUB
-- Exercicio Pratico: do modelo logico ao fisico (CREATE)
-- Modelo 3: Loja Online
-- Aluno: Matheus
-- =====================================================================

-- Passo 1: criar o database (executar SOZINHO, conectado ao database postgres).
-- Fica comentado para que o script inteiro possa ser executado com F5.
-- CREATE DATABASE loja_online;

-- Passo 2: abrir o Query Tool conectado ao database "loja_online"
-- e executar este script inteiro (F5).

-- Decisao: o DROP permite rodar o script de novo enquanto corrijo erros.
-- A ordem e inversa a da criacao (filhas antes das pais).
-- Atencao: rodar de novo apaga os dados ja inseridos.
DROP TABLE IF EXISTS item_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;


-- ---------------------------------------------------------------------
-- Tabelas pais
-- ---------------------------------------------------------------------

CREATE TABLE clientes (
    id_cliente  SERIAL       NOT NULL,
    nome        VARCHAR(80)  NOT NULL,

    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE categorias (
    id_categoria  SERIAL       NOT NULL,
    nome          VARCHAR(40)  NOT NULL,

    CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),

    -- Regra UNIQUE: duas categorias com o mesmo nome confundiriam o cliente.
    CONSTRAINT uq_categorias_nome UNIQUE (nome)
);


-- ---------------------------------------------------------------------
-- Tabelas filhas de 1:N
-- ---------------------------------------------------------------------

CREATE TABLE produtos (
    id_produto    SERIAL         NOT NULL,
    nome          VARCHAR(80)    NOT NULL,
    preco         DECIMAL(8,2)   NOT NULL,
    -- INTEGER porque aponta para um SERIAL.
    -- NOT NULL: o produto participa com (1,1) em "pertence".
    id_categoria  INTEGER        NOT NULL,

    CONSTRAINT pk_produtos PRIMARY KEY (id_produto),

    CONSTRAINT fk_produtos_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria),

    -- Regra CHECK: preco nao pode ser negativo
    -- (zero e aceito para brindes).
    CONSTRAINT ck_produtos_preco CHECK (preco >= 0)
);

CREATE TABLE pedidos (
    id_pedido   SERIAL   NOT NULL,
    -- Decisao: DEFAULT CURRENT_DATE registra a data do dia quando
    -- o pedido for inserido sem data.
    data        DATE     NOT NULL DEFAULT CURRENT_DATE,
    -- NOT NULL: o pedido participa com (1,1) em "faz".
    id_cliente  INTEGER  NOT NULL,

    CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido),

    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
);


-- ---------------------------------------------------------------------
-- Tabela associativa do N:N entre pedidos e produtos
-- ---------------------------------------------------------------------

CREATE TABLE item_pedido (
    id_pedido   INTEGER  NOT NULL,
    id_produto  INTEGER  NOT NULL,
    -- Atributo do relacionamento "contem".
    quantidade  INTEGER  NOT NULL,

    -- PK composta: o mesmo produto nao se repete dentro do mesmo pedido
    -- (se o cliente quiser mais unidades, aumenta a quantidade).
    CONSTRAINT pk_item_pedido PRIMARY KEY (id_pedido, id_produto),

    -- Decisao: ON DELETE CASCADE porque o item nao existe sem o pedido;
    -- excluir um pedido remove os itens dele junto.
    CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedidos (id_pedido) ON DELETE CASCADE,

    -- Aqui fica o padrao (NO ACTION): nao deixa excluir um produto
    -- que ja foi vendido, para nao perder o historico.
    CONSTRAINT fk_item_pedido_produto FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto),

    -- Regra CHECK: um item precisa ter pelo menos uma unidade.
    CONSTRAINT ck_item_pedido_quantidade CHECK (quantidade > 0)
);

-- Observacoes sobre a cardinalidade minima (lado 1,N):
-- * todo cliente faz pelo menos um pedido;
-- * todo pedido contem pelo menos um produto e todo produto aparece em
--   pelo menos um pedido;
-- * toda categoria tem pelo menos um produto.
-- O CREATE TABLE nao garante isso sozinho; a regra e respeitada nos dados.
