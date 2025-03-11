-- Selecionar apenas os alunos aprovados (nota maior que 7,0)
SELECT * FROM ALUNO WHERE NOTA > 7.0;

-- Exibir os alunos do 1º ano com nota maior ou igual a 8,0
SELECT * FROM ALUNO WHERE SÉRIE = '1º ano' AND NOTA >= 8.0;

-- Exibir apenas os nomes e as notas dos alunos
SELECT P.NOME, U.NOME, NOTA FROM ALUNO;

-- Criar a tabela PROFESSOR (com primeiro e último nome)
CREATE TABLE PROFESSOR (
    P_NOME VARCHAR(50),
    U_NOME VARCHAR(50)
);

-- Inserir exemplos de professores (substitua pelos reais, se necessário)
INSERT INTO PROFESSOR (P_NOME, U_NOME) VALUES
('Carlos', 'Ferreira'),
('Mariana', 'Oliveira'),
('André', 'Carvalho');

-- Criar a tabela ALUNO apenas com os nomes
CREATE TABLE ALUNO_NOMES AS
SELECT P.NOME AS P_NOME, U.NOME AS U_NOME FROM ALUNO;

-- União entre a tabela ALUNO e a tabela PROFESSOR
SELECT P_NOME, U_NOME FROM ALUNO_NOMES
UNION
SELECT P_NOME, U_NOME FROM PROFESSOR;

-- Intersecção entre ALUNO e PROFESSOR (nomes que aparecem em ambas)
SELECT P_NOME, U_NOME FROM ALUNO_NOMES
INTERSECT
SELECT P_NOME, U_NOME FROM PROFESSOR;

-- Diferença entre ALUNO e PROFESSOR (nomes que estão em ALUNO mas não em PROFESSOR)
SELECT P_NOME, U_NOME FROM ALUNO_NOMES
EXCEPT
SELECT P_NOME, U_NOME FROM PROFESSOR;

