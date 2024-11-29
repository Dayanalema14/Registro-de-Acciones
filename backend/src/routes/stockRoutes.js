const express = require('express');
const StockController = require('../controllers/StockController');

const router = express.Router();

router.get('/', StockController.getStocks);
router.post('/register', StockController.registerStock);



router.delete('/delete', StockController.deleteStocks);

module.exports = router;