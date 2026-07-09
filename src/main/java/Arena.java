public class Arena {

    public Fighter fight(Fighter f1, Fighter f2) {
        while (!f1.isDead() && !f2.isDead()) {
            double random = Math.random() * 10;
            if (random > 5) f1.fire(f2);
            else f2.fire(f1);
            
            System.out.println(ConsoleUtils.GREEN + f1.getName() + " " + ConsoleUtils.getHealthBar(f1.getLifePoints(), 10) + " " + Math.max(0, f1.getLifePoints()) + "/10" + ConsoleUtils.RESET);
            System.out.println(ConsoleUtils.GREEN + f2.getName() + " " + ConsoleUtils.getHealthBar(f2.getLifePoints(), 10) + " " + Math.max(0, f2.getLifePoints()) + "/10" + ConsoleUtils.RESET);
            System.out.println("--------------------------------------------------");
            
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        return f1.isDead() ? f2 : f1;
    }
}
