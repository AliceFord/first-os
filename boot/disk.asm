disk_load:
    pusha
    
    push dx
    
    mov ah, 0x02 ; Read mode
    mov al, dh
    mov cl, 0x02 ; First available sector after 1
    
    mov ch, 0x00 ; Cylinder
    mov dh, 0x00 ; Head number -> 0=floppy, 0x80=hdd1
    
    int 0x13 ; BIOS interrupt
    jc disk_error ; if carry bit set jump
    
    pop dx
    cmp al, dh
    jne sectors_error
    popa
    ret
    
disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah ; ah is error code
    call print_hex
    jmp disk_loop
    
sectors_error:
    mov bx, SECTORS_ERROR
    call print
    
disk_loop:
    jmp $
    
DISK_ERROR:
    db 'Disk read error', 0

SECTORS_ERROR:
    db 'Incorrect number of sectors read', 0