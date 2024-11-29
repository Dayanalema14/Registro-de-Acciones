const apiUrl = "http://localhost:8000";

// Función para obtener y mostrar las acciones
async function loadStocks() {
  const response = await fetch(apiUrl);
  const stocks = await response.json();
  const tableBody = document.getElementById("stocks-table-body");
  tableBody.innerHTML = ""; // Limpiar tabla

  stocks.forEach(stock => {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${stock.ticker}</td>
      <td>${stock.quantity}</td>
      <td>$${stock.buy_price.toFixed(2)}</td>
      <td>${stock.buy_date}</td>
      <td>${stock.current_price ? `$${stock.current_price.toFixed(2)}` : "N/A"}</td>
      <td>${stock.profit_loss !== null ? `$${stock.profit_loss.toFixed(2)}` : "N/A"}</td>
      <td>${stock.profit_loss_percentage !== null ? `${stock.profit_loss_percentage.toFixed(2)}%` : "N/A"}</td> <!-- Nueva columna -->
    `;
    tableBody.appendChild(row);
  });
  
}


// Función para eliminar todos los stocks
async function deleteAllStocks() {
  const response = await fetch(`${apiUrl}/delete`, {
    method: "DELETE", // Tipo de solicitud DELETE
  });

  if (response.ok) {
    alert("Todos los stocks han sido eliminados");
    loadStocks(); // Actualizar la tabla
  } else {
    const error = await response.json();
    alert(`Error: ${error.message}`);
  }
}

// Inicializar el evento del botón de eliminar todos
document.getElementById("delete-all-btn").addEventListener("click", deleteAllStocks);



// Función para registrar una nueva acción
async function registerStock(event) {
  event.preventDefault();

  const ticker = document.getElementById("ticker").value;
  const quantity = parseInt(document.getElementById("quantity").value, 10);
  const purchasePrice = parseFloat(document.getElementById("purchasePrice").value);
  const purchaseDate = document.getElementById("purchaseDate").value;

  const stock = { ticker, quantity, purchasePrice, purchaseDate };

  const response = await fetch(`${apiUrl}/register`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(stock)
  });

  if (response.ok) {
    alert("Stock registrado exitosamente!");
    document.getElementById("stock-form").reset();
    loadStocks(); // Actualizar tabla
  } else {
    const error = await response.json();
    alert(`Error: ${error.message}`);
  }
}

// Inicializar eventos
document.getElementById("stock-form").addEventListener("submit", registerStock);

// Cargar acciones al inicio
loadStocks();
