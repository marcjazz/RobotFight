public class ConsoleUtils {
    public static final String RESET = "\u001B[0m";
    public static final String RED = "\u001B[31m";
    public static final String GREEN = "\u001B[32m";
    public static final String YELLOW = "\u001B[33m";
    public static final String CYAN = "\u001B[36m";

    public static String getHealthBar(int current, int max) {
        StringBuilder bar = new StringBuilder("[");
        for (int i = 0; i < max; i++) {
            if (i < current) bar.append("█");
            else bar.append("░");
        }
        bar.append("]");
        return bar.toString();
    }
}
