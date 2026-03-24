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
sw $t0, 0($s0)      	# Salva o 10 no endereço base (offset 0)
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
addi $t0, $zero, 0  # Limpa o registrador $t0, atribuindo o valor 0
addi $t1, $zero, 0  # Limpa o registrador $t1, atribuindo o valor 0
addi $t2, $zero, 0  # Limpa o registrador $t2, atribuindo o valor 0
addi $t3, $zero, 0  # Limpa o registrador $t3, atribuindo o valor 0
addi $t4, $zero, 0  # Limpa o registrador $t4, atribuindo o valor 0
addi $t5, $zero, 0  # Limpa o registrador $t5, atribuindo o valor 0
addi $t6, $zero, 0  # Limpa o registrador $t6, atribuindo o valor 0
addi $t7, $zero, 0  # Limpa o registrador $t7, atribuindo o valor 0
addi $t8, $zero, 0  # Limpa o registrador $t8, atribuindo o valor 0
addi $t9, $zero, 0  # Limpa o registrador $t9, atribuindo o valor 0