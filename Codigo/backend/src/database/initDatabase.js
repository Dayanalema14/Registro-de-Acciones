const sqlite3 = require('sqlite3').verbose();
const path = require('path');

// Ruta a la base de datos
const dbPath = path.resolve(__dirname, '../../database/stocks.db');

// Crear una nueva base de datos
const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error('Error al crear la base de datos:', err.message);
  }
});

// Crear tabla de stocks
db.serialize(() => {
  db.run(`CREATE TABLE IF NOT EXISTS stocks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ticker TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    buy_price REAL NOT NULL,
    buy_date TEXT NOT NULL,
    current_price REAL,
    profit_loss REAL,
    profit_loss_percentage REAL  -- Nueva columna para el porcentaje
  )`, (err) => {
    if (err) {
      console.error('Error al crear la tabla stocks:', err.message);
    } else {
      console.log('Tabla stocks creada exitosamente');
    }
  });

  // Cerrar la conexión
  db.close((err) => {
    if (err) {
      console.error('Error al cerrar la conexión:', err.message);
    } else {
      console.log('Conexión a la base de datos cerrada');
    }
  });
});