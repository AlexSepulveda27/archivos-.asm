.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result_prompt: .asciiz "\nEl número mayor es: "

.text
.globl main

main:
    # Solicitar al usuario el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Leer el primer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0  # Almacenar el primer número
    
    # Solicitar al usuario el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Leer el segundo número ingresado por el usuario
    li $v0, 5
    syscall
    move $t1, $v0  # Almacenar el segundo número
    
    # Solicitar al usuario el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    
    # Leer el tercer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0  # Almacenar el tercer número
    
    # Comparar los números para encontrar el mayor
    move $t3, $t0  # Asignar el primer número como el mayor inicialmente
    
    # Comparar con el segundo número
    bgt $t3, $t1, check_third
    move $t3, $t1  # Si el segundo número es mayor, asignar como el nuevo mayor
    
check_third:
    # Comparar con el tercer número
    bgt $t3, $t2, print_result
    move $t3, $t2  # Si el tercer número es mayor, asignar como el nuevo mayor
    
print_result:
    # Mostrar el número mayor
    li $v0, 4
    la $a0, result_prompt
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    # Salir del programa
    li $v0, 10
    syscall