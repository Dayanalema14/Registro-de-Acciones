const axios = require('axios');
const { Stock } = require('../models/Stock');

class StockController {
  // Obtener todos los stocks
  static async getStocks(req, res) {
    try {
      const stocks = await Stock.getAll();
      res.json(stocks);
    } catch (error) {
      res.status(500).json({ 
        message: 'Error al obtener los stocks', 
        error: error.message 
      });
    }
  }



  // Eliminar todos los stocks
  static async deleteStocks(req, res) {
    try {
      await Stock.deleteAll();
      res.status(200).json({ message: 'Todos los stocks han sido eliminados' });
    } catch (error) {
      res.status(500).json({ 
        message: 'Error al eliminar los stocks', 
        error: error.message 
      });
    }
  }





  // Registrar un nuevo stock
  static async registerStock(req, res) {
    try {
      const { ticker, quantity, purchasePrice, purchaseDate } = req.body;
  
      // Obtener precio actual de la acción
      const currentPrice = await StockController.getStockValue(ticker);
      
      // Calcular ganancias/pérdidas
      const profitLoss = (currentPrice - purchasePrice) * quantity;
  
      // Calcular ganancias/pérdidas en porcentaje
      const profitLossPercentage = ((currentPrice - purchasePrice) / purchasePrice) * 100;
  
      // Crear nueva instancia de Stock
      const newStock = new Stock(
        ticker, 
        quantity, 
        purchasePrice, 
        purchaseDate, 
        currentPrice,
        profitLoss,
        profitLossPercentage  // Incluir el porcentaje
      );
  
      // Guardar en base de datos
      const savedStock = await newStock.save();
      
      res.status(201).json({
        message: 'Stock registrado exitosamente',
        stock: savedStock
      });
    } catch (error) {
      res.status(500).json({ 
        message: 'Error al registrar stock', 
        error: error.message 
      });
    }
  }
  

  // Obtener valor actual de la acción
  static async getStockValue(ticker) {
    const apiKey = process.env.ALPHA_VANTAGE_API_KEY;
    try {
      const response = await axios.get('https://www.alphavantage.co/query', {
        params: {
          function: 'TIME_SERIES_DAILY',
          symbol: ticker,
          apikey: apiKey,
        },
      });

      const latestDate = Object.keys(response.data['Time Series (Daily)'])[0];
      return parseFloat(response.data['Time Series (Daily)'][latestDate]['4. close']);
    } catch (error) {
      console.error('Error al obtener el valor de la acción:', error);
      throw error;
    }
  }
}

module.exports = StockController;