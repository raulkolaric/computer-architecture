#Raul Kolaric RA00359586
#Igor Simões RA00360505
#Recebe o RA
#Soma todos os dígitos do RA
#RA00359586

#Inicializa o RA

li $t0, 0 
li $t1, 0 
li $t2, 3 
li $t3, 5 
li $t4, 9 
li $t5, 5 
li $t6, 8 
li $t7, 6

 #Soma todos os dígitos do RA
 
add $t8, $t0, $t1
add $t8, $t8, $t1 
add $t8, $t8, $t2
add $t8, $t8, $t3
add $t8, $t8, $t4
add $t8, $t8, $t5
add $t8, $t8, $t6
add $t8, $t8, $t7
