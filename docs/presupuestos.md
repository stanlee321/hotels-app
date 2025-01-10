# Documentación: Pantalla 2 - Presupuesto y Método de Pago

## **Propósito**

Esta pantalla permite a los usuarios ingresar el monto que desean pagar y seleccionar un método de pago entre varias opciones. Facilita el flujo de pagos en el proceso de registro y asegura flexibilidad al aceptar múltiples métodos de pago.

---

## **Diseño de la UI**

### Esquema ASCII

+—————————————————+

PRESUPUESTO
Ingrese el monto a pagar: [ $___ ]
—————————————————
Método de pago:
( ) Pago con tarjeta
( ) Efectivo
( ) Transferencia bancaria
( ) Pago por QR
—————————————————
[ ACEPTAR ]
+—————————————————+

---

## **Descripción de la Funcionalidad**

1. **Campo de ingreso del monto:**

   - **Propósito:** Permitir al usuario definir cuánto desea pagar.
   - **Detalles:** El campo acepta valores numéricos, representados en la moneda local o dólares estadounidenses (USD).
   - **Validación:** Solo se aceptan valores mayores a $0.

2. **Método de pago:**

   - **Opciones disponibles:**
     - **Pago con tarjeta:** El usuario puede ingresar los detalles de su tarjeta para completar el pago.
     - **Efectivo:** Registra el pago manualmente; se espera confirmación física.
     - **Transferencia bancaria:** Solicita datos bancarios para enviar una transferencia.
     - **Pago por QR:** Genera un código QR para que el usuario realice el pago desde su aplicación bancaria.
   - **Interacción:** Cada opción se selecciona mediante un botón de radio (solo se puede elegir una opción).

3. **Botón "ACEPTAR":**
   - **Propósito:** Confirma el monto y el método de pago seleccionados.
   - **Estado activo:** Se habilita únicamente cuando:
     - El monto a pagar es válido.
     - Se ha seleccionado un método de pago.

---

## **Interacciones y Validaciones**

### **Monto a pagar:**

- **Validación de entrada:**
  - Aceptar únicamente números positivos.
  - Mostrar un mensaje de error si el campo queda vacío o contiene un valor inválido.

### **Método de pago:**

- **Validación de selección:**
  - Asegurar que el usuario seleccione solo una opción antes de habilitar el botón "ACEPTAR".
  - Mostrar un mensaje de error si el usuario intenta continuar sin seleccionar un método.

### **Botón "ACEPTAR":**

- Activo únicamente cuando:
  - El monto ingresado es válido.
  - Un método de pago ha sido seleccionado.
- **Acción al presionar:**
  - Registrar la información y proceder al siguiente paso.
  - Mostrar un indicador de carga mientras se procesa la información.

---

## **Estilo Visual**

- **Fuente:** Moderna y minimalista, coherente con el diseño de la primera pantalla.
- **Colores:**
  - Fondo blanco para toda la pantalla.
  - Botones de método de pago con colores distintivos para cada opción:
    - Pago con tarjeta: Azul.
    - Efectivo: Verde.
    - Transferencia bancaria: Gris.
    - Pago por QR: Naranja.
  - Botón "ACEPTAR" en color azul con texto blanco.
- **Interactividad:**
  - Animaciones suaves al seleccionar un método de pago.
  - Resaltado dinámico del campo "Monto a pagar" cuando está activo.

---

## **Uso de Datos Mock**

### **Datos simulados para métodos de pago:**

- **Pago con tarjeta:**
  - Mock: Número de tarjeta de prueba `4111 1111 1111 1111`, fecha de vencimiento `12/24`, CVV `123`.
- **Efectivo:**
  - Mock: Simular confirmación de pago manual sin detalles adicionales.
- **Transferencia bancaria:**
  - Mock: Datos bancarios ficticios.
    - Nombre del banco: "Banco Mock".
    - Número de cuenta: `123456789`.
    - Código SWIFT: `MOCKUS33`.
- **Pago por QR:**
  - Mock: Generar un código QR estático con un monto fijo ($100).

---

## **Implementación Técnica**

### **Frontend**

- **Framework:** Flutter.
- **Componentes necesarios:**
  - `TextField`: Para el ingreso del monto.
  - `RadioListTile`: Para las opciones de método de pago.
  - `Button`: Para el botón "ACEPTAR".
  - `Icon`: Representar cada método de pago con un ícono (ejemplo: tarjeta, efectivo, QR).
  - `QRCodeWidget`: Biblioteca para generar códigos QR dinámicos (para la opción de "Pago por QR").

### **Backend (Simulado con Datos Mock)**

- Usar datos locales hasta que el backend esté disponible.
- Ejemplo de JSON para los métodos de pago:
  ```json
  {
    "payment_methods": [
      { "id": 1, "name": "Pago con tarjeta", "icon": "card" },
      { "id": 2, "name": "Efectivo", "icon": "cash" },
      { "id": 3, "name": "Transferencia bancaria", "icon": "bank_transfer" },
      { "id": 4, "name": "Pago por QR", "icon": "qr_code" }
    ]
  }
  ```

UX Mejorado 1. Monto dinámico:
• Mientras el usuario escribe en el campo “Monto a pagar”, se actualiza un resumen visual del pago debajo.
• Ejemplo: “Monto total: $200 USD”. 2. Métodos de pago visuales:
• Diseñar los métodos como botones grandes con íconos representativos, en lugar de simples botones de radio.
• Ejemplo: Icono de tarjeta para “Pago con tarjeta”. 3. Pago por QR:
• Generar el QR dinámicamente con el monto ingresado.
• Mostrar un mensaje: “Escanea el QR con tu aplicación bancaria para completar el pago”.

Este documento detalla cómo debe funcionar y lucir la segunda pantalla: Presupuesto y Método de Pago. Si necesitas ajustes adicionales, compártelos, y podemos iterar sobre esta base.
