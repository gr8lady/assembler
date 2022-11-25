;programa de Assembler que multiplica y divide, por Heizel Gonzalez carne 1202101


.model Small
.stack
.data
    numero1     db 0 ; cuando no tenemos un valor inicial para la variable asignamos ?
    numero2     db 0
    resultado   db 0
    resiD       db 0
    mensajeM    db 10,13,7,'Multiplicacion: ','$'
    mensajeD    db 10,13,7,'division: ','$'
    residuo     db 10,13,7,'residuo: ','$'
    instruccion db 10,13,7,'ingrese un numero: ','$'
    creador     db 10,13,7,'Heizel Gonzalez carne 1202101 ','$'

    
.code

programa:

    Mov AX,@Data                ;Mueve la direccion de inicio del segmento de datos al Acumulador
    Mov DS, AX                  ;Mueve la direccion de inicio del segmento de datos al DS
    
    mov ah, 09h                 ; desplegamos el mensaje de instrucciones
    lea dx, creador
    int 21h
        
    mov ah, 09h                 ; desplegamos el mensaje de instrucciones
    lea dx, instruccion
    int 21h
    
    mov ah, 01h                 ; leemos un solo caracter 
    int 21h
    sub al, 30h
    mov numero1,al
    
    mov ah, 09h                 ; desplegamos el mensaje de instrucciones
    lea dx, instruccion
    int 21h
    
    mov ah, 01h                 ; leemos un solo caracter 
    int 21h
    sub al, 30h
    mov numero2,al
    
  
    
    ; multiplicar
    mov al, numero1
    mov bl, numero2
    mul bl
    mov resultado,al
    
    mov ah, 09h                 ; desplegamos el tipo de operacion
    lea dx, mensajeM
    int 21h   
   
    mov al,resultado
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h 
    
    ; dividir
    xor ax,ax  ; limpiamos el registro
    mov bl, numero2
    mov al, numero1
    div bl
    mov resultado,al
    mov resiD,ah       ; almacenamos el resultado del resido en el registro ah
    
    mov ah, 09h                 ; desplegamos el tipo de operacion
    lea dx, mensajeD
    int 21h   
   
    mov al,resultado   ; almacenamos el resultado del resuultado
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h 
    
   ; residuo division
    mov ah, 09h                 ; desplegamos el tipo de operacion
    lea dx, residuo
    int 21h   
    
    mov al,resiD   ; almacenamos el resultado del residuo en el registro al para desplegarse
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h 
  
    
    ; finalizar el programa 
    MOV AH, 4ch
    INT 21h
 
end programa