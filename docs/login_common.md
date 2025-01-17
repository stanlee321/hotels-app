# Diseño de Pantalla en Común: LOGIN

## Representación en ASCII de la Pantalla LOGIN
```plaintext
+------------------------------------------------+
|                                                |
|                EXPLORE THE WORLD               |
|                                                |
|              +-------------------+             |
|              |                   |             |
|              |       Avatar      |             |
|              +-------------------+             |
|                                                |
|                    Easy Boarding               |
|                                                |
|    +-------------------------------------+     |
|    |                                     |     |
|    |            Nombre (input)           |     |
|    +-------------------------------------+     |
|                                                |
|    +-------------------------------------+     |
|    |                                     |     |
|    |           Contraseña (input)        |     |
|    +-------------------------------------+     |
|                                                |
|         [ ] Recordarme                         |
|                                                |
|    +-----------------------------+             |
|    |       Botón Sign Up         |             |
|    +-----------------------------+             |
|                                                |
|    (Icono Tarjeta)  (Icono QR)                 |
|                                                |
+------------------------------------------------+
```

---

## Detalles de UI/UX

### Estilo Gráfico
- **Referencia:** Similar al estilo gráfico de Airbnb.
- **Paleta de Colores:**
  - Fondo: Gradiente cálido (de naranja claro a azul claro).
  - Botón "Sign Up": Gradiente de amarillo a naranja, con texto blanco centrado.
  - Texto principal: Blanco con tipografía moderna y bold.
  - Iconos: Estilo minimalista con sombras suaves.

### Tipografía
- **Principal ("EXPLORE THE WORLD"):** Sans-serif bold, tamaño grande.
- **Inputs:** Sans-serif regular, tamaño mediano.
- **Botones:** Sans-serif bold, tamaño mediano, color blanco.

### Componentes
#### 1. Encabezado
- **Título:** "EXPLORE THE WORLD". Centrado, color blanco.
- **Ilustración:** Imagen o diseño que simule montañas y un avión (opcional).

#### 2. Avatares
- **Diseño:** Imagen circular, ícono o avatar personalizado para cada usuario (opcional).

#### 3. Inputs
- **Nombre:**
  - Campo de texto con fondo blanco y bordes redondeados.
  - Placeholder en gris claro: "Introduce tu nombre".

- **Contraseña:**
  - Campo de texto seguro (con opción para mostrar u ocultar la contraseña).
  - Placeholder en gris claro: "Introduce tu contraseña".

#### 4. Opciones
- **Checkbox:** "Recordarme", estilo minimalista.

#### 5. Botón "Sign Up"
- Fondo con gradiente (amarillo a naranja).
- Bordes redondeados.
- Sombra ligera.
- Texto centrado: "Sign Up" en mayúsculas.

#### 6. Iconos
- Dos botones inferiores:
  - **Tarjeta:** Representa pagos.
  - **QR:** Representa escaneos rápidos.
- Estilo: Simple y con animaciones suaves.

---

### Reglas de UX
1. **Consistencia:** Cada elemento debe mantener un diseño uniforme a través de toda la aplicación.
2. **Accesibilidad:**
   - Contrastes adecuados entre texto y fondo.
   - Tamaños de botones e inputs cómodos para dispositivos móviles.
3. **Interacción:**
   - El botón "Sign Up" debe ser resaltado al ingresar datos válidos.
   - Animaciones suaves en interacciones (hover, click, etc.).
4. **Validación:**
   - Mensajes de error claros si faltan datos o son incorrectos.
   - Indicadores de carga o progreso durante la autenticación.

---

Si necesitas agregar más detalles o ejemplos específicos, avísame para seguir ajustando el diseño y la descripción del flujo de usuario.

