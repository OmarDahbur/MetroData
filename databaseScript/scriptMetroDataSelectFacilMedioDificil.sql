-- 1
create database MetroData;
use MetroData;

create table estacao(
idEstacao int primary key auto_increment,
nome varchar(45),
zona varchar(45),
possuiBilheteria char(3),
passageiros int,
mediaAtrasosMin decimal(4,2),
elevadoresFuncionando char(3),
dtInauguracao date,
constraint chkBilheteria check (possuiBilheteria in ('sim', 'não')),
constraint chkElevadores check (elevadoresFuncionando in ('sim', 'não')));



create table usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
idade int,
sexo char(1),
tipoUsuario varchar(45));

create table ocorrencia(
idOcorrencia  int primary key auto_increment,
tipo varchar(45),
descricao varchar(250),
dtOcorrencia date,
nivelGravidade varchar(45),
fkEstacao int,
fkUsuario int
-- criar as chaves estrangeiras
);

alter table ocorrencia add constraint fkEsOco foreign key (fkEstacao) references estacao(idEstacao),
add constraint fkUsuOco foreign key (fkUsuario) references usuario(idUsuario);

create table bilhete(
idBilhete int primary key auto_increment,
tipo varchar(45),
valor decimal(4,2),
formaPagamento varchar(45),
dtUso date,
fkUsuario int,
constraint chkPag check(formaPagamento in ('Débito', 'Crédito', 'Dinheiro', 'Cartão de passagem'))
);

alter table bilhete add constraint fkUsuBil foreign key (fkUsuario) references usuario(idUsuario);


create table viagem(
idViagem int primary key auto_increment,
tempoViagemMin time, 
dataHora date,
estacaoOrigem varchar(45),
estacaoDestino varchar(45)
);

create table viagemUsuario(
fkUsuario int,
fkViagem int);

alter table viagemUsuario add constraint pkUsuVi primary key (fkUsuario, fkViagem),
add constraint fkUsuVi foreign key (fkUsuario) references usuario(idUsuario),
add constraint fkViVi foreign key (fkViagem) references viagem(idViagem);

create table relacionamento(
fkConjuge1 int,
fkConjuge2 int,
statusRelacionamento varchar(45),
nivelProximidade varchar(45));

alter table relacionamento add constraint primary key (fkConjuge1, fkConjuge2),
add constraint fkConUso1 foreign key (fkConjuge1) references usuario(idUsuario),
add constraint fkConUso2 foreign key (fkConjuge2) references usuario(idUsuario);

-- 2
INSERT INTO estacao (nome, zona, possuiBilheteria, passageiros, mediaAtrasosMin, elevadoresFuncionando, dtInauguracao)
VALUES
('Estação São Bento', 'Centro', 'sim', 150000, 5.25, 'sim', '1968-04-30'),
('Estação Sé', 'Centro', 'sim', 120000, 3.50, 'não', '1974-10-06'),
('Estação Luz', 'Centro', 'sim', 130000, 4.20, 'sim', '1950-08-02'),
('Estação República', 'Centro', 'não', 100000, 2.80, 'não', '1990-05-11'),
('Estação Anhangabaú', 'Centro', 'sim', 110000, 4.10, 'sim', '1992-11-15'),
('Estação São Joaquim', 'Centro', 'sim', 95000, 6.00, 'sim', '1975-09-20'),
('Estação Liberdade', 'Centro', 'sim', 140000, 3.75, 'não', '1978-10-04'),
('Estação Brás', 'Leste', 'não', 160000, 7.20, 'sim', '1969-11-23'),
('Estação Pedro II', 'Leste', 'sim', 130000, 5.50, 'não', '1975-02-10'),
('Estação Bresser-Mooca', 'Leste', 'sim', 125000, 3.60, 'sim', '1998-04-10'),
('Estação Mooca', 'Leste', 'sim', 115000, 4.80, 'não', '1993-07-20'),
('Estação Vila Prudente', 'Leste', 'sim', 110000, 2.90, 'sim', '1992-02-12'),
('Estação Ipiranga', 'Sul', 'não', 140000, 6.10, 'sim', '1975-01-08'),
('Estação Sacomã', 'Sul', 'sim', 120000, 3.30, 'não', '2001-03-23'),
('Estação Tamanduateí', 'Sul', 'sim', 150000, 4.70, 'sim', '1992-06-21'),
('Estação Alto do Ipiranga', 'Sul', 'não', 95000, 5.80, 'não', '1977-12-11'),
('Estação Sacomã', 'Sul', 'sim', 105000, 3.90, 'não', '2001-03-23'),
('Estação Vila Mariana', 'Centro-Sul', 'sim', 130000, 2.60, 'sim', '1990-02-08'),
('Estação Chácara Klabin', 'Centro-Sul', 'não', 100000, 4.00, 'sim', '1989-07-29'),
('Estação Praça da Árvore', 'Centro-Sul', 'sim', 90000, 3.40, 'não', '1989-11-19');

