# Roles and General Flows for the Application

## Common Screen: Login

All roles in the application will start from a common login screen. This login screen has the following characteristics:

- **Design:** Based on the screenshot provided.
- **Components:**
  - Input fields for **email/username** and **password**.
  - A "Sign Up" button.
  - Optional features such as "Forgot Password" and social media login options.
  - Role-based redirection logic after successful login.

### Role Validation Process

Upon successful login, the user’s role is validated, and they are redirected to the appropriate flow based on their role. The roles are:

1. **User / Guest (Current Flow)**
2. **Provider**
3. **Admin**
4. **Super Admin**

---

## Role-Based Flows

### 1. **User / Guest**

- **Purpose:** Interaction with the app as a traveler or customer looking for activities, locations, and reservations.
- **Flow:**
Flujo actual de la APP.


### 2. **Provider**

- **Purpose:** Manage and provide services, activities, or locations for the guests.
- **Flow:**

**Roles y Flujos: Proveedores**

**Descripción del Rol de Proveedor**
El proveedor es el usuario encargado de gestionar las reservas y comisiones relacionadas con los servicios que ofrece (hoteles, actividades turísticas, etc.). Su interfaz debe ser intuitiva y eficiente para manejar varias acciones como confirmación de reservas, revisión de comisiones, y control de saldo.

---

## Flujo General del Proveedor

### 1. Pantalla Principal del Proveedor
**Acciones Disponibles:**
- Escaneo de código QR para confirmar reservas.
- Revisión del listado de reservas.
- Generación de reportes de comisiones.
- Ver saldo acumulado (bolsa común).
- Cambiar contraseña.

### 2. Escaneo de Código QR
**Objetivo:**
- Confirmar la llegada de huéspedes o usuarios.
**Detalles:**
- Escaneo directo del código QR que contiene información del cliente.
- Mostrando:
  - Nombre del cliente.
  - Cantidad de personas confirmadas.
  - Botón “Confirmar”.

### 3. Listado de Reservas
**Objetivo:**
- Visualizar y gestionar todas las reservas activas.
**Detalles:**
- Mostrando:
  - Nombre del hotel o actividad.
  - Estado de la reserva (VGHT: vigente, RTRS: retraso, ESPR: en espera, etc.).
  - Opciones para contactar con el cliente o marcar como "No Show" (no se presentó).

### 4. Reporte de Comisiones
**Objetivo:**
- Consultar y aceptar comisiones generadas por las reservas.
**Detalles:**
- Mostrando:
  - Resumen del período seleccionado.
  - Comisión total generada.
  - Saldo en la bolsa común.
- Botón para generar y enviar un PDF con detalles (como los incluidos en la imagen compartida).

### 5. Cambiar Contraseña
**Objetivo:**
- Actualizar credenciales de acceso del proveedor.
**Detalles:**
- Mostrar campos para:
  - Contraseña actual.
  - Nueva contraseña.
  - Confirmar contraseña.
- Botón “Aceptar” para guardar los cambios.

---

## Pantallas Detalladas para el Proveedor

### Pantalla 1: Confirmación de Proveedor
- **Secciones:**
  - Escaneo de código QR.
  - Opciones de menú (“Reservas”, “Reporte de comisiones”, “Saldo de bolsa”, “Cambiar contraseña”).
- **Interacción:**
  - Menú principal con botones claros y segmentados.

### Pantalla 2: Listado de Reservas
- **Diseño:**
  - Tabla de reservas organizadas por nombre y estado.
  - Botones para contactar con cliente o cambiar estado.

### Pantalla 3: Reporte de Comisiones
- **Contenido:**
  - Periodo de fechas seleccionado.
  - Listado de reservas asociadas a las comisiones.
  - Botón “Generar PDF” para exportar y enviar reporte.

### Pantalla 4: Saldo de Bolsa Común
- **Información Clave:**
  - Saldo actual.
  - Transacciones recientes relacionadas con la bolsa común.

### Pantalla 5: Cambiar Contraseña
- **Detalles:**
  - Formulario simple con campos para contraseña actual, nueva y confirmación.

---

