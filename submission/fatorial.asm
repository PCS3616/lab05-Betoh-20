START    SC FATORIAL ; Chama a subrotina FATORIAL
END      HM /0       ; Halt Machine

FATORIAL HM /0       ; Subrotina FATORIAL

            ; Avalia se acabou o fatorial
    LOOP    LD N        ; Armazena o valor de N no AC               
            JZ OUTPUT   ; Se AC for igual a 0, retorna a subrotina

            ; Multiplica o valor de fatorial por N
            LD RES      ; Armazena o valor de F no AC
            ML N        ; Multiplica F por N                        
            MM RES      ; Salva AC em F

            ; Diminui N em 1
            LD N        ; Armazena o valor de N no AC
            SB UM       ; Decrementa AC em 1
            MM N        ; Salva AC em N
            JP LOOP     ; Reinicia a subrotina

    OUTPUT  RS FATORIAL ; Retorna a subrotina

         @ /100
N        K /0        ; Variavel N
RES      K /1        ; Fatorial
UM       K /1        ; Decremento em 1