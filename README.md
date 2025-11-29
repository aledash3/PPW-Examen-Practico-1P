🇪🇨 Pesebre Ecuador - Aplicación Web Cultural (PPW)

📌 Descripción General

Este proyecto es una aplicación web dinámica desarrollada como parte del Examen Práctico del Primer Parcial de Programación Para la Web (PPW) en un contexto académico universitario.

El objetivo es digitalizar y documentar la rica tradición del pesebre navideño en Ecuador, ofreciendo secciones interactivas, históricas y multimedia. La aplicación simula un sistema de gestión de contenidos (CMS básico) y usuarios, utilizando una arquitectura JDBC y PostgreSQL para la persistencia de datos.

El proyecto está estructurado bajo el patrón Modelo-Vista-Controlador (MVC), utilizando Java Servlets y JSP para el backend, y un frontend dinámico que integra Bootstrap, HTML, CSS, JavaScript y la librería model-viewer para contenido 3D.

🚀 Funcionalidades Principales

🖥️ Módulos de Contenido Público

Historia: Detalle histórico y cultural del origen y evolución del pesebre en Ecuador.

Personajes Típicos: Documentación de las figuras clave, incluyendo la integración de Modelos 3D (.glb) para visualización interactiva.

Villancicos Andinos: Galería de audio y letras de canciones tradicionales.

Galería Multimedia: Presentación de videos y fotografías relevantes a la tradición.

Contacto: Formulario para interacción con los administradores.

🔐 Gestión de Usuarios y Administración

Autenticación: Inicio de sesión (login.jsp) con validación de credenciales en PostgreSQL.

Control de Sesiones: Manejo de sesiones para diferenciar usuarios normales y administradores (admin).

Mantenimiento: Funciones básicas de administración (CRUD) de usuarios o contenido (implícito en UsuarioServlet).

🧩 Tecnologías Utilizadas

Categoría

Tecnología

Versión/Detalle

Backend

Java

Java 8+ / Servlets

Vistas

JSP

Páginas JSP modulares (includes/header.jsp, footer.jsp)

Persistencia

JDBC

Conexión nativa a base de datos

Base de Datos

PostgreSQL

Almacenamiento de registros de Usuario

Frontend

HTML5 / CSS3 / JavaScript

Interfaz de usuario y lógica del cliente

Framework CSS

Bootstrap 5.3

Estilización responsiva y componentes UI

Recursos

Modelos GLB / FontAwesome

Vistas 3D y Iconografía

Contenedor

Apache Tomcat

Servidor de aplicaciones (v9.x recomendado)

📁 Estructura del Proyecto

El proyecto sigue la estructura estándar de un Dynamic Web Project de Eclipse/IntelliJ, organizado por su rol en el patrón MVC.

Proyecto/
├── src/main/java/
│   ├── modelo/                   <- Clases POJO (ej. Usuario.java)
│   ├── dao/                      <- Clases DAO (Acceso a BDD)
│   └── controlador/              <- Clases Servlet (ej. UsuarioServlet)
│
├── src/main/webapp/
│   ├── css/                      <- Hojas de estilo personalizadas
│   ├── js/                       <- Scripts JavaScript
│   ├── img/                      <- Imágenes de logotipos y placeholders
│   ├── audio/                    <- Archivos de villancicos
│   ├── model3D/                  <- Archivos GLB para model-viewer
│   ├── includes/                 <- JSP includes (header.jsp, footer.jsp)
│   ├── WEB-INF/lib/              <- Dependencias JAR (Driver PostgreSQL)
│   ├── *.jsp                     <- Vistas principales (index.jsp, historia.jsp, galeria.jsp, etc.)
│   └── META-INF/
│
└── build/classes/                <- Archivos Java compilados


🗄️ Configuración de Base de Datos

El proyecto requiere una instancia de PostgreSQL en ejecución para la gestión de usuarios.

1. Crear base de datos y Tabla:

Se debe crear una base de datos (ej. pesebre_ec_db) y la tabla usuario para almacenar las credenciales de acceso (usuario y admin).

CREATE DATABASE pesebre_ec_db;

-- Tabla de ejemplo para la autenticación
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(20) DEFAULT 'usuario'
);


2. Configurar Conexión JDBC:

Asegúrate de que los parámetros de conexión en tu clase DAO/Conexión (modelo.Conexion o similar) coincidan con la configuración local de PostgreSQL (puerto, usuario y contraseña).

3. Verificar el Driver PostgreSQL:

El archivo JAR del driver JDBC debe estar en:
src/main/webapp/WEB-INF/lib/postgresql-42.x.jar

▶️ Ejecución del Proyecto

Importar en IDE: Importa el proyecto como Dynamic Web Project en Eclipse o IntelliJ y asócialo a un servidor Apache Tomcat configurado.

Ejecutar: Inicia el servidor Tomcat.

Acceso: Accede a la aplicación desde tu navegador (el nombre del proyecto puede ser Examen1B):

http://localhost:8080/Examen1B/index.jsp


🧪 Pruebas Recomendadas

Rutas: Verificar que la navegación entre historia.jsp, galeria.jsp, villancicos.jsp y personajes.jsp funcione correctamente.

Autenticación: Probar el inicio de sesión con roles usuario y admin.

Persistencia: Verificar que las operaciones de la base de datos (Login, Registro) se ejecuten sin errores de conexión.

Multimedia: Probar la carga de modelos 3D y la reproducción de audio/video.

👤 Autor

Autor: David Cruz

Proyecto: Académico universitario (Primer Bimestre PPW)

Repositorio Oficial: PPW-Examen-Practico-1P

📄 Licencia

Este es un proyecto académico de libre uso, destinado a fines de práctica, estudio y pruebas téc
