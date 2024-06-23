.model small
.stack 100h

.data
array db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ; Original array
array_size equ 10                       ; Size of the array
even_array db array_size dup(0)         ; Array to store even numbers
odd_array db array_size dup(0)          ; Array to store odd numbers

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    mov si, 0                ; Index for the original array
    mov di, 0                ; Index for the even_array
    mov bx, 0                ; Index for the odd_array
    mov cx, array_size       ; Set loop counter

next_element:
    mov al, array[si]        ; Load current element into AL
    test al, 1               ; Test if the number is odd (check LSB)
    jz even_number           ; If zero, it's even

    ; If odd
    mov odd_array[bx], al    ; Store in odd_array
    inc bx                   ; Increment odd_array index
    jmp after_store

even_number:
    ; If even
    mov even_array[di], al   ; Store in even_array
    inc di                   ; Increment even_array index

after_store:
    inc si                   ; Increment original array index
    loop next_element        ; Loop until all elements are processed

    ; Terminate program
    mov ax, 4C00h
    int 21h
main endp
end main
