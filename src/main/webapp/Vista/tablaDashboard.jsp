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
    <div class="m-5">
        <div class="d-flex justify-content-between">
            <div class="col bg-white rounded shadow p-3 m-4">
                <h3 class="text-center">Productos más vendidos</h3>
                <hr>
                <canvas id="ventasChart"></canvas>
            </div>
            <div class="col bg-white rounded shadow p-3 m-4">
                <h3 class="text-center">Planes de los usuarios registrados en BabyBliss</h3>
                <hr>
                <canvas id="membresiaChart"></canvas>
            </div>
        </div>
    </div>
    <script>
        // Grafico pastel de membresia
        fetch('../srvObtenerMembresia') 
            .then(response => response.json())
            .then(data => {
                const sinMembresia = data.sinMembresia;
                const conMembresia = data.conMembresia;

                const ctx = document.getElementById('membresiaChart').getContext('2d');
                const membresiaChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['Sin Membresía', 'Con Membresía'],
                        datasets: [{
                            label: 'Cantidad de Membresías',
                            data: [sinMembresia, conMembresia],
                            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            title: {
                                display: true,
                                text: 'Cantidad de Membresías'
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    
        // Histograma de productos mas vendidos
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
                            label: 'Cantidad de Productos',
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
<%@ include file="footer.jsp" %>
