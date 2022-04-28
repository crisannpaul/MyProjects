.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern malloc: proc
extern memset: proc
extern printf: proc

includelib canvas.lib
extern BeginDrawing: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
window_title DB "Assemebly X si 0",0
area_width EQU 500
area_height EQU 400
tabel_size EQU 120
verifica DD 0

matrix DD 9 dup(0);;matrice ce va retine 1-daca se pune X 2-daca se pune 0
verif_Xand0 DD 0 
patru DD 4
trei DD 3
liber DD 0
linie DD 0 
coloana DD 0
principala DD 0
secundara DD 0
val DD 0
divide DD 40

rand DD 0
colum DD 0 

X0 DD 100 ;coordonatele punctului din stanga tablei de unde incepe sa fie desenata
Y0 DD 100 ;;; -       / /         - 
verif_inafara DD 0 ;;; variabila ce retine daca suntem pe tabla de joc sau nu (0 sau 1) 

area DD 0

culoare_simbol DD 0

X_0_width EQU 40 ;dimensiune patrat din tabel
X_0_height EQU 39 ;
X_matrix DD 0
Y_matrix DD 0



symbol_width EQU 10 ;;dimensiune simbol
symbol_height EQU 20

arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20

nr DD 9 ;; numara cate mutari posibile mai sunt in tabla de joc (9 patrate=9 miscari )

include digits.inc
include letters.inc
include Xand0.inc

.code
; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y
make_text proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ; citim simbolul de afisat
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
make_digit:
	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
make_space:	
	mov eax, 26 ; de la 0 pana la 25 sunt litere, 26 e space
	lea esi, letters
	
draw_text:
	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax
	mov ecx, symbol_height
bucla_simbol_linii:
	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax
	push ecx
	mov ecx, symbol_width
bucla_simbol_coloane:
	cmp byte ptr [esi], 0
	je simbol_pixel_alb
	mov dword ptr [edi], 0 ;;culoarea textului
	jmp simbol_pixel_next
simbol_pixel_alb:
	mov dword ptr [edi], 0FFFFFFh ;;culoare background text
simbol_pixel_next:
	add esi,1
	add edi, 4
	loop bucla_simbol_coloane
	pop ecx
	loop bucla_simbol_linii
	popa
	mov esp, ebp
	pop ebp
	ret
make_text endp

; un macro ca sa apelam mai usor desenarea simbolului
make_text_macro macro symbol, drawArea, x, y
	push y
	push x
	push drawArea
	push symbol
	call make_text
	add esp, 16
endm

Make_vertical_line macro x,y,len,color
local line
pusha
mov eax,y    ;Eax=Y
mov ebx,area_width
mul ebx    ;Eax=Y*area_width
add eax,x  ;Eax=Y*area_width + x
shl eax,2  ;Eax=(Y*area_width + x) *4 
add eax,area
mov ecx,len
line:
mov dword ptr[eax],color
add eax,area_width * 4
loop line
popa
endm

Make_horizontal_line macro x,y,len,color
local line
pusha
mov eax,y    ;Eax=Y
mov ebx,area_width
mul ebx    ;Eax=Y*area_width
add eax,x  ;Eax=Y*area_width + x
shl eax,2  ;Eax=(Y*area_width + x) *4 
add eax,area
mov ecx,len
line:
mov dword ptr[eax],color
add eax,4
loop line
popa
endm

Joc_X_0 proc ;;functie pentru desenarea simbolului X si 0
   push ebp
   mov ebp,esp
   pusha
  mov ebx,[EBP+arg1];;citim simbolul (evt 0-init 1-click 2 3-scurs timp fara click)
  cmp EBX,'X'
  jne draw_0
  sub EBX,'X' ; daca simbolul e x in ebx avem 0-primul el din fisier
  lea ESI,Xand0
  jmp draw_X_0

draw_0:

  mov ebx,1 ;;ne pozitionam pe al doilea simbol din fisierul Xand0
  lea ESI,Xand0
  add ESI, X_0_height*X_0_width   ; pentru a ajunge la 0

draw_X_0:
	mov ebx, X_0_width
	mul ebx
	mov ebx, X_0_height
	mul ebx
	add esi, eax     ; eax=X_0_width*X_0_height
	mov ecx, X_0_height
bucla_simbol_linii_X_O:
	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, X_0_height  ; adunam 40 (dim unei coloane) pentru a sari       
	sub eax, ecx         ; scadem ecx care se modifica la fiecare bucla     
	mov ebx, area_width                                                                        ;Eax=(Y*area_width + x) *4
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax   
	push ecx
	mov ecx, X_0_height
bucla_simbol_coloane_X_O:
	cmp byte ptr [esi], 0
	je simbol_pixel_alb_X_O
	mov edx, 0
	mov dword ptr [edi], edx
	jmp simbol_pixel_next_X_O
