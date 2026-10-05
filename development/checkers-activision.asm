; Reconstructed, buildable disassembly of rom/Checkers (Activision).bin.
; Generated with DiStella and corrected where DASM chose a shorter
; zero-page encoding than the original absolute encoding.
; This is not the original authored source: labels are mechanical and the
; code/data classification has not yet had semantic annotations added.
; Verification: assembles byte-for-byte to SHA-256
; 140615d6873181e3a9f23338c623b62ee7f8a0c9da78766f7444b846c44201cf
; Disassembled Mon Oct  5 16:36:58 2026
; Using DiStella v3.02-SNAPSHOT
;
; Command Line: development/tools/distella -a rom/Checkers (Activision).bin
;

       processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
T1024T  =  $0297

       ORG $F000

START:
       SEI
       CLD
       LDX    #$00
LF004: LDY    #$00
LF006: STY    VSYNC,X
       TXS
       INX
       BNE    LF006
       STX    AUDV0
       LDA    #$31
       STA    AUDF0
       STA    CTRLPF
       LDX    #$05
       STX    AUDC0
LF018: LDA    #$99
       STA    $8E,X
       STY    $94,X
       LDA    #$11
       STA    $98,X
       DEX
       BPL    LF018
       STA    $B0
       STA    $85
       LDX    #$07
       STX    ENABL
       STX    VDELP0
       STX    VDELP1
       LDA    #$F7
LF033: STA    $A4,X
       DEX
       DEX
       BPL    LF033
       LDA    $80
       LDX    $87
       BEQ    LF04B
       CLC
       ADC    #$04
       LDX    #$03
       JSR    LF448
       LDY    #$1E
       STY    $89
LF04B: LDA    SWCHB
       ASL
       LDA    #$03
       BCC    LF055
       LDA    #$0B
LF055: STA    $A2
       ROL    $A1
LF059: JSR    LF26A
       LDA    $87
       BNE    LF059
       LDY    $A1
       LDX    REFP1,Y
       BPL    LF06A
       STA    $B2
       BMI    LF07D
LF06A: LDA    $B2
       BNE    LF07D
       DEC    $B2
       LDA    $B1
       BNE    LF07A
       JSR    LF3EF
       JMP    LF07D
LF07A: JSR    LF30B
LF07D: LDA    $80
       CMP    #$03
       BCS    LF08C
       LDA    $A1
       AND    $85
       BEQ    LF08C
       JMP    LF51D
LF08C: LDA    $B2
       BNE    LF0DB
       LDA    SWCHA
       EOR    #$FF
       LDY    $A1
       BNE    LF09D
       LSR
       LSR
       LSR
       LSR
LF09D: AND    #$0F
       BNE    LF0A7
       STA    $B3
       STA    $B9
       BEQ    LF0DB
LF0A7: LDX    $B3
       BEQ    LF0AF
       DEC    $B3
       BPL    LF0DB
LF0AF: TAX
       ORA    $B9
       STA    $B5
       STX    $B9
       JSR    LF441
       LDA    $B5
       TAX
       LDA    LF76B,X
       BEQ    LF0DB
       LDX    $B0
       JSR    LF4E9
       BMI    LF0DB
       STX    $B0
       STA    $A3
       LDA    #$00
       STA    $B9
       LDA    #$20
       STA    $B3
       STA    $88
       LDX    #$03
       JSR    LF68E
LF0DB: LDA    $83
       AND    #$03
       BEQ    LF0EB
       TAY
       DEY
       CPY    #$02
       BNE    LF0E8
       DEY
