import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class HumainTest {
    Robot robot1 = new Robot("D2R2");
    Humain humain = new Humain("Marco");

    @Test
    void fire() {
        int lifePointBefore =  robot1.getLifePoints();
        humain.fire(robot1);
        int lifePointAfter = robot1.getLifePoints();
        assertTrue(lifePointAfter <= lifePointBefore);
    }
}