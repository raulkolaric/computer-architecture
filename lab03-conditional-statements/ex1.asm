#29/03/2026

#Raul Kolaric RA00359586
#Igor Simões RA00360505
#Rodrigo Ward RA00359800

.data
    prompt: .asciiz "Digite o valor de radiacao (inteiro positivo): "

.text
main:
    # Exibe a mensagem pedindo o valor para o usuario
    addi $v0, $zero, 4          # Prepara o syscall 4 (print string)
    la $a0, prompt              # Carrega o endereco da string 'prompt' em $a0
    syscall                     # Executa a chamada do sistema

    # Le o numero inteiro digitado pelo usuario
    addi $v0, $zero, 5          # Prepara o syscall 5 (read integer)
    syscall                     # Executa a chamada do sistema
    add $t0, $zero, $v0         # Move o valor lido de $v0 para o registrador temporario $t0

    # Logica de Classificacao:
    # Tipo 1: 1 a 30 (inclusos) -> $t5 = 1
    # Tipo 2: 31 a 79 (inclusos) -> $t5 = 2
    # Tipo 3: >= 80 -> $t5 = 3

    # Verifica se eh Tipo 1 (Valor < 31)
    addi $t1, $zero, 31         # Coloca o limite 31 em $t1 para comparar
    slt $t2, $t0, $t1           # Se o valor digitado ($t0) for menor que 31, $t2 recebe 1
    bne $t2, $zero, CLAS_TIPO1  # Se $t2 for 1 (verdade), pula para a etiqueta CLAS_TIPO1

    # Verifica se eh Tipo 2 (Valor < 80)
    addi $t1, $zero, 80         # Coloca o limite 80 em $t1 para comparar
    slt $t2, $t0, $t1           # Se o valor digitado ($t0) for menor que 80, $t2 recebe 1
    bne $t2, $zero, CLAS_TIPO2  # Se $t2 for 1 (verdade), pula para a etiqueta CLAS_TIPO2

    # Caso nao seja nem Tipo 1 nem Tipo 2, sobra o Tipo 3
    addi $t5, $zero, 3          # Armazena o numero 3 em $t5 (Tipo 3)
    j FIM                       # Pula para o final do programa

CLAS_TIPO1:
    addi $t5, $zero, 1          # Armazena o numero 1 em $t5 (Tipo 1)
    j FIM                       # Pula para o final do programa

CLAS_TIPO2:
    addi $t5, $zero, 2          # Armazena o numero 2 em $t5 (Tipo 2)
    j FIM                       # Pula para o final do programa

FIM:
    # Encerra a execucao do programa
    addi $v0, $zero, 10         # Codigo syscall 10 para sair (exit)
    syscall                     # Chama o sistema para finalizar
