public class Arena {

    public Fighter fight(Fighter f1, Fighter f2) {
        while (!f1.isDead() && !f2.isDead()) {
            double random = Math.random() * 10;
            if (random > 5) f1.fire(f2);
            else f2.fire(f1);
        }
        return f1.isDead() ? f2 : f1;
    }
}
