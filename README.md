# Sonic The Hedgehog Remastered

**Autores:** Unai Meneses y Angel Perez
**Institución:** CFGM Sistemes Microinformátics y Xarxes
**Motor de Desarrollo:** Godot Engine 4.2
**Lenguaje:** GDScript

---

## 1. Descripción del Proyecto
Este proyecto consiste en una reconstrucción técnica del videojuego Sonic The Hedgehog (1991). El objetivo principal es la implementación de un sistema de físicas preciso basado en los algoritmos originales de aceleración, inercia y fricción, integrándolos en un entorno de desarrollo moderno.

## 2. Especificaciones Técnicas

### 2.1. Sistema de Físicas y Movimiento
- **Cinemática del Jugador:** Uso de `CharacterBody2D` para gestionar desplazamientos complejos.
- **Inercia y Pendientes:** Lógica programada para ajustar la velocidad en función de la inclinación de la superficie y la dirección del movimiento.
- **Coyote Time y Salto en Pared:** Funcionalidades añadidas para mejorar la precisión del control y la respuesta del personaje.

### 2.2. Gestión de Entidades y Áreas
- **Sistema de Colisiones:** Detección de daño y recolección de objetos mediante nodos `Area2D`.
- **Lógica de Anillos:** Implementación de un sistema de dispersión física mediante `call_deferred` para evitar conflictos en el procesamiento de colisiones durante el tiempo de ejecución.
- **Cámara Dinámica:** Control de encuadre mediante límites definidos por polígonos, incluyendo algoritmos de suavizado y efectos de retroalimentación visual (Screen Shake).

### 2.3. Estructura de Escenas
El proyecto sigue un diseño modular, permitiendo la reutilización de componentes:
- **Nodos Globales (Singletons):** El `GameManager` centraliza el estado de la partida, incluyendo el conteo de vidas y la persistencia de datos entre niveles.
- **Transiciones:** Sistema de portales automatizado que gestiona el cambio de escenas y la carga de recursos de forma eficiente.

## 3. Controles del Sistema
| Acción | Entrada (Keyboard) |
| :--- | :--- |
| Desplazamiento Horizontal | Flechas Direccionales / A - D |
| Salto / Acción | Barra Espaciadora / Z |
| Pausa de Sistema | Esc |

## 4. Estructura de Directorios
- `/assets`: Recursos binarios, incluyendo texturas, archivos de audio y fuentes.
- `/scenes`: Archivos `.tscn` que contienen la jerarquía de nodos de niveles y entidades.
- `/scripts`: Lógica de programación organizada por tipo de objeto.

## 5. Herramientas Utilizadas
- **Godot Engine:** Motor principal de desarrollo.
- **Audacity:** Procesamiento y edición de señales de audio.
- **GIMP / Aseprite:** Manipulación de activos gráficos y optimización de mapas de bits.

---

## 6. Objetivos de Ingeniería
1. **Fidelidad Funcional:** Replicar el comportamiento mecánico del software original.
2. **Modularidad:** Diseñar un sistema de escenas independiente que facilite la escalabilidad del proyecto.
3. **Optimización:** Garantizar un rendimiento estable de 60 FPS mediante la gestión eficiente de nodos y memoria.

---
