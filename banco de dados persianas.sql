USE persianas;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(20) NOT NULL DEFAULT 'usuario',
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE clientes (
    id_cliente VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    contato VARCHAR(100),
    rua VARCHAR(150),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    numero VARCHAR(20),
    cep VARCHAR(10),
    cpf_cnpj VARCHAR(20) UNIQUE,
    observacoes TEXT
);

CREATE TABLE estoque (
    id_estoque VARCHAR(10) PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL DEFAULT 0,
    unidade_medida VARCHAR(30) NOT NULL
);

CREATE TABLE vendas (
    id_venda VARCHAR(10) PRIMARY KEY,

    id_cliente VARCHAR(10) NOT NULL,

    tipo_venda VARCHAR(50),
    forma_pgt VARCHAR(50),
    valor DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    nf VARCHAR(50),

    status_pgt VARCHAR(30),
    status_venda VARCHAR(30),

    descricao_item TEXT,

    data_registro DATE NOT NULL DEFAULT (CURRENT_DATE),

    data_agendada DATE,
    hora_agendada TIME,

    data_encerramento_venda DATE,

    obs_venda TEXT,

    status_pos_venda VARCHAR(50),
    fechamento_pos_venda DATE,
    acao_pos_venda TEXT,

    CONSTRAINT fk_venda_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);