-- 3
INSERT INTO usuario (nome, idade, sexo, tipoUsuario)
VALUES
('Ana Silva', 22, 'F', 'Estudante'),
('Carlos Souza', 34, 'M', 'Trabalhador'),
('Beatriz Oliveira', 65, 'F', 'Idoso'),
('João Santos', 29, 'M', 'Trabalhador'),
('Lucas Pereira', 18, 'M', 'Estudante'),
('Mariana Costa', 42, 'F', 'Trabalhador'),
('Roberta Almeida', 60, 'F', 'Idoso'),
('Felipe Rocha', 25, 'M', 'Trabalhador'),
('Juliana Lima', 33, 'F', 'Estudante'),
('Ricardo Almeida', 55, 'M', 'Idoso'),
('Fernanda Oliveira', 40, 'F', 'Trabalhador'),
('Gabriel Rocha', 24, 'M', 'Estudante'),
('Aline Pereira', 30, 'F', 'Trabalhador'),
('Rodrigo Santos', 28, 'M', 'Estudante'),
('Patrícia Costa', 35, 'F', 'Trabalhador'),
('Marcos Silva', 65, 'M', 'Idoso'),
('Juliana Souza', 21, 'F', 'Estudante'),
('Vitor Martins', 31, 'M', 'Trabalhador'),
('Rafael Oliveira', 26, 'M', 'Estudante'),
('Tatiane Lima', 50, 'F', 'Trabalhador'),
('Elias Pereira', 38, 'M', 'Trabalhador'),
('Luana Rocha', 62, 'F', 'Idoso'),
('Douglas Souza', 23, 'M', 'Estudante'),
('Simone Costa', 48, 'F', 'Trabalhador'),
('Igor Almeida', 31, 'M', 'Trabalhador'),
('Thais Lima', 55, 'F', 'Idoso'),
('Eduardo Martins', 27, 'M', 'Estudante'),
('Larissa Pereira', 34, 'F', 'Trabalhador'),
('Giovanni Santos', 61, 'M', 'Idoso'),
('Raquel Oliveira', 22, 'F', 'Estudante'),
('Samuel Rocha', 40, 'M', 'Trabalhador'),
('Isabela Almeida', 25, 'F', 'Estudante'),
('Luan Silva', 36, 'M', 'Trabalhador'),
('Michele Costa', 29, 'F', 'Estudante'),
('Renato Pereira', 58, 'M', 'Idoso'),
('Marina Martins', 45, 'F', 'Trabalhador'),
('Tiago Rocha', 33, 'M', 'Estudante'),
('Jéssica Almeida', 27, 'F', 'Estudante'),
('Luiz Silva', 50, 'M', 'Trabalhador'),
('Tânia Santos', 60, 'F', 'Idoso'),
('Leandro Costa', 23, 'M', 'Estudante'),
('Viviane Pereira', 47, 'F', 'Trabalhador'),
('Juliano Oliveira', 39, 'M', 'Trabalhador'),
('Carla Lima', 52, 'F', 'Idoso'),
('Caio Rocha', 19, 'M', 'Estudante'),
('Paula Almeida', 24, 'F', 'Estudante'),
('Rui Martins', 37, 'M', 'Trabalhador'),
('Lilian Souza', 30, 'F', 'Estudante'),
('Fábio Costa', 34, 'M', 'Trabalhador'),
('Marcos Pereira', 62, 'M', 'Idoso'),
('Tamires Oliveira', 27, 'F', 'Estudante'),
('Bruno Rocha', 41, 'M', 'Trabalhador'),
('Caroline Lima', 49, 'F', 'Trabalhador'),
('Gustavo Santos', 25, 'M', 'Estudante'),
('Marta Costa', 53, 'F', 'Idoso'),
('Jorge Almeida', 28, 'M', 'Trabalhador');

