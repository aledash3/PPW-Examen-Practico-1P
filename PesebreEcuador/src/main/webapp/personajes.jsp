<%@include file="includes/header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4 text-ups-green">Personajes del Pesebre (3D y RA)</h2>
    <div class="alert alert-info text-center">
        Nota: Si estás en un móvil compatible, toca el icono de AR para ver el modelo en tu entorno.
    </div>

    <div class="row">
        <!-- Personaje 1 -->
        <div class="col-md-6 mb-4">
            <div class="card card-personaje p-3">
                <h3 class="text-center">Maria</h3>
                <!-- Componente de Google para 3D web -->
                <model-viewer 
                    src="model3D/ma.glb" 
                    ios-src="model3D/m.usdz"
                    alt="Modelo 3D de María"
                    auto-rotate 
                    camera-controls 
                    ar>
                </model-viewer>
                <div class="card-body">
                    <p>Figura central del nacimiento, representado a menudo con rasgos mestizos en la escuela quiteña.</p>
                </div>
            </div>
        </div>

        <!-- Personaje 2 -->
        <div class="col-md-6 mb-4">
            <div class="card card-personaje p-3">
                <h3 class="text-center">El niño Jesús</h3>
                <!-- Placeholder para otro modelo -->
                <model-viewer 
                    src="model3D/nj.glb" 
                    alt="Modelo 3D del Niño Jesús"
                    auto-rotate 
                    camera-controls 
                    ar>
                </model-viewer>
                <div class="card-body">
                    <p>Los padres terrenales, vestidos con ropajes que a menudo imitan telas locales.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>