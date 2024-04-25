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

**Documentação:** a documentação do projeto foi elaborada como parte integrante do processo de desenvolvimento. Esta etapa abrangeu a descrição detalhada dos requisitos, a modelagem do banco de dados, incluindo a normalização e a definição da estrutura física, bem como as justificativas por trás delas. 


## Modelo lógico

Segue as informações detalhadas sobre cada tabela, incluindo seus campos, tipos de dados, chaves primárias, chaves estrangeiras e qualquer outra restrição relevante:

*Tabela: tb_cliente*

Descrição: Armazena informações sobre os clientes.

Campos:
id_cliente (chave primária, inteiro): Identificador único do cliente.
nome (texto): Nome do cliente.
telefone (inteiro): Número de telefone do cliente.
endereco (texto): Endereço do cliente.
doc_ident (inteiro): Número de documento de identificação do cliente.

*Tabela: tb_loja*

Descrição: Contém informações sobre as lojas.

Campos:
id_loja (chave primária, inteiro): Identificador único da loja.
nome_loja (texto): Nome da loja.
telefone (inteiro): Número de telefone da loja.
email (texto): Endereço de e-mail da loja.

*Tabela: tb_vendedor*

Descrição: Armazena informações sobre os vendedores.

Campos:
id_vendedor (chave primária, inteiro): Identificador único do vendedor.
nome_vendedor (texto): Nome do vendedor.
cargo (texto): Cargo do vendedor.
email (texto): Endereço de e-mail do vendedor.
loja_id_loja (chave estrangeira, inteiro): ID da loja à qual o vendedor está associado.

*Tabela: tb_pedido*

Descrição: Registra informações sobre os pedidos.

Campos:
id_pedido (chave primária, inteiro): Identificador único do pedido.
valor (decimal): Valor do pedido.
data (data): Data do pedido.
tb_cliente_id_cliente (chave estrangeira, inteiro): ID do cliente que fez o pedido.
tb_vendedor_id_vendedor (chave estrangeira, inteiro): ID do vendedor associado ao pedido.
tb_vendedor_loja_id_loja (chave estrangeira, inteiro): ID da loja à qual o vendedor está associado.

*Tabela: tb_programa_pontos*

Descrição: Armazena informações sobre os programas de pontos.

Campos:
id_programa (chave primária, inteiro): Identificador único do programa de pontos.
nome_programa (texto): Nome do programa de pontos.
taxa_conversao (decimal): Taxa de conversão de pontos.

*Tabela: tb_produto*

Descrição: Contém informações sobre os produtos.

Campos:
id_produto (chave primária, inteiro): Identificador único do produto.
nome_produto (texto): Nome do produto.
valor (decimal): Valor do produto.

*Tabela: tb_estoque*

Descrição: Mantém informações sobre o estoque de produtos nas lojas.

Campos:
id_produto (chave estrangeira, inteiro): ID do produto.
qtd_produtos (inteiro): Quantidade de produtos em estoque.
tb_loja_id_loja (chave estrangeira, inteiro): ID da loja.

*Tabela: tb_pontos_cliente*

Descrição: Registra os pontos ganhos pelos clientes.

Campos:
pontos_id (chave primária, inteiro): Identificador único do registro de pontos.
pontos_gerados (decimal): Quantidade de pontos gerados.
data_geracao (data): Data de geração dos pontos.
cliente_id_cliente (chave estrangeira, inteiro): ID do cliente.
programa_pontos_id_programa (chave estrangeira, inteiro): ID do programa de pontos.

*Tabela: tb_endereco*

Descrição: Armazena informações sobre os endereços dos clientes.

Campos:
rua (texto): Nome da rua.
numero (inteiro): Número do endereço.
bairro (texto): Nome do bairro.
cidade (texto): Nome da cidade.
estado (texto): Nome do estado.
cliente_id_cliente (chave estrangeira, inteiro): ID do cliente associado ao endereço.

*Tabela: tb_pedido_has_tb_produto*

Descrição: Associa produtos aos pedidos.

Campos:
tb_pedido_id_pedido (chave estrangeira, inteiro): ID do pedido.
tb_pedido_tb_cliente_id_cliente (chave estrangeira, inteiro): ID do cliente associado ao pedido.
tb_produto_id_produto (chave estrangeira, inteiro): ID do produto


**Espero que esta documentação seja útil para compreender a estrutura e o propósito de cada tabela neste banco de dados.**
