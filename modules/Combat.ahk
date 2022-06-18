;region -- Switch and Use Elemental Skill / Elemental Burst

SwitchAndQ(to,from) {
    Loop {
        Send {AltDown}{%to%}{AltUp}
        Sleep, 150
        sac:=% ActiveParty()
    } Until sac==to
    Loop {
        Sleep, 150
        Send {%from%}
        Sleep, 150
        nac:=% ActiveParty()
    } Until nac==from
    ;CKTooltip("Switched From PS: " from "`nTO: " to "`nCurrent Active Char: " sac,,,10000)
}

SwitchAndE(to,from) {
    Loop {
        Send {%to%}
        Sleep, 150
        sac:=% ActiveParty()
    } Until sac==to
    Send {e}
    Sleep, 5
    Send {e}
    Sleep, 5
    Send {e}
    Sleep, 5
    Send {e}
    Sleep, 5
    Send {e}
    Loop {
        Sleep, 150
        Send {%from%}
        Sleep, 150
        nac:=% ActiveParty()
    } Until nac==from
    ;CKTooltip("Switched From PS: " from "`nTO: " to "`nCurrent Active Char: " sac,,,10000)
}

E1:
    cps:=% ActiveParty()
    mtc:=1
    SwitchAndE(mtc,cps)
    ;CKTooltip(cps mtc)
return

E2:
    cps:=% ActiveParty()
    mtc:=2
    SwitchAndE(mtc,cps)
    ;CKTooltip(cps mtc)
return

E3:
    cps:=% ActiveParty()
    mtc:=3
    SwitchAndE(mtc,cps)
    ;CKTooltip(cps mtc)
return

E4:
    cps:=% ActiveParty()
    mtc:=4
    SwitchAndE(mtc,cps)
    ;CKTooltip(cps mtc)
return

E5:
    cps:=% ActiveParty()
    mtc:=5
    SwitchAndE(mtc,cps)
    ;CKTooltip(cps mtc)
return

Q1:
    cps:=% ActiveParty()
    mtc:=1
    SwitchAndQ(mtc,cps)
    ;CKTooltip(cps mtc)
return

Q2:
    cps:=% ActiveParty()
    mtc:=2
    SwitchAndQ(mtc,cps)
    CKTooltip(cps mtc)
return

Q3:
    cps:=% ActiveParty()
    mtc:=3
    SwitchAndQ(mtc,cps)
    ;CKTooltip(cps mtc)
return

Q4:
    cps:=% ActiveParty()
    mtc:=4
    SwitchAndQ(mtc,cps)
    ;CKTooltip(cps mtc)
return

Q5:
    cps:=% ActiveParty()
    mtc:=5
    SwitchAndQ(mtc,cps)
    ;CKTooltip(cps mtc)
return
;endregion

;region -- Rotation Magic

LeftRapid:
    GameSpeed(1)
    Click
    GameSpeed(0)
return

;endregion