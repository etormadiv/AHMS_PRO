format PE console
entry start

include 'C:\Users\sphere\Desktop\Tools\fasmw17151\INCLUDE\win32a.inc'

section '.text' code executable
include 'SerialChecker.asm'
include 'Function_1.asm'
start:
	push 0
	push 001303CAh
	push serial
	push username
	call SerialChecker
	push username
	call [printf]
	pop ecx

	push 0
	call [ExitProcess]

section '.rdata' data readable writable
	username db 'MYUSERNAME', 0
	serial	 db 'MYSERIAL', 0
	ds_49A3C1Ch dd 0FFFFFFFFh
	object_1 db 0x50, 0x7F, 0x6A, 0x04, 0x59, 0x85, 0x6A, 0x04, 0xAE, 0x7F, 0x6A, 0x04
	db 0x41, 0x48, 0x4D, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

section '.idata' data readable import
	library kernel32, 'kernel32.dll', \
		msvcrt,   'msvcrt.dll'
	import kernel32, ExitProcess, 'ExitProcess'
	import msvcrt, printf, 'printf'