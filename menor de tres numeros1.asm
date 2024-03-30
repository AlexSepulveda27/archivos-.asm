.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result_prompt: .asciiz "\nEl número menor es: "

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
    move $s0, $v0  # Almacenar el primer número
    
    # Solicitar al usuario el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Leer el segundo número ingresado por el usuario
    li $v0, 5
    syscall
    move $s1, $v0  # Almacenar el segundo número
    
    # Solicitar al usuario el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    
    # Leer el tercer número ingresado por el usuario
    li $v0, 5
    syscall
    move $s2, $v0  # Almacenar el tercer número
    
    # Comparar los números para encontrar el mayor
    move $t0, $s0  # Asignar el primer número como el mayor inicialmente
    
    # Comparar con el segundo número
    bgt $s1, $t0, check_third
    move $t0, $s1  # Si el segundo número es mayor, asignar como el nuevo mayor
    
check_third:
    # Comparar con el tercer número
    bgt $s2, $t0, print_result
    move $t0, $s2  # Si el tercer número es mayor, asignar como el nuevo mayor
    
print_result:
    # Mostrar el número mayor
    li $v0, 4
    la $a0, result_prompt
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Salir del programa
    li $v0, 10
    syscall