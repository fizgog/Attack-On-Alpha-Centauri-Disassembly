;-------------------------------------------------------------------------
; Attack On Alpha Centauri - Disassembly
;-------------------------------------------------------------------------
; ALPHA1 loads at 1900 and code from 1DC0 is relocated to 0900
; Relocation code is stored at 0A00 which loads the ALPHA3 at 2500 
; and then relocated down to 0E00. Game execution is then at 1100
;
; File used is from http://bbcmicro.co.uk/explore.php?id=74
;-------------------------------------------------------------------------

OSWRCH  = $FFEE
OSWORD  = $FFF1
OSBYTE  = $FFF4

keyCodeSPACE        = $9D
keyCodeTAB          = $9F
keyCodeS            = $AE
keyCodeSHIFTLOCK    = $AF
keyCodeRETURN       = $B6
keyCodeA            = $BE
keyCodeCAPSLOCK     = $BF
keyCodeCTRL         = $FE

L0000   = $0000
L0002   = $0002
L0005   = $0005
L0006   = $0006
L001E   = $001E
screen_address_low  = $0070
screen_address_high = $0071
L0072   = $0072
L0073   = $0073
L0079   = $0079
L007A   = $007A
L007B   = $007B
L007C   = $007C
L007D   = $007D
bullet_firing        = $007E     ; Set to 1 when fired otherwise 0
L007F   = $007F
L0080   = $0080
L008A   = $008A
L008C   = $008C
L008E   = $008E
L008F   = $008F
sound_flag          = $0C41
freeze_flag         = $0C42
L0C43   = $0C43
L0C45   = $0C45
L0C46   = $0C46
L0C4B   = $0C4B
L0C4C   = $0C4C
L0C4D   = $0C4D
L0C4E   = $0C4E
L0C4F   = $0C4F
L0C50   = $0C50
L0C51   = $0C51
L0C52   = $0C52
L0C53   = $0C53
player_address_low  = $0C54
player_address_high = $0C55
player_x_pos        = $0C56
bullet_fired   = $0C58
L0C59   = $0C59
L0C5A   = $0C5A
L0C5B   = $0C5B
L0C5C   = $0C5C
L0C5D   = $0C5D
L0C5E   = $0C5E
L0C5F   = $0C5F
L0C70   = $0C70
L0C9C   = $0C9C
L0CC8   = $0CC8
L0CF4   = $0CF4
L0D20   = $0D20
L0D4C   = $0D4C
L0D4E   = $0D4E
L0D4F   = $0D4F
L0D50   = $0D50
L0D51   = $0D51
L0D52   = $0D52
L0D53   = $0D53
L0D54   = $0D54
L0D55   = $0D55
L0D56   = $0D56
L0D57   = $0D57
L0D58   = $0D58
L0D59   = $0D59
L0D5A   = $0D5A
L0D5B   = $0D5B
L0D5C   = $0D5C
L0D5D   = $0D5D
L0D5E   = $0D5E
L0D5F   = $0D5F
L0D60   = $0D60
L0D61   = $0D61
L0D64   = $0D64
L0D65   = $0D65
L0D66   = $0D66
L0D6B   = $0D6B
L3110   = $3110
L3390   = $3390
OSWRSC  = $FFB3
OSRDSC  = $FFB9
OSEVEN  = $FFBF
GSINIT  = $FFC2
GSREAD  = $FFC5
NVRDCH  = $FFC8
NNWRCH  = $FFCB

ORG $2500
    ; BASIC Code
    EQUB $0D,$00,$0A,$29,$E2,$31,$2C,$31
    EQUB $2C,$2D,$31,$2C,$2D,$31,$2C,$2D
    EQUB $32,$2C,$32,$35,$35,$2C,$32,$35
    EQUB $35,$2C,$32,$35,$35,$2C,$30,$2C
    EQUB $30,$2C,$30,$2C,$30,$2C,$30,$2C
    EQUB $30,$0D,$00,$14,$2C,$E2,$32,$2C
    EQUB $31,$2C,$32,$2C,$32,$2C,$34,$2C
    EQUB $32,$30,$30,$2C,$32,$30,$30,$2C
    EQUB $32,$30,$30,$2C,$31,$32,$37,$2C
    EQUB $2D,$35,$30,$2C,$30,$2C,$2D,$35
    EQUB $2C,$37,$35,$2C,$30,$0D,$00,$1E
    EQUB $2E,$E2,$33,$2C,$31,$2C,$2D,$31
    EQUB $30,$2C,$31,$30,$2C,$2D,$32,$2C
    EQUB $32,$30,$2C,$32,$30,$2C,$32,$30
    EQUB $30,$2C,$31,$32,$37,$2C,$2D,$35
    EQUB $2C,$30,$2C,$2D,$35,$2C,$31,$32
    EQUB $37,$2C,$30,$0D,$00,$28,$2F,$E2
    EQUB $34,$2C,$31,$2C,$2D,$31,$30,$2C
    EQUB $31,$30,$2C,$31,$30,$2C,$32,$30
    EQUB $2C,$32,$30,$2C,$32,$30,$2C,$31
    EQUB $32,$37,$2C,$2D,$31,$2C,$30,$2C
    EQUB $2D,$31,$2C,$31,$32,$36,$2C,$31
    EQUB $30,$30,$0D,$00,$32,$0A,$2A,$46
    EQUB $58,$39,$2C,$30,$0D,$00,$3C,$09
    EQUB $DB,$3A,$EF,$32,$36,$0D,$00,$46
    EQUB $0A,$D6,$26,$31,$30,$30,$30,$0D
    EQUB $FF

    EQUB $2C,$02,$00,$03,$00,$04,$00,$0A
    EQUB $00,$14,$00,$1E,$39,$2C,$39,$2C
    EQUB $37,$2C,$30,$2C,$30,$2C,$30,$3A
    EQUB $EF,$31,$39,$2C,$31,$30,$2C,$37
    EQUB $2C,$30,$2C,$30,$2C,$30,$0D,$00
    EQUB $1E,$0A,$D6,$26,$31,$30,$30,$30
    EQUB $0D,$FF

    EQUB $2C,$37,$2C,$30,$2C,$30,$2C,$30
    EQUB $0D,$00,$1E,$0A,$D6,$26,$31,$30
    EQUB $30,$30,$0D,$FF

    EQUB $00,$00,$00,$8E,$3C,$00,$00,$00
    EQUB $30,$00,$00,$00,$00,$00,$00,$00
    EQUB $30,$0D,$FF

    EQUB $14,$00,$00,$8E,$17
    EQUB $78,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$84,$50
    EQUB $00,$00,$00,$DD,$F2,$5F,$45,$44
    EQUB $54,$0D,$01,$7C
    EQUB $10,$D4,$31,$2C,$2D,$31,$35,$2C
    EQUB $31,$30,$30,$2C,$35,$0D,$01,$86
    EQUB $13,$E3,$4D,$25,$3D,$30,$B8,$37
    EQUB $3A,$E3,$4E,$25,$3D,$31,$B8,$32
    EQUB $0D,$01,$90,$16,$E7,$A6,$28,$2D
    EQUB $33,$33,$29,$3A,$5A,$25,$3D,$30
    EQUB $3A,$E5,$8D,$64,$6A,$41,$0D,$01
    EQUB $9A,$17,$E7,$A6
    EQUB $28,$2D,$31,$31,$34,$29,$3A,$5A
    EQUB $25,$3D,$32,$3A,$E5,$8D,$64,$6A
    EQUB $41,$0D,$01,$A4,$17,$E7,$A6,$28
    EQUB $2D,$31,$31,$35,$29,$3A,$5A,$25
    EQUB $3D,$38,$3A,$E5,$8D,$64,$6A,$41
    EQUB $0D,$01,$AE,$18,$E7,$A6,$28,$2D
    EQUB $31,$31,$36,$29,$3A,$5A,$25,$3D
    EQUB $31,$30,$3A,$E5,$8D,$64,$6A,$41
    EQUB $0D,$01,$B8,$17,$E7,$A6,$28,$2D
    EQUB $32,$31,$29,$3A,$5A,$25,$3D,$33
    EQUB $32,$3A,$E5,$8D,$64,$6A,$41,$0D
    EQUB $01,$C2,$18,$E7,$A6,$28,$2D,$31
    EQUB $31,$37,$29,$3A,$5A,$25,$3D,$33
    EQUB $34,$3A,$E5,$8D,$64,$6A,$41,$0D
    EQUB $01,$CC,$18,$E7,$A6,$28,$2D,$31
    EQUB $31

