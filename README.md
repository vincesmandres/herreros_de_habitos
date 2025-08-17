# ⚒️ Herreros de Hábitos – Backend en Move

**Herreros de Hábitos** es un contrato inteligente escrito en **Move** para la blockchain de **Sui**, cuyo propósito es gestionar y dar seguimiento a hábitos de manera descentralizada.  

La idea es simple: así como un herrero forja el hierro con golpes constantes, este contrato permite forjar hábitos mediante el registro y seguimiento en la cadena de bloques.

---

## 📌 Estructura del contrato
Archivo principal: `sources/herreros_de_habitos.move`

```move
module herreros_de_habitos::tracker {

    use std::string::String;
    use std::vector;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    /// Estructura de hábitos
    public struct Habits has key, store {
        id: UID,
        items: vector<String>,
    }

    /// Crear un nuevo tracker
    public fun new(ctx: &mut TxContext): Habits {
        Habits {
            id: object::new(ctx),
            items: vector::empty<String>(),
        }
    }

    /// Agregar hábito
    public fun add(h: &mut Habits, habit: String) {
        vector::push_back(&mut h.items, habit);
    }

    /// Número de hábitos
    public fun length(h: &Habits): u64 {
        vector::length(&h.items)
    }
}
```

## Funcionalidades principales
- <code>new(ctx)</code> → Crea un nuevo tracker de hábitos en la blockchain.
- <code>add(h, habit)</code> → Agrega un hábito (string) al tracker.
- <code>length(h)</code> → Devuelve la cantidad de hábitos registrados.