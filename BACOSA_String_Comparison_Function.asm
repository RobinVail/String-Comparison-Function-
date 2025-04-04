ORG 100h

.DATA
MSG1 DB 'Enter first string: $'
MSG2 DB 0DH,0AH,'Enter second string: $'
MSG3 DB 0DH,0AH,'Case-sensitive? (Y/N): $'
MSG_MATCH DB 0DH,0AH,'1$'  ; Identical strings
MSG_NOT_MATCH DB 0DH,0AH,'0$'  ; Not identical
BUFFER1 DB 20, ?, 20 DUP('$')  
BUFFER2 DB 20, ?, 20 DUP('$')  

.CODE
MOV DX, OFFSET MSG1  
MOV AH, 09H  
INT 21H  
MOV DX, OFFSET BUFFER1  
MOV AH, 0AH  
INT 21H  

MOV DX, OFFSET MSG2  
MOV AH, 09H  
INT 21H  
MOV DX, OFFSET BUFFER2  
MOV AH, 0AH  
INT 21H  

MOV DX, OFFSET MSG3  
MOV AH, 09H  
INT 21H  
MOV AH, 01H  
INT 21H  
MOV BL, AL  ; Store response

CALL COMPARE_STRINGS

HLT  

COMPARE_STRINGS PROC
MOV SI, OFFSET BUFFER1+2  
MOV DI, OFFSET BUFFER2+2  

COMPARE_LOOP:  
MOV AL, [SI]  
MOV CL, [DI]  
CMP AL, '$'  
JE CHECK_END  
CMP CL, '$'  
JE CHECK_END  

CMP BL, 'Y'  
JE CASE_SENSITIVE  

OR AL, 20H  
OR CL, 20H  

CASE_SENSITIVE:  
CMP AL, CL  
JNE NOT_MATCH  

INC SI  
INC DI  
JMP COMPARE_LOOP  

CHECK_END:  
MOV DX, OFFSET MSG_MATCH  
JMP PRINT_RESULT  

NOT_MATCH:  
MOV DX, OFFSET MSG_NOT_MATCH  

PRINT_RESULT:  
MOV AH, 09H  
INT 21H  
RET  
COMPARE_STRINGS ENDP

END
