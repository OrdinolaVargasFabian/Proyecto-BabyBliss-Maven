<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grafico</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
        <style>
        /* Estilo para ajustar el tamaño del canvas */
        #membresiaChartContainer {
            width: 80%; 
            height: 300px; 
            margin: auto; /* Centra el canvas en su contenedor */
        }
        #membresiaChart {
            width: 100%;
            height: 100%;
        }
    </style>
    
</head>
<body>
    


    <script>
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

    </script>
</body>
</html>