<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Acciones Archivadas</title>
  <link rel="stylesheet" href="css/styles.css">

</head>
<body>
<nav>
  <a href="stockController?route=listStocks">Inicio</a>
  <a href="stockController?route=consolidateStock">Consolidado</a>
  <a href="stockController?route=grafico">Gráfico</a>
  <div class="animation start-home"></div>
</nav>

<div class="container mt-2">
  <!-- Select dropdown to filter by symbol -->
  <form action="stockController" method="get" class="mb-3">
    <input type="hidden" name="route" value="consolidateStock">
    <div class="form-group">
      <label for="filterSymbol">Filtrar por símbolo:</label>
      <select name="symbol" id="filterSymbol" class="form-control" onchange="this.form.submit()">
        <option value="">Selecciona un símbolo</option>
        <c:forEach var="symbol" items="${symbols}">
          <option value="${symbol}" ${symbol == param.symbol ? 'selected' : ''}>${symbol}</option>
        </c:forEach>
      </select>
    </div>
  </form>

  <c:if test="${not empty param.symbol}">
    <h4>Resumen de compras</h4>
    <table class="table table-bordered mt-3">
      <thead>
      <tr>
        <th>Fecha Compra</th>
        <th>Símbolo</th>
        <th>Cantidad</th>
        <th>Precio de Compra ($)</th>
        <th>Total Compra ($)</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="stock" items="${stocks}">
        <tr>
          <td>${stock.purchaseDate}</td>
          <td>${stock.tickerSymbol}</td>
          <td>${stock.quantity}</td>
          <td>${stock.purchasePrice}</td>
          <td>
            <c:set var="totalPurchase" value="${stock.purchasePrice * stock.quantity}"/>
            <fmt:formatNumber value="${totalPurchase}" type="number" maxFractionDigits="2"/>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <h4>Consolidado</h4>
    <table class="table table-bordered mt-3">
      <thead>
      <tr>
        <th>Símbolo</th>
        <th>Cantidad Total</th>
        <th>Total Compra ($)</th>
        <th>Precio por Acción ($)</th>
        <th>Último precio registrado ($)</th>
        <th>Profit/Loss ($)</th>
        <th>Profit/Loss (%)</th>
      </tr>
      </thead>
      <tbody>
      <c:set var="totalQuantity" value="0"/>
      <c:set var="totalPrice" value="0"/>
      <c:forEach var="stock" items="${stocks}">
        <c:if test="${stock.tickerSymbol == param.symbol}">
          <c:set var="totalQuantity" value="${totalQuantity + stock.quantity}"/>
          <c:set var="totalPrice" value="${totalPrice + (stock.purchasePrice * stock.quantity)}"/>
        </c:if>
      </c:forEach>
      <c:if test="${totalQuantity > 0}">
        <c:set var="averagePrice" value="${totalPrice / totalQuantity}"/>
        <c:set var="consolidatedProfit" value="${(currentPrice - averagePrice) * totalQuantity}"/>
        <c:set var="consolidatedProfitPercentage" value="${((currentPrice - averagePrice) / averagePrice) * 100}"/>
        <tr>
          <td>${param.symbol}</td>
          <td>${totalQuantity}</td>
          <td><fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="2"/></td>
          <td><fmt:formatNumber value="${averagePrice}" type="number" maxFractionDigits="2"/></td>
          <td><fmt:formatNumber value="${currentPrice}" type="number" maxFractionDigits="2"/></td>
          <td><fmt:formatNumber value="${consolidatedProfit}" type="number" maxFractionDigits="2"/></td>
          <td><fmt:formatNumber value="${consolidatedProfitPercentage}" type="number" maxFractionDigits="2"/>%</td>
        </tr>
      </c:if>
      </tbody>
    </table>
  </c:if>
</div>
</body>
</html>