### Flujo de Trabajo

#### 1. Estructura de Ramas
- **main:** Rama principal para el código de producción.
- **codigo:** Rama de desarrollo para el código antes de ser enviado a producción.
- **documentacion:** Rama dedicada exclusivamente a la documentación.

!workflow.png

#### 2. Flujo de Trabajo

##### Desarrollo en la Rama `codigo`
1. **Cambiar a la rama `codigo`:**
   ```bash
   git checkout codigo
   ```

2. **Realizar cambios y confirmarlos:**
   ```bash
   git add .
   git commit -m "Descripción de los cambios realizados"
   ```

3. **Enviar los cambios a la rama `codigo` en el repositorio remoto:**
   ```bash
   git push origin codigo
   ```

##### Fusión de `codigo` a `main`
1. **Cambiar a la rama `main`:**
   ```bash
   git checkout main
   ```

2. **Fusionar los cambios de `codigo` a `main`:**
   ```bash
   git merge codigo
   ```

3. **Enviar los cambios a la rama `main` en el repositorio remoto:**
   ```bash
   git push origin main
   ```

##### Trabajo en la Rama `documentacion`
1. **Cambiar a la rama `documentacion`:**
   ```bash
   git checkout documentacion
   ```

2. **Realizar cambios en la documentación y confirmarlos:**
   ```bash
   git add .
   git commit -m "Actualización de la documentación"
   ```

3. **Enviar los cambios a la rama `documentacion` en el repositorio remoto:**
   ```bash
   git push origin documentacion
   ```

#### 3. Flujo de Trabajo Completo

```bash
# Crear y cambiar a la rama 'codigo'
git checkout -b codigo

# Realizar cambios en el código
git add .
git commit -m "Descripción de los cambios realizados"
git push origin codigo

# Cambiar a la rama 'main' y fusionar los cambios de 'codigo'
git checkout main
git merge codigo
git push origin main

# Cambiar a la rama 'documentacion'
git checkout documentacion

# Realizar cambios en la documentación
git add .
git commit -m "Actualización de la documentación"
git push origin documentacion
```

### Resumen del Flujo de Trabajo
- **Rama `codigo`:** Para desarrollo y pruebas antes de enviar a producción.
- **Rama `main`:** Para el código de producción.
- **Rama `documentacion`:** Exclusivamente para la documentación, no se mezcla con `main`.

Este flujo de trabajo permite mantener un desarrollo organizado y separado entre el código y la documentación. 

