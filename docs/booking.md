# Documentación: Pantalla 7 - Detalles y Reserva de Actividad

## **Propósito**

La pantalla de reserva permite al usuario ver los detalles completos de una actividad o servicio, junto con la opción de realizar una reserva. Presenta información relevante como el nombre, precio, calificación, descripción, horarios y otros datos importantes.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+

[Imagen Principal]
El Obispado
[⭐⭐⭐⭐⭐]
$ 65
—————————————————
Turismo Nuevo León

- General: $65
- Dirección: Rafael J. Verger
- Horarios: Abierto ahora: 09:00 - 18:00
- Disponibilidad: Todo el año
  —————————————————
  [ RESERVA ]
  +—————————————————+

---

## **Descripción de la Funcionalidad**

1. **Encabezado:**

   - **Propósito:** Mostrar la imagen principal de la actividad o servicio.
   - **Detalles:** Incluye un ícono para volver a la pantalla anterior y un ícono para compartir la actividad.

2. **Información Principal:**

   - **Nombre:** El título de la actividad o lugar (e.g., "El Obispado | Museo Regional de Nuevo León").
   - **Calificación:** Representada con estrellas (1-5).
   - **Precio:** Mostrado en formato legible, e.g., "$65".

3. **Detalles Adicionales:**

   - **Proveedor:** Nombre de la entidad responsable del servicio (e.g., "Turismo Nuevo León").
   - **Precio General:** Detalle adicional del costo.
   - **Ubicación:** Dirección completa de la actividad.
   - **Horario:** Horarios de operación, con un indicador de si está abierto actualmente.
   - **Disponibilidad:** Información sobre el periodo del año en que está disponible.

4. **Botón de Reserva:**
   - **Propósito:** Llevar al usuario a un flujo de confirmación de reserva.
   - **Estado:** Activo siempre y visible en la parte inferior de la pantalla.

---

## **Interacciones y Validaciones**

1. **Botón de Reserva:**

   - Al presionarlo, se dirige al flujo de confirmación donde el usuario selecciona la cantidad de boletos y detalles de pago.
   - Validar que los datos de la actividad estén completos antes de proceder.

2. **Íconos de Navegación:**

   - **Regresar:** Lleva al usuario a la pantalla anterior (Lista de Opciones).
   - **Compartir:** Permite compartir el enlace de la actividad a través de redes sociales o mensajería.

3. **Horarios:**

   - Mostrar un mensaje claro si la actividad está cerrada (e.g., "Cerrado ahora").

4. **Calificaciones:**
   - Permitir que las estrellas sean clicables para dirigir al usuario a una sección de reseñas (opcional).

---

## **Estilo Visual**

- **Imagen Principal:**
  - Imagen de alta calidad que ocupa el ancho completo de la pantalla.
- **Texto:**
  - **Título:** Texto grande y en negritas.
  - **Detalles:** Texto más pequeño, alineado a la izquierda, con iconos representativos (e.g., reloj para horarios, mapa para ubicación).
- **Botón de Reserva:**
  - Botón grande y prominente, con texto blanco sobre un fondo colorido (e.g., rosa o azul).

---

## **Uso de Datos Mock**

### **Datos Simulados para la Actividad**

- JSON para simular los detalles de la actividad:
  ```json
  {
    "activity": {
      "id": 1,
      "name": "El Obispado | Museo Regional de Nuevo León",
      "category": "Museos",
      "rating": 4.5,
      "price": 65,
      "provider": "Turismo Nuevo León",
      "details": {
        "general_price": 65,
        "address": "Rafael J. Verger",
        "schedule": "09:00 - 18:00",
        "availability": "Todo el año"
      },
      "image_url": "https://example.com/obispado.jpg"
    }
  }
  ```

Implementación Técnica

Frontend
• Framework: Flutter.
• Componentes necesarios:
• Image: Para mostrar la imagen principal.
• Text: Para el nombre, calificación, precio y detalles.
• IconButton: Para los íconos de navegación (regresar y compartir).
• Button: Para el botón de reserva.

Backend (Simulado con Datos Mock)
• Usar JSON local para los detalles de la actividad hasta que el backend esté disponible.

UX Mejorado 1. Accesibilidad:
• Asegurar que todos los elementos sean fácilmente clicables.
• Proveer soporte para lectores de pantalla (e.g., describir la imagen principal). 2. Interacción Visual:
• Añadir transiciones suaves al navegar entre pantallas.
• Resaltar el botón de reserva al pasar el cursor o tocarlo. 3. Estado de Actividad:
• Indicar claramente si la actividad está cerrada o no disponible.

Este documento refleja cómo debe funcionar y lucir la pantalla de reserva basada en el diseño visual proporcionado. Si necesitas ajustes adicionales, indícalo para iterar en esta base.
