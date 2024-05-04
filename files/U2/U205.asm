.MODEL SMALL, C
.STACK 100h
.DATA
    menu db '1. Capturar tres numeros', 0Dh, 0Ah
         db '2. Mostrar numeros ingresados', 0Dh, 0Ah
         db '3. Mostrar el numero mas pequeno', 0Dh, 0Ah
         db '4. Mostrar el numero mas grande', 0Dh, 0Ah
         db '5. Calcular la mediana', 0Dh, 0Ah
         db '6. Salir', 0Dh, 0Ah
         db 'Selecciona una opcion (1-6): $'

    enter db 0Dh
    option db 'Opcion: '
    input_msg db 'Ingresa el numero: $'
    newline db 13, 10, '$'
    invalid db 'Opcion no valida', newline, '$'
    result db 'El resultado es: ', '$'
    numbers db 3 dup(0)  ; Almacena los tres números ingresados

.CODE
.STARTUP
    ; Inicializa modo de video y segmento de datos
    MOV ax, @DATA
    MOV ds, ax
    MOV es, ax

    ; Bucle del menú principal
menu_loop:
    ; Imprime el menú
    MOV dx, OFFSET menu
    MOV ah, 09h
    INT 21h

    ; Solicita una opción del usuario
    MOV dx, OFFSET option
    MOV ah, 09h
    INT 21h

    ; Lee la opción del usuario
    MOV ah, 01h
    INT 21h
    MOV bl, al  ; Guardar la opción

    ; Ir a la opción seleccionada
    CMP bl, '1'
    JE capture_numbers
    CMP bl, '2'
    JE show_numbers
    CMP bl, '3'
    JE find_smallest
    CMP bl, '4'
    JE find_largest
    CMP bl, '5'
    JE calculate_median
    CMP bl, '6'
    JE exit_program

    ; Si no es una opción válida, mostrar mensaje de error
    MOV dx, OFFSET invalid
    MOV ah, 09h
    INT 21h
    JMP menu_loop

capture_numbers:
    ; Captura tres números
    MOV di, 0
capture_single_number:
    MOV dx, OFFSET input_msg
    MOV ah, 09h
    INT 21h

    ; Leer un número del usuario
    MOV ah, 01h
    INT 21h
    SUB al, '0'  ; Convertir carácter a número
    MOV numbers[di], al

    INC di
    CMP di, 3
    JL capture_single_number

    JMP menu_loop

show_numbers:
    ; Muestra los números ingresados
    MOV dx, OFFSET result
    MOV ah, 09h
    INT 21h

    MOV al, numbers[0]
    ADD al, '0'
    MOV ah, 02h
    MOV dl, al
    INT 21h

    MOV dl, ' '
    INT 21h

    MOV al, numbers[1]
    ADD al, '0'
    MOV dl, al
    INT 21h

    MOV dl, ' '
    INT 21h

    MOV al, numbers[2]
    ADD al, '0'
    MOV dl, al
    INT 21h

    MOV dx, OFFSET newline
    MOV ah, 09h
    INT 21h

    JMP menu_loop

find_smallest:
    ; Encuentra el número más pequeño
    MOV al, numbers[0]
    MOV bl, numbers[1]
    CMP al, bl
    JLE smallest_is_al
    MOV al, bl

smallest_is_al:
    MOV bl, numbers[2]
    CMP al, bl
    JLE smallest_found
    MOV al, bl

smallest_found:
    MOV dx, OFFSET result
    MOV ah, 09h
    INT 21h

    ADD al, '0'
    MOV ah, 02h
    MOV dl, al
    INT 21h

    MOV dx, OFFSET newline
    MOV ah, 09h
    INT 21h

    JMP menu_loop

find_largest:
    ; Encuentra el número más grande
    MOV al, numbers[0]
    MOV bl, numbers[1]
    CMP al, bl
    JGE largest_is_al
    MOV al, bl

largest_is_al:
    MOV bl, numbers[2]
    CMP al, bl
    JGE largest_found
    MOV al, bl

largest_found:
    MOV dx, OFFSET result
    MOV ah, 09h
    INT 21h

    ADD al, '0'
    MOV ah, 02h
    MOV dl, al
    INT 21h

    MOV dx, OFFSET newline
    MOV ah, 09h
    INT 21h

    JMP menu_loop

calculate_median:
    ; Calcula la mediana de tres números
    MOV al, numbers[0]
    MOV bl, numbers[1]
    MOV cl, numbers[2]

    ; Ordenar los tres números para encontrar la mediana
    CMP al, bl
    JLE sort_1
    XCHG al, bl  ; Intercambiar si es necesario
sort_1:
    CMP bl, cl
    JLE sort_2
    XCHG bl, cl  ; Intercambiar si es necesario
sort_2:
    CMP al, bl
    JLE sort_3
    XCHG al, bl  ; Intercambiar si es necesario
sort_3:

    MOV dx, OFFSET result
    MOV ah, 09h
    INT 21h

    ADD bl, '0'
    MOV ah, 02h
    MOV dl, bl
    INT 21h

    MOV dx, OFFSET newline
    MOV ah, 09h
    INT 21h

    JMP menu_loop

exit_program:
    .EXIT
END
