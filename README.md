# hospitalDB - consultas & join's

Olá! 👋 Este repositório foi criado exclusivamente para compartilhar conhecimento sobre SQL e sua sintaxe básica.

No arquivo hospitalDB, foram utilizadas consultas propostas em um desafio feito em sala de aula, onde utilizamos joins para juntar dados entre as tabelas (ambulatorio, medicos, pacientes, consultas).

- Tabela "ambulatorio": capacidade e velocidade;

- Tabela "medicos": nome, cpf e especialidade. A tabela "medicos" possui a chave estrangeira de "ambulatorio";

- Tabela "paciente": nome, cpf e doença;

- Tabela "consultas": hora e data de cada consulta. A tabela "consultas" é utilizada para criar uma relação entre as tabelas e possui duas chaves estrangeiras de "medico" e "paciente".

Comandos SQL abaixo:

**Criar tabela:**

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


