opt subtitle "Microchip Technology Omniscient Code Generator (Lite mode) build 59893"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 49 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
INDF equ 00h ;# 
# 55 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR0 equ 01h ;# 
# 61 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCL equ 02h ;# 
# 67 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
STATUS equ 03h ;# 
# 154 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
FSR equ 04h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTA equ 05h ;# 
# 209 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTB equ 06h ;# 
# 270 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTC equ 07h ;# 
# 331 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTD equ 08h ;# 
# 392 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTE equ 09h ;# 
# 423 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 442 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
INTCON equ 0Bh ;# 
# 519 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 580 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 619 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 625 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 631 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 637 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
T1CON equ 010h ;# 
# 711 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR2 equ 011h ;# 
# 717 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
T2CON equ 012h ;# 
# 787 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPBUF equ 013h ;# 
# 793 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPCON equ 014h ;# 
# 862 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1 equ 015h ;# 
# 868 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1L equ 015h ;# 
# 874 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1H equ 016h ;# 
# 880 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCP1CON equ 017h ;# 
# 937 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
RCSTA equ 018h ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TXREG equ 019h ;# 
# 1037 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1043 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1049 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1055 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1061 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1118 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1124 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1219 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1288 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISA equ 085h ;# 
# 1337 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISB equ 086h ;# 
# 1398 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISC equ 087h ;# 
# 1459 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISD equ 088h ;# 
# 1520 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISE equ 089h ;# 
# 1576 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1637 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1676 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCON equ 08Eh ;# 
# 1709 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1770 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PR2 equ 092h ;# 
# 1776 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPADD equ 093h ;# 
# 1782 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 1950 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TXSTA equ 098h ;# 
# 2030 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SPBRG equ 099h ;# 
# 2036 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2105 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2169 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2175 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2233 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2239 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2245 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2251 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2257 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2301 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EECON2 equ 018Dh ;# 
	FNCALL	_main,_ADC_Init
	FNCALL	_main,_TIMER1_Init
	FNCALL	_main,_USART_Init
	FNCALL	_USART_Init,___aldiv
	FNROOT	_main
	FNCALL	_ISR,_ADC_Read
	FNCALL	_ISR,_USART_ReceiveChar
	FNCALL	_ISR,_USART_WriteChar
	FNCALL	_USART_ReceiveChar,_USART_WriteString
	FNCALL	_USART_WriteString,_USART_WriteChar
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_resp
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	26

;initializer for _resp
	retlw	023h
	global	_HIGH
	global	_LOW
	global	_buffer
	global	_ADC_Buffer
	global	_input
	global	_ADCResult
	global	_ativa
	global	_cont1
	global	_sec
	global	_status
	global	_Display
	global	_TMR1
_TMR1	set	0xE
	global	_ADCON0bits
_ADCON0bits	set	0x1F
	global	_ADRESH
_ADRESH	set	0x1E
	global	_INTCONbits
_INTCONbits	set	0xB
	global	_PIR1bits
_PIR1bits	set	0xC
	global	_PORTA
_PORTA	set	0x5
	global	_PORTB
_PORTB	set	0x6
	global	_PORTBbits
_PORTBbits	set	0x6
	global	_PORTC
_PORTC	set	0x7
	global	_PORTD
_PORTD	set	0x8
	global	_PORTE
_PORTE	set	0x9
	global	_RCREG
_RCREG	set	0x1A
	global	_RCSTAbits
_RCSTAbits	set	0x18
	global	_T1CONbits
_T1CONbits	set	0x10
	global	_TXREG
_TXREG	set	0x19
	global	_OERR
_OERR	set	0xC1
	global	_ADCON1bits
_ADCON1bits	set	0x9F
	global	_ADRESL
_ADRESL	set	0x9E
	global	_PIE1bits
_PIE1bits	set	0x8C
	global	_SPBRG
_SPBRG	set	0x99
	global	_TRISA
_TRISA	set	0x85
	global	_TRISB
_TRISB	set	0x86
	global	_TRISC
_TRISC	set	0x87
	global	_TRISD
_TRISD	set	0x88
	global	_TRISE
_TRISE	set	0x89
	global	_TXSTAbits
_TXSTAbits	set	0x98
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	global __stringdata
__stringdata:
	
STR_1:	
	retlw	10
	retlw	13
	retlw	32	;' '
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	32	;' '
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	79	;'O'
	retlw	85	;'U'
	retlw	82	;'R'
	retlw	79	;'O'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	73	;'I'
	retlw	76	;'L'
	retlw	72	;'H'
	retlw	65	;'A'
	retlw	32	;' '
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	45	;'-'
	retlw	32	;' '
	retlw	10
	retlw	13
	retlw	32	;' '
	retlw	0
psect	strings
	global __end_of__stringdata
