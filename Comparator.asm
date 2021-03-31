 TITLE Simple Comparator     (Comparator.asm)

; Author: Redfield
; Last Modified:
; OSU email address: ONID_ID@oregonstate.edu
; Course number/section:   CS271 Section ???
; Project Number:                 Due Date:
; Description: This program gets two unsigned values from the user,
;	and determines which is greater (or if they are equal), then
;	notifies the user of the conclusion.

;	Note: This program does not perform any data validation.
;   If the user gives invalid input, the output will be
;   meaningless.

INCLUDE Irvine32.inc

.data
a           SDWORD   ?
b           SDWORD   ?
rules1      BYTE     "Enter two unsigned values, a and b. I will tell you which is greater.",13,10,0
prompt1     BYTE     "Enter value for a: ",0
prompt2     BYTE     "Enter value for b: ",0
prompt3		BYTE	 "Please enter positive value, less than 100"
isGreater   BYTE     " is greater than ",0
isEqual     BYTE     "The two values you entered are equal",0
seeya       BYTE     ". Thanks for playing!",13,10,0

.code
main PROC

  mov    EDX, OFFSET rules1
  call   WriteString

  ; Get value 
  _getA
  mov    EDX, OFFSET prompt1
  call   WriteString
  call   ReadInt
  mov    a, EAX
  cmp	 EAX, 0
  JL	 _errorA1
  cmp	 EAX, 100
  JG	 _error1
  jmp	 _getB

  _error1:
  mov EDX, prompt3
  call WriteString
  ; Get value b
  mov    EDX, OFFSET prompt2
  call   WriteString
  call   ReadDec
  mov    b, EAX

  ; Print which is greater
  mov    EAX, a
  cmp    EAX, b
  ja     _aGreater
  jb     _bGreater
  mov    EDX, OFFSET isEqual  ; They are equal
  call   WriteString
  jmp    _goodbye

_aGreater:     ; a is greater than b
  mov    EAX, a
  call   WriteDec
  mov    EDX, OFFSET isGreater
  call   WriteString
  mov    EAX, b
  call   WriteDec
  jmp    _goodbye

_bGreater:     ; b is greater than a
  mov    EAX, b
  call   WriteDec
  mov    EDX, OFFSET isGreater
  call   WriteString
  mov    EAX, a
  call   WriteDec

_goodbye:
  mov    EDX, OFFSET seeya
  call   WriteString

  Invoke ExitProcess,0	; exit to operating system
main ENDP


END main
