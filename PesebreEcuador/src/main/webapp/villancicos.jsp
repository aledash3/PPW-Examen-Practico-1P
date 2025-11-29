<%@include file="includes/header.jsp" %>

<div class="container my-5">
    <div class="row">
        <!-- Sidebar Izquierdo -->
        <div class="col-md-3 mb-4">
            <div class="sidebar-box shadow-sm">
                <div class="sidebar-header">SECCIÓN PESEBRES</div>
                <a href="historia.jsp" class="sidebar-link">Historia</a>
                <a href="personajes.jsp" class="sidebar-link">Personajes Típicos</a>
                <a href="villancicos.jsp" class="sidebar-link active">Villancicos (Actual)</a>
                <a href="galeria_multimedia.jsp" class="sidebar-link">Galería Multimedia</a>
            </div>
        </div>

        <!-- Contenido Derecho -->
        <div class="col-md-9">
            <h1 class="mb-4 text-center" style="color: var(--color-ups-green);">Villancicos y Música Navideña Andina</h1>
            
            <div class="bg-light p-4 border rounded">
                <h3 class="text-ups-blue">Villancicos Populares Ecuatorianos</h3>
                <hr>
                
                <div class="list-group">
                    <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="playSong('Dulce Jesús Mío')">
                        1. Dulce Jesús Mío
                        <span class="badge bg-primary rounded-pill"><i class="fas fa-play"></i></span>
                    </button>
                    <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="playSong('Claveles y Rosas')">
                        2. Claveles y Rosas
                        <span class="badge bg-primary rounded-pill"><i class="fas fa-play"></i></span>
                    </button>
                    <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="playSong('Bienvenido Seas')">
                        3. Bienvenido Seas
                        <span class="badge bg-primary rounded-pill"><i class="fas fa-play"></i></span>
                    </button>
                    <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="playSong('Ya viene el Niñito')">
                        4. Ya viene el Niñito
                        <span class="badge bg-primary rounded-pill"><i class="fas fa-play"></i></span>
                    </button>
                </div>

                <!-- Reproductor Embebido (Caja Verde del Diagrama) -->
                <div class="audio-player-container mt-4">
                    <h5 id="songTitle" class="fw-bold text-ups-green">Selecciona una canción...</h5>
                    <audio id="audioPlayer" controls class="w-100 mt-2">
                        <source src="" type="audio/mpeg">
                        Tu navegador no soporta audio HTML5.
                    </audio>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function playSong(titulo) {
        document.getElementById("songTitle").innerText = "Reproduciendo: " + titulo;
        // Aquí irían las rutas reales a los archivos MP3 en la carpeta 'audio'
        document.getElementById("audioPlayer").src = "audio/" + titulo + ".mp3";
        document.getElementById("audioPlayer").play();
    }
</script>

<%@include file="includes/footer.jsp" %>