__end_of__stringdata:
; #config settings
global __CFG_WDTE$OFF
__CFG_WDTE$OFF equ 0x0
global __CFG_PWRTE$ON
__CFG_PWRTE$ON equ 0x0
global __CFG_CP$OFF
__CFG_CP$OFF equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
global __CFG_CPD$OFF
__CFG_CPD$OFF equ 0x0
global __CFG_FOSC$HS
__CFG_FOSC$HS equ 0x0
	file	"Supervisorio.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_HIGH:
       ds      1

_LOW:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_buffer:
       ds      6

_ADC_Buffer:
       ds      4

_input:
       ds      3

_ADCResult:
       ds      2

_ativa:
       ds      2

_cont1:
       ds      2

_sec:
       ds      2

_status:
       ds      2

_Display:
       ds      1

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	26
_resp:
       ds      1

	file	"Supervisorio.as"
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+018h)
	fcall	clear_ram0
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_USART_WriteChar:	; 0 bytes @ 0x0
??_USART_WriteChar:	; 0 bytes @ 0x0
?_USART_WriteString:	; 0 bytes @ 0x0
?_ADC_Init:	; 0 bytes @ 0x0
?_ADC_Read:	; 0 bytes @ 0x0
?_TIMER1_Init:	; 0 bytes @ 0x0
?_ISR:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
?_USART_ReceiveChar:	; 1 bytes @ 0x0
	global	USART_WriteChar@USARTData
USART_WriteChar@USARTData:	; 1 bytes @ 0x0
	global	ADC_Read@channel
ADC_Read@channel:	; 2 bytes @ 0x0
	ds	1
??_USART_WriteString:	; 0 bytes @ 0x1
	ds	1
??_ADC_Read:	; 0 bytes @ 0x2
	global	USART_WriteString@str
USART_WriteString@str:	; 1 bytes @ 0x2
	ds	1
??_USART_ReceiveChar:	; 0 bytes @ 0x3
	ds	1
	global	USART_ReceiveChar@USART_Data
USART_ReceiveChar@USART_Data:	; 1 bytes @ 0x4
	ds	1
??_ISR:	; 0 bytes @ 0x5
	ds	5
	global	ISR@checksum
ISR@checksum:	; 1 bytes @ 0xA
	ds	1
	global	ISR@index
ISR@index:	; 1 bytes @ 0xB
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_ADC_Init:	; 0 bytes @ 0x0
??_TIMER1_Init:	; 0 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	4
??___aldiv:	; 0 bytes @ 0x8
	ds	1
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x9
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0xA
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xB
	ds	4
?_USART_Init:	; 0 bytes @ 0xF
	global	USART_Init@BaudRate
USART_Init@BaudRate:	; 4 bytes @ 0xF
	ds	4
??_USART_Init:	; 0 bytes @ 0x13
	ds	5
	global	USART_Init@BR
USART_Init@BR:	; 1 bytes @ 0x18
	ds	1
??_main:	; 0 bytes @ 0x19
	ds	3
