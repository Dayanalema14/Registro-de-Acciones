<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<nav>
    <a href="stockController?route=listStocks">Inicio</a>
    <a href="stockController?route=consolidateStock">Consolidado</a>
    <a href="stockController?route=grafico">Gráfico</a>
    <div class="animation start-home"></div>
</nav>
<div class="container">
    <h4 class="mt-2">Registro de Acciones</h4>
    <div id="validationAlerts"></div>
    <form action="stockController" method="POST" onsubmit="return validateForm()">
        <input type="hidden" name="route" value="saveStock">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="tickerSymbol">Símbolo</label>
                <input type="text" class="form-control" id="tickerSymbol" name="tickerSymbol" required>
            </div>
            <div class="form-group col-md-6">
                <label for="companyName">Nombre de la Compañía</label>
                <input type="text" class="form-control" id="companyName" name="companyName" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="purchaseDate">Fecha de Compra</label>
                <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" required>
            </div>
            <div class="form-group col-md-4">
                <label for="quantity">Cantidad</label>
                <input type="number" class="form-control" min="1" id="quantity" name="quantity" required>
            </div>
            <div class="form-group col-md-4">
                <label for="purchasePrice">Precio de Compra</label>
                <input type="number" step="0.01" min="0.01" class="form-control" id="purchasePrice" name="purchasePrice"
                       required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Registrar Compra</button>
    </form>
    <h4 class="mt-5">Acciones Compradas</h4>

    <c:if test="${empty stocks}">
        <div class="alert alert-info" role="alert">
            No hay acciones registradas.
        </div>
    </c:if>
    <c:if test="${not empty stocks}">
        <div class="d-flex justify-content-between">
            <form action="stockController" method="get" class="mb-3">
                <input type="hidden" name="route" value="updateStocksPrices">
                <button type="submit" class="btn btn-warning mt-3">Actualizar Precios</button>
            </form>
            <form action="exportCSV" method="get">
                <button type="submit" class="btn btn-success mt-3">Exportar CSV</button>
            </form>
        </div>
        <form action="stockController" method="get" class="mb-3">
            <input type="hidden" name="route" value="listStocks">
            <div class="form-group">
                <label for="sortBy">Ordenar por:</label>
                <select name="sortBy" id="sortBy" class="form-control" onchange="this.form.submit()">
                    <option value="">Selecciona un criterio</option>
                    <option value="name" ${param.sortBy == 'name' ? 'selected' : ''}>Nombre de la Acción</option>
                    <option value="profitAsc" ${param.sortBy == 'profitAsc' ? 'selected' : ''}>Ganancia/Pérdida (Ascendente)</option>
                    <option value="profitDesc" ${param.sortBy == 'profitDesc' ? 'selected' : ''}>Ganancia/Pérdida (Descendente)</option>
                </select>
            </div>
        </form>
        <table class="table table-bordered mt-3">
            <thead>
            <tr>
                <th>ID</th>
                <th>Símbolo</th>
                <th>Compañía</th>
                <th>Fecha Compra</th>
                <th>Cantidad</th>
                <th>Precio Compra ($)</th>
                <th>Último Precio ($)</th>
                <th>Profit/Loss (%)</th>
                <th>Profit/Loss ($)</th>
            </tr>
            </thead>
            <tbody id="stocksTableBody">
            <c:forEach var="stock" items="${stocks}">
                <tr>
                    <td>${stock.id}</td>
                    <td>${stock.tickerSymbol}</td>
                    <td>${stock.companyName}</td>
                    <td>${stock.purchaseDate}</td>
                    <td>${stock.quantity}</td>
                    <td><fmt:formatNumber value="${stock.purchasePrice}" type="number" maxFractionDigits="2"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${stock.currentPrice != null}">
                                <fmt:formatNumber value="${stock.currentPrice}" type="number" maxFractionDigits="2"/>
                            </c:when>
                            <c:otherwise>N/A</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
            <span class="${stock.profitOrLossPercentage >= 0 ? 'text-success' : 'text-danger'}">
                <fmt:formatNumber value="${stock.profitOrLossPercentage}" type="number" maxFractionDigits="2"/>%
            </span>
                    </td>
                    <td>
            <span class="${stock.profitOrLoss >= 0 ? 'text-success' : 'text-danger'}">
                <fmt:formatNumber value="${stock.profitOrLoss}" type="number" maxFractionDigits="2"/>$
            </span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>