simbol_pixel_alb_X_O:
	mov dword ptr [edi], 0FFFFFFh ;fundal patratel cu simbol 
simbol_pixel_next_X_O:
	inc esi
	add edi, 4
	loop bucla_simbol_coloane_X_O   ; mi se refac coloanele de x_0_height ori (40)
	pop ecx
	loop bucla_simbol_linii_X_O   ; la fel si pentru linii
	popa
	mov esp, ebp
	pop ebp
	ret
Joc_X_0 ENDP

;;pentru a usura reapelarea functiei de desenare simboluri am facut un macro
make_X_O_macro macro simbol, drawArea, x, y
	push y
	push x
	push drawArea
	push simbol
	call Joc_X_0
	add esp, 16
endm

verificare_matrice proc
	push ebp
	mov ebp, esp
	push esi  ;;punem pe stiva valorile ce se afla in esi, edi pentru a nu le pierde 
	push edi
	mov eax, [ebp+arg1]  ; rand
	mov edi, eax			
	mov eax, [ebp+arg2]  ;col 
	mov esi, eax
	mov eax, matrix[esi+edi]	;esi+edi = Col*3+rand - pozitia in matrice
	mov liber, eax
	cmp liber, 0 ;daca pozitia din matrice nu e ocupata(nu e X sau nu e 0)
	jne iesire ;;daca e ocupata iesim 
	mov edx, [ebp+arg3] ;;simbolul ce trebuie afisat
	cmp edx, 0 
	jne eX ;;daca edx!=0 atunci simbolul e X
e0:
	mov matrix[esi+edi], 2 ;; in matrice 2 va reprezenta un 0
	jmp final
eX:
	mov matrix[esi+edi], 1 ;; in matrice 1 va reprezenta un X
	jmp final
iesire:
	mov edx, 1				;evitam sa mai desenam o data simbolul peste altul daca e ocupata casuta
	sub edx, verif_Xand0
	mov verif_Xand0, edx
final:
	pop esi
	pop edi
	mov esp, ebp
	pop ebp
	ret
verificare_matrice endp	

castigator_linie proc
 push EBP
 mov EBP,ESP
 mov edx,0
 mov ecx,3
 sum_lin:
 mov ebx,matrix[edx]
 add edx,4
 add ebx,matrix[edx]
 add edx,4
 add ebx,matrix[edx] 
 cmp ebx,3
 je win_X
 cmp ebx,6
 jne egalitate
win_0:
        mov ebx,matrix[edx]
		sub edx,4
		cmp ebx,matrix[edx]
		jne egalitate
		mov ecx, 2
		mov linie,2 
		jmp finalul ;;in ecx retinem 2 daca castiga 0
win_X:
        mov ebx,matrix[edx]
		sub edx,4
		cmp ebx,matrix[edx]
		jne egalitate 
		mov ecx, 1
		mov linie,1
		jmp finalul;;in ecx retinem 1 daca castiga X
egalitate:
        mov ebx,0
		add edx,4 
		loop sum_lin
finalul:
	mov ESP,EBP 
	pop ebp
	ret
castigator_linie endp

castigator_coloana proc
 push EBP
 mov EBP,ESP
 mov edx,0
 mov ecx,3
 mov ebx,0
 sum_col:
 mov ebx,matrix[edx]
 add edx,12
 add ebx,matrix[edx]
 add edx,12
 add ebx,matrix[edx] 
 cmp ebx,3
 je win_X
 cmp ebx,6
 jne egalitate
win_0:
        mov ebx,matrix[edx]
		sub edx,12
		cmp ebx,matrix[edx]
		jne egalitate
		mov ecx, 2
		mov coloana,2 
		jmp finalul ;;in ecx retinem 2 daca castiga 0
win_X:
        mov ebx,matrix[edx]
		sub edx,12
		cmp ebx,matrix[edx]
		jne egalitate 
		mov ecx, 1
		mov coloana,1
		jmp finalul;;in ecx retinem 1 daca castiga X
egalitate:
        mov ebx,0
		sub edx,20 
		loop sum_col
finalul:
	mov ESP,EBP 
	pop ebp
	ret
castigator_coloana endp

Verificare_principala proc
	push EBP
	mov EBP,ESP 
	mov ebx, matrix[0]   ;;; pozitiile 0, 16, 32 reprezinta diagonala principala din tabela de joc 
	add ebx, matrix[16] 
	add ebx, matrix[32] 
	cmp ebx,3
	je win_X  
    cmp ebx,6
	jne egalitate
win_0:
        mov ebx,matrix[0]
		cmp ebx,matrix[16]
		jne egalitate
		mov ecx, 2 ;;retinem in ecx 2 daca castiga 0
		mov principala,2
		jmp final
