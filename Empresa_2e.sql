create database empresa_2e;
use  empresa_2e;

create table departamento(
id_departamento int auto_increment primary key not null,
nome_departamento  varchar (255)
);

create table funcionario(
id_funcionario int auto_increment primary key not null,
salario decimal,
nome_funcionario  varchar (255),
id_departamento int,
foreign key (id_departamento) references departamento (id_departamento)
);

create table dependente(
id_dependente int auto_increment primary key not null,
nome_dependente varchar (255),
id_funcionario int,
foreign key (id_funcionario) references funcionario (id_funcionario)
);

insert into departamento (nome_departamento)
	values ("Financeiro"),
           ("RH"),
           ("Engenharia"),
           ("Markting");
           
    select * from departamento;       
           
 insert into funcionario (salario, nome_funcionario,id_departamento)
	values (10.000,"Andreia",1),
           (10.000,"Luci",2),
           (10.000,"Edna",3),
           (10.000,"Adriana",4);  
           
     select * from funcionario;   
     
     
     insert into dependente (nome_dependente,id_funcionario)
	values ("Isabella",1),
           ("Maria Julia",2),
           ("Giovana",3),
           ("Lorena",3),
           ("Maria Clara",4);
           
           select * from departamento;
		   select * from funcionario;
	       select * from dependente;

select f.nome_funcionario as funcionario, count(d.id_dependente) AS quantidade_dependentes
from funcionario f
join dependente d on f.id_funcionario = d.id_funcionario
group by f.nome_funcionario
having count(d.id_dependente) > 1;

SELECT d.nome_departamento AS departamento, f.nome_funcionario AS funcionario
FROM departamento d
LEFT JOIN funcionario f ON d.id_departamento = f.id_funcionario
ORDER BY d.nome_departamento ASC, f.nome_funcionario ASC;

SELECT f.nome_funcionario AS funcionario
FROM funcionario f
LEFT JOIN dependente d ON f.id_funcionario = d.id_dependente
WHERE d.nome_dependente IS NULL;

SELECT d.nome_departamento AS departamento, AVG(f.salario) AS media_salarial
FROM departamento d
LEFT JOIN funcionario f ON d.id_departamento = f.id_funcionario
GROUP BY d.nome_departamento;

SELECT SUM(salario) AS total_salarios
FROM funcionario;

SELECT d.nome_departamento AS departamento, SUM(f.salario) AS custo_setor
FROM departamento d
LEFT JOIN funcionario f ON d.id_departamento = f.id_departamento
GROUP BY d.nome_departamento;