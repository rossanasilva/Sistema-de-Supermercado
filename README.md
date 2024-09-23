# Projeto de Banco de Dados

### Professora: Ana Liz
### Aluna: Rossana Laurentino da Silva

O projeto consiste na:

- Interpretação dos requisitos e criação de um modelo relacional coerente com os requisitos;
- Criação do banco de dados, criação de tabelas e inserção de dados coerentes para cada tabela no contexto dos requisitos do sistema;
- Criatividade e coerência na inserção dos dados relacionados com o contexto e nas consultas a serem criadas.

### Requisitos do Sistema

O sistema a ser construído é para um supermercado que oferece, além das compras presenciais, compras online com delivery ou retiradas em loja. O sistema precisa cadastrar os clientes armazenando o nome, endereço, telefone. Os clientes fazem compras de produtos, que precisam cadastrar nome do produto, a descrição do produto, o preço unitário, a quantidade em estoque e o código do fornecedor. Assim, é necessário também armazenar os dados do fornecedor, o nome da empresa, endereço e outros dados necessário. Os funcionários do supermercado também precisam ser cadastrados no banco com dados pertinentes para funcionários. O cliente pode fazer o pedido da compra de três formas: presencial, retirar no supermercado ou delivery. Então o pedido precisa cadastrar o código do cliente, o código do funcionário que atendeu o cliente (no caso de compras presenciais será o próprio caixa), a data do pedido, armazenar se o pedido foi feito pelo cliente presencial, vai ser retirado no supermercado ou vai ser entregue via delivery. Os itens do pedido são registrados em sua própria tabela, registrando o código do pedido, o código do produto, o preço, a quantidade daqueles itens e uma coluna para ser registrado a porcentagem de desconto (que pode ser nula, caso não haja desconto para o item).

O sistema também precisa permitir a realização de consultas. As consultas obrigatórias de serem implementadas são:

a) Exibir o nome dos clientes que realizaram compras via delivery no mês de janeiro de 2024.

b) Exibir o nome do funcionário e a quantidade de pedidos quem cada funcionário já atendeu no primeiro semestre de 2024.

c) Exibir o total do valor dos pedidos que já foram feitos, agrupando por presencial, retirada em loja e delivery.

d) Exibir o nome de todos os fornecedores e os produtos que ele fornece. Exibir em ordem alfabética.

e) Exibir o valor total do pedido de um cliente (você pode escolher o cliente).

Além dessas consultas, você precisa criar 4 novas consultas que sejam pertinentes ao contexto do sistema. Essas consultas precisam, no mínimo, consultar duas tabelas para exibir o resultado. Além disso, devem usar, ao menos, uma das funções a seguir em cada consulta: SUM(), CONT(), JOIN ON, LIKE ... BETWEEN... MIN(), MAX(). Você pode criar no banco mais tabelas que achar pertinente, além das já descritas nos requisitos. Você pode criar mais consultas que achar pertinente.

As 4 consultas adicionadas foram:

1. Listar os produtos com estoque abaixo de 50 unidades e seus respectivos fornecedores.

2. Calcular o valor médio dos pedidos por tipo de pedido.

3. Encontrar o cliente que fez o pedido de maior valor.

4. Listar os funcionários que atenderam pedidos no último mês.