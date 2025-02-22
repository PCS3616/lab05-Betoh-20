START SC IO ; Inicia a subrotina IO
END   HM /0 ; Halt Machine

IO    HM /0 ; Subrotina IO

      ; Leitura de dados
      GD /0      ; Armazena o valor lido no AC
      MM x1      ; Armazena x-d1 em x1
      GD /0      ; Armazena o valor lido no AC
      MM x2      ; Armazena x-d1 em x2
      GD /0      ; Descarta s
      GD /0      ; Descarta s
      GD /0      ; Armazena o valor lido no AC
      MM y1      ; Armazena x-d1 em y1
      GD /0      ; Armazena o valor lido no AC
      MM y2      ; Armazena x-d1 em y2 

      ; Tratamento da Leitura
      LD x1      ; Armazena x1 no AC
      SB ASCII   ; Subtrai 3030 de x1
      MM x1      ; Salva x1 - 3030 em x1
      LD x2      ; Armazena x2 no AC
      SB ASCII   ; Subtrai 3030 de x2
      MM x2      ; Salva x2 - 3030 em x2
      LD y1      ; Armazena y1 no AC
      SB ASCII   ; Subtrai 3030 de y1
      MM y1      ; Salva y1 - 3030 em y1
      LD y2      ; Armazena y2 no AC
      SB ASCII   ; Subtrai 3030 de y2
      MM y2      ; Salva y2 - 3030 em y2

      ; Soma do mais significativo
      LD x1      ; Armazena x1 no AC
      AD y1      ; Soma y1 no AC
      MM z1      ; Salva x1 + y1 em z1

      ; Soma o menos significativo
      LD x2      ; Armazena x2 no AC
      AD y2      ; Soma y2 no AC
      SB A       ; Subtrai A de x1 + x2
      JN NOCARRY ; Se for negativo, vai para o caso sem carry

      ; Carry
      MM z2      ; Salva x2 + y2 em z2
      LD z1      ; Armazena z1 no AC
      AD UM      ; Soma 1 no AC
      MM z1      ; Armazena z1 + 1 no AC
      JP OUTPUT  ; Vai para a saida

      ; No carry
      NOCARRY AD A ; Readiciona A no AC
      MM z2        ; Salva x2 + y2 - A + A em z2
      JP OUTPUT    ; Vai para a saida

      OUTPUT LD z1 ; Armazena z1 no AC
      PD /0        ; Envia z1 para o monitor
      RS IO ; Retorna a subrotina

; Dados
ASCII K /3030 ; Constante 0x3030 para corrigir o valor de ASCII
A     K /A    ; Constante A para verificar o carry
UM    K /1    ; Constante 1
x1    K /0    ; Primeiro digito de x
x2    K /0    ; Segundo digito de x
y1    K /0    ; Primeiro digito de y
y2    K /0    ; Segundo digito de y
z1    K /0    ; Primeiro digito de z
z2    K /0    ; Segundo digito de z2
