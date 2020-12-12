
; Hack to load basic stub at $0800
.segment "LOADADDR"
.addr $0800 ;; start addr of .prg (0800)

; Basic stub followed by all code
.segment "CODE"
;; encode '1 SYS2064' (810) and fill upto with 0
.byte $00, $0c, $08, $01, $00, $9e, $32, $30
.byte $36, $34, $00, $00,  $00, $00, $00, $00

start:
    ; set sprite pointer index
    ; this, multiplied by $40, is the address
    ; in this case, the address is $2000
    ; $80 * $40 = $2000
    lda #$80
    sta $07f8

    ; enable sprite 0
    lda #$01
    sta $d015

    ; set x and y position
    lda #$80
    sta $d000
    sta $d001

loop:
    jmp loop

    .segment "DATA"

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF