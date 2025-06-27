

;ausgeben einer nachricht
;einlesen des User inputs von max 4bytes

%define buffer_50 50


section .bss

	buffer_auslesen resb buffer_50 ;50 bytes für input


section .data

	aufforderung_inp db "Name: ",0 		;0 terminierung
	len_msg_ai equ $ - aufforderung_inp 	;länge (bytes)

	antwort db "Hello, ",0			;output
	len_out equ $ - antwort                 ;len out_antwort
        newline db 0xA,0			;nicht enter bennen, ist schon besetzt

	
section .text

	global _start

	_start:

mov rax,1
mov rdi,1
lea rsi,[aufforderung_inp] ;etwas spezieller syntax es geht auch mov rsi,msg
mov rdx,len_msg_ai

syscall				;ausgabe stdout

;input  syscall 0


mov rax,0
mov rdi,0
mov rsi,buffer_auslesen
mov rdx,buffer_50

syscall ;input in buffer gespeichert

;in rax wird  input länge zuruck gegeben

mov r8,rax ;speichern der input länge

;jetzt outout "Hello, [Name]" vorbereiten

mov rax,1
mov rdi,1
mov rsi,newline
mov rdx,1

syscall


mov rax,1
mov rdi,1
mov rsi,antwort
mov rdx,len_out

syscall

mov rax,60
xor rdi,rdi
syscall ;exit
