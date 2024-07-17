<%@ include file="header.jsp" %> <!-- Incorpora el código del archivo header -->
<html>
<link href="../CSS/calendario.css" rel="stylesheet" type="text/css"/>   
   <body>
      <div class="cont">
      <div class="left">
        <div class="calendar">
          <div class="month">
            <i class='bx bx-left-arrow prev'></i>
            <div class="date"></div>
            <i class='bx bx-right-arrow next' ></i>
          </div>
<!-------------------------------------------- SEMANA ------------------------------------------------>            
          <div class="weekdays">
            <div>Lun</div>
            <div>Mar</div>
            <div>Mi�</div> 
            <div>Jue</div>
            <div>Vie</div>
            <div>S�b</div>
            <div>Dom</div>
          </div>
<!-------------------------------------------- DIAS ------------------------------------------------>            
          <div class="days"></div>
          <div class="goto-today">
            <div class="goto">
              <input type="text" placeholder="mes/a�o" class="date-input" />
              <button class="goto-btn">Ir</button>
            </div>
            <button class="today-btn">Hoy</button>
          </div>
        </div>
      </div>
      <div class="right">
        <div class="today-date">
          <div class="event-day"></div>
          <div class="event-date"></div>
        </div>
<!-------------------------------------------- EVENTO ------------------------------------------------>                      
        <div class="events"></div>
        <div class="add-event-wrapper">
          <div class="add-event-header">
            <div class="title">A�adir Evento</div>
            <i class="fas fa-times close"></i>
          </div>
          <div class="add-event-body">
            <div class="add-event-input">
              <input type="text" placeholder="Nombre del evento" class="event-name" />
            </div>
            <div class="add-event-input">
              <input
                type="text"
                placeholder="Hora de inicio"
                class="event-time-from"/>
            </div>
            <div class="add-event-input">
              <input
                type="text"
                placeholder="Hora de finalizaci�n"
                class="event-time-to"/>
            </div>       
          </div>
          <div class="add-event-footer">
            <button class="add-event-btn">A�adir Evento</button>
          </div>
        </div>
      </div>
<!-------------------------------------------- BOTON A�ADIR EVENTO ------------------------------------------------>          
      <button class="add-event">
        <i class='bx bx-plus'></i>
      </button>
    </div>
     <script src="../JS/calendario.js" type="text/javascript"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>

