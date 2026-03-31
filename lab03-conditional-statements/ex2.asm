# Toda a interacao com o usuario e feita atraves de chamadas de sistema (syscalls)
# As chamadas de sistema sao selecionadas com base no valor armazenado no registrador v0
# onde para cada valor existe uma chamada de sistem diferente
# As chamadas de sistema utilizadas aqui sao:

# 1 - Apresenta um inteiro ao usuario
# 4 - Apresenta uma string ao usuraio
# 5 - Recebe um numero inteiro do usuario

.data
    prompt: .asciiz "Insira um numero inteiro positivo: "
    messageEPrimo: .asciiz "\nPrimo"
    messageNaoEPrimo: .asciiz "\nNao e Primo"
.text

#apresentacao do prompt para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt #carrega a mensaagem do prompt em a0
syscall 


#faza requisicao do numero para o usuario, syscall codigo 5

li $v0, 5 # a0 = 5
syscall

# v0 recebera o valor digitado pelo usuario 

beq $v0, 2, EPrimo # se v0 == 2 entao vai para EPrimo

add $t0, $v0, $zero # t0 = v0 + $zero

add $t1, $t0, $zero # t1 = t0 + $zero

srl $t1, $t1, 1 # faz o deslocamento logico de 1 para a direita, ou seja, faz a divisao por 2 em binario
	        # isso e feito para que o numero de tentativas seja reduzido para a metade para acharmos se o numero e primo

#loop para descobrir se e primo

li $t2, 2 # primeiro numero a ser testado para determinar o primo

Loop:   # testar os numeros de 2 ate t1 se dividem t0

#obtem o resto da divisao e armazena em t3
add $t3, $t0, $zero # t3 = t0 + $zero
Resto: sub $t3, $t3, $t2 # t3 é o resto, portanto, t3 = t3 - Divisor(t2)
slt $t4, $t2, $t3 # t4 = Divisor (t2) < Resto(t3) ? 1 : 0
bne $t4, $zero, Resto # if t4 != 0 goto Resto 
beq $t3, $t2, Resto #if t3 == t2 goto Resto

beq $t3, $zero, NaoEPrimo # if t3 == 0 

slt $t4, $t2, $t1 # t4 = t2 < t1 ? 1 : 0

beq $t4, $zero, EPrimo # if t4 == 0 goto messageEPrimo

addi $t2, $t2, 1 # acrescenta 1  para seguir com o teste do loop 


j Loop # volta para continuar o teste com t2++

NaoEPrimo: # Apresentacao da primeira mensagem (syscall codigo 4)		
addi $v0, $zero, 4  	# v0 = 4		
la $a0, messageNaoEPrimo		# a0 recebe a mensagem
syscall
j End    # vai para o fim do programa  			

EPrimo: # Apresentacao da primeira mensagem (syscall codigo 4)		
addi $v0, $zero, 4  	# v0 = 4		
la $a0, messageEPrimo		# a0 recebe a mensagem
syscall 
j End # vai para o fim do programa

End:    			

