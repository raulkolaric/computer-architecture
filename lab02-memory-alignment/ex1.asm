#Raul Kolaric RA00359586
#Igor Simões RA00360505
#Rodrigo Ward RA00359800

#RA usado = RA00359586

addi $t0, $zero, 268500992	# Armazena em t0 o endereco base da memoria de dados
add $t1, $zero, 8		#Armazena em $t1 o penúltimo número do RA
add $t2, $zero, 6		#Armazena em $t2 o último número do RA
add $t3, $t1, $t2		#Armazena em $t3 a soma dos últimos 2 números do RA

sw $t3, 36($t0)			#Soma do RA00359586 = 36, esse vai ser o deslocamento para salvar na memória. 
