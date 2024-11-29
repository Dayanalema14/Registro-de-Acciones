const db = require('../database/database');

class Stock {
  constructor(ticker, quantity, buyPrice, buyDate, currentPrice, profitLoss, profitLossPercentage) {
    this.ticker = ticker;
    this.quantity = quantity;
    this.buyPrice = buyPrice;
    this.buyDate = buyDate;
    this.currentPrice = currentPrice;
    this.profitLoss = profitLoss;
    this.profitLossPercentage = profitLossPercentage;  // Nueva propiedad
  }



  // Eliminar todos los stocks de la base de datos
  static deleteAll() {
    return new Promise((resolve, reject) => {
      const query = 'DELETE FROM stocks';
      
      db.run(query, function(err) {
        if (err) {
          reject(err);
        } else {
          resolve({ message: 'Todos los stocks han sido eliminados' });
        }
      });
    });
  }







  // Guardar un nuevo stock en la base de datos
  save() {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO stocks 
        (ticker, quantity, buy_price, buy_date, current_price, profit_loss, profit_loss_percentage) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
      `;
      
      db.run(
        query, 
        [
          this.ticker, 
          this.quantity, 
          this.buyPrice, 
          this.buyDate, 
          this.currentPrice, 
          this.profitLoss,
          this.profitLossPercentage  // Guardar el porcentaje
        ],
        function(err) {
          if (err) {
            reject(err);
          } else {
            resolve({
              id: this.lastID,
              ...this
            });
          }
        }
      );
    });
  }

  // Obtener todos los stocks
  static getAll() {
    return new Promise((resolve, reject) => {
      const query = 'SELECT * FROM stocks ORDER BY buy_date DESC';
      
      db.all(query, [], (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      });
    });
  }

  // Obtener stock por ID
  static getById(id) {
    return new Promise((resolve, reject) => {
      const query = 'SELECT * FROM stocks WHERE id = ?';
      
      db.get(query, [id], (err, row) => {
        if (err) {
          reject(err);
        } else {
          resolve(row);
        }
      });
    });
  }
}

module.exports = { Stock };
