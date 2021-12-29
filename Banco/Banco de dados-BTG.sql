-- criar banco de dados
create database dbbtgplus;

use dbbtgplus;

create table tbusuarios(
	iduser int primary key,
	usuario varchar(50) not null,
	fone varchar(15),
	login varchar(15) not null unique,
	senha varchar(15) not null,
    perfil varchar(20) not null
);

insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values(1,'Administrador','00000-0000','admin','admin','admin');

create table tbclientes(
	idcli int primary key auto_increment,
	nomecli varchar(50) not null,
	endcli varchar(75),
	fonecli varchar(50) not null,
	emailcli varchar(50) not null,
	cpfcli varchar(11) not null
);

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cpfcli)
values('Maria Clara Martins','Não faço ideia','11 3383-6297','M.Martins@btgpactual.com','12345678910');

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cpfcli)
values('Amanda Pires','Não sei...','619253-8538','Amanda.Pires@btgpactual.com','12345678910');

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cpfcli)
values('Ricardo S. Alves','Não sei...','619999-9999','Ricardo-S.Alves@btgpactual.com','12345678910');

create table tbbanco(
CO int primary key auto_increment,
data_os timestamp default current_timestamp,
valor_saque decimal(10,2),
valor_deposito decimal(10,2),
valor_saldo decimal(10,2) generated always as (valor_saque - valor_deposito) VIRTUAL,
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);
