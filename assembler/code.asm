ori $R2, $R0, 10
ori $R3, $R0, 15
add $R7, $R3, $R2
sub $R8, $R3, $R2
sw $R3, $R2, 0
sw $R7, $R2, 1
sw $R8, $R2, 2
lw $R9, $R2, 0
lw $R10, $R2, 1
lw $R11, $R2, 2
blt $R3, $R2, 8
