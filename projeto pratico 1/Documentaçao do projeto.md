# 1º Projeto Prático - Trilha de Dados - Desenvolve 2024 Grupo Boticário

O desafio proposto era criar um banco de dados relacional que represente as operações de vendas, o sistema de pontos e o controle de estoque do Boticário. O objetivo é compreender e aplicar os conceitos de identificação de entidades, relacionamentos e atributos, culminando na elaboração da modelagem lógica e física do banco de dados.
Eu escolhi o segmento de loja física do Boticário como cenário imaginário.

## Etapas do Projeto

**Análise dos requisitos:** O projeto de banco de dados para a loja do Boticário foi iniciado com uma análise detalhada dos requisitos do sistema, com o objetivo de compreender completamente as necessidades do negócio e dos usuários finais. Essa análise foi conduzida em estreita colaboração com as partes interessadas relevantes, incluindo representantes da equipe de vendas, gerentes de lojas e administradores do sistema. **(cenário imaginário)**
**Modelo Lógico:** Transferir conceitos e requisitos em um modelo de dados organizado. Isso envolveu a criação do Diagrama Entidade-Relacionamento (DER), a normalização das tabelas para reduzir redundância e inconsistência, e a definição de chaves primárias e estrangeiras para garantir integridade. O resultado foi um modelo detalhado que serve como base para a implementação do banco de dados físico. Etapa realizado no programa MySQL Workbench.
**Normalização:** A normalização do diagrama lógico foi uma etapa crucial no processo de desenvolvimento do banco de dados para o projeto do Boticário. Seguindo as melhores práticas de modelagem de dados, foram realizados os seguintes passos de normalização:
1 - Identificação das Dependências Funcionais: Inicialmente, foram identificadas todas as dependências funcionais entre os atributos das entidades do diagrama lógico.
2 - Primeira Forma Normal (1FN): Cada tabela foi avaliada para garantir que todos os seus atributos sejam atômicos, ou seja, não divisíveis em partes menores.
3 - Segunda Forma Normal (2FN): Em seguida, verificou-se se cada tabela possui uma chave primária de forma que todos os outros atributos dependam completamente dela, eliminando assim as dependências parciais.
4 - Terceira Forma Normal (3FN): As tabelas foram refinadas para garantir que todos os atributos não dependentes da chave primária sejam removidos e colocados em suas próprias tabelas.
**Modelo Físico:** transformei o modelo lógico em estruturas de banco de dados reais, utilizei uma linguagem específica, SQL. Isso envolve a criação das tabelas, definição de tipos de dados, índices e restrições de integridade. O objetivo é implementar o banco de dados de acordo com as necessidades do sistema, otimizando o desempenho e garantindo a segurança dos dados. Etapa realizado no programa MySQL Workbench.
**Documentação:** 
