-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);


/* para workbench - local - desenvolvimento */
CREATE TABLE cliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	cpf varchar(14),
	telefone varchar(15),
);

insert into cliente values 

('Borganhês','borgvinhos@outlook.com','borvin','509.543.875-88','11989819830'),
('Quinta De Cras','quincras@outlook.com','quin','521.323.432-99','1198543-9873'),
('Edeger','edgvinhos@hotmail.com','ed198','599.984.333-90','1198994-9930'),
('Manfro Vinhos Classic','classmanfro@outlook.com','class133','992.432.432-12','119844-1147'),
('Great Vine','greatvinho@outlook.com.br','great333','231.888.901-32','1196129-9947'),
('Yellow Wine','wineyel@outlook.com.br','granwine932','832.333.873-99','1194227-1245'),
('Type Wine Class','typewine@outlook.com','type1999','987.781.000-12','1191224-1241'),
('Robert Monday','robermonday@outlook.com','robertvinho192','032.873.888-90','1195764-1547'),
('Luxurious Wine','luxuriwine@hotmail.com','luxurisystem1133','099.911.903-22','1196224-1907'),
('Wine Classic','classicwinesyle@outlook.com','classicwine982','521.654.331-90','1195229-7247');

create table usuarios 
(idUsuarios int identity (100,1),
 login varchar (40), 
 senha varchar(30),
 fkCliente int,
 foreign key (fkCliente) references cliente (idCliente));
 
create table Barril (idBarril int primary key identity (1,1),
nomeBarril varchar (20),
localArmazenamento varchar (25)
);

create table Sensor 
(idSensor int primary key identity (200,1), 
nomeSensor varchar (15), 
statusSensor varchar(15), 
check (statusSensor = 'ativo' or statusSensor = 'inativo'),
fkBarril int,
foreign key (fkBarril) references Barril (idBarril)
);

create table vinhos 
 (idVinho int primary key identity (1,1),
 tipo_vinho varchar(15),
 temperatura_ideal float,
 temperatura_min float,
 temperatura_max float);

alter table barril add fkVinho int;
alter table barril add foreign key (fkVinho) references vinhos (idVinho);

insert into Vinhos values 
 ('Rosé','14','12','15'),
 ('Tinto Médio','17','16','18'),
 ('Branco','8','6','12');

 alter table barril add fkCliente int;
 alter table barril add foreign key (fkCliente) references cliente (idCliente);

 insert into barril values 
 ('Barril Alfa','Corredor 1','1','1'),
 ('Barril Beta','Corredor 1','2','1'),
 ('Barril Omega','Adega 1','3','1'),
 ('Barril T1','Adega 2','2','2'),
 ('Barril T2','Adega 2','3','2'),
 ('Barril T3','Adega 2','1','2');

 insert into sensor values 
('Sensor A','ativo','1'),
('Sensor B','ativo','2'),
('Sensor C','ativo','3'),
('Sensor D','ativo','4'),
('Sensor E','ativo','5'),
('Sensor F','ativo','6');

create table leitura 
(idLeitura int primary key identity (1,1),
 momento datetime default current_timestamp, 
 temperatura_lm35 float,
 fkSensor int,
 foreign key (fkSensor) references sensor (idSensor));

insert into usuarios values
 ('borg145','borvin','1'),
 ('borg146','estagiarioborv','1'),
 ('quintacras1','admquinta','2'),
 ('quintacras2','estagiario1','2');