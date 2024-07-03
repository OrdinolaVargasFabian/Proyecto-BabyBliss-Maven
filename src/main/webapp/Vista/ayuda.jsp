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
                position: sticky;
                padding-left: 95%;
                bottom: 30px;
                right: 30px;
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
                border-radius: 50px;
                transition: all 0.3s ease;
                opacity: 0;
                visibility: hidden;
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

            .fab-container.open .sub-button:nth-child(5) {
                transform: translateY(-260px);
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
                <form id="chatbotForm" action="chatbot" method="post">
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
                fetch('chatbot', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'message=' + encodeURIComponent(userMessage),
                })
                        .then(response => response.text())
                        .then(data => {
                            const messagesDiv = document.getElementById('chatbotMessages');
                            const messageElement = document.createElement('div');
                            messageElement.textContent = data;
                            messagesDiv.appendChild(messageElement);
                            messagesDiv.scrollTop = messagesDiv.scrollHeight;
                        });
            });
        </script>
    </body>
</html>