LF0E8: LDA    $00A2,Y
LF0EB: JSR    LF443
LF0EE: JMP    LF059
LF0F1: LDA    $A0
       ASL
       TAY
       LDA    $008E,Y
       AND    #$0F
       TAX
       LDA    LF7E5,X
       STA    $AA
       TXA
       LSR
       LSR
       JSR    LF469
       LSR
       TAX
       LDA    $AE,X
       STA    $E9
       LDA    $008F,Y
       AND    #$0F
       TAX
       LDA    LF7E5,X
       STA    $A6
       JSR    LF469
       TXA
       LSR
       LSR
       LSR
       TAX
       LDA    $AE,X
       STA    $E5
       LDA    $008E,Y
       AND    #$F0
       LSR
       LSR
       JSR    LF469
       LSR
       LSR
       TAX
       LDA    LF7E5,X
       STA    $A8
       TXA
       LSR
       LSR
       LSR
       TAX
       LDA    $AE,X
       JSR    LF469
       STA    $E7
       LDA    $008F,Y
       AND    #$F0
       LSR
       LSR
       LSR
       LSR
       TAX
       LDA    LF7E5,X
       STA    $A4
       JSR    LF469
       TXA
       LSR
       LSR
       LSR
       TAX
       LDA    $AE,X
       STA    $E3
       JSR    LF469
       RTS

LF160: LDX    #$04
       STX    NUSIZ0
       STX    NUSIZ1
       INX
       STA    WSYNC
LF169: DEX
       BNE    LF169
       STA    RESBL
       STA    RESP0
       NOP
       NOP
       NOP
       STA    RESP1
       LDA    #$F0
       STA    HMP0
       LDA    #$A0
       JSR    LF467
       LDX    #$03
LF180: LDA    LF7F8,X
       EOR    $81
       AND    $82
       STA    $AC,X
       DEX
       BPL    LF180
       LDY    $AF
       LDX    $AE
       BIT    SWCHB
       BMI    LF199
       STY    $AE
       STX    $AF
LF199: LDA    INTIM
       BNE    LF199
       LDX    $AC
       STX    COLUPF
       STA    WSYNC
       STA    VBLANK
       STA    $A0
       STA    HMCLR
       JSR    LF0F1
LF1AD: LDA    #$80
       JSR    LF465
       LDX    #$C3
       LDY    #$F0
       LDA    #$00
LF1B8: JSR    LF469
       STY    PF0
       STX    PF1
       NOP
       STX    PF2
       JSR    LF465
       LDY    #$0C
LF1C7: LDX    $E3
       STX    COLUP0
       LDX    $AD
       LDA    $AC
       STA    WSYNC
LF1D1: STA    COLUBK
       LDA    ($A4),Y
       STA    GRP0
       LDA    ($A6),Y
       STA    GRP1
       LDA    ($A8),Y
       STA    GRP0
       STX    COLUBK
       LDA    $E5
       STA    COLUP1
       LDA    $E7
       STA    COLUP0
       LDA    ($AA),Y
       .byte  $8D,$1C,$00 ; STA $001C (absolute; preserve original encoding)
       STA    GRP0
       LDA    $E9
       STA    COLUP1
       LDA    $E3
       STA    COLUP0
       LDA    $AC
       NOP
       DEY
       BPL    LF1D1
       LDA    $AC
       STA    COLUBK
       STA    HMCLR
       INC    $A0
       LDX    $AD
       LDA    $A0
       CMP    #$08
       NOP
       BEQ    LF228
       BCS    LF262
       STX    COLUBK
       JSR    LF0F1
       LDA    $A0
       LSR
       BCC    LF1AD
       LDA    #$70
       JSR    LF465
       LDX    #$3C
       LDY    #$30
       LDA    #$20
       BNE    LF1B8
LF228: STX    COLUBK
       LDX    #$05
LF22C: JSR    LF469
       DEX
       BPL    LF22C
       STX    PF0
       STX    PF1
       STX    PF2
       LDY    $AF
       LDA    #$D5
       SEC
       LDX    #$06
LF23F: STA    $A4,X
       SBC    #$08
       STY    $E3,X
       DEX
       DEX
       BPL    LF23F
       LDX    #$08
       STA    WSYNC
LF24D: DEX
       BPL    LF24D
       STA    RESP0
       STA    RESP1
       LDA    #$11
       JSR    LF467
       STA    NUSIZ0
       STA    NUSIZ1
       LDY    #$07
       JMP    LF1C7
LF262: LDA    #$21
       STA    TIM64T
       STA    $84
       RTS

LF26A: LDA    INTIM
       CMP    #$07
       BCS    LF26A
