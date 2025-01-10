# Documentación: Pantalla 6 - Lista de Opciones (Categorías Detalladas)

## **Propósito**
Esta pantalla muestra una lista de actividades u opciones dentro de una categoría seleccionada. Su diseño está orientado a facilitar la exploración de información detallada sobre cada actividad, destacando elementos como el nombre, precio, calificación y otras características relevantes.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+

CULTURAL
[⭐ ⭐ ⭐ ⭐ ⭐] Museo de Historia Mexicana
$40
—————————————————
[⭐ ⭐ ⭐ ⭐ ] Museo del Noreste
$40
—————————————————
[⭐ ⭐ ⭐ ⭐ ] Museo del Palacio de Gobierno
Gratis
+—————————————————+

### **Detalles Visuales**
1. **Encabezado:**
   - El título de la categoría (e.g., "Cultural") aparece en la parte superior.
   - Iconos de navegación a la izquierda (volver) y a la derecha (filtros).

2. **Lista de Opciones:**
   - Cada actividad se presenta en una tarjeta que incluye:
     - Imagen representativa en la parte superior.
     - Nombre de la actividad (e.g., "Museo de Historia Mexicana").
     - Categoría o subtítulo.
     - Calificación en estrellas.
     - Precio (e.g., "$40" o "Gratis").
     - Ícono de favorito (corazón) en la esquina superior derecha de la tarjeta.

3. **Acción:**
   - Al seleccionar una tarjeta, el usuario será dirigido a la página de detalles de la actividad.

---

## **Descripción de la Funcionalidad**

1. **Encabezado de Categoría:**
   - **Propósito:** Indicar la categoría actualmente seleccionada.
   - **Interacción:**
     - Botón de retroceso para volver a la pantalla anterior.
     - Botón de filtros para ordenar y personalizar las opciones mostradas.

2. **Tarjetas de Actividades:**
   - **Interacción:** Cada tarjeta es clicable y lleva a una página de detalles de la actividad.
   - **Información contenida:**
     - Imagen destacada: Una representación visual de la actividad.
     - Nombre de la actividad: Texto en negritas para mayor visibilidad.
     - Subcategoría: Ejemplo, "Museos".
     - Calificación: Mostrada como estrellas (1-5).
     - Precio: Indicado claramente con formato "$X" o "Gratis".
     - Botón de favorito: Permite al usuario marcar la actividad como favorita.

3. **Filtros:**
   - **Opciones disponibles:**
     - Ordenar por precio (ascendente/descendente).
     - Ordenar por calificación.
     - Mostrar solo actividades gratuitas.
   - **Interacción:** Botón de filtro despliega un menú emergente para seleccionar criterios.

---

## **Interacciones y Validaciones**

1. **Tarjetas de Actividades:**
   - Validar que la imagen, nombre, calificación y precio se carguen correctamente.
   - Si no hay actividades disponibles, mostrar un mensaje: "No se encontraron actividades en esta categoría."

2. **Filtros:**
   - Asegurar que los filtros aplicados actualicen la lista en tiempo real.
   - Permitir al usuario restablecer filtros a sus valores predeterminados.

3. **Botones:**
   - Botón de retroceso: Regresa a la pantalla anterior.
   - Botón de favorito: Cambia de estado (vacío a lleno) al tocarlo.

---

## **Estilo Visual**
- **Tarjetas de Actividades:**
  - Fondo blanco con bordes redondeados.
  - Imagen superior que ocupa el 50% de la tarjeta.
  - Texto en negro con tipografía moderna.
  - Ícono de favorito (corazón) en gris claro que se llena en rojo al seleccionarse.

- **Colores:**
  - Fondo de la pantalla: Blanco.
  - Tarjetas: Blanco con sombra ligera para destacar.
  - Texto: Negro para nombres y detalles, gris para subtítulos.

- **Animaciones:**
  - Transición suave al desplazarse por la lista.
  - Efecto de presión al seleccionar tarjetas.

---

## **Uso de Datos Mock**

### **Lista de Opciones Simuladas**
- JSON para simular las actividades en esta categoría:
  ```json
  {
    "category": "Cultural",
    "activities": [
      {
        "id": 1,
        "name": "Museo de Historia Mexicana",
        "subtitle": "Museos",
        "rating": 5,
        "price": 40,
        "image_url": "https://example.com/museo1.jpg"
      },
      {
        "id": 2,
        "name": "Museo del Noreste | MUNE",
        "subtitle": "Museos",
        "rating": 4,
        "price": 40,
        "image_url": "https://example.com/museo2.jpg"
      },
      {
        "id": 3,
        "name": "Museo del Palacio de Gobierno",
        "subtitle": "Museos",
        "rating": 4,
        "price": 0,
        "image_url": "https://example.com/museo3.jpg"
      }
    ]
  }

Implementación Técnica

Frontend
	•	Framework: Flutter.
	•	Componentes necesarios:
	•	ListView: Para mostrar la lista de actividades.
	•	Card: Para diseñar las tarjetas.
	•	Icon: Para los íconos de favorito y calificación.
	•	Image: Para mostrar imágenes de las actividades.
	•	DropdownMenu: Para implementar los filtros.

Backend (Simulado con Datos Mock)
	•	Usar datos JSON locales para las actividades hasta que el backend esté disponible.
	•	Incluir filtros básicos como precio y calificación.

UX Mejorado
	1.	Navegación:
	•	Añadir una barra de progreso o breadcrumb en la parte superior para mostrar la jerarquía de navegación.
	2.	Estado Visual:
	•	Resaltar las tarjetas al pasar el cursor o tocarlas.
	•	Cambiar el color del ícono de favorito al seleccionarlo.
	3.	Filtros Dinámicos:
	•	Mostrar un contador de actividades según los filtros aplicados (e.g., “3 actividades disponibles”).

Este documento detalla cómo debe funcionar y lucir la pantalla 6: Lista de Opciones (Categorías Detalladas). Si necesitas ajustes adicionales o iteraciones, indícalo, y podemos adaptarlo.