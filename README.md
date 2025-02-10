Projeto Banco de Dados - E-commerce

Descrição do Projeto

Este projeto consiste na modelagem e implementação de um banco de dados para um sistema de e-commerce. O objetivo é criar um esquema lógico que suporte as operações essenciais de um e-commerce, garantindo integridade dos dados e eficiência nas consultas.

Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas principais:

clientes: Armazena informações sobre clientes PF e PJ.

vendedores: Contém dados dos vendedores cadastrados na plataforma.

fornecedores: Lista os fornecedores dos produtos disponíveis.

produtos: Registra os produtos com seus respectivos fornecedores e estoque.

pedidos: Gerencia os pedidos realizados pelos clientes.

itens_pedido: Relaciona os produtos incluídos em cada pedido.

pagamentos: Armazena as formas de pagamento cadastradas pelos clientes.

Refinamentos no Modelo

Clientes podem ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas nunca ambas ao mesmo tempo.

Um cliente pode cadastrar mais de uma forma de pagamento.

Pedidos possuem status e código de rastreamento para acompanhamento da entrega.

Script SQL

O script SQL presente neste repositório realiza:

Criação do banco de dados e suas tabelas.

Definição das chaves primárias e estrangeiras.

Inserção de dados iniciais para testes.

Consultas SQL complexas, incluindo:

Recuperação de pedidos por cliente.

Identificação de vendedores que também são fornecedores.

Relação de produtos, fornecedores e estoques.

Listagem de nomes de fornecedores e seus produtos.

Como Executar

Certifique-se de ter o MySQL instalado.

Abra o MySQL Workbench ou terminal.

Execute o script SQL contido neste repositório.

Utilize as queries para análise dos dados.

Perguntas Respondidas pelas Consultas

Quantos pedidos foram feitos por cada cliente?

Algum vendedor também é fornecedor?

Qual a relação de produtos, fornecedores e estoques?

Quais os nomes dos fornecedores e os produtos que fornecem?
