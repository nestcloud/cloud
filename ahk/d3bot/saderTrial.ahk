#NoEnv
#Singleinstance force
#Persistent
SendMode, Input
boucle = 0

(::
	MouseClick, right
return

; ACTIVE DESACTIVE LA FONCTION
^z::
	if (boucle = 0)	{
		Send {SPACE down}
		boucle = 1
		goto Restart
	}
	else if (boucle = 1) {
		Send {SPACE up}
		boucle = 0
	}
return

; RELANCE LE TIMER DE REPETITION
Restart:
	if (boucle = 1) {
		settimer, Bootstrap, 600
	}
return

Macro:
	Send {SPACE down}
	Send r
	Sleep 100
	MouseClick, right
	goto Restart
return

Bootstrap:
	settimer, Bootstrap, off
	
	IfWinActive, Diablo III
	{	
		if (boucle = 0) {
			goto Restart
		}
		goto Macro
	}
	goto Restart
return