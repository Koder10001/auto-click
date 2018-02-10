#include <AutoItConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("Auto Click", 507, 125, 191, 114)
$Times = GUICtrlCreateInput("", 104, 8, 393, 21)
$Location = GUICtrlCreateInput("", 104, 40, 393, 21)
$Label1 = GUICtrlCreateLabel("Times", 8, 8, 89, 25)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Location", 8, 40, 92, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Sleep = GUICtrlCreateInput("", 104, 72, 393, 21)
$Label3 = GUICtrlCreateLabel("Time Sleep", 8, 72, 83, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

HotKeySet ( "{F1}","s" )
HotKeySet ("{F2}","get")
HotKeySet ("{F3}","stop")
Global $stat = False
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
 WEnd
Func get()
   $pos = MouseGetPos ()
   $a = GUICtrlRead($Location)
   If($a == "") Then
	  $a = $pos[0] & "`" & $pos[1]
   Else
	  $a = $a & "|" & $pos[0] & "`" & $pos[1]
   EndIf
   GUICtrlSetData($Location,$a)
EndFunc
Func s()
   $stat = True
   For $i = 1 To Int(GUICtrlRead($Times))
	  If $stat Then
		 $str = GUICtrlRead($Location)
		 $str = StringSplit($str,"|")
 		 For $j = 1 To Ubound($str)-1
			$x = StringSplit($str[$j],"`")[1]
			$y = StringSplit($str[$j],"`")[2]
			MouseClick($MOUSE_CLICK_LEFT,$x,$y)
			Sleep(Int(GUICtrlRead($Sleep)))
		 Next
	  EndIf
   Next
EndFunc
Func stop()
   $stat = False
EndFunc