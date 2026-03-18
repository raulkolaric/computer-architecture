#Inicializando os registradores.

li $t0, 4
li $t1, 5
li $t2, 1	# $t2 = TRUE

slt $t8, $t0, $t1	#Checha se $t1 > $t0.
beq $t2, $t8, t1maior	#Compara se $t8 == $t2, se sim, vai rótulo t1maior.
bne $t2, $t8, t0maior	#Checa se $t8 != $t2. se sim, vai rótulo t2maior

t1maior:
add $t5, $t0, $zero	#Adiciona t0 + 0 em t5, feito a soma com 0 para não alterar o valor. 
add $t6, $t1, $zero	#Adiciona t1 em t6, utilizando a soma 0 que nem a anterior.

j end

t0maior:
add $t5, $t1, $zero	#Adiciona t1 + 0 em t5, feito a soma com 0 para não alterar o valor. 
add $t6, $t0, $zero	#Adiciona t1 em t6, utilizando a soma 0 que nem a anterior.

end: