create table ambulatorio(
	nroa serial primary key,
	andar int,
	capacidade int
);

drop table ambulatorio cascade;

select * from ambulatorio;


insert into ambulatorio(andar, capacidade) values(120, 5);
insert into ambulatorio(andar, capacidade) values(110, 4);
insert into ambulatorio(andar, capacidade) values(120,6);

create table medicos(
	codm serial primary key,
	cpf int,
	nome varchar(40),
	idade int,
	cidade varchar(30),
	especialidade varchar(30),
	nroa serial,
	
	foreign key (nroa) references ambulatorio (nroa)
	
);

drop table medicos cascade;

select * from medicos;

insert into medicos(cpf,nome, idade, cidade, especialidade) values(11223343, 'josé',30, 'joao-pessoa','cirurgia');


create table pacientes(
	codp serial primary key,
	cpf int,
	nome varchar(40),
	idade int,
	cidade varchar(30),
	doenca varchar(30)
)
drop table pacientes cascade;

select * from pacientes;

insert into pacientes(cpf, nome, idade, cidade, doenca) values(10129338,'erlison',22,'joao-pessoa','covid');

create table consultas(
	data_consulta varchar(30),
	hora varchar(30),
	
	codm serial,
	codp serial,
	primary key(codm, codp),
	
	foreign key (codm) references medicos(codm),
	foreign key (codp) references pacientes(codp)
);



drop table consultas cascade;

insert into consultas(data_consulta, hora) values('18/05/2023','13h');
/*
Que apresente o nome do médico, nome do paciente e a hora da consulta;
*/
create view nomeMedico_nomePaciente_horaConsulta as select medicos.nome as "nome do medico",
pacientes.nome as "nome do paciente",
consultas.hora as "hora da consulta"
from consultas
inner join medicos
on medicos.codm = consultas.codm
inner join pacientes
on pacientes.codp = consultas.codp;
					  
select * from nomeMedico_nomePaciente_horaConsulta;
/*
– A hora da consulta, o andar do ambulatódrio e o código do médico;
*/
create view horaConsulta_andarAmbulatorio_idMedico as select consultas.hora as"horaa da consulta",
ambulatorio.andar as "velocidade da ambulancia",
medicos.codm as "id medico"
from consultas
inner join medicos
on medicos.codm = consultas.codm
inner join ambulatorio
on ambulatorio.nroa = consultas.codm;

select * from horaConsulta_andarAmbulatorio_idMedico;