LF271: PHA
       TXA
       PHA
       TYA
       PHA
       LDA    INTIM
       LDX    $84
       CPX    #$14
       BNE    LF283
       CMP    #$01
       BCS    LF285
LF283: CMP    #$0E
LF285: BCS    LF28D
       TXA
       BNE    LF290
       JSR    LF160
LF28D: JMP    LF305
LF290: LDY    INTIM
       BNE    LF290
       STY    $84
       LDX    #$02
       STX    WSYNC
       STX    VSYNC
       STX    VBLANK
       INC    $83
       BNE    LF2AA
       INC    $88
       BNE    LF2AA
       SEC
       ROR    $88
LF2AA: DEY
       LDA    SWCHB
       AND    #$08
       BNE    LF2B4
       LDY    #$0F
LF2B4: LDA    #$00
       BIT    $88
       BPL    LF2C1
       TYA
       AND    #$F7
       TAY
       LDA    $88
       ASL
LF2C1: STA    $81
       STY    $82
       INX
LF2C6: STA    WSYNC
       DEX
       BNE    LF2C6
       STX    VSYNC
       BIT    $B8
       BPL    LF2DA
       LDY    #$14
       STY    T1024T
       STY    $84
       BNE    LF2DF
LF2DA: LDY    #$22
       STY    TIM64T
LF2DF: LDA    SWCHB
       LSR
       BCS    LF2EA
       LDX    #$87
LF2E7: JMP    LF004
LF2EA: LSR
       BCS    LF303
       LDA    $89
       BEQ    LF2F5
       DEC    $89
       BPL    LF305
LF2F5: LDY    $80
       INY
       TYA
       AND    #$03
       STA    $80
       LDX    #$88
       STX    $87
       BNE    LF2E7
LF303: STX    $89
LF305: PLA
       TAY
       PLA
       TAX
       PLA
       RTS

LF30B: LDX    $B4
       CPX    $B0
       BEQ    LF38A
       LDA    $A3
       BNE    LF332
       JSR    LF735
       STA    $8A
       LDX    $B0
       JSR    LF735
       SEC
       SBC    $8A
       STA    $8C
       LDA    $A2
       AND    #$02
       BNE    LF339
       LDA    $8C
       BPL    LF335
       LDA    $A1
       BEQ    LF339
LF332: JMP    LF43E
LF335: LDA    $A1
       BEQ    LF332
LF339: LDA    $8C
       LDX    #$03
LF33D: CMP    LF7DD,X
       BEQ    LF38D
       CMP    LF7E1,X
       BEQ    LF34C
       DEX
       BPL    LF33D
       BMI    LF332
LF34C: JSR    LF441
       LDA    $B6
       STA    $8A
       LDA    #$00
       STA    $B6
       LDX    $B4
       LDA    $8C
       ASL
       LDA    $8C
       ROR
       JSR    LF4C8
       LDX    $B6
       LDA    $8A
       STA    $B6
       TXA
       BEQ    LF332
       LDX    $8B
       JSR    LF504
       LDY    $B9
       STA    $00CE,Y
       LDA    #$00
       STA    $B6
       JSR    LF445
       LDA    $A2
       JSR    LF443
       LDX    $B0
       JSR    LF47E
       LDA    $B6
       STA    $B7
LF38A: JMP    LF391
LF38D: LDA    $B6
       BNE    LF332
LF391: LDA    $A2
       STA    $A3
       LDA    $A1
       ASL
       ASL
       ASL
       ORA    #$03
       STA    $A2
       LDA    #$00
       STA    $B1
       LDA    $B4
       CMP    $B0
       BEQ    LF3DB
       LDX    $B4
       LDA    #$00
       JSR    LF445
       LDA    $B0
       STA    $B4
       LDA    $B6
       BNE    LF3EC
       LDA    $A1
       BEQ    LF3C5
       LDA    $B0
       CMP    #$1C
       BCC    LF3CF
       LDA    #$0A
       BNE    LF3CD
LF3C5: LDA    $B0
       CMP    #$04
       BCS    LF3CF
       LDA    #$02
