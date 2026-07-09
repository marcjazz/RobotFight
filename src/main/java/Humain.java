public class Humain implements Fighter {
    private String nom;
    private int lifePoints;

    public Humain(String nom) {
        this.nom = "Humain " + nom;
        this.lifePoints = 10;
    }

    @Override
    public String getName() {
        return nom;
    }

    @Override
    public int getLifePoints() {
        return lifePoints;
    }

    @Override
    public void setLifePoints(int lifePoints) {
        this.lifePoints = lifePoints;
    }

    @Override
    public void fire(Fighter target) {
        double random = Math.random() * 10;
        if (random > 5) {
            target.setLifePoints(target.getLifePoints() - 2);
            System.out.println(ConsoleUtils.RED + "💥 " + target.getName() + " est touché par " + this.nom + ConsoleUtils.RESET);
        } else {
            System.out.println(ConsoleUtils.YELLOW + "💨 " + this.nom + " a raté sa cible (" + target.getName() + ")" + ConsoleUtils.RESET);
        }
    }

    @Override
    public boolean isDead() {
        return this.lifePoints <= 0;
    }
}
