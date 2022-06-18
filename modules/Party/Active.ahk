ActiveParty() {
    PSX:="1880"
    P1SY:="260"
    P2SY:="360"
    P3SY:="460"
    P4SY:="560"
    P5SY:="660"
    pixelGetColor,P1SCOL,PSX,P1SY,RGB,Fast
    pixelGetColor,P2SCOL,PSX,P2SY,RGB,Fast
    pixelGetColor,P3SCOL,PSX,P3SY,RGB,Fast
    pixelGetColor,P4SCOL,PSX,P4SY,RGB,Fast
    pixelGetColor,P5SCOL,PSX,P5SY,RGB,Fast
    Loop,5
    {
        if (P1SCOL!="0xFFFFFF")
            return "1"
        else if (P2SCOL!="0xFFFFFF")
            return "2"
        else if (P3SCOL!="0xFFFFFF")
            return "3"
        else if (P4SCOL!="0xFFFFFF")
            return "4"
        else if (P5SCOL!="0xFFFFFF")
            return "5"
        else
            CKTooltip("Error Detecting Active Party")
    }   
}