win_X:
        mov ebx,matrix[0]
		cmp ebx,matrix[16]
		jne egalitate
		mov ecx, 1 ;; retinem in ecx 1 daca castiga X 
		mov principala,1
		jmp final
egalitate:
		mov ecx, 0 ;; retinem in ecx 0 daca avem remiza 
        mov principala,0
final:
	mov ESP,EBP
	pop EBP 
	ret
Verificare_principala endp

Verificare_secundara proc
	push EBP
	mov EBP,ESP 
	mov ebx, matrix[8]   ;;; pozitiile 0, 16, 32 reprezinta diagonala principala din tabela de joc 
	add ebx, matrix[16] 
	add ebx, matrix[24] 
	cmp ebx,3
	je win_X  
    cmp ebx,6
	jne egalitate
win_0:
        mov ebx,matrix[8]
		cmp ebx,matrix[16]
		jne egalitate
		mov ecx, 2 ;;retinem in ecx 2 daca castiga 0
		mov principala,2
		jmp final
win_X:
        mov ebx,matrix[8]
		cmp ebx,matrix[16]
		jne egalitate
		mov ecx, 1 ;; retinem in ecx 1 daca castiga X 
		mov principala,1
		jmp final
egalitate:
		mov ecx, 0 ;; retinem in ecx 0 daca avem remiza 
        mov secundara,0
final:
	mov ESP,EBP
	pop EBP 
	ret
Verificare_secundara endp


main proc
	push ecx
	mov ebx,[ebp+arg2]		
	mov edx,[ebp+arg3]
 ;;;;;;;;;;;;;;;;;;;;;
 ; verificam daca s-a dat click in tabla sau nu
	mov edx, edi ;pentru y 
	cmp edx, 100
	jl nutabla 
	mov eax,tabel_size
	add eax, 100
	mov edx, edi
	cmp edx, eax
	jge nutabla
	mov edi, edx ; pentru x
	cmp ebx, 100  
	jl nutabla ;;ne aflam pe un pixel ce se afla inafara tablei de joc
	mov eax,tabel_size
	add eax, 100
	cmp ebx, eax
	jge nutabla
	mov edx,1 ; dupa ce apelam functia vom verifica cu ajutorul lui edx ; va devini 1 sau 0 :1- suntem pe tabla 0- suntem inafara tablei
	jmp afara
nutabla:
    mov edx,0 ; nu ne aflam pe tabla de joc
afara:  ;verif_inafara=1 click-ul a fost pe tabla / verif_inafara=0 click-ul s-a dat inafara tabelei ;eliberam stiva 
	cmp edx, 0 
	je final ;
	mov edx, 1				
	;verificam daca scriem X sau 0 
	sub edx, verif_Xand0
	mov verif_Xand0,edx ;in functie de edx (daca e 0 sau 1 ) vom stii ce simbol urmeaza sa afisam 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;aflarea coordonate lui X unde s-a efectuat click-ul ,punem EDX pe 0 fiindca facem div
	mov edx,0  
	mov ecx, 40          
	mov eax, [ebp+arg2]	;x	
	sub eax, 100
	div ecx   	;rand= (X-100)/ 40  x0=100   dim patrat tabela=40
	shl eax,2
	mov rand, eax 	
	mov ecx, 40
	mul ecx
	add eax,100
	add EAX,1 ; eax=x+1
    mov ebx,eax  
	mov EDX,0 ;; aflarea coordonate Y unde s-a efectuat click-ul , punem EDX pe 0 fiindca facem impartiri 
	mov eax, [ebp+arg3] ; y 
	sub eax, 100
	div ecx 	;coloana=(Y-100)/40   y0=100 dim patrat tabela=40
	shl eax,2
	mov ecx,3
	mul ecx     ;coloana=((Y-100)/40)*3   y0=100 dim patrat tabela=40 
	mov coloana, eax
	mov edx,0
	div patru
	mov ecx, 40
	mul ecx
	add eax,100
	add eax,1  ;eax=Y+1
	
	mov edi, eax	 ; mutam coordonatele lui x si y in edi si esi
    mov esi,ebx 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;construim matricea ce retine daca avem X, 0 sau casuta libera 
	push verif_Xand0
	push coloana
	push rand         
	call verificare_matrice 
	add esp, 12
	cmp liber, 0	; 0-patrat liber, 1-avem un X , 2-avem un 0
	jne final
	cmp verif_Xand0, 1 ;daca avem 1 se va desena X, daca avem 0 se va desena 0
	jne draw_0
	make_X_O_macro 'X', area, edi, esi
	jmp final
draw_0:
	make_X_O_macro 'O', area, edi, esi
final:
	pop ecx
	ret
main endp

