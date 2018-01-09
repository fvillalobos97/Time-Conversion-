;;; hw3.asm
;;;  Felicia Villalobos
;;;  this program converts a given value into hours, minutes,days  and seconds 
;;;  nasm -f elf hw3.asm
;;;  nasm -f elf 231Lib.asm
;;;  ld -melf_i386 -o hw3.o 231Lib.o
;;; ./hw3, enter a value 

                extern  _printDec
                extern  _printInt
                extern  _printString
                extern  _println
                extern  _getInput

        section .data
prompt          db      "> "
promptLen       equ     $-prompt
ansStr          db      " "
ansStrLen       equ     $-ansStr

        ;; Values 
a               dd      0
ans             dd      0
nodays          dd      0
nohrs           dd      0
nomin           dd      0
nosec           dd      0

        ;; Strings for printing answer
dayStr          db      " days "
dayLen          equ     $-dayStr
hours           db      " hours "
hoursLen        equ     $-hours
minutes         db      " minutes "
minLen          equ     $-minutes
seconds         db      " seconds "
secondsLen      equ     $-seconds
spc             db      "  "
spcLen          equ     $-spc
        section .text
                global  _start
_start:
        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get a
                call    _getInput
                mov     dword[a], eax

        ;; -----------------------------------
        ;; computation: time conversion)
        ;; -----------------------------------
                mov     edx,    0
                mov     ebx,    86400
                div     ebx
                mov     dword[nodays],eax

                mov     eax,    edx
                mov     edx,    0
                mov     ebx,    3600
                div     ebx
                mov     dword[nohrs],eax

                mov     eax,    edx
                mov     edx,    0
                mov     ebx,    60
                div     ebx
                mov     dword[nomin],eax

                mov     eax,    edx
                mov     edx,    0
                mov     ebx,    1
                div     ebx
                mov     dword[nosec],eax
        ;; -----------------------------------
        ;; display "ans = "
        ;; -----------------------------------
                mov     ecx, ansStr
                mov     edx, ansStrLen
                call    _printString

        ;; -----------------------------------
        ;; display  variables
        ;; -----------------------------------
                mov     eax, dword[nodays] ;print # of days
                call    _printInt
                mov     ecx,    dayStr ;Print string "days"
                mov     edx,    dayLen
                call    _printString 

                mov     eax, dword[nohrs] ;Print # of hours
                call    _printInt
                mov     ecx,    hours
                mov     edx,    hoursLen
                call    _printString

                mov     eax,dword[nomin] ;Print # of minutes
                call    _printInt
                mov     ecx,    minutes ;Print string "minutes"
                mov     edx,    minLen
                call    _printString

                mov     eax,dword[nosec] ;Print # of seconds
                call    _printInt

                mov     ecx,    seconds ;Print string "seconds"
                mov     edx,    secondsLen
                call    _printString
                call    _println
;;; exit
                mov     ebx, 0
                mov     eax, 1
                int     0x80
