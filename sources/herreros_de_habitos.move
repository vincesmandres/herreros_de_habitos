module herreros_de_habitos::tracker {

    use std::string::String;

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
