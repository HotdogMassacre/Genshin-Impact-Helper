SkipDialog:
    Keywait r, T0.4
    if (ErrorLevel) {
        SetTimer, DoSkipDialog, ON
        While(GetKeyState("r","P"))
        {
            Send {capslock Down}
            Send {f}
            Click, 1500, 800 ; First Dialog Option
        }
    } else {
        Send {f}
        Sleep, 125
        ;CheckDialogOpts()
    }
return