LF3CD: STA    $A3
LF3CF: LDA    $A1
       EOR    #$01
       STA    $A1
       LDA    #$08
       EOR    $A2
       STA    $A2
LF3DB: JSR    LF441
       LDA    #$00
       STA    $B6
       LDY    #$1F
LF3E4: TYA
       TAX
       JSR    LF47E
       DEY
       BPL    LF3E4
LF3EC: JMP    LF432
LF3EF: LDA    $A3
       BEQ    LF43E
       LSR
       LSR
       LSR
       CMP    $A1
       BNE    LF43E
       LDA    $B7
       BEQ    LF404
       LDA    $B0
       CMP    $B4
       BNE    LF43E
LF404: JSR    LF441
       LDA    $B6
       BEQ    LF41F
       STA    $9E
       LDA    #$00
       STA    $B6
       LDX    $B0
       JSR    LF47E
       LDX    $B6
       LDA    $9E
       STA    $B6
       TXA
       BEQ    LF43E
LF41F: LDA    $B0
       STA    $B4
       LDA    $A3
       STA    $A2
       LDA    $A1
       ASL
       ASL
       ASL
       ORA    #$03
       STA    $A3
       STA    $B1
LF432: LDA    $B8
       BMI    LF43B
       LDX    #$08
       JSR    LF68E
LF43B: LDA    #$FF
       RTS

LF43E: LDA    #$00
       RTS

LF441: LDA    $A3
LF443: LDX    $B0
LF445: JSR    LF271
LF448: STA    $8B
       TXA
       CLC
       ROR
       TAX
       LDA    $8E,X
       BCS    LF456
       AND    #$F0
       BCC    LF460
LF456: AND    #$0F
       ASL    $8B
       ASL    $8B
       ASL    $8B
       ASL    $8B
LF460: ORA    $8B
       STA    $8E,X
       RTS

LF465: STA    HMP0
LF467: STA    HMP1
LF469: STA    WSYNC
       STA    HMOVE
       PHA
       LDA    $AC
       STA    COLUBK
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       LDA    $AD
       STA    COLUBK
       PLA
       RTS

LF47E: STX    $8C
       JSR    LF504
       STA    $8A
       BEQ    LF4C7
       LSR
       LSR
       LSR
       CMP    $A1
       BNE    LF4C7
       LDA    $8A
       AND    #$02
       BNE    LF49A
       STA    $8A
       LDA    $A1
       BEQ    LF4B3
LF49A: CPX    #$18
       BCC    LF4A3
       LDA    $8A
       BNE    LF4B3
       RTS

LF4A3: LDA    #$04
       JSR    LF4C8
       LDA    #$05
       LDX    $8C
       JSR    LF4C8
       LDA    $8A
       BEQ    LF4C7
LF4B3: LDX    $8C
       CPX    #$08
       BCC    LF4C7
       LDA    #$FC
       LDX    $8C
       JSR    LF4C8
       LDA    #$FB
       LDX    $8C
       JSR    LF4C8
LF4C7: RTS

LF4C8: STX    $8C
       STA    $8D
       ASL
       JSR    LF4E9
       BNE    LF4E8
       LDX    $8C
       LDA    $8D
       JSR    LF4E9
       BMI    LF4E8
       BEQ    LF4E8
       LSR
       LSR
       LSR
       CMP    $A1
       BEQ    LF4E8
       LDA    #$FF
       STA    $B6
LF4E8: RTS

LF4E9: STA    $A0
       JSR    LF735
       ADC    $A0
       BMI    LF501
       CMP    #$24
       BCS    LF501
       JSR    LF742
       BMI    LF500
       STA    $8B
       JSR    LF504
LF500: RTS

LF501: LDA    #$FF
       RTS

LF504: STX    $9F
       JSR    LF271
       TXA
       CLC
       ROR
       TAX
       LDA    $8E,X
       LDX    $9F
       BCS    LF516
       AND    #$0F
       RTS

LF516: AND    #$F0
       LSR
       LSR
       LSR
       LSR
       RTS

LF51D: LDA    $80
       CLC
       ADC    #$01
       STA    $86
       LDX    #$F0
       JSR    LF68E
