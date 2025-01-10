# Documentación: Pantalla 1 - Registro de Huésped (Onboarding)

## **Propósito**

Esta pantalla permite a los huéspedes registrarse en el sistema proporcionando información clave sobre su estancia y preferencias. Es el primer paso en el flujo de onboarding y asegura que los datos necesarios para personalizar la experiencia del usuario se recopilen de manera eficiente.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+

Registro de Huésped
[Escanear Voucher QR]
o

# Voucher: [__________________________]

Nombre completo: [____________________]
Fecha de llegada: [] Salida: []
Número de adultos: [-] 2 [+]
Número de niños: [-] 1 [+]

# Teléfono móvil: [____________________]

Correo electrónico: [___________________]
—————————————————
Características / Actividades:
[ Tour guiado ] [ Renta de carro ]
[ Vida nocturna ] [ Eventos culturales ]
—————————————————
Presupuesto $$$: [____________________]
—————————————————
[ ACEPTAR ]
+—————————————————+

---

## **Descripción de la Funcionalidad**

1. **Campos de entrada:**

   - **[Escanear Voucher QR]:** Botón para activar la cámara y escanear un código QR que rellena automáticamente el campo "Voucher".
   - **# Voucher:** Campo para ingresar manualmente el código único proporcionado por el hotel o la agencia. Este campo es obligatorio si no se escanea el QR.
   - **Nombre completo:** Campo para que el usuario registre su nombre y apellidos.
   - **Fecha de llegada y salida:** Selector de fechas interactivo que despliega un calendario para elegir las fechas correspondientes.
   - **Número de adultos y niños:** Controles tipo `Stepper` para ajustar el número de personas mediante botones `+` y `-`.
   - **# Teléfono móvil:** Campo para registrar el número de contacto del huésped.
   - **Correo electrónico:** Campo para el email del usuario, con validación de formato.

2. **Opciones de actividades:**

   - Diseñadas como botones clicables con íconos representativos y etiquetas claras.
   - Actividades sugeridas: "Tour guiado", "Renta de carro", "Vida nocturna", "Eventos culturales".
   - Los usuarios pueden seleccionar múltiples actividades.

3. **Presupuesto:**

   - Campo para ingresar el presupuesto estimado en dólares o moneda local.
   - Validación para permitir únicamente valores numéricos.

4. **Botón de acción:**
   - **[ACEPTAR]:** Envía los datos ingresados para registrarlos en el sistema y continuar al siguiente paso del flujo de onboarding.

---

## **Interacciones y Validaciones**

### **Voucher QR:**

- Si el usuario escanea un código QR válido:
  - Rellenar automáticamente el campo "Voucher".
  - Mostrar un mensaje de éxito.
- Si el código QR es inválido:
  - Mostrar un mensaje de error indicando que el voucher no es válido.

### **Fecha de llegada y salida:**

- Asegurar que las fechas seleccionadas sean válidas:
  - La fecha de salida debe ser posterior a la de llegada.
- Mostrar un mensaje de error si el rango es inválido.

### **Número de personas:**

- Los botones `+` y `-` permiten aumentar o disminuir el número.
- Validar que los valores sean positivos y razonables (ejemplo: máximo 10 adultos).

### **Correo electrónico:**

- Validar que el formato sea correcto (ejemplo: `usuario@dominio.com`).
- Mostrar un mensaje de error en caso de formato inválido.

### **Botón ACEPTAR:**

- Activar únicamente cuando todos los campos obligatorios estén completos.
- Al presionarlo:
  - Mostrar un indicador de carga.
  - Confirmar si los datos se enviaron correctamente.

---

## **Estilo Visual**

- **Fuente:** Moderna y minimalista, similar a la utilizada en interfaces de Airbnb.
- **Colores:**
  - Fondo blanco con texto en negro para los campos.
  - Botón "ACEPTAR" en color azul con texto blanco.
- **Interactividad:**
  - Campos resaltados cuando están activos.
  - Animaciones suaves al interactuar con botones y controles.

---

## **Uso de Datos Mock**

1. **# Voucher:**

   - Mock: Códigos de ejemplo como `ABC123`, `XYZ789`.
   - Usar QR mock que rellene automáticamente el código al escanear.

2. **Fecha de llegada y salida:**

   - Mock: Fechas predefinidas para prueba (ejemplo: hoy como fecha de llegada, tres días después como salida).

3. **Número de adultos y niños:**

   - Mock: Valores iniciales como `2 adultos, 1 niño`.

4. **Actividades:**

   - Mock: Opciones estáticas como "Tour guiado", "Eventos culturales", "Renta de carro", "Vida nocturna".

5. **Presupuesto:**
   - Mock: Valores sugeridos como `$500`, `$1000`.

---

## **Implementación Técnica**

### **Frontend**

- **Framework:** Flutter.
- **Componentes necesarios:**
  - `TextField`: Para campos como voucher, nombre, teléfono, correo electrónico.
  - `DatePicker`: Para la selección de fechas.
  - `Stepper`: Para seleccionar número de personas.
  - `Button`: Para el botón "ACEPTAR".
  - `Card` o `Grid`: Para las actividades con íconos representativos.

### **Backend (Simulado con Datos Mock)**

- Usar datos locales (JSON) hasta que el backend esté disponible.
- Ejemplo de JSON mock para actividades:
  ```json
  {
    "activities": [
      { "id": 1, "name": "Tour guiado", "icon": "tour" },
      { "id": 2, "name": "Eventos culturales", "icon": "event" },
      { "id": 3, "name": "Renta de carro", "icon": "car" },
      { "id": 4, "name": "Vida nocturna", "icon": "nightlife" }
    ]
  }
  ```

UX Mejorado 1. Interacción QR:
• Escáner integrado para ahorrar tiempo al ingresar manualmente el voucher. 2. Selector de personas:
• Uso de botones incrementales para hacerlo más intuitivo. 3. Actividades:
• Tarjetas clicables con íconos visualmente atractivos.

Este documento detalla el rediseño y mejora de la pantalla de registro de huésped con datos mock para pruebas y sugerencias de interacción optimizadas para el usuario.
