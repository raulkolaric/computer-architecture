#Igor Gabriel Santos Simões RA00360505
#Raul Kolaric RA00359586
#Rodrigo Ward Leite RA00359800

addi $t0, $zero, 890    # t0 = 890 
add $a0, $zero, $t0   # a0 = t0 = 890

jal eMaiorQue100            # JAL (jump and link) chama a funcao "eMaiorQue100"
add $t5, $zero, $v0   # Move o valor de retorno, armazenado em v0 para t5
j fim		      # Pula pro label "fim"

# ====================================== Funcao ================================================
eMaiorQue100:
    slti $a1, $a0, 101 # realiza a expressao ternaria a1 = a0 < 100 ? 1 : 0
    beq $a1, $zero, maiorQue100 # if a1 == 0 goto maiorQue100
    addi $v0, $zero, 100    # v0 = $zero + 100
    jr $ra # Retorno da funcao
    maiorQue100: addi $v0, $zero, 999 # v0 = $zero + 999
    jr $ra # Retorno da funcao
# =============================================================================================

fim:
