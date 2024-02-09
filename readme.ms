
Hamburgueria Node.js App
Este é um aplicativo Node.js para gerenciar os pedidos de uma hamburgueria. Utilizando o framework Express, a aplicação oferece operações básicas de criação, leitura, atualização e exclusão (CRUD) dos pedidos, além de algumas funcionalidades específicas, como alterar o status do pedido para "Pronto".

Instalação
Certifique-se de ter o Node.js instalado em sua máquina antes de prosseguir.

Clone o repositório e acesse o diretório do projeto:

Instale as dependências:


npm install
Inicie o servidor:


npm start
O servidor estará em execução em http://localhost:3000.

Rotas
GET /orders
Retorna a lista de todos os pedidos.

Exemplo de Uso:


curl http://localhost:3000/orders
GET /orders/:id
Retorna detalhes de um pedido específico.

Exemplo de Uso:


curl http://localhost:3000/orders/ac3ebf68-e0ad-4c1d-9822-ff1b849589a8
POST /orders
Cria um novo pedido.

Parâmetros:

order (string): Descrição do pedido.
clientName (string): Nome do cliente.
price (number): Valor do pedido.


Exemplo de Uso:


curl -X POST -H "Content-Type: application/json" -d '{"order": "X-Salada, 2 batatas grandes, 1 coca-cola", "clientName": "José", "price": 44.50}' http://localhost:3000/orders
PUT /orders/:id
Atualiza um pedido existente.

Parâmetros:

id (string): ID único do pedido a ser atualizado.
order (string, opcional): Nova descrição do pedido.
clientName (string, opcional): Novo nome do cliente.
price (number, opcional): Novo valor do pedido.

Exemplo de Uso:


curl -X PUT -H "Content-Type: application/json" -d '{"order": "X-Bacon", "price": 50.00}' http://localhost:3000/orders/ac3ebf68-e0ad-4c1d-9822-ff1b849589a8
PATCH /orders/:id
Altera o status de um pedido para "Pronto".

Exemplo de Uso:


curl -X PATCH http://localhost:3000/orders/ac3ebf68-e0ad-4c1d-9822-ff1b849589a8
DELETE /orders/:id
Exclui um pedido existente.

Exemplo de Uso:


curl -X DELETE http://localhost:3000/orders/ac3ebf68-e0ad-4c1d-9822-ff1b849589a8

Middlewares
ID Verification Middleware
Verifica se o ID passado como parâmetro existe. Retorna um erro se o ID não existir.

Request Logging Middleware
Exibe no console o método da requisição e a URL. Adicionado a todas as requisições.