; Assembly code start here (exec &1100)
.L1000
    LDA #$00
    STA L0D56
    STA L0D57
    STA L0D58
    STA L0D59
    STA L0D5A
    STA L0D6B
    JSR L18C9

    JSR L18BE

    LDA #$01
    STA sound_flag      ; Sound flag
    STA freeze_flag     ; Freeze flag
    STA L0D4F
    STA L0D50
    STA L0C4B
    STA L0C51
    LDA L2F0C
    STA L0D4E
    LDX #$1F
    LDA #$00
.L1038
    STA L0C70,X
    DEX
    BPL L1038

    LDA #$03
    STA L0D53
    LDA #$05
    STA L0D66
    LDA #$20
    STA L0C4D
    JMP L1989

.L1050
    SEC
    LDA L0D61
    ADC L0D64
    ADC L0D65
    STA L0D60
    LDX #$04
.L105F
    LDA L0D60,X
    STA L0D61,X
    DEX
    BPL L105F

    CLC
    ADC L0D66
    BCS L1071

    LDA #$01
    RTS

.L1071
    LDA #$00
    RTS

;-------------------------------------------------------------------------

.L1074
    LDA screen_address_high
    CMP #$30
    BCC L1085

    LDY #$07
.L107C
    LDA (screen_address_low),Y
    EOR (L0072),Y
    STA (screen_address_low),Y
    DEY
    BPL L107C

.L1085
    RTS

;-------------------------------------------------------------------------

.L1086
    LDA L007B
    STA screen_address_low
    LDA L007C
    STA screen_address_high
    LDA L0079
    STA L007D
.L1092
    JSR L1074
    JSR L10A7
    JSR L10B5
    DEC L007D
    BNE L1092
    JSR L10C3
    DEC L007A
    BNE L1086
    RTS

;-------------------------------------------------------------------------

.L10A7
    CLC
    LDA screen_address_low
    ADC #$08
    STA screen_address_low
    LDA screen_address_high
    ADC #$00
    STA screen_address_high
    RTS

;-------------------------------------------------------------------------

.L10B5
    CLC
    LDA L0072
    ADC #$08
    STA L0072
    LDA L0073
    ADC #$00
    STA L0073
    RTS

;-------------------------------------------------------------------------

.L10C3
    CLC
    LDA L007B
    ADC #$80
    STA L007B
    LDA L007C
    ADC #$02
    STA L007C
    RTS

;-------------------------------------------------------------------------

.L10D1
    LDA L0C9C,X
    STA L007B
    LDA L0CC8,X
    STA L007C
    LDA L0C70,X
    TAY
    DEY
    LDA L24F0,Y
    STA L0072
    LDA L24F8,Y
    STA L0073
    LDA L2500,Y
    STA L0079
    LDA L2508,Y
    STA L007A
    JSR L1086

    RTS

;-------------------------------------------------------------------------

.L10F8
    JSR UpdateTimer
    JSR CheckSpecialKeys        ; Check for sound and freeze key presses

    LDA freeze_flag             ; Freeze flag
    BEQ L10F8                   ; If Fozen branch back to top

    JSR UpdatePlayer
    JSR UpdateBullet

    JSR L143D

    JSR L1486

    JSR L14CE

    JSR L15A3

    JSR L164D

    JSR TimerWait

    LDA L0D5B
    BNE L1128

    LDA L0C52
    BEQ L112B

    JMP L10F8

.L1128
    JMP L19E1

.L112B
    JMP L19ED

;-------------------------------------------------------------------------
; UpdatePlayer
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.UpdatePlayer
    LDA L0D6B                           ; This does nothing as it never changes from $00
    BNE UpdatePlayerExit

    LDX #keyCodeA 
    JSR isKeyPressed

    CPX #$FF
    BNE CheckPlayerRight

    JSR PlayerLeft

.CheckPlayerRight
    LDX #keyCodeS
    JSR isKeyPressed

    CPX #$FF
    BNE CheckPlayerFire

    JSR PlayerRight

.CheckPlayerFire
    LDX #keyCodeRETURN
    JSR isKeyPressed

    CPX #$FF
    BNE FireNotPressed

    LDA bullet_firing
    BNE UpdatePlayerExit

    JSR PlayerFire

    LDA #$01
    STA bullet_firing
    JMP UpdatePlayerExit

.FireNotPressed
    LDA #$00
    STA bullet_firing

.UpdatePlayerExit
    RTS

;-------------------------------------------------------------------------
; IsKeyPressed
;-------------------------------------------------------------------------
; On entry  : X contains inkey value
; On exit   : A is preserved
;           : X contains key value
;           : Y is underfined
;-------------------------------------------------------------------------
.isKeyPressed
    LDY #$FF
    LDA #$81
    JSR OSBYTE
    RTS

;-------------------------------------------------------------------------
; PlotSprite
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.PlotSprite
    JSR L11AA

    LDA #$88
    STA L0072
    LDA #$0D
    STA L0073
    LDX #$03
.PlotXLoop
    LDY #$27
.PlotYLoop
    LDA (screen_address_low),Y
    STA (L0072),Y
    DEY
    BPL PlotYLoop

    JSR CalcNextRow

    DEX
    BNE PlotXLoop

    JSR L11AA

    LDA #$78
    STA L0072
    LDA #$24
    STA L0073
    LDX #$03
.L1198
    LDY #$27
.L119A
    LDA (screen_address_low),Y
    ORA (L0072),Y
    STA (screen_address_low),Y
    DEY
    BPL L119A

    JSR CalcNextRow

    DEX
    BNE L1198

    RTS

.L11AA
    LDA player_address_low
    STA screen_address_low
    LDA player_address_high
    STA screen_address_high
    RTS

;-------------------------------------------------------------------------
; CalcNextRow
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------

.CalcNextRow
    CLC
    LDA screen_address_low
    ADC #$80
    STA screen_address_low
    LDA screen_address_high
    ADC #$02
    STA screen_address_high
    CLC
    LDA L0072
    ADC #$28
    STA L0072
    LDA L0073
    ADC #$00
    STA L0073
    RTS

;-------------------------------------------------------------------------
; EraseSprite
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------

.EraseSprite
    JSR L11AA

    LDA #$88
    STA L0072
    LDA #$0D
    STA L0073
    LDX #$03
.L11DD
    LDY #$27
.L11DF
    LDA (L0072),Y
    STA (screen_address_low),Y
    DEY
    BPL L11DF

    JSR CalcNextRow

    DEX
    BNE L11DD

    RTS

;-------------------------------------------------------------------------
; PlayerLeft
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.PlayerLeft
    LDA player_x_pos
    CMP screen_min_x
    BEQ PlayerLeftExit

    JSR EraseSprite

    DEC player_x_pos
    SEC
    LDA player_address_low
    SBC #$08
    STA player_address_low
    LDA player_address_high
    SBC #$00
    STA player_address_high
    JSR PlotSprite

.PlayerLeftExit
    RTS

;-------------------------------------------------------------------------
; PlayerRight
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.PlayerRight
    LDA player_x_pos
    CMP screen_max_x
    BEQ PlayerRightExit

    JSR EraseSprite

    INC player_x_pos
    CLC
    LDA player_address_low
    ADC #$08
    STA player_address_low
    LDA player_address_high
    ADC #$00
    STA player_address_high
    JSR PlotSprite

.PlayerRightExit
    RTS

;-------------------------------------------------------------------------

.L1233
    LDX #$04
.L1235
    LDA L2F05,X
    STA L0C53,X
    DEX
    BNE L1235

    JSR PlotSprite

    RTS

;-------------------------------------------------------------------------
; PlayerFire
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.PlayerFire
    LDA bullet_fired
    BNE PlayerFireExit

    JSR L1C99

    SEC
    LDA player_address_low
    SBC #$70
    STA L0C59
    LDA player_address_high
    SBC #$02
    STA L0C5A
    CLC
    LDA player_x_pos
    ADC #$02
    STA L0C5B
    LDA #$1C
    STA L0C5C
    LDA #$01
    STA bullet_fired
    JSR L1272

