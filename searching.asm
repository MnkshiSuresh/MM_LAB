DATA SEGMENT
ARRAY DW 1111,2222,3333,4444,5555
ARRAYSIZE DB 5
MSG DB 10,13,"FOUND$"
MSG1 DB 10,13,"NOT FOUND$"
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV CX,ARRAYSIZE
    LEA SI,ARRAY
    MOV AX,5555
    
    NEXT:
    CMP AX,[SI]
    JZ FOUND
    
    INC SI
    INC SI
    DEC CX
    JNZ NEXT
    
    NOT FOUND:
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    JMP EXIT
    
    FOUND:
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H



CODE ENDS
END START
