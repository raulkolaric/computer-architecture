#Raul Kolaric RA00359586
#Igor Simões RA00360505

addi $s0, $zero, 268500992	# Armazena em t0 o endereco base da memoria de dados (usando o %s0 porque vamos usar todos os temporarios para iniciar as notas)

#notas escolhidas: 10,1,7,5,7,8,9,4,4,3
addi $t0, $zero, 10	#Nota número 1 inicializada em $t0, com valor 10
addi $t1, $zero, 1	#Nota número 2 inicializada em $t1, com valor 1
addi $t2, $zero, 7	#Nota número 3 inicializada em $t2, com valor 7
addi $t3, $zero, 5	#Nota número 4 inicializada em $t3, com valor 5
addi $t4, $zero, 7	#Nota número 5 inicializada em $t4, com valor 7
addi $t5, $zero, 8	#Nota número 6 inicializada em $t5, com valor 8
addi $t6, $zero, 9	#Nota número 7 inicializada em $t6, com valor 9
addi $t7, $zero, 4	#Nota número 8 inicializada em $t7, com valor 4
addi $t8, $zero, 4	#Nota número 9 inicializada em $t8, com valor 4
addi $t9, $zero, 3	#Nota número 10 inicializada em $t9, com valor 3

#atribuição das notas na memória
sw $t0, 0($s0)      	# Salva o $t0(10) no endereço base (offset 0)
sw $t1, 4($s0)      	# Pula 4 bytes. Salva o 1 no offset 4
sw $t2, 8($s0)      	# Pula 4 bytes. Salva o 7 no offset 8
sw $t3, 12($s0)     	# Offset 12
sw $t4, 16($s0)     	# Offset 16
sw $t5, 20($s0)     	# Offset 20
sw $t6, 24($s0)     	# Offset 24
sw $t7, 28($s0)     	# Offset 28
sw $t8, 32($s0)     	# Offset 32
sw $t9, 36($s0)     	# Salva a última nota (3) no offset 36

# Limpeza dos registradores temporários após o uso
addi $t0, $zero, 0  	# Limpa o registrador $t0, atribuindo o valor 0
addi $t1, $zero, 0  	# Limpa o registrador $t1, atribuindo o valor 0
addi $t2, $zero, 0  	# Limpa o registrador $t2, atribuindo o valor 0
addi $t3, $zero, 0  	# Limpa o registrador $t3, atribuindo o valor 0
addi $t4, $zero, 0  	# Limpa o registrador $t4, atribuindo o valor 0
addi $t5, $zero, 0  	# Limpa o registrador $t5, atribuindo o valor 0
addi $t6, $zero, 0  	# Limpa o registrador $t6, atribuindo o valor 0
addi $t7, $zero, 0  	# Limpa o registrador $t7, atribuindo o valor 0
addi $t8, $zero, 0  	# Limpa o registrador $t8, atribuindo o valor 0
addi $t9, $zero, 0  	# Limpa o registrador $t9, atribuindo o valor 0

#processamento das notas
lw $t5, 0($s0)      	# Inicializa a maior nota com a primeira nota da memoria
lw $t6, 0($s0)      	# Inicializa a menor nota com a primeira nota da memoria
addi $t7, $zero, 0  	# Inicializa o contador de notas menores que 5 com 0
addi $t4, $zero, 5  	# Valor para comparacao (5.0)

addi $t0, $zero, 0  	# Contador do loop (i = 0)
addi $t1, $zero, 10 	# Limite de notas (10 notas)
add $t2, $zero, $s0 	# Copia o endereco base para percorrer a memoria

LOOP:
    beq $t0, $t1, FIM   # Se o contador chegar em 10, encerra o loop
    
    lw $t3, 0($t2)      # Carrega a nota atual da memoria para $t3
    
    # Verifica se a nota atual eh a maior
    slt $t8, $t5, $t3   # Se maior ($t5) < atual ($t3), entao $t8 = 1
    beq $t8, $zero, MENOR
    add $t5, $zero, $t3 # Atualiza a maior nota
    
MENOR:
    # Verifica se a nota atual eh a menor
    slt $t8, $t3, $t6   # Se atual ($t3) < menor ($t6), entao $t8 = 1
    beq $t8, $zero, CONTADOR
    add $t6, $zero, $t3 # Atualiza a menor nota
    
CONTADOR:
    # Verifica se a nota eh menor que 5
    slt $t8, $t3, $t4   # Se atual ($t3) < 5, entao $t8 = 1
    add $t7, $t7, $t8   # Soma 1 ao contador $t7 se for verdadeiro
    
    addi $t2, $t2, 4    # Avanca 4 bytes para a proxima nota
    addi $t0, $t0, 1    # Incrementa o contador do loop
    j LOOP              # Volta para o inicio do loop

FIM:
# Fim do programa. Resultados estao em $t5, $t6 e $t7.




