import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class Assembler {
    public static HashMap<String, String> opcodes = new HashMap<>();
    public static HashMap<String, String> registers = new HashMap<>();
    public static HashMap<String, String> types = new HashMap<>();

    public static void main(String[] args) {
        addData();
        
        ArrayList<String> assembly = new ArrayList<>();
        try {
            ArrayList<String> instructions = readFromFile();
            for (String inst : instructions) {
                assembly.add(assembler(inst));
            }
            writeToFile(assembly);
        } catch (Exception ignored) {}
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

    // lw/sw $s0, imm($s1) => lw $s0, $s1, imm
    public static String assembler(String inst) {
        inst = inst.replace(",", "");
        String[] sections = inst.split(" ");
        StringBuilder assembly = new StringBuilder();

        if (types.get(sections[0]).equals("R")) { // R-type
            assembly.append(opcodes.get(sections[0])); // Opcode
            assembly.append(registers.get(sections[2])); // rs
            assembly.append(registers.get(sections[3])); // rt
            assembly.append(registers.get(sections[1])); // rd
        } else if (types.get(sections[0]).equals("I")) { // I-type
            assembly.append(opcodes.get(sections[0])); // Opcode
            assembly.append(registers.get(sections[2])); // rt(rd)
            assembly.append(registers.get(sections[1])); // rs
            assembly.append(registers.get(sections[3])); // imm
        }

        return assembly.toString();
    }

    public static void writeToFile(ArrayList<String> assembly) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(".\\ass.txt"));
        for (String inst : assembly) {
            writer.write(inst + "\n");
        }
        writer.close();
    }

    public static ArrayList<String> readFromFile() throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(".\\code.txt"));
        ArrayList<String> instructions = new ArrayList<>();
        String temp;

        while ((temp = reader.readLine()) != null) {
            instructions.add(temp);
        }

        reader.close();

        return instructions;
    }
}