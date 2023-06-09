import java.util.HashMap;
import java.util.Scanner;

public class Assembler {
    public static void main(String[] args) {
        HashMap<String, String> opcodes = new HashMap<>();
        HashMap<String, String> registers = new HashMap<>();
        HashMap<String, String> cmdTypes = new HashMap<>();

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


        registers.put("$R0", "0000");
        registers.put("$R1", "0001");
        registers.put("$R2", "0010");
        registers.put("$R3", "0011");
        registers.put("$R4", "0100");
        registers.put("$R5", "0101");
        registers.put("$R6", "0110");
        registers.put("$R7", "0111");
        registers.put("$R8", "0111");
        registers.put("$R9", "0111");
        registers.put("$R10", "0111");
        registers.put("$R11", "0111");
        registers.put("$R12", "0111");
        registers.put("$R13", "0111");
        registers.put("$R14", "0111");
        registers.put("$R15", "0111");
        registers.put("$R16", "0111");


        cmdTypes.put("add", "R");
        cmdTypes.put("sub", "R");
        cmdTypes.put("mul", "R");
        cmdTypes.put("div", "R");
        cmdTypes.put("ori", "I");
        cmdTypes.put("nor", "R");
        cmdTypes.put("nand", "R");
        cmdTypes.put("sw", "I");
        cmdTypes.put("lw", "I");
        cmdTypes.put("blt", "I");

        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
//            System.out.println(binaryToHex(assemblyToBinary(line, opcodes, functions, registers, cmdTypes)));
        }
        scanner.close();
    }

    public static String assemblyToBinary(String string, HashMap<String, String> opcodes,
                                          HashMap<String, String> functions, HashMap<String, String> registers,
                                          HashMap<String, String> cmdTypes) {
        string = string.replace(",", "");
        String[] sections = string.split(" ");
        StringBuilder answer = new StringBuilder();

        sections[sections.length - 1] = sections[sections.length - 1].substring(0, sections[sections.length - 1].length() - 1);

        String cmdType = sections[0];

        if (cmdTypes.get(cmdType).equals("R")) { // command is R type
            answer.append(opcodes.get(sections[0])).append(" ");
            answer.append(registers.get(sections[2])).append(" ");
            answer.append(registers.get(sections[3])).append(" ");
            answer.append(registers.get(sections[1])).append(" ");
            answer.append(functions.get(sections[0]));
        } else { // command is I type
            if (sections[0].equals("beq")) {
                answer.append(opcodes);
            }
        }
        return null;
    }
}