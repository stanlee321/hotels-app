# Documentación: Pantalla 5 - Selección de Actividades

## **Propósito**

La pantalla de actividades permite a los usuarios explorar y seleccionar diferentes categorías de actividades disponibles durante su estancia. Se utiliza un diseño en formato de **mosaicos/grillas** para presentar de manera atractiva y organizada las opciones como tours guiados, eventos, vida nocturna, compras y más.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+

ACTIVIDADES
[ Tours Guiados ] [ Rentas Auto, Barco ]
[ Eventos ] [ Vida Nocturna ]
[ Lugares ] [ Compras ]
+—————————————————+

---

### **Descripción Visual del Diseño**

1. **Diseño en Mosaico/Grilla:**

   - **Cada categoría** se representa como una "tarjeta" dentro de una grilla de dos columnas.
   - Cada tarjeta contiene:
     - **Un ícono representativo.**
     - **Texto centrado** indicando el nombre de la categoría.
   - Las tarjetas tienen un diseño limpio, con bordes redondeados y una sombra sutil para dar sensación de profundidad.

2. **Encabezado de Categorías:**
   - Una barra en la parte superior con dos pestañas:
     - **Top:** Muestra las categorías más populares.
     - **Todo:** Muestra todas las categorías disponibles.

---

## **Descripción de la Funcionalidad**

1. **Interacción con las Tarjetas:**

   - **Acción:** Al tocar una tarjeta, el usuario es dirigido a la lista de actividades específicas dentro de esa categoría.
   - **Diseño:** Las tarjetas tienen un efecto de "presión" al ser tocadas (e.g., cambio de color o animación de escala).
   - **Ejemplo:** Si el usuario selecciona "Tours Guiados", será llevado a una pantalla que muestra todos los tours disponibles.

2. **Opciones de Filtrado:**

   - **Propósito:** Permitir a los usuarios filtrar actividades dentro de una categoría.
   - **Interacción:** Barra de filtros disponible en la parte superior de la lista de actividades.
     - Ejemplo: Ordenar actividades por precio, distancia o popularidad.

3. **Indicador de Estado de Categorías:**
   - Mostrar etiquetas como "Nuevo" o "Popular" en las tarjetas para destacar categorías relevantes.

---

## **Interacciones y Validaciones**

1. **Selección de Tarjetas:**

   - Validar que cada tarjeta lleve a la página correcta con las actividades relevantes.
   - Si no hay actividades en una categoría, mostrar un mensaje: "No hay actividades disponibles en esta categoría."

2. **Filtros:**

   - Validar que los filtros aplicados actualicen la lista correctamente.
   - Agregar un botón para restablecer filtros al estado predeterminado.

3. **Transiciones:**
   - Aplicar animaciones suaves al cambiar entre pestañas (Top/Todo) o al seleccionar una tarjeta.

---

## **Estilo Visual**

- **Grilla de Tarjetas:**

  - Dos columnas con separación uniforme.
  - Tarjetas con bordes redondeados, colores distintivos y una sombra ligera.
  - Íconos grandes y texto centrado.

- **Colores:**

  - Fondo blanco para toda la pantalla.
  - Tarjetas con colores suaves (e.g., tonos pastel o gradientes).
  - Texto en negro o gris oscuro para contraste.

- **Animaciones:**
  - Tarjetas que aumentan ligeramente de tamaño al ser seleccionadas.
  - Animaciones suaves al cambiar entre pestañas.

---

## **Uso de Datos Mock**

### **Categorías y Actividades Simuladas**

- JSON para simular datos de las categorías y actividades:
  ```json
  {
    "categories": [
      {
        "id": 1,
        "name": "Tours Guiados",
        "icon": "tour_icon",
        "activities": [
          { "id": 101, "name": "Tour por el centro histórico", "price": 50 },
          { "id": 102, "name": "Recorrido en lancha por el río", "price": 30 }
        ]
      },
      {
        "id": 2,
        "name": "Rentas Auto, Barco",
        "icon": "rent_icon",
        "activities": [
          { "id": 201, "name": "Alquiler de auto compacto", "price": 40 },
          { "id": 202, "name": "Alquiler de lancha", "price": 60 }
        ]
      },
      {
        "id": 3,
        "name": "Eventos",
        "icon": "event_icon",
        "activities": [
          { "id": 301, "name": "Concierto local", "price": 25 },
          { "id": 302, "name": "Feria gastronómica", "price": 15 }
        ]
      }
    ]
  }
  ```

Implementación Técnica

Frontend
• Framework: Flutter.
• Componentes necesarios:
• GridView: Para mostrar las categorías en formato mosaico.
• Card: Para cada categoría.
• Icon: Para los íconos de cada categoría.
• TabBar: Para las pestañas de “Top” y “Todo”.

Backend (Simulado con Datos Mock)
• Usar datos JSON locales para las categorías y actividades hasta que el backend esté disponible.
• Proveer filtros como precio, distancia y popularidad en la lista de actividades.

UX Mejorado 1. Visualización de Actividades:
• Añadir etiquetas como “Nuevo” o “Recomendado” en categorías con actividades destacadas. 2. Interacción:
• Animaciones suaves al seleccionar tarjetas y al cambiar entre pestañas.
• Implementar un cambio de color en las tarjetas seleccionadas para confirmar la interacción. 3. Accesibilidad:
• Asegurar que las tarjetas sean suficientemente grandes para facilitar el toque en dispositivos pequeños.
• Añadir soporte para lectores de pantalla.

Este documento refleja la intención de UI/UX basada en el mockup y diseño final proporcionado (mosaico/grilla). Si necesitas ajustes adicionales, puedo incorporarlos.
