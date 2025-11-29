<%@include file="includes/header.jsp" %>

<div class="container my-5">
    <div class="row">
        <!-- Sidebar Izquierdo (Diagrama: Sección Pesebres) -->
        <div class="col-md-3 mb-4">
            <div class="sidebar-box shadow-sm">
                <div class="sidebar-header">SECCIÓN PESEBRES</div>
                <a href="historia.jsp" class="sidebar-link active">Historia (Actual)</a>
                <a href="personajes.jsp" class="sidebar-link">Personajes Típicos</a>
                <a href="villancicos.jsp" class="sidebar-link">Villancicos Andinos</a>
                <a href="galeria_multimedia.jsp" class="sidebar-link">Galería Multimedia</a>
            </div>
        </div>

        <!-- Contenido Derecho -->
        <div class="col-md-9">
            <h1 class="mb-4" style="color: var(--color-ups-green);">Historia del Pesebre Ecuatoriano</h1>
            
            <div class="bg-white p-4 shadow-sm rounded">
                <h3 class="text-ups-blue">Orígenes Coloniales y la Escuela Quiteña</h3>
                <p>
                    El pesebre en Ecuador, especialmente el quiteño, tiene sus raíces en la época colonial, 
                    influenciado por la imaginería religiosa europea y adaptado por artistas locales. 
                    La Escuela Quiteña de arte fue fundamental en la creación de las primeras figuras, 
                    dotándolas de vestimentas, rasgos y materiales andinos, un reflejo de sincretismo cultural.
                </p>
                
                <h3 class="text-ups-blue mt-4">Materiales y Tradición Local</h3>
                <p>
                    A diferencia de otras culturas, el pesebre ecuatoriano incorpora elementos naturales de la Sierra 
                    y la Costa, como musgo, heno, ramas de capulí y pequeños animales domésticos.
                </p>
                
                <div class="text-center mt-4">
                    <img src="img/p1.jpg" alt="Pesebre Antiguo" class="img-fluid rounded shadow" onerror="this.src='https://placehold.co/600x300?text=Imagen+Historica'">
                    <p class="text-muted small mt-2">Pesebre tradicional del siglo XVIII</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>