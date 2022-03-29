
MOV BX,0200H
MOV BYTE PTR [bx],55h
MOV BYTE PTR [bx+1],66H
MOV BYTE PTR [bx+2],54H
MOV BYTE PTR [bx+3],11H
MOV BYTE PTR [bx+4],57H
MOV BYTE PTR [bx+5],33H
MOV BYTE PTR [bx+6],75H
MOV BYTE PTR [bx+7],05H
MOV BYTE PTR [bx+8],48H
MOV BYTE PTR [bx+9],23H   

org 100h

MOV DI,11
MOV BX,0200H
MOV SI,1
MOV DL,[BX] ;en kucuk sayiyi tutan register
MOV DH,00 ;en kucuk sayiyinin dizideki sirasini tutan register

J1:
MOV AL,[BX+SI] ; 0700:0200 taban adresindeki (SI ile indekslenmis) ilgili byte alir
CMP AL,DL
JAE devam ;ele alinan sayi daha kucuk degilse
MOV DX,SI
MOV DH,DL ;yeni en kucuk sayinin indisi kopyalanir
MOV DL,AL ;yeni en kucuk sayi kopyalanir

devam:
INC SI
CMP SI,10
JNZ J1 
PUSH DX ;eger en kucuk sayiyi bulduysa bunu 
        ;DH'inda index DL'unda deger olmak uzere stack'e atiyorum.
JMP git ;En kucuk sayi stack'e gittikten sonra 
        ;git fonksiyonu ile bu sayiyi digerlerinden en buyuk hale getiriyorum. 

git: 
MOV CH,00
MOV CL,DH
MOV SI,CX
MOV [BX+SI],0080H  ;En kucuk sayiya 0080 degerini atiyorum.
MOV SI,1           ;Diger sayilar icin ayni islemi uyguluyorum. 
MOV DL,[BX] 
MOV DH,00
DEC DI
CMP DI,1           ;Stack'e atma islemi 10 defa gerceklesiyor.
JNZ J1  


HLT

ret