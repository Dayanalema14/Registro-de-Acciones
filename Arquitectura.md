# Arquitectura de la Aplicación

## Descripción General
La aplicación de registro de acciones permite a los usuarios registrar, actualizar y visualizar sus inversiones en acciones. La aplicación incluye funcionalidades para exportar datos a CSV y generar gráficos de rendimiento.

## Arquitectura de la Aplicación
La aplicación sigue una arquitectura en capas que incluye las siguientes capas principales:
- **Controladores (Controllers):** Manejan las solicitudes HTTP y dirigen las acciones correspondientes.
- **Servicios (Services):** Contienen la lógica de negocio y se comunican con los DAOs.
- **DAOs (Data Access Objects):** Manejan las operaciones de base de datos utilizando Hibernate.
- **Modelos (Models):** Representan las entidades de la base de datos.

### Diagrama de Arquitectura
[Cliente] --> [Controladores] --> [Servicios] --> [DAOs] --> [Base de Datos]


## Tecnologías Utilizadas
- **Backend:** Java, Hibernate, Servlet API
- **Frontend:** JSP, HTML, CSS, JavaScript (Chart.js)
- **Base de Datos:** MySQL

## Configuración de Hibernate
El archivo `hibernate.cfg.xml` configura la conexión a la base de datos MySQL:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
 "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
 "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
 <session-factory>
   <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
   <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/stocks_db?useSSL=false&serverTimezone=UTC</property>
   <property name="hibernate.connection.username">root</property>
   <property name="hibernate.connection.password"></property>
   <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
   <property name="hibernate.show_sql">true</property>
   <property name="hibernate.format_sql">true</property>
   <property name="hibernate.hbm2ddl.auto">update</property>
   <mapping class## Endpoints
- **/stockController:** Maneja las acciones relacionadas con las acciones (listar, actualizar precios, guardar, consolidar).
- **/exportCSV:** Exporta los datos de las acciones a un archivo CSV.
- **/graficoController:** Genera los datos necesarios para visualizar el gráfico de inversiones.