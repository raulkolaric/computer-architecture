# Toda a interacao com o usuario e feita atraves de chamadas de sistema (syscalls)
# As chamadas de sistema sao selecionadas com base no valor armazenado no registrador v0
# onde para cada valor existe uma chamada de sistem diferente
# As chamadas de sistema utilizadas aqui sao:

# 1 - Apresenta um inteiro ao usuario
# 4 - Apresenta uma string ao usuraio
# 5 - Recebe um numero inteiro do usuario

.data
    prompt1: .asciiz "Insira o primeiro numero inteiro positivo: "
    prompt2: .asciiz "Insira o segundo numero inteiro positivo: "
.text

#apresentacao do prompt1 para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt1 #carrega a mensagem do prompt1 em a0
syscall 


#faz a requisicao do priemiro numero para o usuario, syscall codigo 5

li $v0, 5 # v0 = 5
syscall

#v0 recebe o valor digitado pelo usuario

#armazena o primeiro numero em t0
add $t0, $v0, $zero


#apresentacao do prompt2 para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt2 #carrega a mensagem do prompt2 em a0
syscall 
#v0 recebe o numero digitado pelo usuario

#faza requisicao do segundo numero para o usuario, syscall codigo 5

li $v0, 5 # v0 = 5
syscall

#v0 recebe o valor digitado pelo usuario

# armazena o segundo numero em t1
add $t5, $v0, $zero

Loop: # loop realizado para saber qual e o mdc entre t0 e t1

rem  $t2, $t0, $t5 #  t2 = t0 % t1 

beq $t2, $zero, End # if t2 == 0 goto End, achou MDC e esta em t5

add $t0, $t5, $zero # else t0 = t1

add $t5, $t2, $zero # t1 = t2


j Loop



End: