; TIMER SUBROUTINES


AutoSight:
    Auto("SIGHT")
return



ElementalSightTimer:
    Send {MButton Down}
    Sleep, 3000
    Send {MButton Up}
return