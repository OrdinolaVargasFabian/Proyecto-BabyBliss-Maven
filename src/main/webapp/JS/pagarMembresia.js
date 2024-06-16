let selectedPayment = '';

function selectPayment(paymentMethod) {

    document.querySelectorAll('.circle').forEach(circle => {
        circle.classList.remove('selected');
    });

    document.getElementById(`circle-${paymentMethod}`).classList.add('selected');
    selectedPayment = paymentMethod;
}

function proceedToPayment() {
    if (selectedPayment) {
        let url;
        switch (selectedPayment) {
            case 'Tarjeta':
                url = 'pagoTarjeta.jsp';
                break;
            case 'YAPE':
                url = 'pagoYAPE.jsp';
                break;
            case 'PLIN':
                url = 'pagoPLIN.jsp';
                break;
            case 'Transferencia':
                url = 'pagoTransferencia.jsp';
                break;
            default:
                url = '';
        }
        if (url) {
            window.location.href = url;
        } else {
            alert('Error: Método de pago no reconocido.');
        }
    } else {
        alert('Por favor selecciona un método de pago.');
    }
}

