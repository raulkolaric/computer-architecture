#29/03/2026

#Raul Kolaric RA00359586
#Igor Simões RA00360505
#Rodrigo Ward RA00359800

.data
    prompt: .asciiz "Digite um numero inteiro (maior que 1): "
    msg_primo: .asciiz "Primo"
    msg_nao_primo: .asciiz "Nao e Primo"

.text
main:
    # Exibe a mensagem pedindo o numero para o usuario
    addi $v0, $zero, 4          # Prepara o syscall 4 (print string)
    la $a0, prompt              # Carrega o endereco da mensagem em $a0
    syscall                     # Executa a chamada do sistema

    # Le o numero digitado
    addi $v0, $zero, 5          # Prepara o syscall 5 (read integer)
    syscall                     # Executa a chamada do sistema
    add $t0, $zero, $v0         # Move o numero lido para o registrador $t0

    # Para saber se e primo, vamos tentar dividir o numero ($t0)
    # por todos os valores comecando de 2 ate chegar no proprio numero.
    addi $t1, $zero, 2          # Inicia o divisor em 2 (guarda em $t1)

LOOP:
    # Se o divisor ($t1) for igual ao numero ($t0), significa que testamos todos
    # e nenhum dividiu certinho, logo o numero e primo.
    beq $t1, $t0, EH_PRIMO      

    # Faz a divisao do numero pelo divisor atual
    div $t0, $t1                # Divide $t0 por $t1
    mfhi $t2                    # Pega o resto da divisao (fica no registrador HI) e joga em $t2 
#Nao sei se podemos usar essa instrucao acima, ela disse a respeito da instrucao resto so no 3 exercicio 

    # Se o resto ($t2) for igual a zero, o numero e divisivel, entao nao e primo
    beq $t2, $zero, NAO_PRIMO   

    # Se ainda nao dividiu, aumenta o divisor em 1 e volta para o loop
    addi $t1, $t1, 1            # Incrementa o divisor ($t1 = $t1 + 1)
    j LOOP                      # Pula de volta para o inicio do LOOP

EH_PRIMO:
    # Se o programa chegar aqui, imprime a mensagem de que e primo
    addi $v0, $zero, 4          # Prepara o syscall 4 (print string)
    la $a0, msg_primo           # Carrega a mensagem "Primo"
    syscall                     # Executa a chamada do sistema
    j FIM                       # Pula para o final do programa

NAO_PRIMO:
    # Se o programa chegar aqui, imprime a mensagem de que nao eh primo
    addi $v0, $zero, 4          # Prepara o syscall 4 (print string)
    la $a0, msg_nao_primo       # Carrega a mensagem "Nao e Primo"
    syscall                     # Executa a chamada do sistema
    j FIM                       # Pula para o final do programa

FIM:
    # Encerra a execucao do programa
    addi $v0, $zero, 10         # Codigo syscall 10 para sair (exit)
    syscall                     # Chama o sistema para finalizar
