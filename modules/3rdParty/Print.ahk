Print(vOutput)
{
	static hGui, hEdit, vText, vWinW := 400, vWinH := 400
	if !hGui
	{
		Gui, New, +HwndhGui
		Gui, Font, s18 w700 cC0C0C0, Courier New
		Gui, Color,, 000000
		Gui, Add, Edit, % Format("+HwndhEdit x0 y0 w{} h{}", vWinW, vWinH)
		Gui, Show, % Format("w{} h{}", vWinW, vWinH)
		vText := vOutput
	}
	else
	{
		ControlGetText, vText,, % "ahk_id " hEdit
		vText .= "`r`n" vOutput
	}
	ControlSetText,, % vText, % "ahk_id " hEdit
	vLen := StrLen(vText)
	SendMessage, 0xB1, % vLen, % vLen,, % "ahk_id " hEdit ;EM_SETSEL := 0xB1
	PostMessage, 0xB7, 0, 0,, % "ahk_id " hEdit ;EM_SCROLLCARET := 0xB7
}