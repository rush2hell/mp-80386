DATA SEGMENT
    ERR_MSG DB 'ERROR OCCURED$'
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:MOV AX,DATA
    MOV DS,AX
    MOV AH,57H
    MOV AL,00H
    MOV AH,2AH
    INT 21H
    JNC QUIT
    QUIT:MOV AH,4CH
    INT 21H
CODE ENDS
END START