;!
;!Data Sizes:
;!    Strings     40
;!    Constant    0
;!    Data        1
;!    BSS         26
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     12      14
;!    BANK0            80     28      53
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    Display	PTR unsigned char  size(1) Largest target is 0
;!		 -> NULL(NULL[0]), 
;!
;!    USART_WriteString@str	PTR const unsigned char  size(1) Largest target is 40
;!		 -> STR_1(CODE[40]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _ISR in COMMON
;!
;!    _ISR->_USART_ReceiveChar
;!    _USART_ReceiveChar->_USART_WriteString
;!    _USART_WriteString->_USART_WriteChar
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_USART_Init
;!    _USART_Init->___aldiv
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 3     3      0     538
;!                                             25 BANK0      3     3      0
;!                           _ADC_Init
;!                        _TIMER1_Init
;!                         _USART_Init
;! ---------------------------------------------------------------------------------
;! (1) _USART_Init                                          10     6      4     538
;!                                             15 BANK0     10     6      4
;!                            ___aldiv
;! ---------------------------------------------------------------------------------
;! (2) ___aldiv                                             15     7      8     428
;!                                              0 BANK0     15     7      8
;! ---------------------------------------------------------------------------------
;! (1) _TIMER1_Init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_Init                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _ISR                                                  7     7      0     343
;!                                              5 COMMON     7     7      0
;!                           _ADC_Read
;!                  _USART_ReceiveChar
;!                    _USART_WriteChar
;! ---------------------------------------------------------------------------------
;! (4) _USART_ReceiveChar                                    2     2      0     121
;!                                              3 COMMON     2     2      0
;!                  _USART_WriteString
;! ---------------------------------------------------------------------------------
;! (5) _USART_WriteString                                    2     2      0      97
;!                                              1 COMMON     2     2      0
;!                    _USART_WriteChar
;! ---------------------------------------------------------------------------------
;! (4) _USART_WriteChar                                      1     1      0      22
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (4) _ADC_Read                                             3     1      2      86
;!                                              0 COMMON     3     1      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _ADC_Init
;!   _TIMER1_Init
;!   _USART_Init
;!     ___aldiv
;!
;! _ISR (ROOT)
;!   _ADC_Read
;!   _USART_ReceiveChar
;!     _USART_WriteString
;!       _USART_WriteChar
;!   _USART_WriteChar
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               60      0       0       9        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               60      0       0      11        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     1C      35       5       66.3%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      C       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      43      12        0.0%
;!ABS                  0      0      43       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 224 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ADC_Init
;;		_TIMER1_Init
;;		_USART_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	224
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	224
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	226
	
l977:	
;Supervisorio.c: 226: TRISA = 0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	227
;Supervisorio.c: 227: PORTA = 0b00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	228
	
l979:	
;Supervisorio.c: 228: TRISB = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	229
	
l981:	
;Supervisorio.c: 229: PORTB = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	230
;Supervisorio.c: 230: TRISC = 0b10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	231
;Supervisorio.c: 231: PORTC = 0b11000000;
	movlw	(0C0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	232
	
l983:	
;Supervisorio.c: 232: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	233
	
l985:	
;Supervisorio.c: 233: PORTD = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	234
;Supervisorio.c: 234: TRISE = 0b00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(137)^080h	;volatile
	line	235
;Supervisorio.c: 235: PORTE = 0b00000111;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(9)	;volatile
	line	237
	
l987:	
;Supervisorio.c: 237: USART_Init(115200);
	movlw	0
	movwf	(USART_Init@BaudRate+3)
	movlw	01h
	movwf	(USART_Init@BaudRate+2)
	movlw	0C2h
	movwf	(USART_Init@BaudRate+1)
	movlw	0
	movwf	(USART_Init@BaudRate)

	fcall	_USART_Init
	line	238
;Supervisorio.c: 238: ADC_Init();
	fcall	_ADC_Init
	line	240
	
l989:	
;Supervisorio.c: 240: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	241
	
l991:	
;Supervisorio.c: 241: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	242
	
l993:	
;Supervisorio.c: 242: _delay((unsigned long)((400)*(18432000/4000.0)));
	opt asmopt_off
movlw  10
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	90
movwf	((??_main+0)+0+1),f
	movlw	195
movwf	((??_main+0)+0),f
u437:
	decfsz	((??_main+0)+0),f
	goto	u437
	decfsz	((??_main+0)+0+1),f
	goto	u437
	decfsz	((??_main+0)+0+2),f
	goto	u437
	nop2
opt asmopt_on

	line	243
	
l995:	
;Supervisorio.c: 243: TIMER1_Init();
	fcall	_TIMER1_Init
	line	246
;Supervisorio.c: 246: while(1)
	
l125:	
	line	249
;Supervisorio.c: 247: {
	
l126:	
	line	246
	goto	l125
	
l127:	
	line	250
	
l128:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_USART_Init

;; *************** function _USART_Init *****************
;; Defined at:
;;		line 34 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;  BaudRate        4   15[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  BR              1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___aldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1
	line	34
global __ptext1
__ptext1:	;psect for function _USART_Init
psect	text1
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	34
	global	__size_of_USART_Init
	__size_of_USART_Init	equ	__end_of_USART_Init-_USART_Init
	
_USART_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _USART_Init: [wreg+status,2+status,0+pclath+cstack]
	line	40
	
l845:	
;Supervisorio.c: 40: unsigned char BR = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(USART_Init@BR)
	line	43
	
l847:	
;Supervisorio.c: 43: BR = (18432000 / (16 * BaudRate)) - 1;
	movf	(USART_Init@BaudRate),w
	movwf	(??_USART_Init+0)+0
	movf	(USART_Init@BaudRate+1),w
	movwf	((??_USART_Init+0)+0+1)
	movf	(USART_Init@BaudRate+2),w
	movwf	((??_USART_Init+0)+0+2)
	movf	(USART_Init@BaudRate+3),w
	movwf	((??_USART_Init+0)+0+3)
	movlw	04h
u345:
	clrc
	rlf	(??_USART_Init+0)+0,f
	rlf	(??_USART_Init+0)+1,f
	rlf	(??_USART_Init+0)+2,f
	rlf	(??_USART_Init+0)+3,f
u340:
	addlw	-1
	skipz
	goto	u345
	movf	3+(??_USART_Init+0)+0,w
	movwf	(___aldiv@divisor+3)
	movf	2+(??_USART_Init+0)+0,w
	movwf	(___aldiv@divisor+2)
	movf	1+(??_USART_Init+0)+0,w
	movwf	(___aldiv@divisor+1)
	movf	0+(??_USART_Init+0)+0,w
	movwf	(___aldiv@divisor)

	movlw	01h
	movwf	(___aldiv@dividend+3)
	movlw	019h
	movwf	(___aldiv@dividend+2)
	movlw	040h
	movwf	(___aldiv@dividend+1)
	movlw	0
	movwf	(___aldiv@dividend)

	fcall	___aldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___aldiv)))),w
	addlw	0FFh
	movwf	(??_USART_Init+4)+0
	movf	(??_USART_Init+4)+0,w
	movwf	(USART_Init@BR)
	line	44
	
