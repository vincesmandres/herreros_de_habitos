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

    // -------------------
    // 🔎 TESTS UNITARIOS
    // -------------------

    #[test]
    public fun test_new_tracker(ctx: &mut TxContext) {
        let tracker = new(ctx);
        assert!(length(&tracker) == 0, 1);
    }

    #[test]
    public fun test_add_habits(ctx: &mut TxContext) {
        let mut tracker = new(ctx);
        add(&mut tracker, String::utf8(b"Leer 10 páginas"));
        add(&mut tracker, String::utf8(b"Ejercicio 30 min"));
        assert!(length(&tracker) == 2, 2);
    }
}