.PlayerFireExit
    RTS

.L1272
    LDA L0C59
    STA L007B
    LDA L0C5A
    STA L007C
.L127C
    LDA #$10
    STA L0072
    LDA #$25
    STA L0073
    LDA #$01
    STA L0079
    STA L007A
    JSR L1086
    RTS

;-------------------------------------------------------------------------
; UpdateBullet
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.UpdateBullet
    LDA bullet_fired
    BEQ L12BD

    JSR L1272

    SEC
    LDA L0C59
    SBC #$80
    STA L0C59
    LDA L0C5A
    SBC #$02
    STA L0C5A
    DEC L0C5C
    LDA L0C5C
    CMP #$02
    BNE L12B7

    LDA #$00
    STA bullet_fired
    RTS

.L12B7
    JSR L1272

    JSR L12BE

.L12BD
    RTS

;-------------------------------------------------------------------------

.L12BE
    LDX #$1F
.L12C0
    LDA L0C70,X
    BEQ L12FA

    LDA L0C5B
    CMP L0CF4,X
    BCC L12FA

    LDA L0C70,X
    TAY
    DEY
    CLC
    LDA L0CF4,X
    ADC L2500,Y
    CMP L0C5B
    BCC L12FA

    LDA L0C5C
    CMP L0D20,X
    BCC L12FA

    LDA L0C70,X
    TAY
    DEY
    CLC
    LDA L0D20,X
    ADC L2508,Y
    CMP L0C5C
    BCC L12FA

    JMP L12FE

.L12FA
    DEX
    BPL L12C0

    RTS

.L12FE
    LDA L0C70,X
    STA L008C
    STX L008F
    JSR L10D1

    LDX L008F
    LDA #$00
    STA L0C70,X
    STA bullet_fired
    DEC L0C52
    LDA L22B4,X
    BEQ L1325

    DEC L0C4F
    LDA #$01
    STA L0D58
    JMP L132A

.L1325
    LDA #$01
    STA L0D59
.L132A
    JSR L1272

    JSR L18D4

    JSR L1405

    RTS

;-------------------------------------------------------------------------

.L1334
    LDX L0D4C
    LDA L0C5E
    STA L007B
    LDA L0C5F
    STA L007C
    LDA L235C,X
    BMI L1364

    AND #$01
    STA L007F
    LDA L235C,X
    LSR A
    BEQ L1387

    TAY
.L1351
    CLC
    LDA L007B
    ADC #$08
    STA L007B
    LDA L007C
    ADC #$00
    STA L007C
    DEY
    BNE L1351

    JMP L1387

.L1364
    STA L008F
    SEC
    LDA #$00
    SBC L008F
    STA L008F
    AND #$01
    STA L007F
    LDA L008F
    LSR A
    BEQ L1387

    TAY
.L1377
    SEC
    LDA L007B
    SBC #$08
    STA L007B
    LDA L007C
    SBC #$00
    STA L007C
    DEY
    BNE L1377

.L1387
    LDA L237C,X
    BMI L13AC

    STA L008F
    AND #$03
    STA L0080
    LDA L008F
    LSR A
    LSR A
    BEQ L13D0

    TAY
.L1399
    CLC
    LDA L007B
    ADC #$80
    STA L007B
    LDA L007C
    ADC #$02
    STA L007C
    DEY
    BNE L1399

    JMP L13D0

.L13AC
    STA L008F
    SEC
    LDA #$00
    SBC L008F
    STA L008F
    AND #$03
    STA L0080
    LDA L008F
    LSR A
    LSR A
    BEQ L13D0

    TAY
.L13C0
    SEC
    LDA L007B
    SBC #$80
    STA L007B
    LDA L007C
    SBC #$02
    STA L007C
    DEY
    BNE L13C0

.L13D0
    RTS

.L13D1
    LDY L0080
    LDA L2314,Y
    STA L0072
    LDA L2318,Y
    STA L0073
    LDA L007F
    BEQ L13EE

    CLC
    LDA L0072
    ADC #$08
    STA L0072
    LDA L0073
    ADC #$00
    STA L0073
.L13EE
    RTS

.L13EF
    JSR L1334

    JSR L13D1

    LDA #$01
    STA L0079
    STA L007A
    LDA L007C
    CMP #$76
    BCS L1404

    JSR L1086

.L1404
    RTS

.L1405
    JSR L1C72

    LDA L0C5D
    BNE L143C

    LDA L0C59
    STA L0C5E
    LDA L0C5A
    STA L0C5F
.L1419
    LDA #$1F
    STA L0D4C
    TAX
    LDA #$00
.L1421
    STA L235C,X
    STA L237C,X
    DEX
    BPL L1421

.L142A
    JSR L13EF

    DEC L0D4C
    BPL L142A

    LDA L008C
    STA L0C5D
    LDA L2F0B
    STA L008A
.L143C
    RTS

.L143D
    LDA L0C5D
    BEQ L1485

    DEC L008A
    BNE L1485

    LDA L2F0B
    STA L008A
    LDA #$1F
    STA L0D4C
.L1450
    JSR L13EF

    LDX L0D4C
    CLC
    LDA L235C,X
    ADC L231C,X
    STA L235C,X
    CLC
    LDA L237C,X
    ADC L233C,X
    STA L237C,X
    JSR L13EF

    DEC L0D4C
    BPL L1450

    DEC L0C5D
    BEQ L1478

    RTS

.L1478
    LDA #$1F
    STA L0D4C
.L147D
    JSR L13EF

    DEC L0D4C
    BPL L147D

.L1485
    RTS

.L1486
    LDA L0C52
    BEQ L14CD

    LDA L0C4F
    CMP L0C51
    BEQ L14CD

    CMP L0C52
    BEQ L14CD

    DEC L0D4E
    BNE L14CD

    LDA L2F0C
    STA L0D4E
.L14A3
    JSR L1050

    LDA L0D65
    AND #$1F
    TAX
    LDA L0C70,X
    BEQ L14A3

    LDA L22B4,X
    BNE L14A3

    LDA L0CF4,X
    CMP #$29
    BCC L14C5

    LDA #$02
    STA L22B4,X
    JMP L14CA

.L14C5
    LDA #$01
    STA L22B4,X
.L14CA
    INC L0C4F
.L14CD
    RTS

.L14CE
    DEC L0D4F
    BEQ L14D4

    RTS

.L14D4
    LDA L2F0D
    STA L0D4F
    LDA #$20
    STA L0C50
.L14DF
    LDX L0C50
    DEX
    LDA L0C70,X
    BEQ L150A

    LDA L22B4,X
    BEQ L150A

    JSR L10D1

    LDX L0C50
    DEX
    LDA L22B4,X
    CMP #$02
    BNE L1501

    JSR L1573

    JMP L1504

.L1501
    JSR L1590

.L1504
    JSR L1510

    JSR L10D1

.L150A
    DEC L0C50
    BNE L14DF

    RTS

.L1510
    JSR L1534

    LDA L0D20,X
    TAY
    DEY
    LDA L2299,Y
    STA L0C70,X
    LDA L0D20,X
    CMP #$1B
    BNE L1533

    SEC
    LDA L0CC8,X
    SBC #$3C
    STA L0CC8,X
    LDA #$03
    STA L0D20,X
.L1533
    RTS

.L1534
    CLC
    LDA L0C9C,X
    ADC #$80
    STA L0C9C,X
    LDA L0CC8,X
    ADC #$02
    STA L0CC8,X
    INC L0D20,X
    RTS

.L1549
    CLC
    LDA L0C9C,X
    ADC #$08
    STA L0C9C,X
    LDA L0CC8,X
    ADC #$00
    STA L0CC8,X
    INC L0CF4,X
    RTS

.L155E
    SEC
    LDA L0C9C,X
    SBC #$08
    STA L0C9C,X
    LDA L0CC8,X
    SBC #$00
    STA L0CC8,X
    DEC L0CF4,X
    RTS

.L1573
    JSR L16D7

    JSR L1549

    LDA L0C70,X
    TAY
    DEY
    SEC
    LDA L2F04
    SBC L2500,Y
    CMP L0CF4,X
    BCS L158F

    LDA #$01
    STA L22B4,X
.L158F
    RTS

.L1590
    JSR L16D7

    JSR L155E

    LDA L0CF4,X
    CMP #$01
    BNE L15A2

    LDA #$02
    STA L22B4,X
.L15A2
    RTS

.L15A3
    LDA L0C4E
    CMP L0C4D
    BEQ L1605

    JSR L1050

    LDA L0D65
    AND #$1F
    TAX
    LDA L21F9,X
    BNE L1605

    LDA L22B4,X
    BEQ L1605

    LDA L0C70,X
    BEQ L1605

    TAY
    DEY
    LDA L2500,Y
    LSR A
    STA L008F
    LDA L2508,Y
    STA L008E
    DEC L008E
    LDA L0C9C,X
    STA L2219,X
    LDA L0CC8,X
    STA L2239,X
    LDA L0CF4,X
    STA L2259,X
    LDA L0D20,X
    STA L2279,X
    JSR L1606

    JSR L1623

    LDA L2239,X
    CMP #$76
    BCS L1605

    LDA #$01
    STA L21F9,X
    INC L0C4E
    JSR L1640

    JSR L1C8A

.L1605
    RTS

.L1606
    LDA L008F
    BEQ L1622

    CLC
    LDA L2219,X
    ADC #$08
    STA L2219,X
    LDA L2239,X
    ADC #$00
    STA L2239,X
    INC L2259,X
    DEC L008F
    BNE L1606

.L1622
    RTS

.L1623
    LDA L008E
    BEQ L163F

    CLC
    LDA L2219,X
    ADC #$80
    STA L2219,X
    LDA L2239,X
    ADC #$02
    STA L2239,X
    INC L2279,X
    DEC L008E
    BNE L1623

.L163F
    RTS

.L1640
    LDA L2219,X
    STA L007B
    LDA L2239,X
    STA L007C
    JMP L127C

.L164D
    DEC L0C4B
    BEQ L1653

    RTS

.L1653
    LDA L2F0F
    STA L0C4B
    LDA #$20
    STA L0C4C
.L165E
    LDX L0C4C
    DEX
    LDA L21F9,X
    BEQ L169E

    JSR L1640

    LDX L0C4C
    DEX
    CLC
    LDA L2219,X
    ADC #$80
    STA L2219,X
    LDA L2239,X
    ADC #$02
    STA L2239,X
    INC L2279,X
    LDA L2279,X
    CMP #$1D
    BNE L1697

    LDA #$00
    STA L21F9,X
    DEC L0C4E
    JSR L16A4

    JMP L169E

.L1697
    LDX L0C4C
    DEX
    JSR L1640

.L169E
    DEC L0C4C
    BNE L165E

    RTS

.L16A4
    LDA L2259,X
    CMP player_x_pos
    BCC L16BA

    CLC
    LDA player_x_pos
    ADC #$04
    CMP L2259,X
    BCC L16BA

    JSR L17C5

.L16BA
    RTS


;-------------------------------------------------------------------------
; TimerWait
;-------------------------------------------------------------------------
; Read System Clock
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.TimerWait
    LDA #$01
    LDY #$0C
    LDX #$46
    JSR OSWORD  ; Read System Clock at 0C46

    LDA L0C46
    CMP L2F11
    BCC TimerWait
    RTS

;-------------------------------------------------------------------------
; UpdateTimer
;-------------------------------------------------------------------------
; Write System Clock
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.UpdateTimer
    LDA #$02
    LDY #$25
    LDX #$18
    JSR OSWORD  ; Write System Clock at 2518
    RTS

;-------------------------------------------------------------------------

.L16D7
    STX L008F
    JSR L1050

    BNE L16F4

    LDX L008F
    LDA L22B4,X
    CMP #$02
    BNE L16EF

    LDA #$01
    STA L22B4,X
    JMP L16F4

.L16EF
    LDA #$02
    STA L22B4,X
.L16F4
    LDX L008F
    RTS

;-------------------------------------------------------------------------

.L16F7
    LDY #$00
.L16F9
    LDA (screen_address_low),Y
    JSR OSWRCH  ; Display character

    INY
    CPY #$06
    BNE L16F9

    RTS

.L1704
    LDA L0D51
    BEQ L1726

    LSR A
    LSR A
    BCS L1718

    LDA #$F3
    STA screen_address_low
    LDA #$21
    STA screen_address_high
    JMP L1720

.L1718
    LDA #$ED
    STA screen_address_low
    LDA #$21
    STA screen_address_high
.L1720
    JSR L16F7

    DEC L0D51
.L1726
    RTS

.L1727
    DEC L0D4F
    BEQ L172D

    RTS

.L172D
    LDA L2F0D
    STA L0D4F
    LDA #$20
    STA L0C50
.L1738
    LDX L0C50
    DEX
    LDA L0C70,X
    BEQ L176E

    LDA L22B4,X
    BEQ L176E

    JSR L10D1

    LDX L0C50
    DEX
    JSR L1774

    JSR L1788

    JSR L179C

    LDA L0CF4,X
    CMP L2420,X
    BNE L176B

    LDA L0D20,X
    CMP L244C,X
    BNE L176B

    LDA #$00
    STA L22B4,X
.L176B
    JSR L10D1

.L176E
    DEC L0C50
    BNE L1738

    RTS

.L1774
    LDA L0C70,X
    CMP L239C,X
    BEQ L1787

    BCC L1784

    DEC L0C70,X
    JMP L1787

.L1784
    INC L0C70,X
.L1787
    RTS

.L1788
    LDA L0CF4,X
    CMP L2420,X
    BEQ L179B

    BCC L1798

    JSR L155E

    JMP L179B

.L1798
    JSR L1549

.L179B
    RTS

.L179C
    LDA L0D20,X
    CMP L244C,X
    BEQ L17AF

    BCC L17AC

    JSR L17B0

    JMP L17AF

.L17AC
    JSR L1534

.L17AF
    RTS

.L17B0
    SEC
    LDA L0C9C,X
    SBC #$80
    STA L0C9C,X
    LDA L0CC8,X
    SBC #$02
    STA L0CC8,X
    DEC L0D20,X
    RTS

.L17C5
    JSR L1C5A

    JSR EraseSprite

    LDA L2F12
    STA L0D51
    LDA L2F13
    STA L0D52
    LDA bullet_fired
    BEQ L17E4

    JSR L1272

    LDA #$00
    STA bullet_fired
.L17E4
    JSR L1817

.L17E7
    JSR UpdateTimer

    JSR L1704

    JSR L1727

    JSR L143D

    JSR TimerWait

    DEC L0D52
    BNE L17E7

    LDA #$00
    STA L0C4F
    LDA L0D53
    BNE L180D

    LDA #$01
    STA L0D5B
    JMP L1816

.L180D
    DEC L0D53
    JSR L1233

    JSR L18AD

.L1816
    RTS

.L1817
    LDA #$20
    STA L0C4C
.L181C
    LDX L0C4C
    DEX
    LDA L21F9,X
    BEQ L182D

    LDA #$00
    STA L21F9,X
    JSR L1640

.L182D
    DEC L0C4C
    BNE L181C

    LDA #$01
    STA L0C4C
    RTS

.L1838
    LDY #$6F
    LDA #$00
.L183C
    STA L3110,Y
    STA L3390,Y
    DEY
    BPL L183C

    LDA L0D53
    BEQ L187B

    LDA #$10
    STA L0D54
    LDA #$31
    STA L0D55
    LDA L0D53
    STA L008F
.L1859
    LDA L0D54
    STA screen_address_low
    LDA L0D55
    STA screen_address_high
    JSR L187C

    CLC
    LDA L0D54
    ADC #$28
    STA L0D54
    LDA L0D55
    ADC #$00
    STA L0D55
    DEC L008F
    BNE L1859

.L187B
    RTS

.L187C
    LDA #$1D
    STA L0072
    LDA #$25
    STA L0073
    LDX #$02
.L1886
    LDY #$17
.L1888
    LDA (L0072),Y
    STA (screen_address_low),Y
    DEY
    BPL L1888

    CLC
    LDA screen_address_low
    ADC #$80
    STA screen_address_low
    LDA screen_address_high
    ADC #$02
    STA screen_address_high
    CLC
    LDA L0072
    ADC #$18
    STA L0072
    LDA L0073
    ADC #$00
    STA L0073
    DEX
    BNE L1886

    RTS

