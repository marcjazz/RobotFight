public class Main {
    public static void main(String[] args) {
        System.out.println("Welcome to RobotFight!");
        
        Fighter d2r2 = new Robot("D2R2");
        Fighter john = new Humain("John");
        
        Arena arena = new Arena();
        System.out.println("The fight begins between " + d2r2.getName() + " and " + john.getName() + "!");
        
        Fighter winner = arena.fight(d2r2, john);
        
        System.out.println("The winner is " + winner.getName() + "!");
    }
}
