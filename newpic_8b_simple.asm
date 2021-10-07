#include "p16F628a.inc"    
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    

RES_VECT  CODE    0x0000            ; processor reset vector
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
  
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program

i EQU 0x20
j EQU 0x21

START
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0 
    CLRF TRISB
    CLRF TRISA
    BCF STATUS, RP0
    
    BCF PORTA,1
    BCF PORTA,0
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
INICIO	  
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x00		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'R'
    MOVWF PORTB
    CALL exec

    MOVLW 'L'
    MOVWF PORTB
    CALL exec

    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'V'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec

    MOVLW 'L'
    MOVWF PORTB
    CALL exec

    MOVLW 'L'
    MOVWF PORTB
    CALL exec

    MOVLW 'E'
    MOVWF PORTB
    CALL exec

    MOVLW 'G'
    MOVWF PORTB
    CALL exec

    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC5		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    MOVLW 'G'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'U'
    MOVWF PORTB
    CALL exec

    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec

    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTB
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;COMIENZA TIPO INITLCD2
    
    CALL TIME2
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    ;;COMIENZA TIPO INIICIO2
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x84		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    MOVLW 'R'
    MOVWF PORTB
    CALL exec

    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
   
     MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC3		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec

    MOVLW 'B'
    MOVWF PORTB
    CALL exec

    MOVLW 'E'
    MOVWF PORTB
    CALL exec

    MOVLW 'R'
    MOVWF PORTB
    CALL exec

    MOVLW 'N'
    MOVWF PORTB
    CALL exec

    MOVLW 'E'
    MOVWF PORTB
    CALL exec

    MOVLW 'T'
    MOVWF PORTB
    CALL exec

    MOVLW 'I'
    MOVWF PORTB
    CALL exec

    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTB
    CALL exec
   
    ;COMIENZA INITLCD3
    
    CALL TIME2
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    ;;COMIENZA TIPO INIICIO3
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x84		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC7		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTB
    CALL exec
    
    CALL TIME2
;;BORRAR PARA EL INICIO
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    GOTO INICIO

exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
		
TIME2
    NOP
    NOP
    NOP
    CLRF i
    MOVLW d'200'
    MOVWF j
ciclo1    
    NOP
    NOP
    MOVLW d'200'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo1
    RETURN
			
    END