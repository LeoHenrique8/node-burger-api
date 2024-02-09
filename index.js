let orders = [
  { id: "ac3ebf68-e0ad-4c1d-9822-ff1b849589a8", order: "X- Salada, 2 batatas grandes, 1 coca-cola", clientName: "José", price: 44.50, status: "Em preparação" },
  { id: "ac3ebas-e0ad-4c1d-9822-ff1b849589a8", order: "X- Bacon, 2 batatas médias 1 coca-cola", clientName: "Paulo", price: 41.50, status: "Em preparação" }
];

const express = require('express');
const app = express();
app.use(express.json());
const uuid = require('uuid');

const checkOrderId = (request, response, next) => {
  const { id } = request.params;
  const index = orders.findIndex(item => item.id === id);

  if (index === -1) {
    return response.status(404).json({ message: "Pedido não encontrado" });
  }

  request.orderIndex = index;
  request.orderId = id;
  next();
};

const showMeta = (request, response, next) => {
  const method = request.method;
  const url = request.url;

  console.log("Método: ", method, "\nURL: ", url);
  next();
};

// Lista todos os pedidos
app.get("/orders", showMeta, (request, response) => {
  return response.json(orders);
});

// Lista um pedido específico
app.get("/orders/:id", showMeta, checkOrderId, (request, response) => {
  const index = request.orderIndex;
  return response.json(orders[index]);
});

// Cria um novo pedido
app.post("/orders", showMeta, (request, response) => {
  const { order, clientName, price } = request.body;
  const newOrder = {
    id: uuid.v4(),
    order,
    clientName,
    price,
    status: "Em preparação"
  };

  orders.push(newOrder);
  return response.status(201).json(newOrder);
});

// Altera o status para "Pronto"
app.patch("/orders/:id", showMeta, checkOrderId, (request, response) => {
  const index = request.orderIndex;
  orders[index].status = "Pronto";
  return response.json(orders[index]);
});

// Altera um pedido existente
app.put("/orders/:id", showMeta, checkOrderId, (request, response) => {
  const { order, clientName, price } = request.body;
  const index = request.orderIndex;
  const updatedOrder = { order, clientName, price };

  orders[index] = { ...orders[index], ...updatedOrder };
  return response.json(updatedOrder);
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
