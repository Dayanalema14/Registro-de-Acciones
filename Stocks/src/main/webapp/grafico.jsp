<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acciones Archivadas</title>
    <!-- Incluir Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            padding-top: 70px; /* Ajusta según la altura de la barra de navegación */
        }
        .chart-container {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item">
                <a class="nav-link mx-2" href="stockController?route=listStocks">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mx-2" href="stockController?route=consolidateStock">Consolidado</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mx-2" href="stockController?route=grafico">Gráfico</a>
            </li>
        </ul>
        <a class="navbar-brand ms-auto" href="#">Stock Manager</a>
    </div>
</nav>
<div class="container mt-4">
    <h4 class="text-center">Gráfico de Acciones</h4>

    <div class="chart-container">
        <canvas id="stockChart"></canvas>
    </div>
</div>

<!-- Incluir el archivo grafico.js -->
<script>
    // Cargar los datos dinámicos desde el servidor como JSON
    const empresas = JSON.parse('<c:out value="${empresasJson}" escapeXml="false" />');
    const totalInvertido = JSON.parse('<c:out value="${totalInvertidoJson}" escapeXml="false" />');
    const totalActual = JSON.parse('<c:out value="${totalActualJson}" escapeXml="false" />');
    const gananciaPerdida = JSON.parse('<c:out value="${gananciaPerdidaJson}" escapeXml="false" />');
</script>
<script src="js/grafico.js"></script>
</body>
</html>
