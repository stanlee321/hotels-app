# Guía de Línea Gráfica y Estilo de la Aplicación

## **Propósito**
Establecer un diseño visual limpio, moderno y coherente, inspirado en el estilo gráfico de **Airbnb**. Este documento detalla los colores, tipografía, componentes, y principios de UX que deben aplicarse en toda la aplicación.

---

## **Paleta de Colores**

| Propósito          | Color Hexadecimal   | Ejemplo de Uso                            |
|--------------------|---------------------|-------------------------------------------|
| **Primario**       | `#FF385C`           | Botones principales, acentos importantes. |
| **Secundario**     | `#008489`           | Íconos de navegación, estados activos.    |
| **Texto Principal**| `#333333`           | Títulos, encabezados.                     |
| **Texto Secundario**| `#717171`          | Subtítulos, textos informativos.          |
| **Fondo Claro**    | `#FFFFFF`           | Fondos generales.                         |
| **Fondo Oscuro**   | `#F7F7F7`           | Fondos secundarios.                       |
| **Éxito**          | `#00A699`           | Indicadores de éxito (e.g., confirmaciones). |
| **Error**          | `#FF0000`           | Mensajes de error.                        |

### **Principios de Uso de Colores**
1. **Enfatizar Acción:**
   - El color primario debe usarse para elementos interactivos como botones principales y enlaces.
   - Contrastes claros entre el fondo y el texto.
2. **Jerarquía Visual:**
   - Títulos con colores oscuros (`#333333`) para máxima legibilidad.
   - Subtítulos con un color más claro (`#717171`) para crear jerarquía visual.

---

## **Tipografía**

### **Fuentes Utilizadas**
- **Principal:** `Circular Std` (la misma utilizada por Airbnb).
  - Alternativa libre: `Poppins` o `Roboto`.
- **Estilo Tipográfico:**
  - **Títulos:** Negritas (`Bold`), tamaño 24-30px.
  - **Subtítulos:** Regular, tamaño 16-20px.
  - **Texto Informativo:** Light, tamaño 14-16px.

### **Ejemplo de Aplicación**
| Propósito           | Fuente          | Estilo  | Tamaño | Color      |
|---------------------|-----------------|---------|--------|------------|
| **Títulos**         | Circular Std    | Bold    | 30px   | `#333333`  |
| **Subtítulos**      | Circular Std    | Regular | 20px   | `#717171`  |
| **Texto Informativo**| Circular Std    | Light   | 16px   | `#717171`  |

---

## **Componentes UI**

### **Botones**
1. **Botón Primario:**
   - **Estilo:** Fondo color primario (`#FF385C`), texto blanco (`#FFFFFF`).
   - **Forma:** Bordes redondeados (radio de 8px).
   - **Estado Hover/Presionado:**
     - Hover: Color más oscuro del primario (`#E63950`).
     - Presionado: Sombra sutil y reducción ligera de tamaño.
   - **Ejemplo CSS:**
     ```css
     button.primary {
       background-color: #FF385C;
       color: #FFFFFF;
       border-radius: 8px;
       padding: 12px 24px;
       font-size: 16px;
       font-weight: bold;
       transition: all 0.2s ease-in-out;
     }
     button.primary:hover {
       background-color: #E63950;
     }
     ```

2. **Botón Secundario:**
   - **Estilo:** Borde color secundario (`#008489`), texto del mismo color.
   - **Fondo:** Transparente.
   - **Forma:** Bordes redondeados (radio de 8px).
   - **Estado Hover:** Fondo ligeramente translúcido (`#008489` con opacidad 10%).

---

### **Tarjetas**
- **Estructura General:**
  - Imagen en la parte superior (ocupa el 50% del alto).
  - Texto y detalles debajo, con un margen interno de 16px.
  - Fondo blanco (`#FFFFFF`) con sombra ligera (`box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1)`).
- **Tamaño:**
  - Ancho: 300px.
  - Altura: Ajustable según el contenido.
- **Estilo Visual:**
  - Bordes redondeados (radio de 12px).
  - Íconos representativos alineados a la derecha.
- **Ejemplo CSS:**
  ```css
  .card {
    background-color: #FFFFFF;
    border-radius: 12px;
    box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: all 0.2s ease-in-out;
  }
  .card:hover {
    box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
  }

Navegación
	1.	Menú Superior:
	•	Fondo blanco (#FFFFFF) con sombra ligera.
	•	Íconos en color secundario (#008489).
	•	Espaciado uniforme entre los elementos.
	2.	Navegación Inferior:
	•	Estilo fijo (sticky) en la parte inferior de la pantalla.
	•	Íconos centrados con etiquetas pequeñas debajo.

Principios de UX

1. Simplicidad
	•	Priorizar diseño minimalista y evitar sobrecargar con elementos.
	•	Usar colores y tipografías de manera consistente en toda la app.

2. Jerarquía Visual
	•	Los elementos más importantes deben ser los más visibles (e.g., botones de acción).
	•	Usar tamaño, color y espacio en blanco para guiar la atención del usuario.

3. Animaciones Suaves
	•	Implementar transiciones sutiles para cambios de pantalla o al interactuar con componentes.
	•	Ejemplo:
	•	Transición entre pantallas: Deslizamiento suave (300ms).
	•	Hover en botones: Cambio de color con animación (200ms).

4. Accesibilidad
	•	Usar texto claro y legible en todos los tamaños.
	•	Garantizar contraste suficiente entre texto y fondo.
	•	Implementar soporte para lectores de pantalla:
	•	Etiquetas aria en botones e íconos.

5. Reutilización de Componentes
	•	Diseñar componentes genéricos (e.g., tarjetas, botones) que puedan reutilizarse en diferentes pantallas.
	•	Ejemplo: Una tarjeta genérica que se use tanto para actividades como para reservas.

Ejemplo de Implementación Visual

Pantalla Principal

Componente	Estilo
Encabezado	Fondo blanco, texto #333333.
Botones Primarios	Fondo #FF385C, texto blanco.
Tarjetas	Fondo blanco, sombra sutil.
Navegación Inferior	Íconos color #008489.

Mapa Interactivo
	•	Uso de marcadores personalizados:
	•	Icono rojo para ubicaciones destacadas.
	•	Tooltip con información básica (nombre, calificación).

Resumen

Esta guía establece los estándares de diseño visual y UX para la aplicación, basados en la línea gráfica de Airbnb. Proporciona una base clara y estructurada para que los desarrolladores humanos o IA puedan implementar una experiencia consistente y atractiva.

Este archivo cubre todos los aspectos esenciales para guiar a un programador o una IA en la creación de una aplicación con una línea gráfica profesional y moderna. Si necesitas agregar más detalles o ejemplos, avísame.