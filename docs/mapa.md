# Documentación: Pantalla 3 - Mapa Interactivo

## **Propósito**

La pantalla de mapa interactivo permite a los usuarios explorar puntos de interés cercanos a su ubicación o seleccionados según sus preferencias ingresadas en las pantallas anteriores (1 y 2). Proporciona una visualización clara y opciones filtradas para encontrar restaurantes, museos, parques temáticos, alquileres (autos, bicicletas) y teatros.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+
| MAPA |
| [ Representación del mapa con Leaflet ] |
| |
| |

[Actividades] [Ver en el Mapa]
+—————————————————+

### **Filtros Emergentes**

+—————————————————+
| Filtros: |
| [X] Restaurantes |
| [ ] Museos |
| [ ] Parques temáticos |
| [ ] Alquileres (Auto, Bicicletas) |
| [ ] Teatros |
| |
| [ ACEPTAR ] |
+—————————————————+

---

## **Descripción de la Funcionalidad**

1. **Mapa Interactivo (Leaflet):**

   - **Propósito:** Mostrar puntos de interés geolocalizados en un mapa interactivo.
   - **Interacción:**
     - Los usuarios pueden acercar/alejar (`zoom`) y desplazarse por el mapa.
     - Los puntos de interés aparecen como marcadores (`markers`) con íconos representativos.
   - **Contenido:**
     - Restaurantes: Ícono de tenedor y cuchillo.
     - Museos: Ícono de edificio.
     - Parques temáticos: Ícono de carrusel.
     - Alquileres: Ícono de auto o bicicleta.
     - Teatros: Ícono de máscaras de teatro.

2. **Filtros de Actividades:**

   - **Propósito:** Permitir al usuario filtrar los puntos de interés mostrados en el mapa.
   - **Interacción:**
     - Al pulsar el botón **"Actividades"**, aparece una lista emergente de filtros.
     - Los usuarios pueden seleccionar una o más categorías.
     - Al presionar **"Aceptar"**, se actualizan los marcadores en el mapa.

3. **Botones principales:**
   - **"Actividades":**
     - Abre el panel de filtros para seleccionar categorías.
   - **"Ver en el Mapa":**
     - Muestra los marcadores en el mapa según los filtros seleccionados.

---

## **Interacciones y Validaciones**

1. **Mapa:**

   - Los marcadores se actualizan automáticamente al aplicar filtros.
   - Cada marcador debe ser clicable, mostrando un pequeño popup con:
     - Nombre del lugar.
     - Categoría.
     - Botón para más información (e.g., dirección, horarios).

2. **Filtros:**

   - Validar que al menos un filtro esté seleccionado antes de aplicar.
   - Si ningún filtro está seleccionado, mostrar un mensaje: "Por favor selecciona al menos una categoría."

3. **Botones:**
   - **"Actividades":** Activo siempre.
   - **"Ver en el Mapa":** Habilitado solo después de seleccionar y aplicar un filtro.

---

## **Estilo Visual**

- **Mapa:**
  - Usar la biblioteca **Leaflet** con tiles de **OpenStreetMap**.
  - Colores:
    - Fondo del mapa: Predeterminado de OpenStreetMap.
    - Marcadores: Colores distintivos según categoría (e.g., rojo para restaurantes, azul para museos).
- **Filtros:**
  - Diseño minimalista con casillas (`checkbox`) alineadas.
  - Botón "Aceptar" en color azul con texto blanco.
- **General:**
  - Fuente moderna y coherente con el resto de la aplicación.

---

## **Uso de Datos Mock**

### **Puntos de Interés Simulados**

- JSON para simular datos de los puntos de interés:
  ```json
  {
    "points_of_interest": [
      {
        "id": 1,
        "name": "Restaurante La Tabasqueña",
        "type": "Restaurante",
        "latitude": 21.1619,
        "longitude": -86.8515
      },
      {
        "id": 2,
        "name": "Museo Maya",
        "type": "Museo",
        "latitude": 21.1212,
        "longitude": -86.8945
      },
      {
        "id": 3,
        "name": "Parque Xcaret",
        "type": "Parque temático",
        "latitude": 20.5803,
        "longitude": -87.118
      },
      {
        "id": 4,
        "name": "Alquiler de Bicicletas Cancun",
        "type": "Alquiler",
        "latitude": 21.1354,
        "longitude": -86.7827
      },
      {
        "id": 5,
        "name": "Teatro Cancun",
        "type": "Teatro",
        "latitude": 21.1618,
        "longitude": -86.8475
      }
    ]
  }
  ```

Filtros Simulados
• Mock de filtros iniciales:

{
"filters": [
{ "id": 1, "name": "Restaurantes", "selected": true },
{ "id": 2, "name": "Museos", "selected": false },
{ "id": 3, "name": "Parques temáticos", "selected": false },
{ "id": 4, "name": "Alquileres (Auto, Bicicletas)", "selected": false },
{ "id": 5, "name": "Teatros", "selected": false }
]
}

Implementación Técnica

Frontend
• Framework: Flutter con Leaflet Flutter Wrapper para la integración del mapa.
• Componentes necesarios:
• LeafletMap: Para mostrar el mapa interactivo.
• CheckboxListTile: Para los filtros.
• Button: Para “Actividades” y “Ver en el Mapa”.

Lógica de Filtrado
• Filtrar los marcadores mostrados en el mapa con base en las categorías seleccionadas en el panel de filtros.
• Actualizar el mapa en tiempo real tras aplicar los filtros.

UX Mejorado 1. Feedback Visual en el Mapa:
• Mostrar una breve animación al añadir o eliminar marcadores tras aplicar filtros.
• Añadir un contorno brillante al marcador seleccionado. 2. Resumen de Filtros Activos:
• Mostrar un pequeño texto sobre el mapa indicando los filtros activos (e.g., “Mostrando: Restaurantes, Museos”). 3. Accesibilidad:
• Asegurar que todos los elementos sean fácilmente clicables.
• Ofrecer soporte para ampliar marcadores con texto más grande.

Este documento detalla cómo debe funcionar y lucir la pantalla 3: Mapa Interactivo. Si necesitas ajustes o integraciones adicionales, podemos iterar sobre esta base.