; functia de desenare - se apeleaza la fiecare click
; sau la fiecare interval de 200ms in care nu s-a dat click
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click)
; arg2 - x
; arg3 - y
draw proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ;evt click
	cmp eax, 1
	jz evt_click
	cmp eax, 2
	jz afisare_text; nu s-a efectuat click pe nimic
	;;initializam zona de desenat
initializare:	
	mov eax, area_width
	mov ebx, area_height
	mul ebx          ; eax=area_width*area_height
	shl eax, 2       ; eax=(area_width*area_height)*4
	push eax
	push 0FFFFFFh
	push area
	call memset
	add esp, 12
	make_horizontal_line 100,100, 120,0
	make_horizontal_line 100,140, 120,0
	make_horizontal_line 100,180, 120,0
	make_horizontal_line 100,220, 120,0
	make_vertical_line 100,100,120,0
	make_vertical_line 140,100,120,0
	make_vertical_line 180,100,120,0
	make_vertical_line 220,100,120,0
	jmp afisare_text
	
	evt_click:
	mov ebx,[ebp+arg2] ;x
	mov edx,[ebp+arg3] ;y
	push edx
	push ebx
	add esp, 8 
	mov ebx, nr ;initial counter=9 (9 patratele); se verifica de fiecare data nr
	cmp ebx,0 ;daca s-a ajuns la 0 s-au facut 9 mutari fara a se castiga
	je make_text ; 
ciclu: ;; jocul e in desfasurare 
		call main  ; functia care imi verifica daca s -a dat click in afara tabelei si daca patratul este ocupat sau nu
		cmp eax, 0       
		jne counter_neschim ; daca eax!=0 patratul e ocupat , deci counterul ramane neschimbat
		cmp verif_inafara, 0 ; daca s-a dat click inafara tablei counterul ramane neschimbat
		je counter_neschim
		sub nr,1          ; scadem 1 pentru fiecare data cand se da click
		jmp castigatorul
counter_neschim:
		mov ecx, nr
castigatorul:     ; verificam pe rand cele 4 posibile cazuri
		call castigator_linie
		cmp linie, 0 
		jne final ;;daca nu avem castigator pe linie 
		call castigator_coloana
		cmp coloana, 0
		jne final ;;daca nu avem castigator pe coloana 
		call Verificare_principala
		cmp principala, 0 ;; daca nu avem castigator pe diagonala principala 
		jne final
		call Verificare_secundara 
		cmp secundara,0
		jne final
final:
		cmp ecx, 1
		je win_X ;; daca ecx=1 a castigat X 
		cmp ecx ,2
		je win_0 ;; daca ecx=2 a castigat 0 
		cmp nr,0
		je egalitate
iesi:	
		jmp afisare_text
	 	
	egalitate: ;; avem remiza 

		make_text_macro 'E', area, 216, 254
		make_text_macro 'G', area, 226, 254
		make_text_macro 'A', area, 236, 254
		make_text_macro 'L', area, 246, 254
		jmp afisare_text
			
	win_0:  ;;castigatorul e 0
		
		make_text_macro 'O', area, 216, 254
		make_text_macro ' ', area, 226, 254
		make_text_macro 'W', area, 236, 254
		make_text_macro 'O', area, 246, 254
		make_text_macro 'N', area, 256, 254
		mov nr, 0  ;; counterul a devenit 0 deoarece jocul a fost castigat de cineva 
		jmp afisare_text
	
	win_X:   ;;castigatorul e X 

		make_text_macro 'X', area, 216, 254
		make_text_macro ' ', area, 226, 254
		make_text_macro 'W', area, 236, 254
		make_text_macro 'O', area, 246, 254
		make_text_macro 'N', area, 256, 254
		mov nr, 0 ;; counterul a devenit 0 deoarece jocul a fost castigat de cineva

	
afisare_text:
	
	;scriem un mesaj
	make_text_macro 'T', area, 113, 30
	make_text_macro 'I', area, 123, 30
	make_text_macro 'C', area, 133, 30
	
	make_text_macro 'T', area, 153, 30
	make_text_macro 'A', area, 163, 30
	make_text_macro 'C', area, 173, 30
	
	make_text_macro 'T', area, 193, 30
	make_text_macro 'O', area, 203, 30
	make_text_macro 'E', area, 213, 30

final_draw:
	popa
	mov esp, ebp
	pop ebp
	ret
draw endp

start:
	;alocam memorie pentru zona de desenat
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov area, eax
	;apelam functia de desenare a ferestrei
	; typedef void (*DrawFunc)(int evt, int x, int y);
	; void __cdecl BeginDrawing(const char *title, int width, int height, unsigned int *area, DrawFunc draw);
	push offset draw
	push area
	push area_height
	push area_width
	push offset window_title
	call BeginDrawing
	add esp, 20
	
	;terminarea programului
	push 0
	call exit
end start
