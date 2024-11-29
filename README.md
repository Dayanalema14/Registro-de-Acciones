
# Stock Tracker 📈

Stock Tracker es una aplicación para gestionar un portafolio de inversiones. Permite registrar acciones, calcular ganancias/pérdidas, y mostrar esta información de manera organizada a través de una interfaz web.

## 🚀 Funcionalidades

- **Registrar acciones**: Añade información sobre tus inversiones, como el ticker, cantidad, precio y fecha de compra.
- **Calcular ganancias/pérdidas**: Calcula automáticamente las ganancias o pérdidas totales y en porcentaje basándose en el precio actual del mercado.
- **Visualizar portafolio**: Muestra las acciones registradas en una tabla con información detallada.

---

## 🛠️ Tecnologías utilizadas

### Backend:
- **Node.js**: Entorno de ejecución de JavaScript.
- **Express**: Framework para la creación del servidor.
- **SQLite3**: Base de datos ligera para persistencia de datos.
- **Axios**: Cliente HTTP para consumir la API externa.

### Frontend:
- **HTML, CSS y JavaScript**: Tecnologías para la interfaz de usuario.

### Dependencias:
- **Producción**:
  - `express`
  - `sqlite3`
  - `axios`
  - `dotenv`
- **Desarrollo**:
  - `nodemon`
  - `eslint`
  - `prettier`

---

## 📂 Estructura del proyecto

```
📂 Registro de acciones
├── 📁backend
│   ├── 📁database
│   ├── stocks.db
│   ├── 📁node_modules
│   ├── 📁src
│   │   ├── 📁controllers
│   │   │   └──StockController.js
│   │   ├── 📁database
│   │   │   └──database.js
│   │   │   └──initDatabase.js
│   │   ├── 📁models
│   │   │   └──Stock.js
│   │   ├── 📁routes
│   │   │   └──stockRoutes.js
│   │   ├── server.js
│   ├── .env
│   ├── package.json
│   ├── package-lock.json
├── 📁frontend
│   ├── 📁public
│   │   └──app.js
│   │   └──index.html
│   │   └──style.css
└── README.md
```

---

## 📦 Instalación

Sigue estos pasos para configurar el proyecto en tu entorno local:

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/Dayanalema14/Registro-de-Acciones.git
   cd Proyecto
   ```

2. **Instalar dependencias**:
   ```bash
   npm install
   ```

3. **Configurar variables de entorno**:
   Crea un archivo `.env` en la raíz del proyecto con la siguiente variable:
   ```env
   ALPHA_VANTAGE_API_KEY=00HNW70PDMP0OC56
   ```

4. **Inicializar la base de datos**:
   ```bash
   node src/database/InitDatabase.js
   ```

5. **Iniciar el servidor**:
   ```bash
   npm run dev
   ```

6. Abre tu navegador en [http://localhost:8000](http://localhost:8000).

---

## 🌟 Endpoints de la API

### `GET /`
Obtiene todas las acciones registradas.

### `POST /register`
Registra una nueva acción.

#### Ejemplo de solicitud:
```json
{
  "ticker": "AAPL",
  "quantity": 10,
  "purchasePrice": 150.50,
  "purchaseDate": "2024-11-01"
}
```

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
Este valor se almacena en la base de datos.

---

## 🌍 Recursos externos

- [Alpha Vantage API](https://www.alphavantage.co/): Para obtener precios actuales de acciones.

---

## ⚖️ Licencia

Este proyecto está bajo la [MIT License](LICENSE).

---

## 🖥️ Autor

**Vortex**  
Grupo de estudiantes de Ingeniería de Software, grupo "Vortex".  
[GitHub](https://github.com/Dayanalema14/Registro-de-Acciones.git)

