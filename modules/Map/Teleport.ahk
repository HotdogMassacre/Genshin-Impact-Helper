ScanTelOpt() {
    CL1 := 1254
    CL2 := CL1+20
    CL3 := 1280
    TOL := [485, 560, 584, 635, 659, 710, 733, 785, 808, 860]
    TBL := [470, 545, 620, 695, 770, 845]
    for k,v in TOL {
        pixelGetColor,OO,CL1,v,RGB,Fast
        OV:=% HasVal(MenuSelCol,OO)
        if (OV==1) {
            mv:=% (v-10)
            ;Tooltip,Scanning Location 1280x%mv%x50x50,600,50,17
            TO1:=% ScanScreen("1292",mv,"14","22","needles\teleport.png",k)
            TO2:=% ScanScreen("1292",mv,"14","22","needles\teleport_alt.png",k)
            TO3:=% ScanScreen("1292",mv,"14","22","needles\teleport_alt2.png",k)
            TO4:=% ScanScreen("1292",mv,"14","22","needles\teleport_alt3.png",k)
            TO5:=% ScanScreen("1292",mv,"14","22","needles\teleport_alt4.png",k)
            TO6:=% ScanScreen("1292",mv,"14","22","needles\teleport_alt5.png",k)
            TO7:=% ScanScreen("1292",mv,"14","22","needles\teleport_alcor.png",k)
            TO8:=% ScanScreen("1292",mv,"14","22","needles\teleport_frostbearer_tree.png",k)
            ;Tooltip,MAIN-%OY%`nALT1-%OM%`nALT2-%OP%,300,400,%k%
            if (TO1<1) && (TO2<1) && (TO3<1) && (TO4<1) && (TO5<1) && (TO6<1) && (TO7<1) && (TO8<1) {
                found:=false
                Send {s}
                Sleep, 300
            } else {
                found:=true
                MouseClick Left, 1292,%mv%
            }
        }
    }
}

AutoTeleport() {
    GameSpeed(1)
    Click
    Sleep, 50
    ;Sleep,600
    pixelGetColor,CV,1430,1,RGB,Fast
    CC:=% HasVal(TelMenuCol,CV)
    if (CC==0) {
        ScanTelOpt()
        ;Sleep, 500
        Sleep, 75
    }
    TV:=ScanScreen("1469","996","19","25","needles\teleport_btn.png","telbtn")
    if (TV==1) {
        MouseClick Left,1469,996
    }
    GameSpeed(0)
}

AutoTeleport:
    AutoTeleport()
return

ZoomMap() {

}

Teleport_Mondstadt:
    Send {m}
    Sleep, 800
    MapZoom("in",5)
    Sleep, 125
    MapZoom("out",2)
    Sleep, 300
    pixelGetColor,UCC,1840,1015,RGB,Fast
    ;Tooltip,%UCC%,300,5,20
    if (UCC=="0xE2DCCF") || (UCC=="0xECE5D8") {
        Click 1840,1015
        Sleep, 800
        Click 1500,140
        Sleep, 800
        MouseMove 957, 535, 0
        Sleep, 300
        AutoTeleport()
    }
return

Teleport_Liyue:
    Send {m}
    Sleep, 800
    MapZoom("in",5)
    Sleep, 125
    MapZoom("out",2)
    Sleep, 300
    pixelGetColor,UCC,1840,1015,RGB,Fast
    ;Tooltip,%UCC%,300,5,20
    if (UCC=="0xE2DCCF") || (UCC=="0xECE5D8") {
        Click 1840,1015
        Sleep, 800
        Click 1500,230 ; Click Liyue
        Sleep, 800
        MouseMove 957, 535, 0 ; Move to Liyue Teleport Button
        Sleep, 300
        AutoTeleport()
    }
return

Teleport_Inazuma:
    Send {m}
    Sleep, 800
    MapZoom("in","max")
    Sleep, 30
    MapZoom("out",2)
    Sleep, 300
    pixelGetColor,UCC,1840,1015,RGB,Fast
    ;Tooltip,%UCC%,300,5,20
    if (UCC=="0xE2DCCF") || (UCC=="0xECE5D8") {
        Click 1840,1015
        Sleep, 800
        Click 1500,350 ; Click Inazuma
        Sleep, 800
        MouseMove 957, 536, 0 ; Move to Inazuma Teleport Button
        Sleep, 300
        AutoTeleport()
    }
return

Teleport_Enkanomiya:
    Send {m}
    Sleep, 800
    MapZoom("in",5)
    Sleep, 125
    MapZoom("out",2)
    Sleep, 300
    pixelGetColor,UCC,1840,1015,RGB,Fast
    ;Tooltip,%UCC%,300,5,20
    if (UCC=="0xE2DCCF") || (UCC=="0xECE5D8") {
        Click 1840,1015
        Sleep, 800
        Click 1500,450 ; Click Enkanomiya
        Sleep, 800
        MouseMove 1136, 558, 0 ; Move to Enkanomiya Teleport Button
        Sleep, 300
        AutoTeleport()
    }
return

Teleport_TheChasm:
    Send {m}
    Sleep, 800
    MapZoom("in",5)
    Sleep, 125
    MapZoom("out",2)
    Sleep, 300
    pixelGetColor,UCC,1840,1015,RGB,Fast
    ;Tooltip,%UCC%,300,5,20
    if (UCC=="0xE2DCCF") || (UCC=="0xECE5D8") {
        Click 1840,1015
        Sleep, 800
        Click 1500,550 ; Click The Chasm
        Sleep, 800
        MouseMove 1291, 596, 0 ; Move to TheChasm Teleport Button
        Sleep, 300
        AutoTeleport()
    }
return

Teleport_Sumeru:
    ; Nothing Yet
return

Teleport_Teapot:
    Send {b}
    Sleep, 800
    Click 1050, 45
    Sleep, 150
    Click 170, 190
    Sleep, 150
    Click 1700, 1020
    Sleep, 500
    Send {f}
return