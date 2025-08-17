module herreros_de_habitos::tracker {
    use std::string;

    // Remove 'drop' ability because UID doesn't have drop
    public struct Habits has key, store {
        id: object::UID,
        items: vector<string::String>,
    }

    public fun new(ctx: &mut tx_context::TxContext): Habits {
        Habits {
            id: object::new(ctx),
            items: vector::empty<string::String>(),
        }
    }

    public fun add(h: &mut Habits, habit: string::String) {
        vector::push_back(&mut h.items, habit);
    }

    public fun length(h: &Habits): u64 {
        vector::length(&h.items)
    }

    // Consume the Habits object to avoid unused value error
    public fun destroy(h: Habits) {
        let Habits { id, items: _ } = h;
        object::delete(id);
    }

    #[test]
    public fun test_new_tracker() {
        let mut ctx = tx_context::dummy();
        let h = new(&mut ctx);
        assert!(length(&h) == 0, 0);
        destroy(h); // Consume the object
    }

    #[test]
    public fun test_add_habits() {
        let mut ctx = tx_context::dummy();
        let mut h = new(&mut ctx);
        add(&mut h, string::utf8(b"Leer 10 páginas"));
        add(&mut h, string::utf8(b"Ejercicio 30 min"));
        assert!(length(&h) == 2, 1);
        destroy(h); // Consume the object
    }
}