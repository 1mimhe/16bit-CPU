import java.util.HashMap;

public class Assembler {
    public static HashMap<String, String> opcodes = new HashMap<>();
    public static HashMap<String, String> registers = new HashMap<>();
    public static HashMap<String, String> types = new HashMap<>();

    public static void main(String[] args) {
        addData();
    }

    private static void addData() {
        // Opcodes
        opcodes.put("add", "0000");
        opcodes.put("sub", "0001");
        opcodes.put("mul", "0010");
        opcodes.put("div", "0011");
        opcodes.put("ori", "0100");
        opcodes.put("nor", "0101");
        opcodes.put("nand", "0110");
        opcodes.put("sw", "0111");
        opcodes.put("lw", "1000");
        opcodes.put("blt", "1001");

        // Registers
        for (int i = 0; i < 32; i++) {
            registers.put("$R" + i, decToBin(i, 4));
        }

        // Types
        types.put("add", "R");
        types.put("sub", "R");
        types.put("mul", "R");
        types.put("div", "R");
        types.put("ori", "I");
        types.put("nor", "R");
        types.put("nand", "R");
        types.put("sw", "I");
        types.put("lw", "I");
        types.put("blt", "I");
    }

    private static String decToBin(int dec, int digits) {
        StringBuilder bin = new StringBuilder(Integer.toBinaryString(dec));

        for (int i = 0; i < digits - bin.length(); i++) {
            bin.insert(0, "0");
        }

        return bin.toString();
    }