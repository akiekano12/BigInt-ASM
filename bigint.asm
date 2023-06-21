section .data
    result db 0                ; Store the result
    result_size equ $ - result ; Size of the result buffer
    number1 db "12345678987654321"   ; First number
    number1_size equ $ - number1     ; Size of the first number
    number2 db "98765432123456789"   ; Second number
    number2_size equ $ - number2     ; Size of the second number
    newline db 10               ; Line break character

section .text
    global _start

_start:
    mov rsi, number1           ; Load the address of number1 into rsi
    mov rdx, number1_size      ; Load the size of number1 into rdx
    call print_number          ; Print the first number

    mov rsi, number2           ; Load the address of number2 into rsi
    mov rdx, number2_size      ; Load the size of number2 into rdx
    call print_number          ; Print the second number

    mov rsi, number1           ; Load the address of number1 into rsi
    mov rdi, number2           ; Load the address of number2 into rdi
    mov rcx, number1_size      ; Load the size of number1 into rcx
    cmp rcx, number2_size      ; Compare the sizes of number1 and number2
    jg add_numbers             ; If number1 is greater, jump to add_numbers
    mov rcx, number2_size      ; Otherwise, use number2_size for the loop count

add_numbers:
    xor rax, rax               ; Clear rax (accumulator)
    xor rbx, rbx               ; Clear rbx (carry)
    xor rdx, rdx               ; Clear rdx (unused)

add_loop:
    mov al, [rsi + rcx - 1]    ; Load a byte from number1
    adc al, [rdi + rcx - 1]    ; Add a byte from number2 with carry
    mov [result + rcx - 1], al ; Store the sum in result
    dec rcx                    ; Decrement the loop count
    cmp rcx, 0                 ; Compare the loop count with 0
    jne add_loop               ; If not zero, continue the loop

    mov rsi, result            ; Load the address of result into rsi
    mov rdx, result_size       ; Load the size of result into rdx
    call print_number          ; Print the result

    mov rsi, newline           ; Load the address of newline into rsi
    mov rdx, 1                 ; Length of line break (1 byte)
    call print_number          ; Print the line break

exit:
    mov eax, 60                ; Exit system call number
    xor edi, edi               ; Exit status 0
    syscall                    ; Invoke the exit system call

print_number:
    push rcx                   ; Preserve rcx
    mov rcx, rdx               ; Load the size into rcx
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rax, 1                 ; System call number 1 (write)
    syscall                    ; Invoke the write system call
    pop rcx                    ; Restore rcx
    ret                        ; Return from the function