-- 4
INSERT INTO bilhete (tipo, valor, formaPagamento, dtUso, fkUsuario)
SELECT
    'Unitário',
    4.50,
    'Crédito',
    CURRENT_DATE,
    idUsuario
FROM usuario;
/*
Explicação:
Tipo de Bilhete: Todos os bilhetes serão do tipo "Unitário".

Valor: O valor do bilhete será fixo: 4.50.

Forma de Pagamento: Todos os bilhetes terão como forma de pagamento "Crédito".

Data de Uso: A data de uso será a data atual (CURRENT_DATE).

fkUsuario: O bilhete será associado a cada idUsuario da tabela usuario.

Resultado:
Este código insere um bilhete para cada usuário, de forma simples e direta. Todos os bilhetes terão o mesmo tipo, valor, forma de pagamento e data.
*/

-- 5
INSERT INTO ocorrencia (tipo, descricao, dtOcorrencia, nivelGravidade, fkEstacao, fkUsuario)
VALUES
('Falha técnica', 'Sistema de controle de trens com defeito.', '2025-07-24', 'Alta', 1, 50), -- São Bento
('Superlotação', 'Plataforma cheia com passageiros aguardando por mais de 30 minutos.', '2025-07-25', 'Média', 2, 51), -- Sé
('Objeto na via', 'Caixa de ferramentas na linha, causando paralisação.', '2025-07-26', 'Alta', 3, 52), -- Liberdade
('Falha técnica', 'Elevadores fora de operação, dificultando o acesso.', '2025-07-27', 'Média', 4, 53), -- República
('Superlotação', 'Trens lotados devido ao evento na região.', '2025-07-28', 'Média', 5, 54), -- Bresser-Mooca
('Objeto na via', 'Sacola jogada na linha, impedindo a circulação.', '2025-07-29', 'Alta', 6, 55), -- São Joaquim
('Falha técnica', 'Problemas com os bilhetes, causando filas.', '2025-07-30', 'Baixa', 7, 56), -- Brás
('Superlotação', 'Estação lotada devido ao horário de pico.', '2025-07-31', 'Média', 8, 50), -- Ipiranga
('Objeto na via', 'Pedra nas trilhas, causando interrupção nas viagens.', '2025-08-01', 'Alta', 9, 51), -- Alto do Ipiranga
('Falha técnica', 'Portas não fechando corretamente nas plataformas.', '2025-08-02', 'Alta', 10, 52), -- Luz
('Superlotação', 'Plataforma congestionada devido ao horário de pico.', '2025-08-03', 'Média', 11, 53), -- Sé
('Objeto na via', 'Pedra grande na linha, paralisando o tráfego.', '2025-08-04', 'Alta', 12, 54), -- República
('Falha técnica', 'Erro no sistema de sinalização de trens.', '2025-08-05', 'Baixa', 13, 55), -- Liberdade
('Superlotação', 'Estação cheia por conta do evento no estádio.', '2025-08-06', 'Média', 14, 56), -- Bresser-Mooca
('Objeto na via', 'Sacola na linha, interrompendo a circulação.', '2025-08-07', 'Alta', 15, 50), -- São Joaquim
('Falha técnica', 'Sistema de comunicação entre trens com defeito.', '2025-08-08', 'Alta', 16, 51), -- Brás
('Superlotação', 'Muitas pessoas na estação devido a um jogo.', '2025-08-09', 'Média', 17, 52), -- Ipiranga
('Objeto na via', 'Cano obstruindo a linha, causando atraso.', '2025-08-10', 'Alta', 18, 53), -- Sacomã
('Falha técnica', 'Sistema de controle de trens em modo manual.', '2025-08-11', 'Alta', 19, 54), -- São Bento
('Superlotação', 'Plataforma muito cheia, causando desconforto.', '2025-08-12', 'Média', 20, 55), -- Luz
('Objeto na via', 'Caminhão na linha, causando interrupção nas viagens.', '2025-08-13', 'Alta', 1, 56), -- Bresser-Mooca
('Falha técnica', 'Defeito no sistema de ventilação, causando calor excessivo.', '2025-08-14', 'Baixa', 2, 50), -- Brás
('Superlotação', 'Passageiros esperando na plataforma durante mais de 30 minutos.', '2025-08-15', 'Média', 3, 51), -- Vila Matilde
('Objeto na via', 'Caixa de ferramentas na linha, causando bloqueio.', '2025-08-16', 'Alta', 4, 52), -- Liberdade
('Falha técnica', 'Problema no sistema de trens automáticos.', '2025-08-17', 'Alta', 5, 53), -- Vila Prudente
('Superlotação', 'Trens lotados, dificultando o embarque.', '2025-08-18', 'Média', 6, 54), -- Sé
('Objeto na via', 'Pedra nas trilhas, interrompendo o serviço.', '2025-08-19', 'Alta', 7, 55), -- Brás
('Falha técnica', 'Sistema de controle de estações falhou.', '2025-08-20', 'Baixa', 8, 56); -- Bresser-Mooca

