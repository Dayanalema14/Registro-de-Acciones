
**Casos de prueba**

|**ID**|**Resumen**|**Prioridad**|**Precondiciones**|**Datos de entrada**|**Pasos**|**Resultado esperado**|
| :-: | :-: | :-: | :-: | :-: | :- | :-: |
|CP-001|Verificar que se pueda registrar una nueva acción correctamente.|Alta|La aplicación debe estar en funcionamiento.|Nombre de la compañía, símbolo, fecha de compra, cantidad, precio de compra.|<p>1. Navegar a la página de registro de acciones.</p><p>2. Ingresar el nombre de la compañía.</p><p>3. Ingresar el símbolo de la acción.</p><p>4. Ingresar la fecha de compra.</p><p>5. Ingresar la cantidad de acciones compradas.</p><p>6. Ingresar el precio de compra por acción.</p><p>7. Hacer clic en "Registrar Compra".</p><p></p>|<p>La acción se guarda y aparece en la lista de acciones compradas.</p><p></p>|
|CP-002|Verificar que se puedan actualizar los precios de las acciones correctamente.|Alta|La aplicación debe estar en funcionamiento|` `N/A |<p>1. Navegar a la página de acciones compradas.</p><p>2. Hacer clic en "Actualizar Precios".</p><p></p>|Los precios se actualizan correctamente desde el API y se reflejan en la lista de acciones.|
|CP-003|Verificar que se puedan exportar las acciones compradas a un archivo CSV.|Media|La aplicación debe estar en funcionamiento|` `N/A |<p>1. Navegar a la página de acciones compradas.</p><p>2. Hacer clic en "Exportar CSV".</p>|Se descarga un archivo CSV con los datos correctos de las acciones compradas.|
|CP-004|Verificar que se pueda visualizar el gráfico de inversiones correctamente.|Media|La aplicación debe estar en funcionamiento|N/A  |1. Navegar a la página de gráfico de inversiones.|El gráfico se muestra con los datos correctos de las inversiones.|
|CP-005|Verificar que se pueda ver el resumen consolidado de las acciones compradas.|Alta|` `La aplicación debe estar en funcionamiento|Símbolo de la acción.|<p>1. Navegar a la página de consolidado.</p><p>2. Seleccionar un símbolo en el combobox de filtrado.</p><p></p>|Se muestra un resumen con la cantidad total comprada, el precio promedio, el último precio registrado, y las ganancias/pérdidas.|