;-------------------------------------------------------------------------
; Display SCORE and HIGH text
;-------------------------------------------------------------------------
.L18AD
    LDX #$00
.L18AF
    LDA L1C31,X     ; SCORE and HIGH data address
    JSR OSWRCH      ; Display character
    INX
    CPX #$29
    BNE L18AF
    JSR L1838
    RTS

;-------------------------------------------------------------------------

.L18BE
    LDX #$04
    LDA #$30
.L18C2
    STA L1C46,X
    DEX
    BPL L18C2

    RTS

.L18C9
    LDX #$04
    LDA #$30
.L18CD
    STA L1C55,X
    DEX
    BPL L18CD

    RTS

.L18D4
    LDX #$04
    LDY #$05
.L18D8
    CLC
    LDA L1C45,Y
    ADC L0D55,Y
    STA L1C45,Y
    CMP #$3A
    BCC L18EF

    SEC
    SBC #$0A
    STA L1C45,Y
    INC L0D55,X
.L18EF
    DEX
    DEY
    BNE L18D8

    LDY #$05
    LDA #$00
.L18F7
    STA L0D55,Y
    DEY
    BNE L18F7

    JSR L18AD

    RTS

.L1901
    LDX #$00
.L1903
    LDA L1C46,X
    CMP L1C55,X
    BCC L1915

    BEQ L1910

    JMP L1919

.L1910
    INX
    CPX #$05
    BNE L1903

.L1915
    JSR L18AD

    RTS

.L1919
    LDX #$04
.L191B
    LDA L1C46,X
    STA L1C55,X
    DEX
    BPL L191B

    JMP L1915

;-------------------------------------------------------------------------
; Display Game Over Text
;-------------------------------------------------------------------------
.L1927
    LDX #$00
.L1929
    LDA L216F,X     ; Game Over address
    JSR OSWRCH      ; Display character
    INX
    CPX #$1E
    BNE L1929
    RTS

;-------------------------------------------------------------------------

.L1935
    LDX #$00
.L1937
    LDA L218D,X
    JSR OSWRCH      ; Display character
    INX
    CPX #$1E
    BNE L1937
    RTS

;-------------------------------------------------------------------------
; Display PRESS SPACE
;-------------------------------------------------------------------------
.L1943
    LDX #$00
.L1945
    LDA L21AB,X     ; PRESS SPACE address
    JSR OSWRCH      ; Display character
    INX
    CPX #$21
    BNE L1945
    RTS

;-------------------------------------------------------------------------

.L1951
    LDX #$00
.L1953
    LDA L21CC,X
    JSR OSWRCH      ; Display character
    INX
    CPX #$21
    BNE L1953
    RTS

;-------------------------------------------------------------------------

.L195F
    LDA #$20
    STA L0C50
.L1964
    LDX L0C50
    DEX
    LDA L0C70,X
    BEQ L1979

    JSR L10D1

    LDX L0C50
    DEX
    LDA #$00
    STA L0C70,X
.L1979
    DEC L0C50
    BNE L1964

    RTS

.L197F
    LDX #keyCodeSPACE
    JSR isKeyPressed

    CPX #$FF
    BNE L197F

    RTS

.L1989
    JSR L1943

    JSR L18D4

    JSR L197F

    JSR L1935

    JSR L1951

    JSR L195F

    LDA #$03
    STA L0D53
    JSR L18BE

    JSR L18D4

    LDA #$01
    STA L0D5C
    STA L0C51
    LDA #$00
    STA bullet_fired
    STA L0C4E
    STA L0C4F
    STA L0C5D
    STA L0D5B
    LDX #$20
.L19C1
    STA L22B3,X
    STA L21F8,X
    DEX
    BNE L19C1

    LDA #$20
    STA L0C52
    JSR L1A54

    JSR L1A42

    JSR L1233

    DEC L0D53
    JSR L1838

    JMP L10F8

.L19E1
    JSR L1927

    JSR L1901

    JSR L18D4

    JMP L1989

.L19ED
    JSR L1817

    LDA #$32
    STA L008F
.L19F4
    JSR UpdateTimer

    JSR L143D

    JSR TimerWait

    DEC L008F
    BNE L19F4

    JSR L1A42

    JSR EraseSprite

    INC L0D53
    JSR L18D4

    LDA L0D5C
    CMP #$20
    BEQ L1A17

    INC L0D5C
.L1A17
    LDA #$20
    STA L0C52
    JSR L1A54

    JSR L1A42

    JSR L1233

    DEC L0D53
    JSR L18D4

    LDX #$1F
    LDA #$00
.L1A2F
    STA L22B4,X
    DEX
    BPL L1A2F

    LDA L0C51
    CMP #$20
    BEQ L1A3F

    INC L0C51
.L1A3F
    JMP L10F8

.L1A42
    LDA L2F14
    STA L0D5D
.L1A48
    JSR UpdateTimer

    JSR TimerWait

    DEC L0D5D
    BNE L1A48

    RTS

.L1A54
    LDA L2F18
    STA L0C43
    LDX L0D5C
    DEX
    LDA L212F,X
    STA L2125
    LDA L214F,X
    STA L212B
    LDA #$17
    STA screen_address_low
    LDA #$21
    STA screen_address_high
    JSR L16F7

    LDA #$23
    STA screen_address_low
    JSR L16F7

    LDA #$29
    STA screen_address_low
    JSR L16F7

    JSR L1B0C

    LDA #$00
    STA L0C45
.L1A8B
    LDX L0C45
    LDA #$01
    STA L0C70,X
    LDA #$C8
    STA L0C9C,X
    LDA #$69
    STA L0CC8,X
    LDA #$0A
    STA L0CF4,X
    LDA #$18
    STA L0D20,X
    LDA #$02
    STA L22B4,X
    JSR L10D1

    LDA L2F17
    STA L0D5F
.L1AB5
    DEC L0C43
    BNE L1AC3

    LDA L2F18
    STA L0C43
    JSR L143D

.L1AC3
    JSR L1727

    JSR L1AF1

    DEC L0D5F
    BNE L1AB5

    INC L0C45
    LDA L0C45
    CMP #$20
    BNE L1A8B

    JSR L1B0C

    LDX #$1F
    LDA #$00
.L1ADF
    STA L22B4,X
    DEX
    BPL L1ADF

    LDA #$1D
    STA screen_address_low
    LDA #$21
    STA screen_address_high
    JSR L16F7

    RTS

.L1AF1
    LDA L0C5D
    BNE L1B0B

    JSR L1C5A

    LDA L2F15
    STA L008C
    LDA #$50
    STA L0C5E
    LDA #$67
    STA L0C5F
    JSR L1419

.L1B0B
    RTS

.L1B0C
    LDA L2F16
    STA L0D5E
.L1B12
    JSR L1AF1

.L1B15
    JSR UpdateTimer

    DEC L0C43
    BNE L1B26

    LDA L2F18
    STA L0C43
    JSR L143D

.L1B26
    JSR L1727

    JSR TimerWait

    LDA L0C5D
    BNE L1B15

    DEC L0D5E
    BNE L1B12

    RTS

;-------------------------------------------------------------------------
; CheckSpecialKeys
;-------------------------------------------------------------------------
; On entry  :
; On exit   : 
;-------------------------------------------------------------------------
.CheckSpecialKeys
    LDX #keyCodeCAPSLOCK
    JSR isKeyPressed

    CPX #$FF
    BNE L1B45

    LDA #$01
    STA sound_flag   ; Sound On
.L1B45
    LDX #keyCodeSHIFTLOCK
    JSR isKeyPressed

    CPX #$FF
    BNE L1B53

    LDA #$00
    STA sound_flag   ; Sound Off
.L1B53
    LDX #keyCodeTAB
    JSR isKeyPressed

    CPX #$FF
    BNE L1B61

    LDA #$00
    STA freeze_flag   ; Freeze game on
.L1B61
    LDX #keyCodeCTRL
    JSR isKeyPressed

    CPX #$FF
    BNE L1B6F

    LDA #$01
    STA freeze_flag   ; Freeze game off
.L1B6F
    RTS

