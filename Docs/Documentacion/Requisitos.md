**1. Requisitos Funcionales**

**1.1. Gestión de Transacciones**

-   **RF1.1**: El sistema debe permitir que el usuario ingrese los datos
    de la transacción, que incluyen:

    -   Precio de compra

    -   Precio de venta

    -   Cantidad de acciones

-   **RF1.2**: El sistema debe permitir que el usuario realice el
    cálculo de ganancia o pérdida basado en los datos de la transacción
    y el precio actual de la acción.

-   **RF1.3**: El sistema debe calcular la ganancia o perdida

-   **RF1.4**: El sistema debe permitir que el usuario consulte el
    historial de transacciones previas almacenadas.

**1.3. Consultar Precios de Acciones**

-   **RF3.1**: El sistema debe conectarse a una fuente de datos para
    consultar los precios actuales de las acciones en tiempo real.

-   **RF3.2**: El sistema debe mostrar el precio actual de la acción al
    usuario cuando ingrese los datos de la transacción.

**1.4. Gestión de Resultados**

-   **RF4.1**: El sistema debe mostrar al usuario el resultado de la
    ganancia o pérdida calculada después de realizar la transacción.

-   **RF4.2**: El sistema debe mostrar los detalles de la transacción

**1.5. Historial de Transacciones**

-   **RF5.1**: El sistema debe almacenar todas las transacciones
    realizadas por el usuario en un historial de transacciones.

-   **RF5.2**: El sistema debe permitir al usuario visualizar un
    historial de sus transacciones previas con los detalles de cada una.

**2. Requisitos No Funcionales**

**2.1. Usabilidad**

-   **RNF1.1**: El sistema debe ser fácil de usar, con una interfaz de
    usuario clara y accesible.

**2.2. Rendimiento**

-   **RNF1.2**: El sistema debe ser capaz de calcular la ganancia o
    pérdida de una transacción en menos de 2 segundos.

-   **RNF1.3**: El sistema debe ser capaz de consultar el precio de una
    acción en tiempo real sin un retraso significativo.

**2.3. Mantenibilidad**

-   **RNF1.4**: El sistema debe estar diseñado de manera modular para
    facilitar futuras modificaciones y actualizaciones.

-   **RNF1.5**: El código del sistema debe seguir buenas prácticas de
    programación y estar bien documentado para facilitar su
    mantenimiento.

**3. Requisitos de Interfaz**

**3.1. Interfaz de Usuario**

-   **RI1.1**: La interfaz debe permitir al usuario registrar una nueva
    transacción ingresando el precio de compra, precio de venta y
    cantidad de acciones.

-   **RI1.2**: El sistema debe proporcionar un botón para calcular la
    ganancia o pérdida.

-   **RI1.3**: El sistema debe mostrar una lista de las transacciones
    anteriores con detalles como el precio de compra, precio de venta,
    cantidad de acciones y el resultado.

-   **RI1.4**: La interfaz debe mostrar el precio actual de la acción
    cuando el usuario lo solicite.
