DATA SEGMENT
  MSG DB 10,13,"ENTER THE NUMBER WHOSE FACT TO BE FOUND:$"
  FACT DB ?
  DATA ENDS

CODE SEGMENT
  ASSUME DS:DATA, CS:CODE
  START:
  MOV AX,DATA
  MOV DS,AX
  LEA DX,MSG
  MOV AH,09H
  INT 21H
  MOV AH,01H
  INT 21H
  MOV CL,AL
  MOV AX,0001H
  MOV BX,0001H
  AGAIN:
  MUL BX
  INC BX
  DEC CL
  JNZ AGAIN
  MOV BX,AX
  MOV FACT,BX
  MOV AH,4CH
  INT 21H
  CODE ENDS
  END START
