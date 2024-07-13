<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Yellowtail&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            .fab-container {
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
                align-items: center;
                user-select: none;
                position: fixed;
                bottom: 30px;
                right: 30px;
                z-index: 1000;
            }

            .fab {
                position: relative;
                height: 70px;
                width: 70px;
                background-color: #4ba2ff;
                border-radius: 50%;
                z-index: 2;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .fab:hover {
                background-color: #007bff;
                transform: scale(1.1);
            }

            .fab-content .material-symbols-outlined {
                color: white;
                font-size: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
                width: 100%;
            }

            .sub-button {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                bottom: 10px;
                right: 10px;
                height: 50px;
                width: 50px;
                background-color: #4ba2ff;
                border-radius: 50%;
                transition: all 0.3s ease, background-color 0.3s ease;
                opacity: 0;
                visibility: hidden;
            }

            .sub-button:hover {
                background-color: #007bff;
                transform: scale(1.1);
            }

            .sub-button a .material-symbols-outlined {
                color: white;
                font-size: 24px;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
                width: 100%;
            }

            .sub-button a {
                text-decoration: none;
            }

            .fab-container.open .sub-button:nth-child(2) {
                transform: translateX(-80px);
                opacity: 1;
                visibility: visible;
            }

            .fab-container.open .sub-button:nth-child(3) {
                transform: translateX(-140px);
                opacity: 1;
                visibility: visible;
            }

            .fab-container.open .sub-button:nth-child(4) {
                transform: translateX(-200px);
                opacity: 1;
                visibility: visible;
            }

            /* Estilos para el chatbot */
            .chatbot-modal {
                display: none;
                position: fixed;
                bottom: 100px;
                right: 30px;
                width: 300px;
                height: 400px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                z-index: 1000;
                overflow: hidden;
                flex-direction: column;
                justify-content: space-between;
            }

            .chatbot-header {
                background-color: #C99FF4;
                color: white;
                padding: 10px;
                text-align: center;
            }

            .chatbot-messages {
                flex: 1;
                padding: 10px;
                overflow-y: auto;
            }

            .chatbot-input {
                display: flex;
            }

            .chatbot-input input {
                flex: 1;
                padding: 10px;
                border: none;
                border-top: 1px solid #ccc;
            }

            .chatbot-input button {
                padding: 10px;
                border: none;
                background-color: #4ba2ff;
                color: white;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="fab-container">
            <div class="fab shadow" onclick="toggleFab()">
                <div class="fab-content">
                    <span class="material-symbols-outlined">help</span>
                </div>
            </div>
            <div class="sub-button shadow">
                <a href="https://wa.me/992245544" target="_blank">
                    <span class="material-symbols-outlined">call</span>
                </a>
            </div>
            <div class="sub-button shadow">
                <a href="#" onclick="toggleChatbotModal()">
                    <span class="material-symbols-outlined">support_agent</span>
                </a>
            </div>
        </div>

        <div id="chatbotModal" class="chatbot-modal" style="width: 330px;">
            <div class="chatbot-header"><b>BABYBOT</b><i class='bx bx-bot ms-2'></i></div>
            <div id="chatbotMessages" class="chatbot-messages">
                <div class="p-3 m-3 rounded shadow bg-light">
                    <div class="row mb-2">
                        <b>BabyBot</b>
                    </div>
                    <div class="row">
                        <p>Hola, estoy aqui para ayudarte con tus dudas.</p>
                    </div>
                </div>
            </div>
            <div class="dropup-center dropup text-center m-2">
                <button class="btn btn-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class='bx bx-message-alt'></i>
                </button>
                <ul class="dropdown-menu">
                    <li><button onclick="getChatbotResponse(event, 1)" class="btn btn-primary mb-2 shadow dropdown-item">¿Qué es BabyBliss?</button></li>
                    <li><button onclick="getChatbotResponse(event, 2)" class="btn btn-primary mb-2 shadow dropdown-item">¿Cuál es el proceso de compra?</button></li>
                    <li><button onclick="getChatbotResponse(event, 3)" class="btn btn-primary mb-2 shadow dropdown-item">¿Cómo puedo adquirir una membresía?</button></li>
                    <li><button onclick="getChatbotResponse(event, 4)" class="btn btn-primary mb-2 shadow dropdown-item">¿Qué servicios ofrece BabyBliss?</button></li>
                </ul>
            </div>
            <div class="chatbot-input">
                <!-- <form id="chatbotForm">
                    <input type="text" name="message" id="userMessage" placeholder="Escribe tu pregunta aquí...">
                    <button type="submit">Enviar</button>
                </form> 
                <div class="chatbot-predefined-messages d-flex flex-column align-items-center py-2">
                    <li><button onclick="getChatbotResponse(1)" class="btn btn-primary mb-2 shadow dropdown-item">¿Qué es BabyBliss?</button></li>
                    <li><button onclick="getChatbotResponse(2)" class="btn btn-primary mb-2 shadow dropdown-item">¿Cuál es el proceso de compra?</button></li>
                    <li><button onclick="getChatbotResponse(3)" class="btn btn-primary mb-2 shadow dropdown-item">¿Cómo puedo adquirir una membresía?</button></li>
                    <li><button onclick="getChatbotResponse(4)" class="btn btn-primary mb-2 shadow dropdown-item">¿Qué servicios ofrece BabyBliss?</button></li>
                </div>-->
            </div>
        </div>

        <script>
            function toggleFab() {
                const fabContainer = document.querySelector('.fab-container');
                fabContainer.classList.toggle('open');
            }

            function toggleChatbotModal() {
                const chatbotModal = document.getElementById('chatbotModal');
                if (chatbotModal.style.display === 'none' || chatbotModal.style.display === '') {
                    chatbotModal.style.display = 'flex';
                } else {
                    chatbotModal.style.display = 'none';
                }
            }

            document.getElementById('chatbotForm').addEventListener('submit', function (event) {
                event.preventDefault();
                var userMessage = document.getElementById('userMessage').value;
                var chatbotMessages = document.getElementById('chatbotMessages');

                // lógica para responder a los mensajes del usuario.
                var response = getChatbotResponse(userMessage);

                var userMessageElement = document.createElement('div');
                userMessageElement.textContent = "Tú: " + userMessage;
                chatbotMessages.appendChild(userMessageElement);

                var botMessageElement = document.createElement('div');
                botMessageElement.textContent = "Bot: " + response;
                chatbotMessages.appendChild(botMessageElement);

                chatbotMessages.scrollTop = chatbotMessages.scrollHeight;
                document.getElementById('userMessage').value = '';
            });

            function getChatbotResponse(event, pregunta) {
                // lógica para responder a los mensajes del usuario.    
                var respuesta;
                switch (pregunta) {
                    case 1:
                        respuesta = "Es un aplicativo web, donde proporcionamos herramientas de ayuda para las madres primerizas que tengas dificultades con el cuidado de su bebé.";
                        break;
                    case 2:
                        respuesta = "Para comprar productos en BabyBliss,\n\
                                    1. Navege a Baby Shop desde la barra de navegación y selecciona los productos que desee.\n\
                                    2. Añada los productos al carrito de compras.\n\
                                    3. Proceda al pago y eliga el método de pago que prefiera.\n\
                                    4. Confirme su compra y recibirá una notificación con los detalles de su pedido vía correo electronico.";
                        break;
                    case 3:
                        respuesta = "Para adquirir una membresía en BabyBliss, sigue estos pasos:\n\
                                                      1. Inicia sesión en tu cuenta.\n\
                                                      2. Click en el icono de su perfil.\n\
                                                      3. Selecciona en membresía y observará el precio.\n\
                                                      4. Elija su método de pago favorito.\n\
                                                      5. Proceda al pago y recibirá un correo de confirmación.";
                        break;
                    case 4:
                        respuesta = "BabyBliss ofrece los siguientes servicios:\n\
                                                            - Guias y consejos personalizados sobre el cuidado de su bebé.\n\
                                                            - BabyShop, una tienda con productos para bebés.\n\
                                                            - Un calendario para eventos y recordatorios.\n\
                                                            - Una comunidad de apoyo para interactuar con otros usuarios.\n\
                                                            - Una opción premium donde podrás resolver tus dudas en charlas privadas con especialistas.";
                        break;
                    default :
                        respuesta = "Lo siento, no entiendo tu pregunta";
                }
                console.log(respuesta);
                // Pregunta del usuario
                $('#chatbotMessages').append(
                        '<div class="p-3 m-3 rounded shadow" style="background-color: #C99FF4;">' +
                        '<div class="row mb-2">' +
                        '<b>Tú</b>' +
                        '</div>' +
                        '<div class="row">' +
                        '<p>'+$(event.target).text()+'</p>' +
                        '</div>' +
                        '</div>'
                        );
                // Respuesta del bot
                $('#chatbotMessages').append(
                        '<div class="p-3 m-3 rounded shadow bg-light">' +
                        '<div class="row mb-2">' +
                        '<b>BabyBot</b>' +
                        '</div>' +
                        '<div class="row">' +
                        '<p>' + respuesta + '</p>' +
                        '</div>' +
                        '</div>'
                        );
                $('#chatbotMessages').scrollTop($('#chatbotMessages')[0].scrollHeight);
                /* const responses = {
                 "hola": "¡Hola! ¿En qué puedo ayudarte?",
                 "qué es babybliss": "Es un aplicativo web, donde proporcionamos herramientas de ayuda para las madres primerizas que tengas dificultades con el cuidado de su bebé",
                 "cuál es el proceso de compra": "Para comprar productos en BabyBliss, 1. Navega a la tienda y selecciona los productos que deseas.\n\
                 2. Añade los productos al carrito de compras.\n\
                 3. Procede al pago y elige el método de pago que prefieras (tarjeta de crédito, transferencia bancaria, etc.).\n\
                 4. Confirma tu compra y recibirás una notificación con los detalles de tu pedido.",
                 "cómo puedo adquirir una membresía": "Para adquirir una membresía en BabyBliss, sigue estos pasos:\n\
                 1. Inicia sesión en tu cuenta.\n\
                 2. Clic en el icono de su perfil.\n\
                 3. Selecciona en membresías y observará el precio de nuestra membresía.\n\
                 4. Elige su método de pago favorito.\n\
                 5. Procede al pago y confirma tu compra.",
                 "qué servicios ofrece babybliss": "BabyBliss ofrece los siguientes servicios:\n\
                 - Consejos personalizados sobre el cuidado del bebé.\n\
                 - Una tienda con productos para bebés.\n\
                 - Un calendario para eventos y recordatorios.\n\
                 - Una comunidad para interactuar con otros usuarios.\n\
                 - Una opción premium donde podrás resolver tus dudas con un especialista.",
                 };
                 
                 return responses[message.toLowerCase()] || "Lo siento, no entiendo tu pregunta."; */
            }
        </script>
    </body>
</html>

