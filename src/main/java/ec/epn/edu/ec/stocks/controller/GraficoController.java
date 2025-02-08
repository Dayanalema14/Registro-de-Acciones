package ec.epn.edu.ec.stocks.controller;

import com.google.gson.Gson;
import ec.epn.edu.ec.stocks.model.*;
import ec.epn.edu.ec.stocks.service.StockService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/graficoController")
public class GraficoController extends HttpServlet {
    private StockService stockService;

    @Override
    public void init() {
        stockService = new StockService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ruteador(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.ruteador(req, resp);
    }

    private void ruteador(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String route = (req.getParameter("route") == null) ? "listar" : req.getParameter("route");

        switch (route) {
            case "verGrafico":
                this.verGrafico(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Ruta no encontrada");
                break;
        }
    }

    private void verGrafico(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();

        // Obtener todas las acciones
        List<Stock> stocks = stockService.getAllStocks();

        // Mapas para consolidar los valores por empresa
        Map<String, BigDecimal> totalInvertidoPorEmpresa = new HashMap<>();
        Map<String, BigDecimal> totalActualPorEmpresa = new HashMap<>();
        Map<String, BigDecimal> gananciaPerdidaPorEmpresa = new HashMap<>();

        // Consolidar los valores
        for (Stock stock : stocks) {
            String empresa = stock.getCompanyName();
            BigDecimal totalInvertido = BigDecimal.valueOf(stock.getPurchasePrice())
                    .multiply(BigDecimal.valueOf(stock.getQuantity()));
            BigDecimal totalActual = BigDecimal.valueOf(stock.getCurrentPrice())
                    .multiply(BigDecimal.valueOf(stock.getQuantity()));
            BigDecimal gananciaPerdida = totalActual.subtract(totalInvertido);

            totalInvertidoPorEmpresa.merge(empresa, totalInvertido, BigDecimal::add);
            totalActualPorEmpresa.merge(empresa, totalActual, BigDecimal::add);
            gananciaPerdidaPorEmpresa.merge(empresa, gananciaPerdida, BigDecimal::add);
        }

        // Convertir y asignar los atributos JSON
        generarAtributosJson(request, gson, totalInvertidoPorEmpresa, totalActualPorEmpresa, gananciaPerdidaPorEmpresa);

        // Redirigir al JSP de gráficos
        request.getRequestDispatcher("/grafico.jsp").forward(request, response);
    }

    private void generarAtributosJson(HttpServletRequest req, Gson gson,
                                      Map<String, BigDecimal> totalInvertidoPorEmpresa,
                                      Map<String, BigDecimal> totalActualPorEmpresa,
                                      Map<String, BigDecimal> gananciaPerdidaPorEmpresa) {
        req.setAttribute("empresasJson", gson.toJson(new ArrayList<>(totalInvertidoPorEmpresa.keySet())));
        req.setAttribute("totalInvertidoJson", gson.toJson(new ArrayList<>(totalInvertidoPorEmpresa.values())));
        req.setAttribute("totalActualJson", gson.toJson(new ArrayList<>(totalActualPorEmpresa.values())));
        req.setAttribute("gananciaPerdidaJson", gson.toJson(new ArrayList<>(gananciaPerdidaPorEmpresa.values())));
    }

}