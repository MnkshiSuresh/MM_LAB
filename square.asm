DATA SEGMENT
     SQUARE DW ?
     NUM DW 5
     ENDS DATA

CODE SEGMENT
     ASSUME CS:CODE,DS:DATA
     START:MOV AX,DATA
     MOV DS,AX
     MOV AX,[NUM]
     IMUL AX
     MOV [SQUARE],AX
     
     MOV AH,4CH
     INT 21H
     CODE ENDS
     END START