;-------------------------------------------------------------------------

    ; DATA ?
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    BRK
.L1C31
    EQUB $1E                                 ; Move text cursor to top left
    EQUS    "SCORE"                             ; Print SCORE
    EQUB $09,$09,$09,$09,$09,$09,$09,$09     
    EQUB $09,$09,$09                         ; Move 11 space in
    EQUS    "HIG"                               ; Print HIGH

.L1C45
    EQUS    "H"
.L1C46
    EQUS    "00000"                             ; Print 00000 (score placeholder)
    EQUB $09,$09,$09,$09,$09,$09,$09,$09
    EQUB $09,$09                             ; Move 10 space in
.L1C55
    EQUS    "00000"                             ; Print 00000 (Highscore placeholder)

;-------------------------------------------------------------------------

.L1C5A
    LDA sound_flag      ; Sound Off ?
    BEQ L1C71

    LDA #$07
    LDY #$20
    LDX #$E7
    JSR OSWORD          ; Play Sound at 20E7

    LDA #$07
    LDY #$20
    LDX #$EF
    JSR OSWORD          ; Play Sound at 20EF

.L1C71
    RTS

.L1C72
    LDA sound_flag      ; Sound Off ?
    BEQ L1C89

    LDA #$07
    LDY #$20
    LDX #$F7
    JSR OSWORD          ; Play Sound at 20F7

    LDA #$07
    LDY #$20
    LDX #$FF
    JSR OSWORD          ; Play Sound at 20FF

.L1C89
    RTS

.L1C8A
    LDA sound_flag      ; Sound Off ?
    BEQ L1C98

    LDA #$07
    LDY #$21
    LDX #$07
    JSR OSWORD          ; Play Sound at 2107

.L1C98
    RTS

.L1C99
    LDA sound_flag      ; Sound Off ?
    BEQ L1CA7

    LDA #$07
    LDY #$21
    LDX #$0F
    JSR OSWORD          ; Play Sound at 210F

.L1CA7
    RTS

;-------------------------------------------------------------------------

    ; DATA ?
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00
    
    ; Sound Data 1 20E7
    EQUB $11,$00,$01,$00,$FF,$00,$32,$00
    ; Sound Data 2 20EF
    EQUB $10,$00,$F1,$00,$07,$00,$32,$00
    ; Sound Data 3 20F7
    EQUB $11,$00,$02,$00,$64,$00,$10,$00
    ; Sound Data 4 20FF
    EQUB $10,$00,$F1,$00,$07,$00,$10,$00
    ; Sound Data 5 2107
    EQUB $12,$00,$03,$00,$C8,$00,$14,$00
    ; Sound Data 6 210F
    EQUB $13,$00,$04,$00,$C8,$00,$02,$00
    
    EQUB $13,$0B,$05,$00,$00,$00,$13,$0B 
    EQUB $07,$00,$00,$00,$13,$09
    
.L2125
    EQUB $04
    EQUB $00,$00,$00,$13,$0A

.L212B
    EQUB $06
     
    EQUB $00,$00,$00,$04,$01,$02,$05,$02
    EQUB $03,$04,$00,$04,$01,$02,$05,$02 
    EQUB $03,$04,$00,$04,$01,$02,$05,$02
    EQUB $03,$04,$00,$04,$01,$02,$05,$02
    EQUB $03,$04,$00
    
.L214F  
    EQUB $06,$01,$05,$04,$06,$05,$04,$06 
    EQUB $06,$01,$05,$04,$06,$05,$04,$06 
    EQUB $06,$01,$05,$04,$06,$05,$04,$06 
    EQUB $06,$01,$05,$04,$06,$05,$04,$06

.L216F  
    EQUB $1E,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; Move text cursor to top left
    EQUB $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; then move down 15 lines
    EQUB $09,$09,$09,$09,$09                 ; and finally 5 character in ?
    EQUS    "GAME OVER"                         ; print GAME OVER

.L218D
    EQUB $1E,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; Move text cursor to top left
    EQUB $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; then move down 15 lines
    EQUB $09,$09,$09,$09,$09                 ; and finally 5 character in ?
    EQUS    "     "                             ; print 5 spaces

.L21AB
    EQUB $1E,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; Move text cursor to top left
    EQUB $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; then move down 17 lines
    EQUB $0A,$0A,$09,$09,$09,$09             ; and finally 4 character in ?
    EQUS    "PRESS SPACE"                       ; print PRESS SPACE

.L21CC
    EQUB $1E,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; Move text cursor to top left
    EQUB $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A     ; then move down 17 lines
    EQUB $0A,$0A,$09,$09,$09,$09             ; and finally 4 character in ?
    EQUS    "   "                               ; print 3 spaces

    EQUB $13,$08,$03,$00,$00,$00,$13,$08     
                                                
    EQUB $00,$00,$00

.L21F8
    EQUB $00

.L21F9
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00

.L2219
    EQUB $80,$88,$E8,$88,$70,$30,$60,$E0
    EQUB $78,$B0,$38,$D0,$E8,$F0,$A8,$C0
    EQUB $F8,$B0,$10,$90,$18,$A8,$E8,$58
    EQUB $20,$00,$68,$88,$28,$18,$30,$C0

.L2239
    EQUB $77,$77,$77,$77,$77,$77,$76,$76
    EQUB $77,$77,$77,$77,$76,$76,$76,$76
    EQUB $77,$77,$78,$77,$77,$76,$76,$76
    EQUB $77,$78,$77,$77,$77,$77,$77,$76

.L2259
    EQUB $31,$32,$3E,$32,$2F,$27,$0D,$1D
    EQUB $30,$37,$28,$3B,$1E,$1F,$16,$19
    EQUB $40,$37,$43,$33,$24,$16,$1E,$0C
    EQUB $25,$41,$2E,$32,$26,$24,$27,$19

.L2279
    EQUB $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
    EQUB $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
    EQUB $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
    EQUB $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D

.L2299
    EQUB $00,$00,$01,$02,$02,$03,$03,$03
    EQUB $04,$05,$06,$07,$08,$08,$07,$06
    EQUB $06,$05,$05,$04,$04,$03,$03,$02
    EQUB $02,$01

.L22B3
    EQUB $01

.L22B4
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $8A,$8A,$00,$00,$00,$00,$00,$00
    EQUB $45,$45,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$8A,$8A,$00,$00,$00,$00
    EQUB $00,$00,$45,$45,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$8A,$8A,$00,$00
    EQUB $00,$00,$00,$00,$45,$45,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$8A,$8A
    EQUB $00,$00,$00,$00,$00,$00,$45,$45

.L2314
    EQUB $D4,$E4,$F4,$04

.L2318
    EQUB $22,$22,$22,$23

.L231C
    EQUB $00,$03,$05,$05,$04,$02,$FE,$FB
    EQUB $FB,$FA,$FB,$FC,$FD,$FF,$01,$03
    EQUB $04,$01,$FE,$FC,$FD,$FF,$00,$01
    EQUB $02,$FF,$00,$FC,$FE,$03,$03,$04

.L233C
    EQUB $06,$04,$02,$FE,$FB,$FB,$FB,$FC
    EQUB $FE,$00,$02,$03,$04,$05,$04,$01
    EQUB $FE,$FD,$FE,$00,$02,$04,$02,$01
    EQUB $FF,$00,$FC,$FE,$01,$03,$FC,$00

.L235C
    EQUB $00,$09,$0F,$0F,$0C,$06,$FA,$F1
    EQUB $F1,$EE,$F1,$F4,$F7,$FD,$03,$09
    EQUB $0C,$03,$FA,$F4,$F7,$FD,$00,$03
    EQUB $06,$FD,$00,$F4,$FA,$09,$09,$0C

.L237C
    EQUB $12,$0C,$06,$FA,$F1,$F1,$F1,$F4
    EQUB $FA,$00,$06,$09,$0C,$0F,$0C,$03
    EQUB $FA,$F7,$FA,$00,$06,$0C,$06,$03
    EQUB $FD,$00,$F4,$FA,$03,$09,$F4,$00

