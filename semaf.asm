#include "p16F628a.inc"
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
RES_VECT  CODE    0x0000      
    GOTO    START 
MAIN_PROG CODE
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33
START
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0 
    MOVLW b'00000000'
    MOVWF TRISB 
    BCF STATUS, RP0
    clrf PORTB
    
    
    
    
    inicio:
    movlw b'00100001'
    movwf PORTB
    call cincoseg
    movlw b'00100010'
    movwf PORTB
    call unseg
    movlw b'00001100'
    movwf PORTB
    call cincoseg
    movlw b'00010100'
    movwf PORTB
    call unsegs
    goto inicio
	

    cincoseg:
    nop
    nop
    call tiempo1
    tiempo1:
    movlw d'47'
    movwf m
    mloop1:
    decfsz m,f
    goto mloop1
    movlw d'101'
    movwf i
    iloop1:
     nop
    nop
    nop
    nop
    nop
    movlw d'89'
    movwf j
    jloop1:
    nop
    movlw d'91'
    movwf k
    kloop1:
    decfsz k,f
    goto kloop1
    decfsz j,f
    goto jloop1
    decfsz i,f
    goto iloop1
    return
	
    unseg:
    nop
    nop
    call tiempoc
    tiempoc:
    movlw d'20'
    movwf m
    mloop:
    decfsz m,f
    goto mloop
    movlw d'108'
    movwf i
    iloop:
    nop
    nop
    nop
    nop
    nop
    movlw d'60'
    movwf j
    jloop:
    nop
    movlw d'24'
    movwf k
    kloop:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return
    
    unsegs:
    call tiempoc2
    tiempoc2:
    movlw d'20'
    movwf m
    mloop2:
    decfsz m,f
    goto mloop2
    movlw d'108'
    movwf i
    iloop2:
    nop
    nop
    nop
    nop
    nop
    movlw d'60'
    movwf j
    jloop2:
    nop
    movlw d'24'
    movwf k
    kloop2:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop2
    decfsz i,f
    goto iloop2
    return
    
    end