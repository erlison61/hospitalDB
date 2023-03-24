# hospitalDB - consultas & join's

olá 👋, este repositorio foi criado exclusivamente para compartilhar conhecimento sobre SQL e sua sintaxe basica.

no arquivo hospitalDB foram utilizados consultas propostas no desafio feito em sala de aula, onde utilizamos
join's para juntar dados entre tabelas (ambulatorio, medicos, pacientes, consultas)

- ambulatorio: capacidade e velocidade;

- medicos: nome, cpf e especialidade\n
    medicos tem a chave estrangeira de ambulatorio;
    
- paciente: nome, cpf e doença;

- consultas: hora e data de cada consulta\n
    a tabela consulta é utilizada para criar uma relação 
    entre as tabelas e tem duas chaves estrangeiras de 
    medico e paciente;
    
    
comandos sql abaixo:

// criar tabela:
  create table nome_da_tabela(
    ...
  );

//inserir na tabela:
  insert into nome_da_tabela(...) values(...);

//atualizar tabela:                                   #exemplo: id=1;
  update nome_da_tabela set nome_da_coluna= novo_valor where condicao_de_filtragem;

//deletar tabela:
  drop table nome_da_tabela;

//criar uma chave-estrangeira:
  FOREIGN KEY (CAMPO_NA_TABELA_ORIGEM)
  REFERENCES TABELA_DESTINO (CAMPO_NA_TABELA DESTINO);


//inner join
  SELECT * FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id;


  SELECT aluno.nome as aluno,
         curso.nome as curso
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;


