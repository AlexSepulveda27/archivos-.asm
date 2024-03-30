.data
prompt: .asciiz "Ingrese un número para generar la serie Fibonacci: "
result_prompt: .asciiz "\nLa serie Fibonacci es: "

.text
.globl main

main:
    # Mostrar mensaje para solicitar al usuario el número
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $s0, $v0  # Almacenar el número ingresado
    
    # Mostrar mensaje para la serie de Fibonacci
    li $v0, 4
    la $a0, result_prompt
    syscall
    
    # Llamar a la función fibonacci
    move $a0, $s0  # Pasar el número ingresado como argumento
    jal fibonacci  # Llamar a la función fibonacci
    
    # Salir del programa
    li $v0, 10
    syscall

# Función para calcular la serie Fibonacci
fibonacci:
    # Configuración de registros
    addi $sp, $sp, -12   # Reservar espacio en la pila
    sw $ra, 0($sp)       # Guardar la dirección de retorno
    sw $a0, 4($sp)       # Guardar el argumento n
    li $t0, 0            # Inicializar f0 = 0
    li $t1, 1            # Inicializar f1 = 1
    move $t2, $zero      # Inicializar contador

    # Mostrar el primer término
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Mostrar el segundo término si n es mayor que 1
    lw $t3, 4($sp)      # Cargar el argumento n
    bge $t3, 2, loop    # Saltar al bucle si n es mayor o igual a 2
    
    li $v0, 1
    move $a0, $t1
    syscall

    j end               # Saltar al final de la función si n es 0 o 1

loop:
    # Calcular el siguiente término
    add $t2, $t2, 1     # Incrementar el contador
    lw $t3, 4($sp)      # Cargar el argumento n
    blt $t2, $t3, calculate_term  # Saltar al cálculo si el contador es menor que n
    
end:
    # Restaurar registros y retornar
    lw $ra, 0($sp)      # Recuperar la dirección de retorno
    addi $sp, $sp, 12   # Restaurar el puntero de pila
    jr $ra              # Retornar

calculate_term:
    add $t4, $t0, $t1   # Calcular el siguiente término
    li $v0, 1
    move $a0, $t4       # Mostrar el término actual
    syscall

    # Actualizar los valores para el siguiente término
    move $t0, $t1
    move $t1, $t4

    j loop              # Volver al bucle principal