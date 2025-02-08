// Crear el gráfico de Chart.js
const ctx = document.getElementById('stockChart').getContext('2d');
const stockChart = new Chart(ctx, {
    type: 'bar', // Tipo de gráfico (barras)
    data: {
        labels: empresas, // Las empresas se usan como etiquetas
        datasets: [{
            label: 'Total Invertido',
            data: totalInvertido, // Datos de lo invertido por cada empresa
            backgroundColor: 'rgba(54, 162, 235, 0.6)', // Color de fondo de las barras
            borderColor: 'rgba(54, 162, 235, 1)', // Color del borde de las barras
            borderWidth: 1
        },
            {
                label: 'Total Actual',
                data: totalActual, // Datos del valor actual por cada empresa
                backgroundColor: 'rgba(75, 192, 192, 0.6)', // Color de fondo de las barras
                borderColor: 'rgba(75, 192, 192, 1)', // Color del borde de las barras
                borderWidth: 1
            },
            {
                label: 'Ganancia/Pérdida',
                data: gananciaPerdida, // Datos de ganancia o pérdida por cada empresa
                backgroundColor: 'rgba(255, 99, 132, 0.6)', // Color de fondo de las barras
                borderColor: 'rgba(255, 99, 132, 1)', // Color del borde de las barras
                borderWidth: 1
            }]
    },
    options: {
        responsive: true, // Hacer que el gráfico sea responsivo
        scales: {
            y: {
                beginAtZero: true // Asegurarse que el eje Y comience en cero
            }
        }
    }
});