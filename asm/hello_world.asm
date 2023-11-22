;x86 asm 
;16-bit DOS
;Intel syntax

DATA SEGMENT USE16; Declare data segment in 16-bit mode

; Define a data byte array named MESG containing the string "Hello World!", followed by a null terminated character ('$')
MESG DB 'Hello world!', '$'; 
DATA ENDS; Marks the end of a data segment
CODE SEGMENT USE16; 
    ASSUME CS:CODE,DS:DATA; This specifies the segment registers  are assumed to point to code (CS) and data (DS) segments.
BEG:
    MOV AX,DATA; Moves the address of the DATA segment into the AX register.
    MOV DS,AX; Initializes the DS register with the value in the AX register, setting up the data segment.
    MOV AH,9; Loads the value 9 into the AH register, indicating a request to display a string.
    MOV DX, OFFSET MESG; Moves the offset address of the MESG string into the DX register.
    INT 21H; Triggers an interrupt 21H (hexadecimal), which is the DOS interrupt for various services.
    ; In this case, it's service 9, which displays a string.
    MOV AH,4CH; Loads the value 4CH into the AH register, indicating a request to exit the program.
    INT 21H; Triggers another interrupt 21H, terminating the program and returning control to DOS.
CODE ENDS
END BEG