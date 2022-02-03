create database empregos;
use empregos;

create TABLE vagas(
	idvaga INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    req_obrigatorios VARCHAR(45) NOT NULL,
    req_desejaveis VARCHAR(45),
    remuneracao FLOAT NOT NULL,
    aberta TINYINT DEFAULT 1, -- 1 true aberta e 0 false fechada
    beneficios VARCHAR(45) NOT NULL,
    local_trabalho VARCHAR(45) NOT NULL
) AUTO_INCREMENT = 1000; -- Inicia o código das vagas no valor 1000

SELECT * FROM vagas;

SELECT * FROM vagas WHERE aberta = 1;

SELECT * FROM vagas WHERE aberta = 0;