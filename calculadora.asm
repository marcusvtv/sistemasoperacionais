.LC0:
        .string "Programa que faz operacao matematica basica"
.LC1:
        .string "\nAdicao: +"
.LC2:
        .string "\nSubtracao: -"
.LC3:
        .string "\nMultiplicacao: *"
.LC4:
        .string "\nDivisao: /"
.LC5:
        .string "\n\nDigite a opcao desejada: "
.LC6:
        .string "\nDigite o primeiro numero: "
.LC7:
        .string "%d"
.LC8:
        .string "\nDigite o segundo numero: "
.LC9:
        .string "\n%d + %d = %d\n"
.LC10:
        .string "\n%d - %d = %d\n"
.LC11:
        .string "\n%d x %d = %d\n"
.LC12:
        .string "\n%d // %d = %d\n"
.LC13:
        .string "\nDivisao por 0 nao definida"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     edi, OFFSET FLAT:.LC0
        call    puts
.L3:
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    printf
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 0
        call    printf
        mov     edi, OFFSET FLAT:.LC5
        mov     eax, 0
        call    printf
        call    getchar
        mov     BYTE PTR [rbp-1], al
        cmp     BYTE PTR [rbp-1], 43
        je      .L2
        cmp     BYTE PTR [rbp-1], 45
        je      .L2
        cmp     BYTE PTR [rbp-1], 42
        je      .L2
        cmp     BYTE PTR [rbp-1], 47
        jne     .L3
.L2:
        mov     edi, OFFSET FLAT:.LC6
        mov     eax, 0
        call    printf
        lea     rax, [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 0
        call    printf
        lea     rax, [rbp-12]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc99_scanf
        movsx   eax, BYTE PTR [rbp-1]
        cmp     eax, 47
        je      .L4
        cmp     eax, 47
        jg      .L5
        cmp     eax, 45
        je      .L6
        cmp     eax, 45
        jg      .L5
        cmp     eax, 42
        je      .L7
        cmp     eax, 43
        jne     .L5
        mov     edx, DWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-12]
        lea     ecx, [rdx+rax]
        mov     edx, DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-8]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC9
        mov     eax, 0
        call    printf
        jmp     .L5
.L6:
        mov     eax, DWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-12]
        sub     eax, edx
        mov     ecx, eax
        mov     edx, DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-8]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC10
        mov     eax, 0
        call    printf
        jmp     .L5
.L7:
        mov     edx, DWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-12]
        mov     ecx, edx
        imul    ecx, eax
        mov     edx, DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-8]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC11
        mov     eax, 0
        call    printf
        jmp     .L5
.L4:
        mov     eax, DWORD PTR [rbp-12]
        test    eax, eax
        je      .L8
        mov     eax, DWORD PTR [rbp-8]
        mov     esi, DWORD PTR [rbp-12]
        cdq
        idiv    esi
        mov     ecx, eax
        mov     edx, DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-8]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 0
        call    printf
        jmp     .L5
.L8:
        mov     edi, OFFSET FLAT:.LC13
        call    puts
.L5:
        mov     eax, 0
        leave
        ret
