.code

externdef Beep:proc					; extend Beef function from Windows API
externdef Done:proc					; extend Done function from main.cpp API

Play proc
							; Save non-volatile registers
	push rbx
	push rbp
	push r12
	push r13
	push r14
	push r15

	sub rsp, 28h					; reserved stack space
	mov r12, rcx					; save rcx to non-volatile register
	mov r13d, edx					; save edx to non-volatile register

playloop:						; start loop
	mov ecx, dword ptr [r12]			; move first param from array to ecx
	mov edx, dword ptr [r12+4]			; move next param from array to edx by offset it 4 byte
	call Beep					; call Beep
	add r12, 8					; offset to next array element
	sub r13d, 1					; decreas counter
	test r13d, r13d					; check if counter readed 0 or not
	jnz playloop					; if not just loop again
	mov r14, rcx					; save rcx to non-volatile register
	mov rcx, offset msg				; mov address of message to ecx for passing to Done function
	call Done					; call done
	add rsp, 28h					; restore stack space

							; Restore non-volatile registers
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	pop rbx

	ret
Play endp

.data

msg db "Happy Birthday to You!", 0

end
