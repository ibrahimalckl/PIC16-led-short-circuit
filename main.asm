   list 	p=16F628A
   include	"P16F628A.INC"
   __CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF 

      ORG		h'0000'		
      CLRF		PORTB		; PORTB'ye bağlı ledleri söndür
      BANKSEL	TRISB		; BANK1'e geç
      CLRF		TRISB		; PORTB'nin uçlarını çıkış yap
      MOVLW	h'FF'			; W saklayıcısına h'FF' yükle
      MOVWF	TRISA		; PORTA'nın tüm uçlarını giriş yap
      BANKSEL	PORTB		; BANK0'a geç
      MOVLW	h'07'			; W saklayıcısına h'07' yükle
      MOVWF	CMCON		; W -> CMCON PORTA girişleri dijital
BASLA
      MOVF	PORTA, W	
      MOVWF	PORTB		
DONGU
      GOTO 	DONGU		; Sonsuz Dongu
      END					