## Estilo y Lineamientos de Diseño para Proveedores
- **Estilo Airbnb:**
  - Colores suaves y atractivos para transmitir profesionalismo y confianza.
  - Uso de iconografía clara para diferenciar secciones.
  - Tipografía legible y consistente.
- **Interacción UX:**
  - Flujos simples con botones y acciones visibles.
  - Validación en tiempo real para formularios.
  - Respuestas inmediatas al usuario (feedback visual).

## Resumen del Flujo de Proveedor
- **Inicio:** Login compartido.
- **Menú Principal:** Selección de acciones principales (Escaneo QR, Reservas, Comisiones, etc.).
- **Confirmación QR:** Validación de códigos para usuarios.
- **Reservas:** Gestor para manejo de clientes.
- **Comisiones:** Revisión y aprobación de comisiones con posibilidad de exportar reporte.




# Flujo de Proveedor con Pantallas en ASCII

## 1. Pantalla de Inicio: Confirmación del Proveedor
```
+------------------------------------------------+
|                CONFIRMACIÓN                   |
|                 DEL PROVEEDOR                 |
|                                                |
| Escanea el Código QR:                         |
|    [QR CODE PLACEHOLDER]                       |
|                                                |
| Nombre: Nombre del Proveedor                  |
| Cantidad de Personas: 5                       |
|                                                |
| [CONFIRMAR]                                    |
+------------------------------------------------+
```

### UI/UX Details:
- **Estilo gráfico:** Similitud a la estética de Airbnb: colores suaves, sombras sutiles, fuentes sans-serif modernas.
- **Botón:** "Confirmar" debe estar destacado en color verde o azul claro, con bordes redondeados y efecto hover animado.
- **Iconos:** Íconos minimalistas para escanear QR.

---

## 2. Pantalla de Listado de Reservas
```
+------------------------------------------------+
|               LISTADO DE RESERVAS              |
|                                                |
| Hotel: Nombre del Hotel 1                      |
|    - Nombre: Nombre 1   [Estado: VGHT]        |
|    - Nombre: Nombre 2   [Estado: RTRS]        |
|                                                |
| Hotel: Nombre del Hotel 2                      |
|    - Nombre: Nombre 3   [Estado: ESPR]        |
+------------------------------------------------+
```

### Interacción
- Al hacer clic en cualquier reserva, se abre un diálogo modal con:
  - Nombre del cliente
  - Número de teléfono
  - Selector de estado (VGHT/RTRS/ESPR)
  - Botones de acción:
    - Llamar al cliente
    - Marcar como No Show
    - Guardar cambios
    - Cancelar

### Flujo de Cambio de Estado
1. Usuario hace clic en una reserva
2. Se abre el modal con la información detallada
3. Usuario puede:
   - Cambiar el estado mediante los botones de estado
   - Llamar directamente al cliente
   - Marcar la reserva como No Show
4. Al guardar:
   - Se actualiza el estado en la lista
   - Se muestra confirmación del cambio
   - Se notifica al hotel del cambio (pendiente implementación)

### UI/UX Details:
- **Colores:** Estados codificados con colores (verde, rojo, amarillo) según el estado.
- **Acciones:** Botón "Detalles" para ver más información, colocado de forma clara bajo cada sección de reservas.

### Estados de Reserva
Los estados de reserva pueden ser cambiados por el proveedor mediante un toggle switch:

- **VGHT (Vigente)**: Reserva activa y dentro del horario previsto
- **RTRS (Retrasado)**: Cliente ha notificado retraso o no ha llegado a tiempo
- **ESPR (Espera)**: En espera de confirmación o pendiente de llegada

### Funcionalidad de Cambio de Estado
- El proveedor puede cambiar el estado de cualquier reserva en tiempo real
- Los cambios deben ser confirmados para evitar modificaciones accidentales
- Se debe mantener un historial de cambios de estado
- Notificar al hotel correspondiente cuando se realice un cambio de estado

---

