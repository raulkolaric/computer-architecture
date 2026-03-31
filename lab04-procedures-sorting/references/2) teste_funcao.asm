
addi $t0, $zero, 8    # t0 = 8
add $a0, $zero, $t0   # a0 = t0 = 8

jal somaum            # JAL (jump and link) chama a funcao "somaum"
add $t5, $zero, $v0   # Move o valor de retorno, armazenado em v0 para t5
j fim		      # Pula pro label "fim"

# ====================================== Funcao ================================================
somaum:
    addi $v0, $a0, 1    # v0 = a0 + 1
    jr $ra              # Retorna da funcao
# =============================================================================================

fim:
