# Exemplo de codigo que apresenta mensagens ao usuario e recebe um numero inteiro
# Toda a interacao com o usuario e feita atraves de chamadas de sistema (syscalls)
# As chamadas de sistema sao selecionadas com base no valor armazenado no registrador v0
# onde para cada valor existe uma chamada de sistem diferente
# As chamadas de sistema utilizadas aqui sao:

# 1 - Apresenta um inteiro ao usuario
# 4 - Apresenta uma string ao usuraio
# 5 - Recebe um numero inteiro do usuario

.data 
  prompt:	.asciiz "Digite um numero:"
  message:	.asciiz "\nSeu numero foi:"

.text
		
# Apresentacao da primeira mensagem (syscall codigo 4)		
addi $v0, $zero, 4  	# v0 = 4		
la $a0, prompt		# a0 recebe a mensagem
syscall      			

# Recebe input numero inteiro do usuario em v0 (syscall codigo 5)
addi $v0, $zero, 5	# v0 = 5
syscall

# v0 vai receber numero do usuario
      
# Move o inteiro recebido de t0 para v0
add $t0, $v0, $zero	# t0 = v0
  
# Apresentacao da segunda mensagem (syscall codigo 4)
addi $v0, $zero, 4 	# v0 = 4
la $a0, message		# a0 recebe a mensagem
syscall
  
# Apresentacao do inteiro recebido (syscall codigo 1)
addi $v0, $zero, 1	# v0 = 1
add $a0, $zero, $t0	# a0 = t0
syscall
