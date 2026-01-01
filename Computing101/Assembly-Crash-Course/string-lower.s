.intel_syntax noprefix
.global _start

_start:
xor rax, rax
xor rcx, rcx # Counter
xor rbx, rbx # place holder

cmp rdi, rbx
je finish

loop:

xor rbx, rbx
cmp byte ptr [rdi], bl
je finish

mov rbx, 0x5a
cmp byte ptr [rdi] , bl # jmp intermediate if 
jg end_loop

mov rbx, rdi
xor rdi, rdi
mov dil, byte ptr [rbx]

mov rax, 0x403000
call rax

mov rdi, rbx
mov [rdi], al # [src_addr] = foo([src_addr])

inc rcx

end_loop:
inc rdi
jmp loop


finish:
mov rax, rcx
ret
