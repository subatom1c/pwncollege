.intel_syntax noprefix
.global _start

_start:
push rbp
mov rbp, rsp
sub rsp, 512

sub rsi, 1

xor rcx, rcx # i
# rdi = src_addr
# rsi = size

while_1:
# cmp i, size
cmp rcx, rsi
jg end_while_1

# curr_byte = [src_addr+i]
mov r9, 0
mov r9b, byte ptr [rcx + rdi]

mov r12, rbp
sub r12, r9
sub r12, r9
# r12 = rbp -2*r9
add word ptr [r12], 1

inc rcx
jmp while_1

end_while_1:
xor r10, r10 # max_freq
xor r11, r11 # max_freq_byte
xor rdx, rdx # b

while_2:
# cmp b, 0xff
cmp rdx, 0xff
jg end_while_2
mov r12, rbp
sub r12, rdx
sub r12, rdx
movzx r12, word ptr [r12]

cmp r12, r10
jbe pass
mov r10, r12
mov r11, rdx
pass:
inc rdx
jmp while_2

end_while_2:
add rsp, 512
mov rsp, rbp
pop rbp

mov rax, r11

ret
