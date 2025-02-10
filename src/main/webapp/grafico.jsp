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
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<nav>
  <a href="stockController?route=listStocks">Inicio</a>
  <a href="stockController?route=consolidateStock">Consolidado</a>
  <a href="stockController?route=grafico">Gráfico</a>
  <div class="animation start-home"></div>
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