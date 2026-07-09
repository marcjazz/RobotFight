public class Robot implements Fighter {
    private String name;
    private int lifePoints;

    public Robot(String name) {
        this.name = "Robot " + name;
        this.lifePoints = 10;
    }

    @Override
    public String getName() {
        return name;
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
        target.setLifePoints(target.getLifePoints() - 2);
        System.out.println(ConsoleUtils.RED + "💥 " + target.getName() + " est touché par " + this.name + ConsoleUtils.RESET);
    }

    @Override
    public boolean isDead() {
        return this.lifePoints <= 0;
    }
}
