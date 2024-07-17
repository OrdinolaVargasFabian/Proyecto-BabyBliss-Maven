<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventas Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        #ventasChartContainer {
            width: 80%; 
            height: 300px; 
            margin: auto; 
        }
        #ventasChart {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <div id="ventasChartContainer">
        <canvas id="ventasChart"></canvas>
    </div>

    <script>
        fetch('../srvObtenerVentas') 
            .then(response => response.json())
            .then(data => {
                const nombresProductos = data.map(item => item.nombreProducto);
                const cantidades = data.map(item => item.totalCantidad);

                //colores para las barras
                const colores = [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(99, 255, 132, 0.2)'
                ];

                const borderColores = [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(99, 255, 132, 1)'
                ];

                const ctx = document.getElementById('ventasChart').getContext('2d');
                const ventasChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: nombresProductos,
                        datasets: [{
                            label: 'Cantidad Vendida',
                            data: cantidades,
                            backgroundColor: colores,
                            borderColor: borderColores,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    </script>
</body>
</html>
