; Programmed by hXR16F
; hXR16F.ar@gmail.com | https://github.com/hXR16F

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("", 370, 212, 374, 248, Default, $WS_EX_TOPMOST)
GUISetIcon("C:\Windows\System32\shell32.dll", -51)
GUISetBkColor(0xFFFFFF)
$Input1 = GUICtrlCreateInput("NONE", 12, 28, 105, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_UPPERCASE))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Input2 = GUICtrlCreateInput("Hello", 124, 28, 121, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Input3 = GUICtrlCreateInput("ENTER", 252, 28, 105, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_UPPERCASE))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Input4 = GUICtrlCreateInput("50", 202, 56, 95, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Input5 = GUICtrlCreateInput("0", 74, 56, 95, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("KEY", 12, 8, 105, 17, $SS_CENTER)
$Label2 = GUICtrlCreateLabel("TEXT", 124, 8, 122, 17, $SS_CENTER)
$Label3 = GUICtrlCreateLabel("KEY", 252, 8, 105, 17, $SS_CENTER)
$Label4 = GUICtrlCreateLabel("DELAY", 74, 84, 96, 17, $SS_CENTER)
$Label5 = GUICtrlCreateLabel("DELAY", 202, 84, 96, 17, $SS_CENTER)
$Button1 = GUICtrlCreateButton("Reset", 104, 110, 75, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Button2 = GUICtrlCreateButton("Stop", 192, 110, 75, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Button3 = GUICtrlCreateButton("Start", 148, 148, 75, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
Dim $StatusBar1_PartsWidth[1] = [-1]
_GUICtrlStatusBar_SetParts($StatusBar1, $StatusBar1_PartsWidth)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "Programmed by hXR16F", 0)
$Label6 = GUICtrlCreateLabel("GitHub", 322, 170, 43, 17, $SS_RIGHT)
GUICtrlSetFont(-1, 8, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetTip(-1, "Go to: https://github.com/hXR16F")
GUICtrlSetCursor (-1, 0)
$Label7 = GUICtrlCreateLabel("-", 6, 168, 8, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetState($Button3, $GUI_Enable)
GUICtrlSetState($Button2, $GUI_Disable)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Label6
			ShellExecute("https://github.com/hXR16F")

		Case $Button1
			GUICtrlSetData($Input1, "NONE")
			GUICtrlSetData($Input2, "Hello")
			GUICtrlSetData($Input3, "ENTER")
			GUICtrlSetData($Input4, "50")
			GUICtrlSetData($Input5, "0")

		Case $Button2
			If WinExists("SpamMER - Active") Then
				While WinExists("SpamMER - Active")
					WinKill("SpamMER - Active")
				WEnd
				GUICtrlSetState($Button3, $GUI_Enable)
				GUICtrlSetState($Button2, $GUI_Disable)
				GUICtrlSetState($Button1, $GUI_Enable)
				GUICtrlSetState($Input1, $GUI_Enable)
				GUICtrlSetState($Input2, $GUI_Enable)
				GUICtrlSetState($Input3, $GUI_Enable)
				GUICtrlSetState($Input4, $GUI_Enable)
				GUICtrlSetState($Input5, $GUI_Enable)
			EndIf

		Case $Button3
			GUICtrlSetState($Button3, $GUI_Disable)
			GUICtrlSetState($Button1, $GUI_Disable)
			GUICtrlSetState($Input1, $GUI_Disable)
			GUICtrlSetState($Input2, $GUI_Disable)
			GUICtrlSetState($Input3, $GUI_Disable)
			GUICtrlSetState($Input4, $GUI_Disable)
			GUICtrlSetState($Input5, $GUI_Disable)
			Local $Input1Data = GUICtrlRead($Input1)
			Local $Input2Data = GUICtrlRead($Input2)
			Local $Input3Data = GUICtrlRead($Input3)
			Local $Input4Data = GUICtrlRead($Input4)
			Local $Input5Data = GUICtrlRead($Input5)
			If FileExists(@ScriptDir & "\input.ini") Then
				FileDelete("input.ini")
			EndIf
			FileWrite(@ScriptDir & "\input.ini", $Input1Data & @CRLF & $Input2Data & @CRLF & $Input3Data& @CRLF & $Input5Data & @CRLF & $Input4Data)
			GUICtrlSetData($Label7, "3")
			Sleep(1000)
			GUICtrlSetData($Label7, "2")
			Sleep(1000)
			GUICtrlSetData($Label7, "1")
			Sleep(1000)
			GUICtrlSetData($Label7, "-")
			Run(@ScriptDir & "\SpamMER.bat", "", "", @SW_HIDE)
			WinWait("SpamMER - Active", "", "2")
			GUICtrlSetState($Button2, $GUI_Enable)

	EndSwitch
WEnd
