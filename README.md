
# Stock Tracker 📈

Stock Tracker es una aplicación para gestionar un portafolio de inversiones. Permite registrar acciones, calcular ganancias/pérdidas, realizar búsquedas avanzadas con filtros, visualizar consolidaciones de las acciones compradas y graficar las tendencias del portafolio, todo a través de una interfaz web, utilizando un patrón MVC en JSP, MySQL, Tomcat 10 y JDK 23.

## 🚀 Funcionalidades

- **Registrar acciones**: Añade información sobre tus inversiones, como el ticker, cantidad, precio y fecha de compra.
- **Calcular ganancias/pérdidas**: Calcula automáticamente las ganancias o pérdidas totales y en porcentaje basándose en el precio actual del mercado.
- **Visualizar portafolio**: Muestra las acciones registradas en una tabla con información detallada.
- **Filtrar acciones**: Permite realizar búsquedas avanzadas de las acciones por ticker, fecha de compra y otros parámetros.
- **Consolidar acciones**: Agrupa las acciones de un mismo ticker y muestra el total de la cantidad comprada y el valor total invertido.
- **Gráfica de consolidaciones**: Genera gráficos visuales que muestran la evolución de las acciones consolidadas, permitiendo ver las tendencias y rendimiento de la inversión.

---

## 🛠️ Tecnologías utilizadas

### Backend:
- **Java**: Lenguaje de programación principal.
- **JSP (JavaServer Pages)**: Para la creación de vistas dinámicas en el servidor.
- **Servlets**: Para la lógica de control del patrón MVC.
- **MySQL**: Base de datos relacional para persistencia de datos.
- **Tomcat 10**: Servidor de aplicaciones para ejecutar la aplicación web.
- **JDK 23**: Java Development Kit para compilar y ejecutar la aplicación.
- **API de Finnhub**: Para obtener datos en tiempo real sobre las acciones.

### Frontend:
- **HTML, CSS, TailwindCSS**: Tecnologías para la interfaz de usuario, con un diseño responsivo y moderno.
- **Chart.js**: Para generar gráficos de las consolidaciones de las acciones.

### IDE:
- **IntelliJ IDEA**: IDE utilizado para el desarrollo del proyecto.

### Dependencias:
- **Producción**:
    - `MySQL`
    - `Tomcat 10`
    - `JDK 23`
    - `Finnhub API`
    - `Chart.js`
- **Desarrollo**:
    - `Eclipse` o cualquier IDE compatible con Java para desarrollo (usando IntelliJ IDEA).

---

## 📂 Estructura del proyecto

```
📂 Registro de acciones
├───📁Stocks
│    ├── 📁src
│    │    ├── 📁main
│    │    │    ├── 📁java
│    │    │    ├── 📁resources
│    │    │    │    └──hibernate.cfg.xml
│    │    │    └── 📁webapp
│    │    │         ├── 📁WEB-INF
│    ├── 📁target
│    │    ├── 📁META-INF
│    │    │    └── context.xml
│    │    └── 📁WEB-INF
│    │         ├── web.xml
│    │         └── lib/
├── README.md
└── LICENSE
```

---

## 📦 Instalación

Sigue estos pasos para configurar el proyecto en tu entorno local:

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/Dayanalema14/Stock-Tracker.git
   cd Stock-Tracker
   ```

2. **Configurar el servidor**:
   Asegúrate de tener instalado Tomcat 10 y JDK 23.

3. **Importar el proyecto en IntelliJ IDEA**:
   Abre el proyecto en IntelliJ IDEA y configura el servidor Tomcat 10.

4. **Configurar la base de datos**:
   Crea una base de datos en MySQL con el siguiente esquema:
   ```sql
   CREATE DATABASE stock_tracker;
   ```
   Luego, importa las tablas de la base de datos desde el archivo `StockTrackerDB.sql` ubicado en `📂backend/database/`.

5. **Configurar la API de Finnhub**:
   Asegúrate de que la URL y la clave API estén correctamente configuradas en el archivo de propiedades de la aplicación.

6. **Iniciar el servidor**:
   Ejecuta el servidor desde IntelliJ IDEA y abre tu navegador en [http://localhost:8080](http://localhost:8080).

---

## 🛡️ Validaciones

- **Ticker**: Debe ser un texto válido (símbolo de la acción).
- **Cantidad**: Debe ser un número entero positivo.
- **Precio de Compra**: Debe ser un número mayor que 0.
- **Fecha de Compra**: Debe ser una fecha válida.

---

## 📈 Calculando porcentaje de ganancias/pérdidas

El cálculo del porcentaje de ganancia/pérdida se realiza con la fórmula:
```
((precio_actual - precio_compra) / precio_compra) * 100
```
Este valor se almacena en la base de datos y se muestra junto con la información de la acción.

---

## 🌍 Recursos externos

- [Finnhub API](https://finnhub.io/): Para obtener precios actuales de acciones en tiempo real.

---

## ⚖️ Licencia

Este proyecto está bajo la [MIT License](LICENSE).

---

## 🖥️ Autor

**Vortex**  
Grupo de estudiantes de Ingeniería de Software, grupo "Vortex".  
[GitHub](https://github.com/Dayanalema14/Stock-Tracker.git)
