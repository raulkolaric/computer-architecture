# Este codigo realiza um teste de escrita e leitura na memoria do MIPS
# A escrita da memoria do MIPS e feita com a instrucao SW (store word)
# A leitura da memoria do MIPS e feita com a instrucao LW (load word)
# Ambas as instrucoes necessitam de um endereco base da memoria
# O endereco de comeco da memoria de dados do MIPS no MARS e 268500992

addi $t0, $zero, 268500992	# Armazena em t0 o endereco base da memoria de dados
addi $t1, $zero, 7      	# t1 = 7

sw $t1, ($t0)				# Armazena o conteudo de t1 na posicao de memoria apontada por t0

						
addi $t1, $zero, 3      	# t1 = 3


sw $t1, 32($t0)			# 268500992 + 32

											
lw $t2, ($t0)	# Carrega o valor armazenado na posicao de memoria apontado por t0 em t2