l849:	
;Supervisorio.c: 44: SPBRG = BR;
	movf	(USART_Init@BR),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	47
	
l851:	
;Supervisorio.c: 47: TXSTAbits.CSRC = 0;
	bcf	(152)^080h,7	;volatile
	line	48
	
l853:	
;Supervisorio.c: 48: TXSTAbits.TX9 = 0;
	bcf	(152)^080h,6	;volatile
	line	49
	
l855:	
;Supervisorio.c: 49: TXSTAbits.TXEN = 1;
	bsf	(152)^080h,5	;volatile
	line	50
	
l857:	
;Supervisorio.c: 50: TXSTAbits.SYNC = 0;
	bcf	(152)^080h,4	;volatile
	line	51
	
l859:	
;Supervisorio.c: 51: TXSTAbits.BRGH = 1;
	bsf	(152)^080h,2	;volatile
	line	52
	
l861:	
;Supervisorio.c: 52: TXSTAbits.TRMT = 1;
	bsf	(152)^080h,1	;volatile
	line	53
	
l863:	
;Supervisorio.c: 53: TXSTAbits.TX9D = 0;
	bcf	(152)^080h,0	;volatile
	line	56
	
l865:	
;Supervisorio.c: 56: RCSTAbits.SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(24),7	;volatile
	line	57
	
l867:	
;Supervisorio.c: 57: RCSTAbits.RX9 = 0;
	bcf	(24),6	;volatile
	line	58
	
l869:	
;Supervisorio.c: 58: RCSTAbits.SREN = 0;
	bcf	(24),5	;volatile
	line	59
	
l871:	
;Supervisorio.c: 59: RCSTAbits.CREN = 1;
	bsf	(24),4	;volatile
	line	60
	
l873:	
;Supervisorio.c: 60: RCSTAbits.ADDEN = 0;
	bcf	(24),3	;volatile
	line	61
	
l875:	
;Supervisorio.c: 61: RCSTAbits.FERR = 0;
	bcf	(24),2	;volatile
	line	62
	
l877:	
;Supervisorio.c: 62: RCSTAbits.OERR = 0;
	bcf	(24),1	;volatile
	line	63
	
l879:	
;Supervisorio.c: 63: RCSTAbits.RX9D = 0;
	bcf	(24),0	;volatile
	line	66
	
l881:	
;Supervisorio.c: 66: PIE1bits.RCIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(140)^080h,5	;volatile
	line	67
	
l883:	
;Supervisorio.c: 67: PIR1bits.RCIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(12),5	;volatile
	line	68
	
l81:	
	return
	opt stack 0
GLOBAL	__end_of_USART_Init
	__end_of_USART_Init:
	signat	_USART_Init,4216
	global	___aldiv

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   11[BANK0 ] long 
;;  sign            1   10[BANK0 ] unsigned char 
;;  counter         1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USART_Init
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
	line	6
global __ptext2
__ptext2:	;psect for function ___aldiv
psect	text2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
	line	6
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	14
	
l805:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	15
	
l807:	
	btfss	(___aldiv@divisor+3),7
	goto	u241
	goto	u240
u241:
	goto	l267
u240:
	line	16
	
l809:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	17
	clrf	(___aldiv@sign)
	incf	(___aldiv@sign),f
	line	18
	
l267:	
	line	19
	btfss	(___aldiv@dividend+3),7
	goto	u251
	goto	u250
u251:
	goto	l815
u250:
	line	20
	
l811:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	21
	
l813:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l815
	line	22
	
l268:	
	line	23
	
l815:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	24
	
l817:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u261
	goto	u260
u261:
	goto	l837
u260:
	line	25
	
l819:	
	clrf	(___aldiv@counter)
	incf	(___aldiv@counter),f
	line	26
	goto	l823
	
l271:	
	line	27
	
l821:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u275:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u275
	line	28
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l823
	line	29
	
l270:	
	line	26
	
l823:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u281
	goto	u280
u281:
	goto	l821
u280:
	goto	l825
	
l272:	
	goto	l825
	line	30
	
l273:	
	line	31
	
l825:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u295:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u295
	line	32
	
l827:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u305
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u305
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u305
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u305:
	skipc
	goto	u301
	goto	u300
u301:
	goto	l833
u300:
	line	33
	
l829:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	34
	
l831:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l833
	line	35
	
l274:	
	line	36
	
l833:	
	movlw	01h
u315:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u315

	line	37
	
l835:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u321
	goto	u320
u321:
	goto	l825
u320:
	goto	l837
	
l275:	
	goto	l837
	line	38
	
l269:	
	line	39
	
l837:	
	movf	(___aldiv@sign),w
	skipz
	goto	u330
	goto	l841
u330:
	line	40
	
l839:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l841
	
l276:	
	line	41
	
l841:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l277
	
l843:	
	line	42
	
l277:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
	signat	___aldiv,8316
	global	_TIMER1_Init

