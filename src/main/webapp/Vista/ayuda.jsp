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
                transform: translateY(-80px);
                opacity: 1;
                visibility: visible;
            }

            .fab-container.open .sub-button:nth-child(3) {
                transform: translateY(-140px);
                opacity: 1;
                visibility: visible;
            }

            .fab-container.open .sub-button:nth-child(4) {
                transform: translateY(-200px);
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
                background-color: #4ba2ff;
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

        <div id="chatbotModal" class="chatbot-modal">
            <div class="chatbot-header">Chatbot BabyBliss</div>
            <div id="chatbotMessages" class="chatbot-messages"></div>
            <div class="chatbot-input">
                <form id="chatbotForm">
                    <input type="text" name="message" id="userMessage" placeholder="Escribe tu pregunta aquí...">
                    <button type="submit">Enviar</button>
                </form>
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

            function getChatbotResponse(message) {
                // lógica para responder a los mensajes del usuario.    
                const responses = {
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

                return responses[message.toLowerCase()] || "Lo siento, no entiendo tu pregunta.";
            }
        </script>
    </body>
</html>

