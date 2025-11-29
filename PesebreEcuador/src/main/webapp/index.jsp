<%@include file="includes/header.jsp" %>

<!-- Banner Principal (Diagrama: Caja Amarilla/Dorada) -->
<div class="container-fluid p-0">
    <div class="hero-banner">
        <h1 class="display-4 fw-bold" style="color: var(--color-accent-gold);">Descubre la Tradición Navideña Ecuatoriana</h1>
        <p class="lead">Un recorrido interactivo por el nacimiento de Jesús desde la visión andina.</p>
    </div>
</div>

<!-- Sección de Categorías (Diagrama: Cajas Azules Claras) -->
<div class="container my-5">
    <div class="row text-center">
        <!-- Historia -->
        <div class="col-md-4 mb-4">
            <div class="card card-custom h-100 p-3">
                <div class="card-body">
                    <h3 class="card-title-custom">Historia Ecuatoriana</h3>
                    <p class="card-text">Tradición y Orígenes coloniales de la Escuela Quiteña.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                    <a href="historia.jsp" class="btn btn-primary w-100">Leer Historia</a>
                </div>
            </div>
        </div>

        <!-- Personajes -->
        <div class="col-md-4 mb-4">
            <div class="card card-custom h-100 p-3">
                <div class="card-body">
                    <h3 class="card-title-custom">Personajes Típicos</h3>
                    <p class="card-text">El Niño, la Virgen, San José y los Reyes con vestimenta local.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                    <a href="personajes.jsp" class="btn btn-primary w-100">Ver en 3D</a>
                </div>
            </div>
        </div>

        <!-- Villancicos -->
        <div class="col-md-4 mb-4">
            <div class="card card-custom h-100 p-3">
                <div class="card-body">
                    <h3 class="card-title-custom">Villancicos Andinos</h3>
                    <p class="card-text">Música y letras tradicionales. Escucha nuestra selección.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                    <a href="villancicos.jsp" class="btn btn-primary w-100">Escuchar</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Noticia/Actualización (Perspectiva CS del diagrama) -->
    <div class="alert alert-danger mt-4" role="alert">
        <strong>Noticia:</strong> Lanzamiento del Repositorio de Música. Versión 1.0 lista con 15 villancicos.
    </div>
</div>

<%@include file="includes/footer.jsp" %>