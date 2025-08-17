# Herreros de Hábitos

Un smart contract simple para el seguimiento de hábitos construido en el lenguaje Move para la blockchain Sui.

## Descripción

"Herreros de Hábitos" es un contrato inteligente que permite a los usuarios crear y gestionar un tracker personal de hábitos. El proyecto demuestra conceptos fundamentales de Move como estructuras de datos, ownership, y testing.

## Características

- **Creación de tracker**: Crea un nuevo objeto de seguimiento de hábitos
- **Agregar hábitos**: Añade nuevos hábitos como strings UTF-8
- **Consultar cantidad**: Obtén el número total de hábitos registrados
- **Destrucción segura**: Limpia recursos apropiadamente

## Estructura del Proyecto

```
herreros_de_habitos/
├── Move.toml              # Configuración del proyecto
├── sources/
│   └── herreros_de_habitos.move  # Código principal del contrato
└── README.md
```

## Prerrequisitos

- [Sui CLI](https://docs.sui.io/guides/developer/getting-started/sui-install) instalado
- Conocimientos básicos del lenguaje Move

## Instalación y Uso

### 1. Clonar e instalar dependencias

```bash
git clone <tu-repositorio>
cd herreros_de_habitos
```

### 2. Compilar el proyecto

```bash
sui move build
```

### 3. Ejecutar tests

```bash
sui move test
```

### Estructuras

#### `Habits`
```move
public struct Habits has key, store {
    id: object::UID,
    items: vector<string::String>,
}
```

### Funciones Públicas

#### `new(ctx: &mut tx_context::TxContext): Habits`
Crea un nuevo tracker de hábitos vacío.

**Parámetros:**
- `ctx`: Contexto de la transacción

**Retorna:** Una nueva instancia de `Habits`

#### `add(h: &mut Habits, habit: string::String)`
Agrega un nuevo hábito al tracker.

**Parámetros:**
- `h`: Referencia mutable al tracker de hábitos
- `habit`: String UTF-8 describiendo el hábito

#### `length(h: &Habits): u64`
Obtiene el número total de hábitos en el tracker.

**Parámetros:**
- `h`: Referencia inmutable al tracker de hábitos

**Retorna:** Número de hábitos como `u64`

#### `destroy(h: Habits)`
Destruye el tracker de hábitos de forma segura.

**Parámetros:**
- `h`: Instancia del tracker a destruir
## Testing

El proyecto incluye tests unitarios completos:

- `test_new_tracker()`: Verifica la creación correcta de un tracker vacío
- `test_add_habits()`: Prueba la funcionalidad de agregar hábitos

Para ejecutar los tests:

```bash
sui move test
```

## Casos de Uso

- **Aplicaciones de productividad**: Integrar como backend para apps de seguimiento de hábitos
- **Gamificación**: Base para sistemas de recompensas por completar hábitos
- **Análisis personal**: Tracking de patrones de comportamiento
- **Comunidades**: Seguimiento grupal de objetivos

## Desarrollo

### Compilar
```bash
sui move build
```

### Ejecutar tests
```bash
sui move test
```

### Verificar sintaxis
```bash
sui move check
```

## Notas Técnicas

- **Abilities**: El struct `Habits` tiene `key` y `store` pero no `drop` debido a que contiene un `UID`
- **Ownership**: Se sigue el modelo de ownership de Move para gestión segura de recursos
- **Testing**: Usa `tx_context::dummy()` para crear contextos de prueba

## Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia Apache. Ver el archivo `LICENSE` para más detalles.

## 🔗 Enlaces Útiles

- [Documentación de Sui](https://docs.sui.io/)
- [Libro de Move](https://move-language.github.io/move/)
- [Ejemplos de Sui](https://github.com/MystenLabs/sui/tree/main/examples)

---