## 3. Pantalla de Reporte de Comisiones
```
+------------------------------------------------+
|            REPORTE DE COMISIONES               |
|                                                |
| Fecha: 14-01-2025                              |
| Comision Total $us         | 30                |
| Saldo Bolsa actual $us     | 1080             |
| Saldo Bolsa aplicada $us   | 1050             |
|                                                |
| Nombre del Hotel 1                             |
|   Cantidad de Reservas | 10                    |
|   Total Comision      | 20 $us                |
|            [ACEPTAR]                           |
|                                                |
| Nombre del Hotel 2                             |
|   Cantidad de Reservas | 50                    |
|   Total Comision      | 10 $us                |
|            [ACEPTAR]                           |
|                                                |
|            [Enviar PDF]                        |
+------------------------------------------------+
```

### Detalles de la Interfaz
- **Encabezado**: Muestra fecha y totales generales
- **Saldos**: Muestra información de la bolsa actual y aplicada
- **Por Hotel**: 
  - Muestra cantidad de reservas por hotel
  - Total de comisión por hotel
  - Botón de aceptar por hotel
- **Acciones**:
  - Aceptar comisiones por hotel individualmente
  - Generar y enviar reporte PDF

### Flujo de Confirmación
1. Al hacer clic en "ACEPTAR" para un hotel:
   - Se muestra diálogo de confirmación
   - Opciones: Confirmar o Cancelar
2. Al confirmar:
   - Se muestra animación de éxito
   - La animación se auto-cierra después de 2 segundos
   - Se actualiza el estado del reporte
3. Al cancelar:
   - Se cierra el diálogo sin cambios

### Elementos UI/UX
- **Cards**: Bordes redondeados y sombras suaves
- **Botones**: 
  - ACEPTAR: Azul primario con texto blanco
  - Cancelar: Gris neutro
- **Animaciones**: 
  - Ícono de check verde para confirmación
  - Transiciones suaves en diálogos

---

## 4. Pantalla de Cambio de Contraseña
```
+------------------------------------------------+
|               CAMBIAR CONTRASEÑA               |
|                                                |
| Contraseña Actual: [__________]                |
| Nueva Contraseña:   [__________]               |
| Confirmar Nueva:    [__________]               |
|                                                |
| [ACEPTAR]                                      |
+------------------------------------------------+
```

### UI/UX Details:
- **Seguridad:** Indicador de fuerza de contraseña al escribir.
- **Colores:** Botón de aceptar en azul y mensajes de error en rojo.

---

## 5. Pantalla de Resumen y PDF
```
+------------------------------------------------+
|         RESUMEN DE COMISIONES ENVIADO          |
|                                                |
| Generación Exitosa                             |
| Archivo PDF enviado al correo:                 |
| proveedor@correo.com                           |
|                                                |
| [ACEPTAR]                                      |
+------------------------------------------------+
```

### UI/UX Details:
- **Notificación:** Animación breve (check verde) al generar el PDF.
- **Estética:** Fondo con degradado sutil y tipografía ligera.



### 3. **Admin**

- **Purpose:** Manage the system’s overall operations, oversee providers, and handle escalations.
- **Flow:**
  - Dashboard:
    - Overview of platform performance and provider activity.
  - Provider Management:
    - Approve/reject provider registrations.
    - Monitor provider services and compliance.
  - Issue Handling:
    - Address escalations from users or providers.
    - Manage system notifications and warnings.
  - Reports:
    - Generate and export data on users, providers, and overall platform performance.

### 4. **Super Admin**

- **Purpose:** Full access to all system features with authority over admins, providers, and platform configurations.
- **Flow:**
  - Global Dashboard:
    - Monitor all activities across roles.
  - Role Management:
    - Add/Edit/Delete roles (Admins, Providers, etc.).
  - Platform Configuration:
    - Manage platform-wide settings like payment gateways, server configurations, and policies.
  - Security Oversight:
    - Monitor and respond to security threats or breaches.
  - Reporting and Analytics:
    - Access all platform data with advanced analytics and insights.

---

## Next Steps

1. **Screen Development:** Each flow will require specific screens, which will be designed and mapped in further detail.
2. **Validation Logic:** Backend validation logic will ensure that users are redirected to the correct flow based on their role.
3. **API Design:** APIs will need to support role-based actions and ensure security for role segregation.

This document serves as the foundational guide for understanding roles and their respective flows, enabling the development of role-specific functionalities in the application.

\
Hagamoslo mejor.\