;; *************** function _TIMER1_Init *****************
;; Defined at:
;;		line 147 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	147
global __ptext3
__ptext3:	;psect for function _TIMER1_Init
psect	text3
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	147
	global	__size_of_TIMER1_Init
	__size_of_TIMER1_Init	equ	__end_of_TIMER1_Init-_TIMER1_Init
	
_TIMER1_Init:	
;incstack = 0
	opt	stack 3
; Regs used in _TIMER1_Init: []
	line	149
	
l919:	
;Supervisorio.c: 149: T1CONbits.TMR1CS = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(16),1	;volatile
	line	150
;Supervisorio.c: 150: T1CONbits.T1OSCEN = 0;
	bcf	(16),3	;volatile
	line	151
;Supervisorio.c: 151: T1CONbits.T1CKPS1 = 1;
	bsf	(16),5	;volatile
	line	152
;Supervisorio.c: 152: T1CONbits.T1CKPS0 = 1;
	bsf	(16),4	;volatile
	line	154
;Supervisorio.c: 154: T1CONbits.TMR1ON = 1;
	bsf	(16),0	;volatile
	line	155
;Supervisorio.c: 155: TMR1 = 7936;
	movlw	high(01F00h)
	movwf	(14+1)	;volatile
	movlw	low(01F00h)
	movwf	(14)	;volatile
	line	157
;Supervisorio.c: 157: PIR1bits.TMR1IF = 0;
	bcf	(12),0	;volatile
	line	158
;Supervisorio.c: 158: PIE1bits.TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(140)^080h,0	;volatile
	line	159
	
l110:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_Init
	__end_of_TIMER1_Init:
	signat	_TIMER1_Init,88
	global	_ADC_Init

;; *************** function _ADC_Init *****************
;; Defined at:
;;		line 114 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	line	114
global __ptext4
__ptext4:	;psect for function _ADC_Init
psect	text4
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	114
	global	__size_of_ADC_Init
	__size_of_ADC_Init	equ	__end_of_ADC_Init-_ADC_Init
	
_ADC_Init:	
;incstack = 0
	opt	stack 3
; Regs used in _ADC_Init: []
	line	117
	
l909:	
;Supervisorio.c: 117: ADCON1bits.ADFM = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(159)^080h,7	;volatile
	line	118
;Supervisorio.c: 118: ADCON1bits.PCFG3 = 1;
	bsf	(159)^080h,3	;volatile
	line	119
;Supervisorio.c: 119: ADCON1bits.PCFG2 = 1;
	bsf	(159)^080h,2	;volatile
	line	120
;Supervisorio.c: 120: ADCON1bits.PCFG1 = 1;
	bsf	(159)^080h,1	;volatile
	line	121
;Supervisorio.c: 121: ADCON1bits.PCFG0 = 0;
	bcf	(159)^080h,0	;volatile
	line	125
;Supervisorio.c: 125: ADCON0bits.ADCS1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(31),7	;volatile
	line	126
;Supervisorio.c: 126: ADCON0bits.ADCS0 = 0;
	bcf	(31),6	;volatile
	line	129
;Supervisorio.c: 129: PIE1bits.ADIE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(140)^080h,6	;volatile
	line	130
;Supervisorio.c: 130: PIR1bits.ADIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(12),6	;volatile
	line	131
	
l101:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Init
	__end_of_ADC_Init:
	signat	_ADC_Init,88
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 163 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   11[COMMON] unsigned char 
;;  checksum        1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADC_Read
;;		_USART_ReceiveChar
;;		_USART_WriteChar
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1
	line	163
global __ptext5
__ptext5:	;psect for function _ISR
psect	text5
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	163
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 2
; Regs used in _ISR: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+1)
	movf	fsr0,w
	movwf	(??_ISR+2)
	movf	pclath,w
	movwf	(??_ISR+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+4)
	ljmp	_ISR
psect	text5
	line	168
	
i1l921:	
;Supervisorio.c: 168: if(PIR1bits.TMR1IF)
	btfss	(12),0	;volatile
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l933
u37_20:
	line	170
	
i1l923:	
;Supervisorio.c: 169: {
;Supervisorio.c: 170: TMR1 = 7936;
	movlw	high(01F00h)
	movwf	(14+1)	;volatile
	movlw	low(01F00h)
	movwf	(14)	;volatile
	line	171
	
i1l925:	
;Supervisorio.c: 171: if(cont1 == 10)
	movlw	0Ah
	xorwf	(_cont1),w
	iorwf	(_cont1+1),w
	skipz
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l931
u38_20:
	line	173
	
i1l927:	
;Supervisorio.c: 172: {
;Supervisorio.c: 173: sec++;
	movlw	low(01h)
	addwf	(_sec),f
	skipnc
	incf	(_sec+1),f
	movlw	high(01h)
	addwf	(_sec+1),f
	line	174
	
i1l929:	
;Supervisorio.c: 174: cont1 = 0;
	clrf	(_cont1)
	clrf	(_cont1+1)
	goto	i1l931
	line	176
	
i1l114:	
	line	177
	
i1l931:	
;Supervisorio.c: 176: }
;Supervisorio.c: 177: PIR1bits.TMR1IF = 0;
	bcf	(12),0	;volatile
	goto	i1l933
	line	178
	
i1l113:	
	line	181
	
i1l933:	
;Supervisorio.c: 178: }
;Supervisorio.c: 181: if (PIR1bits.ADIF)
	btfss	(12),6	;volatile
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l115
u39_20:
	line	184
	
