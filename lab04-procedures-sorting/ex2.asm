#Igor Gabriel Santos Simões RA00360505
#Raul Kolaric RA00359586
#Rodrigo Ward Leite RA00359800

# Toda a interacao com o usuario e feita atraves de chamadas de sistema (syscalls)
# As chamadas de sistema sao selecionadas com base no valor armazenado no registrador v0
# onde para cada valor existe uma chamada de sistem diferente
# As chamadas de sistema utilizadas aqui sao:

# 1 - Apresenta um inteiro ao usuario
# 4 - Apresenta uma string ao usuraio
# 5 - Recebe um numero inteiro do usuario

.data
    prompt1: .asciiz "\nInsira o primeiro numero: "
    prompt2: .asciiz "\nInsira o segundo numero: "
    prompt3: .asciiz "\nInsira o terceiro numero: "
    prompt4: .asciiz "\nInsira o quarto numero: "
    tab: .asciiz "\t"
    menssagem: .asciiz "\nVetor ja ordenado\n"

.text

#apresentacao do prompt para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt1 #carrega a mensaagem do prompt1 em a0
syscall 


#faza requisicao do numero para o usuario, syscall codigo 5

li $v0, 5 # a0 = 5
syscall

#grava o numero em v0 para t0

add $t0, $v0, $zero


#===========================================
#apresentacao do prompt para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt2 #carrega a mensaagem do prompt1 em a0
syscall 


#faza requisicao do numero para o usuario, syscall codigo 5

li $v0, 5 # a0 = 5
syscall

#grava o numero em v0 para t0

add $t1, $v0, $zero
#============================================
#apresentacao do prompt para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt3 #carrega a mensaagem do prompt1 em a0
syscall 


#faza requisicao do numero para o usuario, syscall codigo 5

li $v0, 5 # a0 = 5
syscall

#grava o numero em v0 para t0

add $t2, $v0, $zero

#=============================================
#apresentacao do prompt para o usuario, syscall codigo 4

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, prompt4 #carrega a mensaagem do prompt1 em a0
syscall 


#faza requisicao do numero para o usuario, syscall codigo 5

li $v0, 5 # a0 = 5
syscall

#grava o numero em v0 para t0

add $t3, $v0, $zero

#=============================================




jal bubbleSort            # JAL (jump and link) chama a funcao "bubbleSort"
add $t5, $zero, $v0   # Move o valor de retorno, armazenado em v0 para t5
bne $t5, $zero, naoOrdenado # pula para a impressao do vetor ordenado pelo bubbleSort

li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, menssagem #carrega a mensagem do menssagem em a0
syscall # reqaliza a impressao da menssagem no terminal 

j fim

naoOrdenado:
#Imprime para o usuario os inteiros ordenados pelo bubbleSort

#mostra o primeiro numero
li $v0, 1
la $a0, ($t0)
syscall

#tab
li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, tab #carrega a mensagem do menssagem em a0
syscall # reqaliza a impressao da menssagem no terminal 

#mostra o segundo numero
li $v0, 1
la $a0, ($t1)
syscall

#tab
li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, tab #carrega a mensagem do menssagem em a0
syscall # reqaliza a impressao da menssagem no terminal 

#mostra o terceiro numero
li $v0, 1
la $a0, ($t2)
syscall

#tab
li $v0, 4 # carrega o 4 em v0, ou seja, v0 = 4
la $a0, tab #carrega a mensagem do menssagem em a0
syscall # reqaliza a impressao da menssagem no terminal 

#mostra o quarto numero
li $v0, 1
la $a0, ($t3)
syscall


j fim		      # Pula pro label "fim"

# ====================================== Funcao ================================================
bubbleSort:
		addi $t6, $zero, -1
    		Loop: li $t4, 0 # carregaramos inicialmente 0 em t4 para sabermos posteriormente se 
	      	                # houve troca de valores entre entre registradores, se houver o valor de 
	                        # t4 mudara para 1
	              addi $t6, $t6, 1 #
          	      slt $t5, $t0, $t1
    	  	      bne $t5, $zero, elsePrimeiraTroca
    	  	      li $t4, 1 # fez uma troca, precisara reiniciar o Loop
    	  	      add $t5, $t0, $zero
    	              add $t0, $t1, $zero
    	              add $t1, $t5, $zero    	  
    	  	      elsePrimeiraTroca: slt $t5, $t1, $t2
    	  	      bne $t5, $zero, elseSegundaTroca
    	  	      li $t4, 1 # fez uma troca, precisara reiniciar o Loop
    	              add $t5, $t1, $zero
    	              add $t1, $t2, $zero
    	              add $t2, $t5, $zero    	  
    	              elseSegundaTroca: slt $t5, $t2, $t3
    	              bne $t5, $zero, elseTerceiraTroca
    	              li $t4, 1 # fez uma troca, precisara reiniciar o Loop
    	              add $t5, $t2, $zero
    	              add $t2, $t3, $zero
    	              add $t3, $t5, $zero    	  
    	              elseTerceiraTroca: bne $t4, $zero, Loop
    	  
    	  
    	  add $v0, $t6, $zero
    	  
    	  jr $ra
# =============================================================================================



fim: