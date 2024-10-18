##criar uma view
create view vw_lista_funcionarios as
select nome_fun, especialidade
from funcionarios;

#utilizando a view criada 
select * from vw_lista_funcionarios;

create view vw_lista_dependente as
select nome_dep
from dependentes;

select * from vw_lista_dependentes;

create view vw_funcionario_com_dependente as
select funcionarios.nome_fun, dependentes.nome_dep
from funcionarios
inner join dependentes
on funcionarios.cod_fun = dependentes.cod_fun;

select * from vw_funcionario_com_dependente;

create view vw_funcionario_e_dependente as
select funcionarios.nome_fun, dependentes.nome_dep
from funcionarios
left join dependentes
on funcionarios.cod_fun = dependentes.cod_fun;

select * from vw_funcionario_e_dependente;

create view vw_dependente as
select funcionarios.nome_fun, dependentes.nome_dep
from funcionarios
right join dependentes
on funcionarios.cod_fun = dependentes.cod_fun;

select * from vw_dependente;