i1l935:	
;Supervisorio.c: 182: {
;Supervisorio.c: 184: PIR1bits.ADIF = 0;
	bcf	(12),6	;volatile
	line	185
	
i1l115:	
	line	188
;Supervisorio.c: 185: }
;Supervisorio.c: 188: if (PIR1bits.RCIF)
	btfss	(12),5	;volatile
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l122
u40_20:
	line	190
	
i1l937:	
;Supervisorio.c: 189: {
;Supervisorio.c: 190: resp = USART_ReceiveChar();
	fcall	_USART_ReceiveChar
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_resp)
	line	193
;Supervisorio.c: 193: switch(resp)
	goto	i1l975
	line	195
;Supervisorio.c: 194: {
;Supervisorio.c: 195: case 'A' :
	
i1l118:	
	line	197
	
i1l939:	
;Supervisorio.c: 197: buffer[0] = '#';
	movlw	(023h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	(_buffer)
	line	198
;Supervisorio.c: 198: buffer[1] = '$';
	movlw	(024h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	0+(_buffer)+01h
	line	199
;Supervisorio.c: 199: buffer[2] = ':';
	movlw	(03Ah)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	0+(_buffer)+02h
	line	201
	
i1l941:	
;Supervisorio.c: 201: ADC_Read(0);
	movlw	low(0)
	movwf	(ADC_Read@channel)
	movlw	high(0)
	movwf	((ADC_Read@channel))+1
	fcall	_ADC_Read
	line	202
	
i1l943:	
;Supervisorio.c: 202: HIGH = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	(_HIGH)
	line	203
	
i1l945:	
;Supervisorio.c: 203: LOW = ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	(_LOW)
	line	205
	
i1l947:	
;Supervisorio.c: 205: buffer[3] = HIGH;
	movf	(_HIGH),w
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_buffer)+03h
	line	206
	
i1l949:	
;Supervisorio.c: 206: buffer[4] = LOW;
	movf	(_LOW),w
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	movwf	0+(_buffer)+04h
	line	208
	
i1l951:	
;Supervisorio.c: 208: unsigned char checksum = 0x00;
	clrf	(ISR@checksum)
	line	209
	
i1l953:	
;Supervisorio.c: 209: for(unsigned char index = 0; index < 5; index++)
	clrf	(ISR@index)
	
i1l955:	
	movlw	(05h)
	subwf	(ISR@index),w
	skipc
	goto	u41_21
	goto	u41_20
u41_21:
	goto	i1l959
u41_20:
	goto	i1l967
	
i1l957:	
	goto	i1l967
	line	210
	
i1l119:	
	line	211
	
i1l959:	
;Supervisorio.c: 210: {
;Supervisorio.c: 211: USART_WriteChar(buffer[index]);
	movf	(ISR@index),w
	addlw	_buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_USART_WriteChar
	line	212
	
i1l961:	
;Supervisorio.c: 212: checksum ^= buffer[index];
	movf	(ISR@index),w
	addlw	_buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	xorwf	(ISR@checksum),f
	line	209
	
i1l963:	
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(ISR@index),f
	
i1l965:	
	movlw	(05h)
	subwf	(ISR@index),w
	skipc
	goto	u42_21
	goto	u42_20
u42_21:
	goto	i1l959
u42_20:
	goto	i1l967
	
i1l120:	
	line	214
	
i1l967:	
;Supervisorio.c: 213: }
;Supervisorio.c: 214: buffer[5] = checksum;
	movf	(ISR@checksum),w
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_buffer)+05h
	line	215
	
i1l969:	
;Supervisorio.c: 215: USART_WriteChar(buffer[5]);
	movf	0+(_buffer)+05h,w
	fcall	_USART_WriteChar
	line	217
	
i1l971:	
;Supervisorio.c: 217: resp = '#';
	movlw	(023h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_resp)
	line	218
;Supervisorio.c: 218: break;
	goto	i1l122
	line	219
	
i1l973:	
;Supervisorio.c: 219: }
	goto	i1l122
	line	193
	
i1l117:	
	
i1l975:	
	movf	(_resp),w
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 65 to 65
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           14    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	65^0	; case 65
	skipnz
	goto	i1l939
	goto	i1l122
	opt asmopt_on

	line	219
	
i1l121:	
	goto	i1l122
	line	220
	
i1l116:	
	line	221
	
