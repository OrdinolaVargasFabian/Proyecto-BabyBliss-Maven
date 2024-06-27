<%@ include file="header.jsp" %> 

<style>
    h1 {
        text-align: center;
        margin-top: 0px;
        margin-bottom: 60px;
        font-size: 2.5em;
        color: #ff6699;
    }

    .listaProductos {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    .productos {
        background: white;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        width: 300px;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .productos:hover {
        transform: scale(1.05);
    }

    .productos img {
        width: 100%;
        height: auto;
        max-width: 200px; /* Ajusta el tamaï¿½o mï¿½ximo segï¿½n sea necesario */
        max-height: 200px; /* Ajusta el tamaï¿½o mï¿½ximo segï¿½n sea necesario */
        min-height: 200px;
        min-width: 200px;
        object-fit: contain; /* Asegura que la imagen mantenga su proporciï¿½n */
        margin: 0 auto; /* Centra la imagen dentro del contenedor */
        display: block;
    }

    .name-productos {
        padding: 15px;


    }

    .name-productos h5 {
        margin: 0 0 10px;
        font-size: 1.5em;
        color: #ff6699;
    }

    .name-productos p {
        margin: 5px 0;
        font-size: 1.2em;
        color: #666;
    }

    .name-productos a {
        text-decoration: none;
        color: #ff6699;
    }

    .name-productos a:hover {
        text-decoration: underline;
    }
    .add-to-cart {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 20px;
        background-color: #ff6699;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 0.9em;
        transition: background-color 0.3s ease;
    }

    .add-to-cart:hover {
        background-color: #ff3366;
    }
    h1{
        padding-bottom: 10px;
    }
</style>
<h2 class="my-5 text-center fw-bold" style="color: #9999ff;">CATÁLOGO DE PRODUCTOS</h2>

<div id="productos-box" class="row m-3">
    <h3 class="text-center" style="color: #9999ff;"><i class='bx bx-refresh bx-spin bx-rotate-180 me-2'></i>Cargando productos...</h3>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        cargarTienda();
    });
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->

