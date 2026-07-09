public interface Fighter {
    String getName();
    int getLifePoints();
    void setLifePoints(int lp);
    boolean isDead();
    void fire(Fighter target);
}
