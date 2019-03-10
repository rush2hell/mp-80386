DATA SEGMENT
MSG DB 'ENTER PASSWORD$'
P1 DB 'co5g$'
ANS DB 'INVALID PASSWORD$'
RES DB 'VALID PASSWORD'
DATA ENDS
EXTRA SEGMENT
P2 DB '5.DUP()'
EXTRA ENDS
CODE SEGMENT
START : ASSUME CS:CODE,DS:DATA,ES:EXTRA
        MOV AX,DATA
        MOV DS,AX
        MOV DX,EXTRA
        MOV ES,DX
        MOV AH,09H
        LEA DX,MSG
        INT 21H
        LEA SI,P1
        MOV CL,05H

UP :    MOV AH,08H
        INT 21H
        LEA DX,ANS
        INT 21H
        MOV AH,02H
        MOV AL,'*'
        INT 21H
        LOOP UP
        LEA SI,P1
        LEA DI,P2
        CMPSB
        JNZ DOWN
        MOV AH,09H
        LEA DX,ANS
        INT 21H
        JMP STOP

DOWN :  MOV AH,09H
        LEA DX,RES
        INT 21H

STOP :  MOV AH,01H
        INT 21H
        MOV AH,01H
        INT 21H
        CODE ENDS 
        END START
