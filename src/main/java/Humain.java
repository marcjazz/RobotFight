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
            System.out.println(target.getName() + " est touché par " + this.nom);
        } else {
            System.out.println(this.nom + " a raté sa cible (" + target.getName() + ")");
        }
    }

    @Override
    public boolean isDead() {
        return this.lifePoints <= 0;
    }
}
