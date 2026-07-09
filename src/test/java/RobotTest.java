import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class RobotTest {
    Robot robot1 = new Robot("D2R2");
    Robot robot2 = new Robot("Data");

    @org.junit.jupiter.api.Test
    void fire() {
        int lifeBeforeCombat = robot1.getLifePoints();
        robot1.fire(robot2);
        int lifeAfterCombat = robot2.getLifePoints();
        System.out.println(robot1.getLifePoints());
        System.out.println(robot2.getLifePoints());
        assertTrue(lifeAfterCombat<lifeBeforeCombat);
    }

    @org.junit.jupiter.api.Test
    void TestisDead() {
        robot1.fire(robot2);
        robot1.fire(robot2);
        robot1.fire(robot2);
        robot1.fire(robot2);
        robot1.fire(robot2);

        assertFalse(robot1.isDead());
        assertTrue(robot2.isDead());
    }

    @Test
    void getName() {
        assertEquals("Robot D2R2", robot1.getName());
    }
}