.L239C
    EQUB $01,$01,$01,$01,$01,$01,$01,$01
    EQUB $02,$02,$02,$02,$02,$02,$02,$02
    EQUB $03,$03,$03,$03,$03,$03,$03,$03
    EQUB $04,$04,$04,$04,$04,$04,$04,$04
    EQUB $E8,$00,$18,$30,$48,$60,$78,$90
    EQUB $48,$68,$88,$A8,$90,$78,$60,$48
    EQUB $30,$18,$00,$E8,$28,$08,$E8,$C8
    EQUB $A8,$88,$68,$48,$40,$18,$F0,$C8
    EQUB $A0,$78,$50,$28,$D8,$A8,$78,$48
    EQUB $18,$E8,$B8,$88,$36,$36,$36,$36
    EQUB $36,$36,$36,$35,$39,$39,$38,$38
    EQUB $36,$36,$36,$36,$36,$36,$36,$35
    EQUB $39,$39,$38,$38,$38,$38,$38,$38
    EQUB $3E,$3E,$3D,$3D,$3D,$3D,$3D,$3D
    EQUB $45,$45,$45,$45,$45,$44,$44,$44
    EQUB $26,$22,$1E,$1A,$2A,$30,$36,$3C
    EQUB $03,$03,$03,$03

.L2420
    EQUB $33,$30,$2D,$2A,$27,$24,$21,$1E
    EQUB $36,$32,$2E,$2A,$26,$22,$1E,$1A
    EQUB $39,$34,$2F,$2A,$25,$20,$1B,$16
    EQUB $3C,$36,$30,$2A,$24,$1E,$18,$12
    EQUB $35,$39,$15,$19,$1D,$21,$25,$29
    EQUB $2D,$31,$35,$39

.L244C
    EQUB $03,$03,$03,$03,$03,$03,$03,$03
    EQUB $04,$04,$04,$04,$04,$04,$04,$04
    EQUB $06,$06,$06,$06,$06,$06,$06,$06
    EQUB $09,$09,$09,$09,$09,$09,$09,$09
    EQUB $0C,$0C,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $0F,$0F,$0F,$0F,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$15,$00,$15,$2A,$2A,$2A,$2A
    EQUB $2A,$3F,$2A,$3F,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$15,$00,$15
    EQUB $3F,$3F,$3F,$3F,$2A,$3F,$2A,$3F
    EQUB $3F,$3F,$3F,$3F,$00,$00,$00,$00
    EQUB $2A,$2A,$2A,$2A,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$15,$3F
    EQUB $3F,$3F,$15,$00,$3F,$3F,$3F,$3F
    EQUB $3F,$3F,$00,$00,$3F,$3F,$3F,$3F
    EQUB $3F,$3F,$2A,$00,$2A,$2A,$3F,$3F
    EQUB $3F,$3F,$15,$00,$00,$00,$00,$2A
    EQUB $2A,$2A,$00,$00

.L24F0
    EQUB $50,$60,$90,$F0,$90,$A8,$58,$C0

.L24F8
    EQUB $25,$25,$25,$25,$26,$27,$29,$2B

.L2500
    EQUB $02,$03,$04,$05,$07,$09,$0B,$0D

