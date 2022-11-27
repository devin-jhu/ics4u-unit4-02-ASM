;-------------------;
; 2 digit decimal number that prints to console
; By: Devin Jhu
; 2022-11-25
;-------------------;

;-------------------; SYSTEM CALLS
SYS_WRITE   equ 1   ; write to _
SYS_READ    equ 0   ; read from _
SYS_EXIT    equ 60  ; end program
;-------------------;

;-------------------;
STDIN       equ 0   ; standard input
STDOUT      equ 1   ; standard output
;-------------------;


section .bss
    inp_len equ     3       ; 3 byte for user input, 3 bytes because need to
                            ;   make room for line feed at the end of input(\n)
    inp     resb    inp_len; buffer for user input

section .data
    message: db "Please input a 2 digit number: "
    messageLen: equ $-message
    out: db 10, "You entered: "
    outLen: equ $-out
    done: db 10, "Done.", 10
    doneLen: equ $-done


        section .text
        global _start

_start:
        ; OUTPUT FOR ASKING FOR INPUT
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, message
        mov rdx, messageLen
        syscall

        ; INPUT
        mov rax, SYS_READ
        mov rdi, STDIN
        mov rsi, inp
        mov rdx, inp_len
        syscall

        ; OUTPUT
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, out
        mov rdx, outLen
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, inp
        mov rdx, inp_len
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, done
        mov rdx, doneLen
        syscall

        ; SYS_EXIT SUCCESS
        mov rbx, 0        ;
        mov rax, SYS_EXIT ;
        syscall
