package ec.epn.edu.ec.stocks.dao;

import ec.epn.edu.ec.stocks.config.HibernateConfig;
import ec.epn.edu.ec.stocks.model.Stock;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * DAO for managing Stock entities.
 * Extends the generic BaseDAO to provide specific operations for the Stock entity.
 */
public class StockDAO extends BaseDAO<Stock> {

    /**
     * Initializes the StockDAO with the Stock entity class.
     */
    public StockDAO() {
        super(Stock.class);
    }

    /**
     * Retrieves a list of stocks by their ticker symbol.
     *
     * @param tickerSymbol The ticker symbol to filter stocks by.
     * @return A list of stocks with the given ticker symbol.
     */
    public List<Stock> findBySymbol(String tickerSymbol) {
        try (Session session = HibernateConfig.getSessionFactory().openSession()) {
            Query<Stock> query = session.createQuery("FROM Stock WHERE tickerSymbol = :tickerSymbol", Stock.class);
            query.setParameter("tickerSymbol", tickerSymbol);
            return query.getResultList();
        }
    }
}