.L2508
    EQUB $01,$02,$03,$04,$05,$06,$07,$08
    EQUB $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A

    ; Write System Clock
    EQUB $00,$00,$00,$00,$00
    
    EQUB $00,$00,$00
    EQUB $00,$00,$15,$15,$15,$2A,$2A,$2A
    EQUB $2A,$2A,$3F,$3F,$3F,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$15,$15,$3F
    EQUB $2A,$00,$00,$00,$00,$3F,$3F,$3F
    EQUB $2A,$00,$00,$00,$00,$00,$00,$2A
    EQUB $2A,$00,$00,$00,$00,$00,$00,$00
    EQUB $0A,$44,$C9,$C6,$C9,$04,$0A,$0A
    EQUB $05,$82,$C9,$C6,$C9,$08,$05,$05
    EQUB $0A,$05,$05,$44,$C9,$C6,$C9,$C6
    EQUB $00,$00,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $05,$0A,$0A,$82,$C9,$C6,$C9,$C6
    EQUB $C9,$4C,$04,$04,$05,$0A,$0A,$05
    EQUB $C9,$0F,$0F,$0C,$0C,$00,$00,$00
    EQUB $C9,$86,$08,$08,$0A,$05,$05,$0A
    EQUB $0A,$05,$05,$05,$05,$00,$44,$C9
    EQUB $00,$00,$00,$00,$00,$8D,$87,$8D
    EQUB $00,$05,$05,$05,$05,$88,$C6,$C9
    EQUB $0A,$00,$00,$00,$00,$00,$00,$88
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $87,$8D,$87,$8D,$87,$8D,$87,$8D
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $82,$88,$82,$88,$82,$88,$82,$88
    EQUB $44,$04,$04,$00,$0F,$0A,$05,$0F
    EQUB $0F,$0F,$0D,$0C,$04,$00,$00,$00
    EQUB $4E,$0E,$0C,$08,$05,$00,$05,$05
    EQUB $00,$00,$00,$00,$0A,$0A,$00,$0A
    EQUB $0A,$05,$05,$05,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$0A,$0A,$4E,$C9
    EQUB $00,$00,$00,$00,$00,$00,$4E,$4B
    EQUB $00,$05,$05,$05,$0A,$0A,$0A,$88
    EQUB $0A,$00,$00,$00,$00,$00,$00,$00
    EQUB $44,$41,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $4E,$4B,$4E,$4B,$4E,$4B,$4E,$4B
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $00,$00,$82,$88,$82,$88,$82,$88
    EQUB $C6,$C9,$C6,$C9,$44,$04,$04,$00
    EQUB $C6,$C9,$C6,$C9,$87,$0D,$0C,$0C
    EQUB $4E,$4B,$4E,$4B,$0F,$0F,$0E,$0E
    EQUB $C6,$C9,$C6,$C9,$C6,$0C,$0C,$08
    EQUB $82,$88,$82,$88,$00,$00,$00,$00
    EQUB $00,$0F,$0A,$0A,$05,$05,$05,$0F
    EQUB $0C,$04,$00,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$00,$00,$00,$00,$00,$00
    EQUB $08,$05,$00,$00,$05,$05,$05,$05
    EQUB $00,$0A,$0A,$0A,$00,$00,$00,$0A
    EQUB $0A,$05,$05,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$0A,$0A,$0A,$05,$05
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$05,$05
    EQUB $00,$05,$05,$0A,$0A,$0A,$00,$00
    EQUB $0A,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$44,$41,$44,$C9
    EQUB $05,$41,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $4E,$4B,$4E,$4B,$4E,$4B,$4E,$4B
    EQUB $87,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $00,$00,$82,$88,$C6,$C9,$C6,$C9
    EQUB $00,$00,$00,$00,$00,$00,$00,$88
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $4E,$4B,$4E,$4B,$4E,$4B,$4E,$4B
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $82,$88,$82,$88,$82,$88,$82,$88
    EQUB $44,$41,$44,$00,$00,$00,$00,$00
    EQUB $C6,$C9,$C6,$C9,$0C,$0C,$04,$04
    EQUB $C6,$C9,$87,$0F,$0F,$0D,$0D,$0D
    EQUB $4E,$4B,$0F,$0F,$0F,$0F,$0D,$0D
    EQUB $C6,$C9,$C6,$C9,$0E,$0C,$0C,$0C
    EQUB $C6,$C9,$C6,$88,$08,$08,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$0F,$0A,$05,$05,$00,$00,$05
    EQUB $05,$0A,$00,$00,$00,$0A,$0A,$0A
    EQUB $0C,$0C,$04,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$0C,$00,$00,$00,$00,$00
    EQUB $0D,$08,$00,$00,$00,$00,$00,$00
    EQUB $00,$0F,$00,$05,$05,$0A,$0A,$0F
    EQUB $00,$0A,$0A,$00,$00,$00,$00,$00
    EQUB $05,$05,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$0A,$0A,$05,$05,$05,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$0A
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$05,$05,$05,$0A
    EQUB $05,$05,$0A,$0A,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$41,$44,$C9,$C6
    EQUB $0A,$0A,$4B,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$4E,$4B,$4E,$4B,$4E,$4B,$4E
    EQUB $00,$82,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $0A,$0A,$0A,$82,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$00,$00,$88,$82
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $41,$44,$41,$44,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $4B,$4E,$4B,$4E,$4B,$4E,$4B,$4E
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$88,$82,$88,$82
    EQUB $C9,$C6,$C9,$C6,$C9,$44,$41,$44
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$87
    EQUB $C9,$C6,$C9,$C6,$8D,$87,$0F,$0F
    EQUB $4B,$4E,$4B,$4E,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$4B,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $88,$82,$88,$82,$88,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $C9,$0C,$0C,$04,$04,$00,$00,$05
    EQUB $0D,$0C,$0C,$0C,$0C,$0C,$0C,$04
    EQUB $0F,$0F,$0F,$0D,$0D,$0D,$0D,$0C
    EQUB $0F,$0F,$0F,$0F,$0F,$0D,$0D,$0C
    EQUB $0F,$0E,$0E,$0C,$0C,$0C,$0C,$0C
    EQUB $49,$0C,$0C,$0C,$0C,$08,$08,$05
    EQUB $88,$08,$08,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $0F,$0A,$05,$00,$00,$00,$00,$00
    EQUB $0A,$00,$00,$0A,$0A,$05,$05,$0F
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $0C,$04,$00,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$00,$00,$00,$00,$00,$00
    EQUB $08,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$05,$05,$05
    EQUB $0F,$00,$05,$0A,$0A,$00,$00,$0A
    EQUB $0A,$0A,$00,$00,$00,$00,$00,$00
    EQUB $05,$05,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$0A,$05,$05,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$0A,$0A,$0A
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$05,$05,$05
    EQUB $00,$00,$05,$0A,$0A,$00,$00,$00
    EQUB $0A,$0A,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$41
    EQUB $05,$05,$05,$05,$44,$41,$C6,$C9
    EQUB $00,$00,$00,$C9,$C6,$C9,$C6,$C9
    EQUB $00,$00,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $00,$00,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $00,$00,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$C6,$C9,$C6,$C9,$C6
    EQUB $0A,$0A,$0A,$0A,$88,$82,$C9,$C6
    EQUB $00,$00,$00,$00,$00,$00,$00,$82
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$41,$44,$41
    EQUB $44,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $88,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$00,$82,$88,$82
    EQUB $44,$41,$44,$41,$44,$41,$44,$41
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $88,$82,$88,$82,$88,$82,$88,$82
    EQUB $44,$00,$00,$00,$00,$00,$00,$00
    EQUB $C6,$C9,$C6,$C9,$44,$41,$04,$04
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$49
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$8D
    EQUB $C6,$C9,$87,$8D,$87,$0F,$0F,$0F
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$4B,$4E,$4B,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$4E
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$86
    EQUB $C9,$C6,$C9,$C6,$88,$82,$08,$08
    EQUB $88,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$0F,$0A,$0A
    EQUB $04,$00,$00,$05,$0A,$00,$00,$00
    EQUB $0C,$0C,$0C,$0E,$04,$04,$00,$00
    EQUB $0D,$0C,$0C,$0C,$0C,$0C,$0C,$0C
    EQUB $0F,$0F,$0F,$0D,$0D,$0D,$0D,$0D
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0C,$0C
    EQUB $0F,$0F,$0F,$0E,$0E,$0E,$0E,$0E
    EQUB $0E,$0C,$0C,$0C,$0C,$0C,$0C,$0C
    EQUB $0C,$0C,$0C,$0D,$08,$08,$00,$00
    EQUB $08,$00,$00,$0A,$05,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$0F,$05,$05
    EQUB $05,$05,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$0A,$0A,$05,$05,$00,$05
    EQUB $00,$00,$00,$00,$00,$00,$0A,$0A
    EQUB $04,$00,$00,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$04,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$0C,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$08,$00,$00,$00,$00,$00
    EQUB $08,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$05,$05
    EQUB $00,$00,$05,$05,$0A,$0A,$00,$0A
    EQUB $0A,$0A,$00,$00,$00,$00,$00,$00
    EQUB $05,$05,$00,$00,$00,$00,$00,$00
    EQUB $00,$0A,$05,$05,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$0A,$0A,$0A,$05
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$05,$05,$05,$0A
    EQUB $00,$05,$0A,$0A,$00,$00,$00,$00
    EQUB $0A,$0A,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $05,$05,$05,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$0A,$0A,$0A,$0A,$4B
    EQUB $00,$00,$00,$00,$00,$41,$C6,$C9
    EQUB $00,$00,$00,$00,$44,$C9,$C6,$C9
    EQUB $00,$00,$00,$00,$0F,$0F,$0F,$0F
    EQUB $00,$00,$00,$00,$88,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$00,$82,$C9,$C6
    EQUB $00,$00,$00,$05,$05,$05,$05,$87
    EQUB $0A,$0A,$0A,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$44,$41,$44,$C9
    EQUB $00,$41,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$82,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$88,$82,$88,$C6
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$44,$41,$44,$41
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $00,$00,$00,$00,$88,$82,$88,$82
    EQUB $44,$41,$44,$00,$00,$00,$00,$00
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$41
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$C6,$C9,$C6,$C9,$C6,$C9
    EQUB $C6,$C9,$87,$8D,$87,$0F,$0F,$0F
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $C9,$C6,$4B,$4E,$4B,$0F,$0F,$0F
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$C6
    EQUB $C9,$C6,$C9,$C6,$C9,$C6,$C9,$82
    EQUB $88,$82,$88,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $04,$04,$00,$00,$00,$00,$00,$00
    EQUB $C6,$49,$0C,$0C,$0C,$0C,$04,$04
    EQUB $C6,$C9,$C6,$0C,$0C,$0C,$0C,$0C
    EQUB $87,$8D,$0F,$0F,$0D,$0D,$0C,$0C
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    EQUB $4B,$4E,$0F,$0F,$0E,$0E,$0C,$0C
    EQUB $C9,$C6,$C9,$0C,$0C,$0C,$0C,$0C
    EQUB $C9,$86,$0C,$0C,$0C,$0C,$08,$08
    EQUB $08,$08,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$0F,$0F,$0F,$05,$05,$00
    EQUB $00,$0F,$0F,$00,$00,$00,$0A,$0A
    EQUB $05,$0F,$0A,$00,$00,$00,$00,$00
    EQUB $0C,$0C,$0C,$04,$04,$00,$00,$00
    EQUB $0C,$0C,$0C,$0C,$0C,$0C,$04,$00
    EQUB $0D,$0D,$0D,$0D,$0D,$0C,$0C,$04
    EQUB $0F,$0F,$0F,$0C,$0C,$0C,$0C,$0C
    EQUB $0E,$0E,$0E,$0E,$0E,$0C,$0C,$08
    EQUB $0C,$0C,$0C,$0C,$0C,$0C,$08,$00
    EQUB $0C,$0C,$0C,$08,$08,$00,$00,$00
    EQUB $0A,$0F,$05,$00,$00,$00,$00,$00
    EQUB $00,$0F,$0F,$00,$00,$00,$05,$05
    EQUB $00,$00,$0F,$0F,$0F,$0A,$0A,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $0F,$05,$05,$00,$00,$00,$00,$00
    EQUB $00,$00,$0A,$0F,$05,$05,$0F,$0F
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$05,$0F,$0A,$0A,$0F,$0F
    EQUB $0F,$0A,$0A,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $FF,$0A

.screen_min_x
    EQUB $06

.screen_max_x
    EQUB $47

.L2F04
    EQUB $49

.L2F05
    EQUB $13,$18,$77,$24,$1D,$20

.L2F0B
    EQUB $01

.L2F0C
    EQUB $0A

.L2F0D
    EQUB $02,$04

.L2F0F
    EQUB $01,$08

.L2F11
    EQUB $03

.L2F12
    EQUB $32

.L2F13
    EQUB $64

.L2F14
    EQUB $32

.L2F15
    EQUB $03

.L2F16
    EQUB $05

.L2F17
    EQUB $0A

.L2F18
    EQUB $05,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $00,$00,$00,$F3,$C6,$92,$3C,$B2
    EQUB $00,$00,$00,$00,$00,$00,$00,$00
    EQUB $F3,$C6,$92,$3C,$B2,$07,$00,$00
    EQUB $00,$00,$00,$00,$00,$10,$00,$00

.BeebDisEndAddr
SAVE "Alpha3.bin",BeebDisStartAddr,BeebDisEndAddr