-- 6
INSERT INTO viagem (tempoViagemMin, dataHora, estacaoOrigem, estacaoDestino)
VALUES 
('00:15:00', '2025-06-01', 'Sé', 'Luz'),
('00:25:00', '2025-06-01', 'Brás', 'República'),
('00:18:00', '2025-06-02', 'São Joaquim', 'Liberdade'),
('00:20:00', '2025-06-02', 'Ipiranga', 'Vila Prudente'),
('00:30:00', '2025-06-03', 'Tamanduateí', 'Alto do Ipiranga');

INSERT INTO viagemUsuario (fkUsuario, fkViagem)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- SELECTS FACEIS

-- 1 - Listar todas as estações
SELECT * FROM estacao;
 -- 2 - Listar todos os usuários
 SELECT * FROM usuario;
-- 3 - Listar todos os bilhetes com valor e forma de pagamento
SELECT tipo, valor, formaPagamento FROM bilhete;
-- 4 - Mostrar o nome das estações e a média de atrasos
SELECT nome, mediaAtrasosMin FROM estacao;
-- 5 - Exibir o nome e tipo de usuário de todos os usuários
SELECT nome, tipoUsuario FROM usuario;
-- 6 - Listar estações com mais de 120.000 passageiros
SELECT nome, passageiros FROM estacao WHERE passageiros > 120000;
-- 7 - Listar usuários do tipo 'Estudante'
SELECT nome, idade FROM usuario WHERE tipoUsuario = 'Estudante';
-- 8 - Listar estações onde os elevadores não estão funcionando
SELECT nome FROM estacao WHERE elevadoresFuncionando = 'não';
-- 9 - Mostrar usuários com idade acima de 60
SELECT nome,idade FROM usuario WHERE idade > 60;
-- 10 - Mostrar os nomes das estações que têm elevadores funcionando
SELECT nome FROM estacao WHERE elevadoresFuncionando = 'sim';
-- 11 - Listar estações ordenadas pela média de atrasos (decrescente)
SELECT nome, mediaAtrasosMin FROM estacao ORDER BY mediaAtrasosMin DESC;
-- 12 - Listar usuários ordenados por idade (crescente)
SELECT nome, idade FROM usuario ORDER BY idade ASC;
-- 13 - Mostrar os nomes e idades dos usuários do tipo 'Trabalhador'
SELECT nome, idade FROM usuario WHERE tipoUsuario = 'Trabalhador';
-- 14 - Exibir o nome da estação e sua zona onde há bilheteria
SELECT nome, zona FROM estacao WHERE possuiBilheteria = 'sim';
-- 15 - Listar os tipos de ocorrência e a data em que aconteceram
SELECT tipo, dtOcorrencia FROM ocorrencia;


-- SELECTS MÉDIO

-- 1
-- Quais são as cinco estações com mais ocorrências de nível de gravidade alta?
SELECT e.nome, COUNT(*) AS totalOcorrenciasGraves FROM ocorrencia o 
JOIN estacao e ON o.fkestacao = e.idestacao WHERE nivelGravidade = 'Alta'
GROUP BY e.nome
ORDER BY totalOcorrenciasGraves DESC
LIMIT 5;

-- 2
-- Quais são as estações de origem com o maior tempo médio de viagem?
SELECT estacaoOrigem, ROUND(AVG(tempoViagemMin), 1) AS mediaTempoViagem FROM viagem
GROUP BY estacaoOrigem
ORDER BY mediaTempoViagem DESC;

-- 3
-- Qual tipo de bilhete gerou a maior arrecadação total?
SELECT tipo, SUM(valor) AS totalArrecadado FROM bilhete 
GROUP BY tipo;

-- 4
-- Pergunta: Qual é a forma de pagamento mais utilizada na compra de bilhetes?
SELECT formaPagamento, COUNT(*) AS totalBilhetesVendidos 
FROM bilhete 
GROUP BY formaPagamento;

