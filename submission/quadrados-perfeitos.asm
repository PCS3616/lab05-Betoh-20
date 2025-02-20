START SC QP     ; Inicia a subrotina QP
END   HM /0     ; Halt Machine

QP    HM /0     ; Halt Machine

      ; Condicao do Loop
      LOOP LD I ; Carrega o valor de I no AC
      SB N      ; Realiza I - N
      JZ OUTPUT ; Se I - N = 0, retorna a subrotina

      ; Calcula a iteracao do somatorio
      LD I      ; Carrega o valor de I no AC
      ML DOIS   ; Multiplica I por 2
      AD UM     ; Soma I com 1
      MM TEMP   ; Salva 2*I + 1 em TEMP

      ; Proximo endereco
      LD OP_MM  ; Carrega o valor de OP_MM no AC
      AD DOIS   ; Soma OP_MM com 2
      MM OP_MM  ; Salva OP_MM + 2 em OP_MM
      MM SAVE   ; Salva OP_MM + 2 em SAVE

      ; Calcula o resultado
      LD RESULT ; Carrega o valor de RESULT no AC
      AD TEMP   ; Soma RESULT com TEMP
      MM RESULT ; Salva RESULT + TEMP em RESULT
      SAVE K /0 ; Salva RESULT + TEMP no OP de OP_MM

      ; Incrementa I em 1
      LD I      ; Carrega o valor de I no AC
      AD UM     ; Soma I com 1
      MM I      ; Salva I + 1 em I

      JP LOOP   ; Reinicia o loop


      OUTPUT RS QP ; Retorna a subrotina

@ /080
UM     K /1    ; Constante 1
DOIS   K /2    ; Constante 2
N      K =64   ; Limite N = 64
I      K /0    ; Variavel I = 0
TEMP   K /0    ; Temporario, armazena 2*I + 1
RESULT K /0    ; Variavel de saida RESULTADO = 0 
OP_MM  K /9100 ;

@ /100
K /0







; Queremos algo como:
; int n
; int  i = 0
; int result = 0
; while int i < n ou while int i - n < 0 {
;   result += 2*i + 1
;   i++
; }
; return result
K /0