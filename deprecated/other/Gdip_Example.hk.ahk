#SingleInstance, Force
#NoEnv
DetectHiddenWindows, On
CoordMode, Mouse, Screen
SetBatchLines, -1
SetWinDelay, 0
SetWorkingDir %A_ScriptDir%

OnExit, Exit

; Uncomment if Gdip.ahk is not in your standard library
#Include, Gdip_All.ahk

If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}

pBrush := Gdip_BrushCreateSolid(0x3300ff00), pPen := Gdip_CreatePen(0xbbff2233, 1)

Gui, 1: +AlwaysOnTop -Caption +ToolWindow +Border
Gui, 1: Margin, 1560, 1640
Gui, 1: Add, Picture, x0 y0 w50 h50 0xE hwndPic
Gui, 1: Show, AutoSize
Hotkey, !LButton, Drag, On
Return

$NumpadDiv::Reload

;########################################################################################

Drag:
Gui, 1: Submit, NoHide
MouseGetPos, x1, y1
Gui, 2: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
hwnd2 := WinExist()
Gui, 2: Show, NA
Loop
{
	Sleep, 50
	If !GetKeyState("LButton", "P")
	Break
	MouseGetPos, x2, y2
	If (x2 = Oldx2) && (y2 = Oldy2)
	Continue
	
	If (x2 >= x1) && (y2 <= y1)
	x := x1, y := y2, w := x2-x1, h := y1-y2
	Else If (x2 >= x1) && (y2 >= y1)
	x := x1, y := y1, w := x2-x1, h := y2-y1
	Else If (x2 <= x1) && (y2 >= y1)
	x := x2, y := y1, w := x1-x2, h := y2-y1
	Else If (x2 <= x1) && (y2 <= y1)
	x := x2, y := y2, w := x1-x2, h := y1-y2
	
	Oldx2 := x2, Oldy2 := y2
	
	hbm := CreateDIBSection(w, h), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm), G := Gdip_GraphicsFromHDC(hdc)
	Gdip_FillRectangle(G, pBrush, 0, 0, w, h)
	Gdip_DrawRectangle(G, pPen, 0, 0, w-1, h-1)
	UpdateLayeredWindow(hwnd2, hdc, x, y, w, h)
	Gdip_DeleteGraphics(G), SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
}
Gui, 2: Destroy

pBitmap1 := Gdip_BitmapFromScreen(x "|" y "|" w "|" h)
pBitmap2 := Gdip_CreateBitmap(1, 1), G2 := Gdip_GraphicsFromImage(pBitmap2)
pBitmap3 := Gdip_CreateBitmap(50, 50), G3 := Gdip_GraphicsFromImage(pBitmap3)

Gdip_DrawImage(G2, pBitmap1, 0, 0, 1, 1, 0, 0, 50, 50)
Gdip_FillRectangle(G3, pBrush2 := Gdip_BrushCreateSolid(Gdip_GetPixel(pBitmap2, 0, 0)), 0, 0, 50, 50)

hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap3)
SetImage(Pic, hBitmap)

Gdip_DeleteBrush(pBrush2)
Gdip_DisposeImage(pBitmap1), Gdip_DisposeImage(pBitmap2), Gdip_DisposeImage(pBitmap3)
Gdip_DeleteGraphics(G2), Gdip_DeleteGraphics(G3)
DeleteObject(hBitmap)
Return

;########################################################################################

Exit:
Gdip_DeleteBrush(pBrush), Gdip_DeletePen(pPen)
Gdip_Shutdown(pToken)
ExitApp
Return