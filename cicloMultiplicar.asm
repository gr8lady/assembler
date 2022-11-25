.model Small
.stack
.data
    num1 db ?  ; cuando no tenemos un valor definido 
    num2 db ? 
    resultado1 DB 'los numeros son iguales$'
    resultado2 db 'el primer numero es mayor$'
    resultado3 db 'el segundo numero es mayor$'
    instruccion db 10,13,7,'ingrese un numero: ','$'
    resultado4 db 'el resultado de la multiplicacion es: $'
    
.code

programa:

    Mov AX,@Data                ;Mueve la direccion de inicio del segmento de datos al Acumulador
    Mov DS, AX                  ;Mueve la direccion de inicio del segmento de datos al DS
    ; haemos una limpieza antes 
    xor AX,AX
    
    ; lectura
    leer:
    mov ah, 09h                 ; desplegamos el mensaje de instrucciones
    lea dx, instruccion
    int 21h
    
    mov ah,01h                  ;comando para leer caracter desde el teclado
    int 21h                     ;lee primer caracter
    sub AL, 30h
    mov num1, AL
    xor ax,ax
    
    mov ah, 09h                 ; desplegamos el mensaje de instrucciones
    lea dx, instruccion
    int 21h
    
    mov ah,01h                  ;comando para leer caracter desde el teclado
    int 21h                     ;lee segundo caracter
    sub AL, 30h
    mov num2, AL
    xor ax,ax
    ;ahora vamos a realizar la comparacion en assembler
    ; no se puede comparar memoria vs memoria. no se pueden sumar directamente dos variables.
    ; limpiamos variables
    xor ax,ax
    mov al,num1 ; asignamos el valor de num1 a al
    cmp al,num2
    
    ; se pueden poner las 3 comparaciones de un solo.
    JE esIgual
    JS esMenor
    JMP esMayor  ; el jmp se puede utilizar como un else dentro de los saltos, tambien se podria obviar la instruccion 
    
    ; resultados de las comparaciones, aca etiquetamos las posibles salidas
    esMayor:
    mov dx,offset resultado2
    mov ah, 09h
    int 21h
    jmp multiplicar ; saltamos a la etiqueta finalizar 
    
    
    esMenor:
    mov dx,offset resultado3
    mov ah, 09h
    int 21h
    jmp multiplicar
    
    
    esIgual:
    mov dx,offset resultado1
    mov ah, 09h
    int 21h
    jmp multiplicar
    
    ;ahora vamos a trabajar los ciclos
    ;----------------- multiplicacion de los ciclos --------------------------------------------
    ;limpiar registros, siempre se empiezan por la parte baja de los registros. 
    mov cx,cx
    mov bx,bx
    
    ;asignamos los valores 
    mov cl,num1
    mov bl,num2
    ; las operaciones van dentro del ciclo
    ; ahora tenemos que declarar una etiqueta para el loop
    multiplicar:
        add bl,num2
    loop multiplicar:
    ; nos falta imprimir el resultado
    mov dx, ofset resultado4
    mov ah,09h
    int 21h
    
    xor dx,dx
    mov dl,bl
    mov bl,30h
    mov ah,02h
    int 21h
    
    mov bl,num2  ; aca ponemos nuestro total, por eso va a fuera de la etiqueta
   
    
finalizar:
    MOV AH, 4ch
    INT 21h
    
end programa