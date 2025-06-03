create database MetroData;
use MetroData;

create table estacao(
idEstacao int primary key auto_increment,
nome varchar(45),
zona varchar(45),
possuiBilheteria char(3),
passaegeiros varchar(45),
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
tipoUsuario varchar(45),
fkUsuario int,
constraint fkUsuUsu foreign key (fkUsuario) references usuario(idUsuario));

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


