import ec.epn.edu.ec.stocks.model.Stock;
import ec.epn.edu.ec.stocks.service.StockService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class StockServiceProfitTest {

    private StockService stockService;

    @BeforeEach
    void setUp() {
        stockService = new StockService();
    }

    @Test
    void shouldReturnZeroProfit_WhenCurrentPriceIsZero() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(0.0);

        double profit = stockService.calculateProfit(stock);

        assertEquals(0.0, profit, "Profit should be zero when current price is zero.");
    }

    @Test
    void shouldReturnCorrectProfit_WhenCurrentPriceIsHigherThanPurchasePrice() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(200.0);

        double profit = stockService.calculateProfit(stock);

        assertEquals(500.0, profit, "Profit should be correctly calculated for a higher current price.");
    }

    @Test
    void shouldReturnCorrectLoss_WhenCurrentPriceIsLowerThanPurchasePrice() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(100.0);

        double profit = stockService.calculateProfit(stock);

        assertEquals(-500.0, profit, "Profit should reflect loss for a lower current price.");
    }

    @Test
    void shouldReturnZeroProfitPercentage_WhenCurrentPriceIsZero() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(0.0);

        double profitPercentage = stockService.calculateProfitPercentage(stock);

        assertEquals(0.0, profitPercentage, "Profit percentage should be zero when current price is zero.");
    }

    @Test
    void shouldReturnCorrectProfitPercentage_WhenCurrentPriceIsHigherThanPurchasePrice() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(200.0);

        double profitPercentage = stockService.calculateProfitPercentage(stock);

        assertEquals(33.33, Math.round(profitPercentage * 100.0) / 100.0,
                "Profit percentage should be correctly calculated for a higher current price.");
    }

    @Test
    void shouldReturnCorrectLossPercentage_WhenCurrentPriceIsLowerThanPurchasePrice() {
        Stock stock = new Stock("Apple Inc.", "AAPL", LocalDate.now(), 10, 150.0);
        stock.setCurrentPrice(100.0);

        double profitPercentage = stockService.calculateProfitPercentage(stock);

        assertEquals(-33.33, Math.round(profitPercentage * 100.0) / 100.0,
                "Profit percentage should reflect loss for a lower current price.");
    }

    @Test
    public void testSortByName() {
        List<Stock> stocks = Arrays.asList(
                new Stock("Apple Inc", "AAPL", LocalDate.now(), 10, 150.0),
                new Stock("Microsoft", "MSFT", LocalDate.now(), 20, 200.0),
                new Stock("Amazon Inc", "AMZN", LocalDate.now(), 40, 100.0)
        );
        stocks = stocks.stream()
                .sorted(Comparator.comparing(Stock::getCompanyName))
                .collect(Collectors.toList());

        assertEquals("Amazon Inc", stocks.get(0).getCompanyName());
        assertEquals("Apple Inc", stocks.get(1).getCompanyName());
        assertEquals("Microsoft", stocks.get(2).getCompanyName());
    }

    @Test
    public void testSortByProfitAsc() {
        List<Stock> stocks = Arrays.asList(
                new Stock("Apple Inc", "AAPL", LocalDate.now(), 10, 150.0),
                new Stock("Microsoft", "MSFT", LocalDate.now(), 20, 200.0),
                new Stock("Amazon Inc", "AMZN", LocalDate.now(), 40, 100.0)
        );
        stocks.get(0).setProfitOrLoss(500.0);
        stocks.get(1).setProfitOrLoss(1000.0);
        stocks.get(2).setProfitOrLoss(200.0);

        stocks = stocks.stream()
                .sorted(Comparator.comparing(Stock::getProfitOrLoss))
                .collect(Collectors.toList());

        assertEquals("Amazon Inc", stocks.get(0).getCompanyName());
        assertEquals("Apple Inc", stocks.get(1).getCompanyName());
        assertEquals("Microsoft", stocks.get(2).getCompanyName());
    }

    @Test
    public void testSortByProfitDesc() {
        List<Stock> stocks = Arrays.asList(
                new Stock("Apple Inc", "AAPL", LocalDate.now(), 10, 150.0),
                new Stock("Microsoft", "MSFT", LocalDate.now(), 20, 200.0),
                new Stock("Amazon Inc", "AMZN", LocalDate.now(), 40, 100.0)
        );
        stocks.get(0).setProfitOrLoss(500.0);
        stocks.get(1).setProfitOrLoss(1000.0);
        stocks.get(2).setProfitOrLoss(200.0);

        stocks = stocks.stream()
                .sorted(Comparator.comparing(Stock::getProfitOrLoss).reversed())
                .collect(Collectors.toList());

        assertEquals("Microsoft", stocks.get(0).getCompanyName());
        assertEquals("Apple Inc", stocks.get(1).getCompanyName());
        assertEquals("Amazon Inc", stocks.get(2).getCompanyName());
    }
}