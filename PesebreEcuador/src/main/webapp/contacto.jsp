<%@include file="includes/header.jsp" %>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0" style="background-color: #f8cecc; border-top: 5px solid #b85450 !important;">
                <div class="card-body text-center p-5">
                    <h2 class="mb-4" style="color: #b85450;">Formulario de Contacto y Soporte</h2>
                    
                    <h4 class="mb-3">Envíanos un Mensaje</h4>
                    
                    <form action="#" method="POST">
                        <div class="mb-3 text-start">
                            <label class="form-label fw-bold">Email:</label>
                            <input type="email" class="form-control" placeholder="nombre@correo.com">
                        </div>
                        
                        <div class="mb-3 text-start">
                            <label class="form-label fw-bold">Mensaje:</label>
                            <textarea class="form-control" rows="4" placeholder="Escribe tu consulta aquí..."></textarea>
                        </div>
                        
                        <button type="submit" class="btn btn-danger btn-lg px-5 mt-3">ENVIAR CONSULTA</button>
                    </form>
                    
                </div>
            </div>
            
            <div class="text-center mt-4 text-muted">
                <p><strong>Info de Soporte:</strong><br>
                Email: dcruzp5@est.ups.edu.ec<br>
                Teléfono: +593 99 508 4284</p>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>/html>