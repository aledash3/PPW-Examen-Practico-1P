<%@include file="includes/header.jsp" %>

<div class="container my-5">
    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="sidebar-box shadow-sm">
                <div class="sidebar-header">SECCIÓN PESEBRES</div>
                <a href="historia.jsp" class="sidebar-link">Historia</a>
                <a href="personajes.jsp" class="sidebar-link">Personajes Típicos</a>
                <a href="villancicos.jsp" class="sidebar-link">Villancicos Andinos</a>
                <a href="galeria.jsp" class="sidebar-link active">Galería Multimedia (Actual)</a>
            </div>
        </div>

        <div class="col-md-9">
            <h1 class="mb-4" style="color: var(--color-ups-blue);"><i class="fas fa-camera-retro"></i> Galería Multimedia del Pesebre</h1>
            
            <div class="bg-white p-4 shadow-sm rounded">
                <h3 class="text-ups-green mb-3">Video Destacado: La Tradición del Pesebre en Ecuador</h3>
                
                <div class="ratio ratio-16x9 mb-4">
                    <iframe src="video/v.mp4" 
                            title="Video de la Tradición del Pesebre" 
                            allowfullscreen></iframe>
                </div>

                <hr>
                
                <h3 class="text-ups-green mt-5 mb-3">Explora Más Contenido Visual</h3>
                
                <div class="row">
                    
                    <div class="col-md-6 mb-4">
                        <div class="card card-custom h-100">
                            <div class="card-body text-center"> <h5 class="card-title-custom"><i class="fas fa-images"></i> Imágenes Históricas</h5>
                                <p class="card-text">Colección de fotografías de pesebres antiguos y contemporáneos de la Sierra y Costa.</p>
                                <img src="img/p.jpg" alt="Placeholder Galería" class="img-fluid rounded mt-2 mx-auto d-block"> </div>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="card card-custom h-100">
                            <div class="card-body text-center"> <h5 class="card-title-custom"><i class="fas fa-cube"></i> Modelos 3D Interactivo</h5>
                                <p class="card-text">Explora de cerca las figuras del Pesebre de la Escuela Quiteña en realidad virtual.</p>
                                <img src="img/3.jpg" alt="Placeholder 3D" class="img-fluid rounded mt-2 mx-auto d-block"> </div>
                             <div class="card-footer bg-transparent border-0 text-center"> <a href="personajes.jsp" class="btn btn-sm btn-outline-primary w-100">Ir a Personajes 3D</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>