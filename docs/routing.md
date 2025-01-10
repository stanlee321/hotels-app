# Documento de Ruteo y Flujo de Navegación - Aplicación de Huéspedes

## **Propósito**
Este documento describe el flujo de navegación entre las pantallas de la aplicación móvil para huéspedes. Define las rutas y transiciones entre las pantallas para asegurar un flujo de usuario coherente y eficiente.

---

## **Flujo General**


### Descripción Visual del Flujo

[Inicio QR] –> [Registro de Huésped] –> [Presupuesto] –> [Mapa Interactivo] –>
[Actividades] –> [Lista de Opciones] –> [Detalles y Reserva]

### **Diagrama Global de Pantallas**
1. **Pantalla 1 - Inicio QR**
   - **Propósito:** Punto de entrada a la app mediante un escáner de código QR o entrada manual del voucher.
   - **Rutas:**
     - Al completar: Navega a la **Pantalla 2 (Registro de Huésped)**.

2. **Pantalla 2 - Registro de Huésped**
   - **Propósito:** Permite al huésped ingresar su información personal, fechas de estancia y preferencias.
   - **Rutas:**
     - Al completar: Navega a la **Pantalla 3 (Presupuesto)**.

3. **Pantalla 3 - Presupuesto**
   - **Propósito:** Permite al huésped definir el monto y el método de pago.
   - **Rutas:**
     - Al completar: Navega a la **Pantalla 4 (Mapa Interactivo)**.

4. **Pantalla 4 - Mapa Interactivo**
   - **Propósito:** Presenta un mapa con puntos de interés basados en las preferencias del huésped.
   - **Rutas:**
     - Selección de "Actividades": Navega a la **Pantalla 5 (Actividades)**.

5. **Pantalla 5 - Actividades**
   - **Propósito:** Muestra las categorías principales de actividades en un formato de mosaico.
   - **Rutas:**
     - Selección de una categoría: Navega a la **Pantalla 6 (Lista de Opciones)**.

6. **Pantalla 6 - Lista de Opciones**
   - **Propósito:** Muestra una lista detallada de actividades dentro de la categoría seleccionada.
   - **Rutas:**
     - Selección de una actividad: Navega a la **Pantalla 7 (Detalles y Reserva)**.

7. **Pantalla 7 - Detalles y Reserva**
   - **Propósito:** Presenta información detallada de la actividad y permite realizar una reserva.
   - **Rutas:**
     - Al completar una reserva: Se mantiene en esta pantalla con un mensaje de confirmación o navega a un historial de reservas (opcional).

---

## **Definición de Rutas y Navegación**

| Pantalla             | Ruta                   | Acción para Navegar                    |
|----------------------|------------------------|----------------------------------------|
| Inicio QR            | `/inicio`             | Al escanear el QR o ingresar voucher. |
| Registro de Huésped  | `/registro`           | Al completar el QR o avanzar manual.  |
| Presupuesto          | `/presupuesto`        | Al llenar los datos de registro.      |
| Mapa Interactivo     | `/mapa`               | Al definir presupuesto y método pago. |
| Actividades          | `/actividades`        | Al seleccionar "Actividades" en el mapa. |
| Lista de Opciones    | `/opciones/:categoria`| Al seleccionar una categoría.         |
| Detalles y Reserva   | `/detalle/:actividad` | Al seleccionar una actividad.         |

---

## **Transiciones Entre Pantallas**

1. **Inicio QR → Registro de Huésped**
   - **Evento:** Escaneo exitoso del QR o ingreso manual del voucher.
   - **Transición:** Animación de deslizamiento hacia la derecha.

2. **Registro de Huésped → Presupuesto**
   - **Evento:** Completar el formulario de registro.
   - **Transición:** Animación de deslizamiento hacia la derecha.

3. **Presupuesto → Mapa Interactivo**
   - **Evento:** Confirmar el monto y el método de pago.
   - **Transición:** Animación de fundido (fade).

4. **Mapa Interactivo → Actividades**
   - **Evento:** Seleccionar "Actividades".
   - **Transición:** Animación de deslizamiento hacia arriba.

5. **Actividades → Lista de Opciones**
   - **Evento:** Seleccionar una categoría de actividades.
   - **Transición:** Animación de deslizamiento hacia la derecha.

6. **Lista de Opciones → Detalles y Reserva**
   - **Evento:** Seleccionar una actividad de la lista.
   - **Transición:** Animación de ampliación (zoom).

---

## **Estado Global y Persistencia**
- **Estado Compartido:**
  - Información del huésped ingresada en el registro.
  - Preferencias seleccionadas (actividades, presupuesto, etc.).
  - Filtros aplicados en el mapa y categorías.

- **Persistencia:**
  - Usar almacenamiento local para datos básicos (e.g., preferencias del usuario).
  - Sincronizar datos críticos (e.g., reservas) con el backend.

---

## **Consideraciones de UX**
1. **Coherencia Visual:**
   - Usar animaciones consistentes entre pantallas para evitar confusión.
   - Mantener encabezados claros en cada pantalla para indicar el contexto.

2. **Estado del Usuario:**
   - Mostrar un indicador de progreso (e.g., pasos completados) en las pantallas iniciales.
   - Agregar confirmaciones visuales al completar acciones importantes (e.g., reserva realizada).

3. **Flujo de Emergencias:**
   - Permitir que el usuario regrese a cualquier pantalla anterior sin perder datos.

---

Este documento describe en detalle el flujo de navegación y ruteo entre las pantallas de la aplicación. Si se requiere mayor personalización o integración de nuevas funcionalidades, estas rutas pueden ajustarse.

Este esquema cubre tanto el ruteo técnico como las interacciones esperadas entre las pantallas, basado en el flujo general representado en el último screenshot. Si necesitas ajustes o ampliaciones, puedo adaptarlo.