-- 5
-- Quais são os usuários que mais registraram ocorrências e quantas vezes fizeram isso?
SELECT u.nome, COUNT(o.idOcorrencia) AS totalOcorrencias 
FROM usuario u 
JOIN ocorrencia o ON u.idUsuario = o.fkUsuario 
GROUP BY u.nome 
ORDER BY totalOcorrencias DESC 
LIMIT 5;

-- 6
-- Quais são as cinco estações com o maior número de passageiros?
SELECT nome, passageiros 
FROM estacao 
ORDER BY passageiros DESC 
LIMIT 5;

-- 7
-- Qual é a idade média dos usuários por categoria?
SELECT tipoUsuario, ROUND(AVG(idade), 1) AS mediaIdade 
FROM usuario 
GROUP BY tipoUsuario;

-- 8
-- Em qual mês há maior incidência de ocorrências registradas?
SELECT MONTH(dtOcorrencia) AS mes, COUNT(*) AS totalOcorrencias 
FROM ocorrencia 
GROUP BY mes 
ORDER BY totalOcorrencias DESC;

-- 9
-- Qual é a estação de destino com maior tempo médio de viagem?
SELECT estacaoDestino, ROUND(AVG(tempoViagemMin), 1) AS mediaTempoViagem 
FROM viagem 
GROUP BY estacaoDestino 
ORDER BY mediaTempoViagem DESC;

-- 10
-- Quantos usuários possuem algum tipo de relacionamento registrado no banco de dados?
SELECT COUNT(DISTINCT fkConjuge1) AS totalUsuariosRelacionados 
FROM relacionamento;


-- SELECTS DIFICEIS 

-- 1
-- Classificar usuários em Faixa Etária e mostrar a média de tempo de viagem por faixa:
SELECT 
    CASE 
WHEN u.idade <= 21 THEN 'Adolescente'
WHEN u.idade <= 59 THEN 'Adulto'
ELSE 'Idoso'
END AS faixaEtaria,
AVG(v.tempoViagemMin) AS mediaTempoViagem
FROM usuario u
JOIN viagemUsuario vu ON u.idUsuario = vu.fkUsuario
JOIN viagem v ON vu.fkViagem = v.idViagem
GROUP BY faixaEtaria;

-- 2
-- Listar TODOS os usuários e quantas viagens cada um fez (incluir usuários que não fizeram nenhuma viagem):
SELECT 
    u.nome,
    COUNT(vu.fkViagem) AS totalViagens
FROM usuario u
LEFT JOIN viagemUsuario vu 
ON u.idUsuario = vu.fkUsuario
GROUP BY u.nome
ORDER BY totalViagens DESC;

-- 3
--  Mostrar todas as estações e quantas ocorrências de nível “Alta” cada uma teve, incluindo estações sem nenhuma ocorrência “Alta”:
SELECT
    e.nome AS nomeEstacao,
    COUNT(o.idOcorrencia) AS totalOcorrenciasAltas
FROM estacao e
LEFT JOIN ocorrencia o
ON e.idEstacao = o.fkEstacao
AND o.nivelGravidade = 'Alta'
GROUP BY e.nome
ORDER BY totalOcorrenciasAltas DESC;

-- 4 CORRIGIR ESTE SELECT
-- Para cada estação, exibir quantos usuários já registraram ocorrências nela.
SELECT
  e.idEstacao,
  e.nome AS nomeEstacao,
  COUNT(DISTINCT o.fkUsuario) AS UsuariosComOcorrencia
FROM estacao e
LEFT JOIN ocorrencia o
ON e.idEstacao = o.fkEstacao
GROUP BY e.idEstacao, e.nome
ORDER BY UsuariosComOcorrencia DESC, e.nome;


-- 5
-- Para cada categoria de usuário (tipoUsuario), mostrar quantos bilhetes eles compraram e quantas ocorrências registraram. 
SELECT
  u.tipoUsuario,
  COUNT(DISTINCT b.idBilhete)  AS totalBilhetesPorTipo,
  COUNT(DISTINCT o.idOcorrencia) AS totalOcorrenciasPorTipo
FROM usuario u
LEFT JOIN bilhete b
ON u.idUsuario = b.fkUsuario
LEFT JOIN ocorrencia o
ON u.idUsuario = o.fkUsuario
GROUP BY u.tipoUsuario
ORDER BY u.tipoUsuario;