LF529: LDX    #$FF
       STX    $B9
       STX    $E4
       STX    $B8
       STX    $D3
LF533: LDY    $B9
       BMI    LF546
       LDA    $B6
       ORA    $B7
       BNE    LF542
       CPY    $86
       JMP    LF544
LF542: CPY    #$04
LF544: BCS    LF57F
LF546: INC    $B9
       LDA    $B6
       AND    #$C0
       ORA    #$09
       STA    $8A
       LDY    $E4
       BMI    LF558
       LDA    $B7
       BNE    LF561
LF558: INC    $E4
       LDY    $E4
       LDX    $A1
       DEX
       STX    $D4,Y
LF561: LDY    $B9
       LDA    $B7
       AND    #$30
       ORA    $8A
       STA    $00BA,Y
       LDA    #$1F
       STA    $00C4,Y
       STA    $B0
       TAX
       JSR    LF504
       STA    $00BF,Y
       STA    $A3
       JMP    LF59B
LF57F: JSR    LF6DF
       CMP    #$FF
       BNE    LF58E
       LDA    $C4
       STA    $D9,X
       LDA    $C9
       STA    $DE,X
LF58E: JSR    LF699
       LDY    $B9
       LDX    $C4,Y
       STX    $B0
       LDX    $BF,Y
       STX    $A3
LF59B: JSR    LF441
       LDY    $B9
       LDA    #$00
       STA    $00CE,Y
       LDA    $00BF,Y
       STA    $A3
       LDA    $00C4,Y
       STA    $B0
       JSR    LF3EF
       BEQ    LF619
       JMP    LF65B
LF5B7: LDA    $BA
       AND    #$C0
       STA    $B6
       LDA    $BA
       AND    #$30
       STA    $B7
       JSR    LF441
       LDA    $D4
       BNE    LF5D1
       DEC    $86
       BMI    LF5FC
       JMP    LF529
LF5D1: LDX    $D9
       STX    $B0
       STX    $B4
       JSR    LF504
       STA    $A3
       STA    $B8
       LDX    #$88
       JSR    LF68E
       JSR    LF3EF
       JSR    LF441
       LDX    $DE
       STX    $B0
       JSR    LF504
       STA    $A3
       JSR    LF30B
       LDA    $B7
       BEQ    LF5FE
       JMP    LF51D
LF5FC: STA    $85
LF5FE: STA    $A1
       STA    $B8
       JMP    LF0EE
LF605: STX    $C4,Y
       JSR    LF504
       STA    $00BF,Y
       LDA    $00BA,Y
       AND    #$F0
       ORA    #$09
       STA    $00BA,Y
       BNE    LF658
LF619: LDX    $C4,Y
       DEX
       BPL    LF605
       LDA    $B7
       BNE    LF644
       LDX    $E4
       LDA    $D4,X
       LDY    $86
       BEQ    LF644
       DEC    $E4
       TAX
       BEQ    LF644
       CMP    #$FF
       BEQ    LF644
       STA    $8B
       JSR    LF712
       CMP    #$FF
       BNE    LF644
       LDA    $DA,X
       STA    $D9,X
       LDA    $DF,X
       STA    $DE,X
LF644: DEC    $B9
       LDY    $B9
       BPL    LF64D
       JMP    LF5B7
LF64D: JSR    LF699
       LDX    $C4,Y
       STX    $B0
       LDX    $BF,Y
       STX    $A3
LF658: JMP    LF59B
LF65B: JSR    LF441
LF65E: JSR    LF271
       LDY    $B9
       LDX    $B9
       DEC    $BA,X
       LDA    $BA,X
       AND    #$0F
       TAX
       LDA    LF7DC,X
       LDX    $C4,Y
       JSR    LF4E9
       BMI    LF65E
       STX    $C9,Y
       STX    $B0
       STA    $A3
       JSR    LF30B
       BEQ    LF65E
       LDY    $B9
       LDA    $00C4,Y
       CMP    $00C9,Y
       BEQ    LF619
       JMP    LF533