i1l122:	
	movf	(??_ISR+4),w
	movwf	btemp+1
	movf	(??_ISR+3),w
	movwf	pclath
	movf	(??_ISR+2),w
	movwf	fsr0
	swapf	(??_ISR+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,88
	global	_USART_ReceiveChar

;; *************** function _USART_ReceiveChar *****************
;; Defined at:
;;		line 90 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  USART_Data      1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USART_WriteString
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1
	line	90
global __ptext6
__ptext6:	;psect for function _USART_ReceiveChar
psect	text6
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	90
	global	__size_of_USART_ReceiveChar
	__size_of_USART_ReceiveChar	equ	__end_of_USART_ReceiveChar-_USART_ReceiveChar
	
_USART_ReceiveChar:	
;incstack = 0
	opt	stack 2
; Regs used in _USART_ReceiveChar: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	94
	
i1l885:	
;Supervisorio.c: 92: unsigned char USART_Data;
;Supervisorio.c: 94: if (!OERR)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(193/8),(193)&7	;volatile
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l895
u35_20:
	line	96
	
i1l887:	
;Supervisorio.c: 95: {
;Supervisorio.c: 96: PORTBbits.RB4 = 1;
	bsf	(6),4	;volatile
	line	97
	
i1l889:	
;Supervisorio.c: 97: USART_Data = RCREG;
	movf	(26),w	;volatile
	movwf	(??_USART_ReceiveChar+0)+0
	movf	(??_USART_ReceiveChar+0)+0,w
	movwf	(USART_ReceiveChar@USART_Data)
	line	98
	
i1l891:	
;Supervisorio.c: 98: PORTBbits.RB4 = 0;
	bcf	(6),4	;volatile
	line	99
	
i1l893:	
;Supervisorio.c: 99: PIR1bits.RCIF = 0;
	bcf	(12),5	;volatile
	line	100
;Supervisorio.c: 100: }
	goto	i1l905
	line	101
	
i1l96:	
	line	103
	
i1l895:	
;Supervisorio.c: 101: else
;Supervisorio.c: 102: {
;Supervisorio.c: 103: USART_WriteString("\n\r ------- ESTOURO DE PILHA ------- \n\r ");
	movlw	((STR_1)-__stringbase)&0ffh
	fcall	_USART_WriteString
	line	105
	
i1l897:	
;Supervisorio.c: 105: RCSTAbits.CREN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(24),4	;volatile
	line	106
	
i1l899:	
;Supervisorio.c: 106: USART_Data = RCREG;
	movf	(26),w	;volatile
	movwf	(??_USART_ReceiveChar+0)+0
	movf	(??_USART_ReceiveChar+0)+0,w
	movwf	(USART_ReceiveChar@USART_Data)
	line	107
	
i1l901:	
;Supervisorio.c: 107: RCSTAbits.CREN = 1;
	bsf	(24),4	;volatile
	line	108
	
i1l903:	
;Supervisorio.c: 108: PIR1bits.RCIF = 0;
	bcf	(12),5	;volatile
	goto	i1l905
	line	109
	
i1l97:	
	line	111
	
i1l905:	
;Supervisorio.c: 109: }
;Supervisorio.c: 111: return(USART_Data);
	movf	(USART_ReceiveChar@USART_Data),w
	goto	i1l98
	
i1l907:	
	line	112
	
i1l98:	
	return
	opt stack 0
GLOBAL	__end_of_USART_ReceiveChar
	__end_of_USART_ReceiveChar:
	signat	_USART_ReceiveChar,89
	global	_USART_WriteString

;; *************** function _USART_WriteString *****************
;; Defined at:
;;		line 78 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> STR_1(40), 
;; Auto vars:     Size  Location     Type
;;  str             1    2[COMMON] PTR const unsigned char 
;;		 -> STR_1(40), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USART_WriteChar
;; This function is called by:
;;		_USART_ReceiveChar
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1
	line	78
global __ptext7
__ptext7:	;psect for function _USART_WriteString
psect	text7
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	78
	global	__size_of_USART_WriteString
	__size_of_USART_WriteString	equ	__end_of_USART_WriteString-_USART_WriteString
	
_USART_WriteString:	
;incstack = 0
	opt	stack 2
; Regs used in _USART_WriteString: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;USART_WriteString@str stored from wreg
	movwf	(USART_WriteString@str)
	line	81
	
i1l797:	
;Supervisorio.c: 81: while(*str != '\0')
	goto	i1l803
	
i1l91:	
	line	84
	
i1l799:	
;Supervisorio.c: 82: {
;Supervisorio.c: 84: USART_WriteChar(*str);
	movf	(USART_WriteString@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_USART_WriteChar
	line	85
	
i1l801:	
;Supervisorio.c: 85: str++;
	movlw	(01h)
	movwf	(??_USART_WriteString+0)+0
	movf	(??_USART_WriteString+0)+0,w
	addwf	(USART_WriteString@str),f
	goto	i1l803
	line	86
	
i1l90:	
	line	81
	
i1l803:	
	movf	(USART_WriteString@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u23_21
	goto	u23_20
u23_21:
	goto	i1l799
u23_20:
	goto	i1l93
	
i1l92:	
	line	87
	
i1l93:	
	return
	opt stack 0
GLOBAL	__end_of_USART_WriteString
	__end_of_USART_WriteString:
	signat	_USART_WriteString,4216
	global	_USART_WriteChar

;; *************** function _USART_WriteChar *****************
;; Defined at:
;;		line 71 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;  USARTData       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  USARTData       1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USART_WriteString
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1
	line	71
global __ptext8
__ptext8:	;psect for function _USART_WriteChar
psect	text8
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	71
	global	__size_of_USART_WriteChar
	__size_of_USART_WriteChar	equ	__end_of_USART_WriteChar-_USART_WriteChar
	
_USART_WriteChar:	
;incstack = 0
	opt	stack 4
; Regs used in _USART_WriteChar: [wreg]
;USART_WriteChar@USARTData stored from wreg
	movwf	(USART_WriteChar@USARTData)
	line	73
	
i1l793:	
;Supervisorio.c: 73: while(!PIR1bits.TXIF);
	goto	i1l84
	
i1l85:	
	
i1l84:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),4	;volatile
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l84
u22_20:
	goto	i1l795
	
i1l86:	
	line	74
	
i1l795:	
;Supervisorio.c: 74: TXREG = USARTData;
	movf	(USART_WriteChar@USARTData),w
	movwf	(25)	;volatile
	line	75
	
i1l87:	
	return
	opt stack 0
GLOBAL	__end_of_USART_WriteChar
	__end_of_USART_WriteChar:
	signat	_USART_WriteChar,4216
	global	_ADC_Read

;; *************** function _ADC_Read *****************
;; Defined at:
;;		line 133 in file "C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
;; Parameters:    Size  Location     Type
;;  channel         2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1
	line	133
global __ptext9
__ptext9:	;psect for function _ADC_Read
psect	text9
	file	"C:\Users\Dracarys\Documents\GitHub\SistemaEmbarcado_projeto_final\SistemasEmbarcados\Firmware no PIC16F877A\Supervisorio.c"
	line	133
	global	__size_of_ADC_Read
	__size_of_ADC_Read	equ	__end_of_ADC_Read-_ADC_Read
	
_ADC_Read:	
;incstack = 0
	opt	stack 4
; Regs used in _ADC_Read: [wreg+status,2+status,0]
	line	135
	
i1l911:	
;Supervisorio.c: 135: ADCON0bits.CHS = channel;
	movf	(ADC_Read@channel),w
	movwf	(??_ADC_Read+0)+0
	rlf	(??_ADC_Read+0)+0,f
	rlf	(??_ADC_Read+0)+0,f
	rlf	(??_ADC_Read+0)+0,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(31),w	;volatile
	xorwf	(??_ADC_Read+0)+0,w
	andlw	not (((1<<3)-1)<<3)
	xorwf	(??_ADC_Read+0)+0,w
	movwf	(31)	;volatile
	line	136
	
i1l913:	
;Supervisorio.c: 136: ADCON0bits.ADON = 1;
	bsf	(31),0	;volatile
	line	138
	
i1l915:	
;Supervisorio.c: 138: _delay((unsigned long)((25)*(18432000/4000000.0)));
	opt asmopt_off
movlw	38
movwf	(??_ADC_Read+0)+0,f
u44_27:
decfsz	(??_ADC_Read+0)+0,f
	goto	u44_27
opt asmopt_on

	line	140
	
i1l917:	
;Supervisorio.c: 140: ADCON0bits.GO = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(31),2	;volatile
	line	141
;Supervisorio.c: 141: while(ADCON0bits.GO_DONE);
	goto	i1l104
	
i1l105:	
	
i1l104:	
	btfsc	(31),2	;volatile
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l104
u36_20:
	
i1l106:	
	line	143
;Supervisorio.c: 143: PIR1bits.ADIF = 0;
	bcf	(12),6	;volatile
	line	144
	
i1l107:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Read
	__end_of_ADC_Read:
	signat	_ADC_Read,4216
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp
	global	wtemp0
	wtemp set btemp
	wtemp0 set btemp
	global	wtemp1
	wtemp1 set btemp+2
	global	wtemp2
	wtemp2 set btemp+4
	global	wtemp3
	wtemp3 set btemp+6
	global	wtemp4
	wtemp4 set btemp+8
	global	wtemp5
	wtemp5 set btemp+10
	global	wtemp6
	wtemp6 set btemp+1
	global	ttemp
	global	ttemp0
	ttemp set btemp
	ttemp0 set btemp
	global	ttemp1
	ttemp1 set btemp+3
	global	ttemp2
	ttemp2 set btemp+6
	global	ttemp3
	ttemp3 set btemp+9
	global	ttemp4
	ttemp4 set btemp+1
	global	ltemp
	global	ltemp0
	ltemp set btemp
	ltemp0 set btemp
	global	ltemp1
	ltemp1 set btemp+4
	global	ltemp2
	ltemp2 set btemp+8
	global	ltemp3
	ltemp3 set btemp+2
	end
