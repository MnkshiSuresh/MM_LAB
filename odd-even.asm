DATA SEGMENT
    RESULT DW ?
    MSG DB 10,13,"ENTER THE NUMBER :$"
    MSG2 DB 10,13,"IS EVEN$"
    MSG3 DB 10,13,"IS ODD$"
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
    MOV AX, DATA
    MOV DS, AX
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV BL, AL        ; Move the user input to BL
    MOV AH, 00H       ; Clear AH for division
    MOV CX, 0002H     ; Move divisor to CX
    DIV CX           ; AX / CX, quotient in AL, remainder in AH
    CMP AH, 00H      ; Compare the remainder with zero (even)
    JZ EVEN          ; Jump to EVEN if zero
    LEA DX, MSG3      ; Load address of MSG3 (ODD message)
    MOV AH, 09H
    INT 21H
    JMP END_PROGRAM  ; Jump to the end of the program
EVEN:
    LEA DX, MSG2      ; Load address of MSG2 (EVEN message)
    MOV AH, 09H
    INT 21H
END_PROGRAM:
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