LF68E: STX    AUDV0
LF690: JSR    LF26A
       DEX
       BNE    LF690
       STX    AUDV0
       RTS

LF699: LDA    $B7
       BNE    LF6A3
       LDA    $A1
       EOR    #$01
       STA    $A1
LF6A3: LDY    $B9
       LDA    $00BA,Y
       TAX
       AND    #$C0
       STA    $B6
       TXA
       AND    #$30
       STA    $B7
       LDX    $C9,Y
       JSR    LF735
       STA    $8C
       LDA    #$00
       JSR    LF445
       LDX    $C4,Y
       STX    $B4
       LDA    $00BF,Y
       JSR    LF445
       LDA    $00CE,Y
       BEQ    LF6DE
       LDX    $C4,Y
       JSR    LF735
       ADC    $8C
       LSR
       JSR    LF742
       LDA    $00CE,Y
       JSR    LF445
LF6DE: RTS

LF6DF: LDY    #$84
       LDA    $8E
       AND    $8F
       CMP    #$99
       BEQ    LF6EB
       LDY    #$80
LF6EB: STY    $8B
       LDX    #$1F
LF6EF: JSR    LF504
       TAY
       LDA    LF7F5,Y
       BMI    LF70A
       CMP    #$06
       BCC    LF70A
       STA    $9F
       TXA
       LSR
       LSR
       CMP    #$04
       BCC    LF707
       EOR    #$07
LF707: CLC
       ADC    $9F
LF70A: CLC
       ADC    $8B
       STA    $8B
       DEX
       BPL    LF6EF
LF712: LDA    $E4
       TAX
       AND    #$01
       TAY
       LDA    $8B
       CMP    $D4,X
       DEY
       BEQ    LF722
       BCS    LF724
       RTS

LF722: BCS    LF734
LF724: CMP    $D4,X
       BNE    LF72E
       LDA    $83
       AND    #$01
       BNE    LF734
LF72E: LDA    $8B
       STA    $D4,X
LF732: LDA    #$FF
LF734: RTS

LF735: TXA
       STA    $9F
       CLC
       ADC    #$04
       LSR
       LSR
       LSR
       CLC
       ADC    $9F
       RTS

LF742: LDX    #$FE
       STA    $9F
       CLC
       ADC    #$05
LF749: SEC
       INX
       SBC    #$09
       BCS    LF749
       CMP    #$F7
       BEQ    LF732
       TXA
       EOR    #$FF
       CLC
       ADC    $9F
       TAX
       RTS

LF75B: .byte $00,$7E,$FF,$FF,$C3,$81,$C3,$3C,$00,$00,$00,$00,$00,$00,$00,$00
LF76B: .byte $00,$00,$00,$00,$00,$FC,$05,$00,$00,$FB,$04,$00,$7E,$FF,$FF,$FF
       .byte $81,$7E,$FF,$FF,$C3,$81,$C3,$3C,$00,$81,$42,$42,$24,$24,$18,$18
       .byte $24,$24,$42,$42,$81,$00,$00,$7E,$18,$18,$18,$18,$78,$38,$18,$00
       .byte $00,$00,$7E,$60,$60,$3C,$06,$06,$46,$3C,$00,$00,$00,$3C,$46,$06
       .byte $0C,$0C,$06,$46,$3C,$00,$00,$00,$0C,$0C,$0C,$7E,$4C,$2C,$1C,$0C
       .byte $00,$00,$00,$AD,$A9,$E9,$A9,$ED,$41,$0F,$00,$50,$58,$5C,$56,$53
       .byte $11,$F0,$00,$BA,$8A,$BA,$A2,$3A,$80,$FE,$00,$E9,$AB,$AF,$AD,$E9
       .byte $00
LF7DC: .byte $00
LF7DD: .byte $04,$05,$FB,$FC
LF7E1: .byte $08,$0A,$F6,$F8
LF7E5: .byte $63,$5B,$76,$83,$90,$9B,$A6,$B1,$63,$5B,$76,$83,$00,$00,$00,$00
LF7F5: .byte $00,$FC,$F9
LF7F8: .byte $00,$86,$46,$0F,$00,$F0,$04,$07
