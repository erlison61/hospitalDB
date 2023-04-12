create table ambulatorio(
	nroa serial primary key,
	andar int,
	capacidade int
);

drop table ambulatorio;

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

drop table medicos;

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
drop table pacientes;

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



drop table consultas;

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
on consultas.codm = medicos.codm
inner join ambulatorio
on consultas.codm = ambulatorio.nroa;

select * from horaConsulta_andarAmbulatorio_idMedico;

/*todas os medicos, data e hora da consulta*/
CREATE VIEW consulta_medicos AS 
SELECT nome as "nome do medico", data_consulta as "data da consulta", hora as "hora da consulta" 
FROM medicos m 
LEFT JOIN consultas c ON medicos.codm = consultas.codm;

SELECT * FROM consulta_medicos;

/*A idade dos pacientes, doença, nome dos médicos e o código dos ambulatórios.*/
CREATE VIEW consulta_pacientes AS 
SELECT idade , doença, nome, ambulatorio.nroa 
FROM pacientes
JOIN consultas ON pacientes.codp = consultas.codp 
JOIN medicos  ON medicos.codm = consultas.codm 
JOIN ambulatorios  ON ambulatorio.nroa = medicos.nroa;

SELECT * FROM consulta_pacientes;





