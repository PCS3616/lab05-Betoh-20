START SC IO ; Inicia a subrotina IO
END   HM /0 ; Halt Machine

IO     HM /0 ; Subrotina IO
 
       ; Leitura de dados
       GD /0      ; Armazena o valor lido no AC
       MM x       ; Armazena x em x
       GD /0      ; Descarta s
       GD /0      ; Armazena o valor lido no AC
       MM y       ; Armazena y em y
 
       ; Tratamento da Leitura
       LD x       ; Armazena x no AC
       SB ASCII   ; Subtrai 3030 de x
       MM x       ; Salva x - 3030 em x
       LD y       ; Armazena y no AC
       SB ASCII   ; Subtrai 3030 de y
       MM y       ; Salva y - 3030 em y
 
       ; Algoritmo de Soma
       LD x       ; Armazena x no AC
       AD y       ; Soma y no AC
       MM SUM     ; Salva a x _ y em SUM
       DV SHIFT   ; Shifta x + y para a direita
       ML SHIFT   ; Shifta x + y para a esquerda
       MM AUX     ; Salva x + y sem o ultimo digito em AUX
       LD SUM     ; Armazena SUM no AC
       SB AUX     ; Subtrai AUX de SUM
       SB A       ; Subtrai A de SUM - AUX
       JN OUTPUT  ; Se o ultimo digito for menor que A, pula para OUTPUT
 
       ; Algoritmo de carry
       LD SUM     ; Armazena SUM no AC
       SB A       ; Subtrai A do AC
       AD DEZ     ; Soma 10 no AC
       MM SUM     ; Salva SUM - A + 10 no AC
       AD ASCII   ; Subtrai 3030 de SUM
       MM SUM     ; Salva SUM - 3030 em SUM
       JP OUTPUT  ; Pula para OUTPUT
 
       ; Saida
OUTPUT LD SUM ; Armazena SUM no AC
       PD /100       ; Envia SUM para o Monitor
       RS IO         ; Retorna a subrotina

; Dados
ASCII K /3030 ; Constante 0x3030 para corrigir o valor de ASCII
SHIFT K /100  ; Constante para shift
DEZ   K /100   ; Constante para representar o vai-um
A     K /A    ; Constante A para verificar o carry
x     K /0    ; Variavel x
y     K /0    ; Variavel y
SUM   K /0    ; Variavel Soma
AUX   K /0    ; Variavel para comparacao da soma