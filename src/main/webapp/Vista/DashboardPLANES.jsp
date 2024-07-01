
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Dashboard de Usuarios</h1>
        <canvas id="myPieChart" width="400" height="400"></canvas>

        <script>
            fetch('srvObtenerMembresia')
                .then(response => response.json())
                .then(data => {
                    const ctx = document.getElementById('myPieChart').getContext('2d');
                    const myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ['Sin Membresia', 'Con Membresia'],
                            datasets: [{
                                data: [data.noMembresia, data.Membresia],
                                backgroundColor: ['#FF6384', '#36A2EB']
                            }]
                        }
                    });
                })
                .catch(error => console.error('Error:', error));
        </script>
    </body>
</html>
