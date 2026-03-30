# Exemplo de codigo que apresenta mensagens ao usuario e recebe um numero inteiro
# Toda a interacao com o usuario e feita atraves de chamadas de sistema (syscalls)
# As chamadas de sistema sao selecionadas com base no valor armazenado no registrador v0
# onde para cada valor existe uma chamada de sistem diferente
# As chamadas de sistema utilizadas aqui sao:

# 1 - Apresenta um inteiro ao usuario
# 4 - Apresenta uma string ao usuraio
# 5 - Recebe um numero inteiro do usuario

.data 
  prompt:	.asciiz "Digite o valor da radiacao: "

.text
		
# Apresentacao da primeira mensagem (syscall codigo 4)		
addi $v0, $zero, 4  	# v0 = 4		
la $a0, prompt		# a0 recebe a mensagem
syscall      			

# Recebe o valor da radiacao em v0 (syscall codigo 5)
addi $v0, $zero, 5	# v0 = 5
syscall

# v0 vai receber o valor da radiacao do usuario
      
# Move o inteiro recebido de v0 para t0
add $t0, $v0, $zero	# t0 = v0 + $zero

#verifica se a radiacao digitada pertence ao tipo 1

slti $t1, $t0, 31 # realiza a seguinte expressao ternaria t1 = t0 < 31 ? 1 : 0
beq $t1, $zero, MaiorQueOuIgualA31 # ramifica para a verificacao do tipo 2
addi $t5, $zero, 1 # adiciona 1 ao t5 
j End # pula para o fim do programa


#verifica se a radaicao digitada pertence ao tipo 2

MaiorQueOuIgualA31: slti $t1, $t0, 80 # realiza a seguinte expressao ternaria t1 = t0 < 80 ? 1 : 0
beq $t1, $zero, MaiorQueOuIgualA80 # ramifica para tipo 3
addi $t5, $zero, 2 # adiciona 2 ao t5 
j End # pula para o fim do programa

#numero digitado pertence ao tipo 3 de radiacao

MaiorQueOuIgualA80: addi $t5, $zero, 3 # adiciona 3 ao t5

End:


