#Raul Kolaric RA00359586
#Igor Simões RA00360505
# inicializar as variaveis x em t0 e y em t1

li $t0, 20 # x = 10
li $t1, 20 # y = 20


bne $t0, $t1, outro # se (t0!= t1) goto outro
li $t5, 6 # z = 6

j Exit

outro: li $t5, 5 # z = 5 

Exit: