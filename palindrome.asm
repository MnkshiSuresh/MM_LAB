DATA SEGMENT
MSG DB 10,13,"ENTER THE STRING: $"
MSG1 DB 10,13,"PALINDROME $"
MSG2 DB 10,13,"NOT A PALINDROME $"
STR1 DB 50 DUP (0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
     START:
     MOV AX,DATA
     MOV DS,AX
     LEA DX,MSG
     MOV AH,09H
     INT 21H
     LEA SI,STR1
     LEA DI,STR1
     MOV AH,01H
     
     NEXT:
     INT 21H
     CMP AL,0DH
     JE TERMINATE
     MOV [DI],AL
     INC DI
     JMP NEXT
     
     
     
     TERMINATE:
     MOV AL,"$"
     MOV [DI],AL
     
     DO THIS:
     DEC DI
     MOV AL,[SI]
     CMP [DI],AL
     JNE NOTPAL
     INC SI
     CMP SI,DI
     JL DO THIS
     
     
     NOTPAL:
     LEA DX,MSG2
     MOV AH,09H
     INT 21H
     
     PAL:
     LEA DX,MSG1
     MOV AH,09H
     INT 21H
     
     EXIT:
     MOV AH,4CH
     INT 21H
     

CODE ENDS
END START
