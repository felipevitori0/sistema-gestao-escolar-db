
CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100),
    matricula VARCHAR(20) UNIQUE,
    idade INT,
    genero VARCHAR(20),
    responsaveis VARCHAR(200),
    observacoes TEXT,
    grau_escolaridade VARCHAR(50)
);

CREATE TABLE historico_escolar (
    id_historico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    notas VARCHAR(10),
    materias VARCHAR(100),
    turno VARCHAR(20),
    advertencias TEXT,
    observacoes TEXT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE
);

CREATE TABLE financeiro (
    id_financeiro INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    parcelamento INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE
);

CREATE TABLE cartao (
    id_cartao INTEGER PRIMARY KEY AUTOINCREMENT,
    numero_cartao VARCHAR(20),
    bandeira VARCHAR(20),
    cvc CHAR(3),
    nome_titular VARCHAR(100),
    cpf CHAR(11),
    id_aluno INTEGER,
    id_financeiro INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_financeiro) REFERENCES financeiro(id_financeiro) ON DELETE CASCADE
);

CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_financeiro INTEGER,
    data_pagamento DATE,
    valor_pago DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (id_financeiro) REFERENCES financeiro(id_financeiro) ON DELETE CASCADE
);


INSERT INTO aluno (
    nome,
    matricula,
    idade,
    genero,
    responsaveis,
    observacoes,
    grau_escolaridade
)
VALUES (
    'Maria Souza',
    'MAT2025001',
    15,
    'Feminino',
    'João Souza e Ana Souza',
    'Aluno participativo e pontual.',
    'Ensino Fundamental II'
);

INSERT INTO aluno (
    nome,
    matricula,
    idade,
    genero,
    responsaveis,
    observacoes,
    grau_escolaridade
)
VALUES (
    'Pedro Lima',
    'MAT2025002',
    17,
    'Masculino',
    'Carlos Lima',
    'Bom desempenho em matemática.',
    'Ensino Médio'
);


UPDATE aluno
SET
    idade = 16,
    observacoes = 'Aluno transferido para o turno da manhã.'
WHERE
    matricula = 'MAT2025001';


DELETE FROM aluno
WHERE matricula = 'MAT2025002';



SELECT * FROM aluno;
