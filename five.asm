DATA SEGMENT
    FNAME DB 'C:\',0
    ERR_MSG DB 'ERROR OCCURED$'
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:  MOV AX,DATA
            MOV DS,AX
            MOV AH,43H
            MOV AL,00H
            LEA DX,FNAME
            INT 21H
            MOV AH,41H
            LEA DX,FNAME
            INT 21H
            JNC QUIT
            MOV AX,0900H
            MOV DX,OFFSET ERR_MSG
            INT 21H
    
    QUIT:   MOV AH,4CH
            INT 21H
            CODE ENDS
            END START 
              