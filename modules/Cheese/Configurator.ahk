
; Unicore Functions
UniGetOpts() {
    Option:=LOCSplit(UniOptLOC)
    Player:=LOCSplit(UniBtnPlayerLOC)
    Auto:=LOCSplit(UniBtnAutoLOC)
    MouseMove,Player[1],Player[2],0
    Send {LButton Down}
    Sleep, 5
    Send {LButton Up}
    Sleep, 350
    for ik,iv in UniPlayerLeftOpts {
        pixelGetColor,%ik%,Option[1],%iv%,RGB,Fast
    }
    for gk,gv in UniPlayerRightOpts {
        pixelGetColor,%gk%,Option[2],%gv%,RGB,Fast
    }

    Sleep, 30
    MouseMove,Auto[1],Auto[2],0
    Send {LButton Down}
    Sleep, 5
    Send {LButton Up}
    Sleep, 350
    for zk,zv in UniAutoLeftOpts {
        pixelGetColor,%zk%,Option[1],%zv%,RGB,Fast
    }
    for xk,xv in UniAutoRightOpts {
        pixelGetColor,%xk%,Option[2],%xv%,RGB,Fast
    }

}

UniToggleOpt(what) {
    Option:=LOCSplit(UniOptLOC)
    Player:=LOCSplit(UniBtnPlayerLOC)
    Auto:=LOCSplit(UniBtnAutoLOC)
    pixelGetColor,PlayerSel,Player[1],Player[2],RGB,Fast
    pixelGetColor,AutoSel,Auto[1],Auto[2],RGB,Fast
    ;Tooltip,%what% and %PlayerSel% and %AutoSel%,700,50,5
    for plk,plv in UniPlayerLeftOpts {
        if (what==plk) {
            btn:="player"
            ux:=Option[1]
            uy:=plv
            bx:=Player[1]
            by:=Player[2]
        }
    }
    for prk,prv in UniPlayerRightOpts {
        if (what==prk) {
            btn:="player"
            ux:=Option[2]
            uy:=prv
            bx:=Player[1]
            by:=Player[2]
        }
    }
    for alk,alv in UniAutoLeftOpts {
        if (what==alk) {
            btn:="auto"
            ux:=Option[1]
            uy:=alv
            bx:=Auto[1]
            by:=Auto[2]
        }
    }
    for ark,arv in UniAutoRightOpts {
        if (what==ark) {
            btn:="auto"
            ux:=Option[2]
            uy:=arv
            bx:=Auto[1]
            by:=Auto[2]
        }
    }
    if (what=="ATPB") {
        btn:="auto"
        ux:=700
        uy:=220
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="ATHALF") {
        btn:="auto"
        ux:=732
        uy:=220
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="ATMAX") {
        btn:="auto"
        ux:=767
        uy:=220
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="ACPB") {
        btn:="auto"
        ux:=408
        uy:=350
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="ACHALF") {
        btn:="auto"
        ux:=441
        uy:=350
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="ACMAX") {
        btn:="auto"
        ux:=480
        uy:=350
        bx:=Auto[1]
        by:=Auto[2]
    }
    if (what=="RF50") {
        btn:="player"
        ux:=770
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF40") {
        btn:="player"
        ux:=754
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF30") {
        btn:="player"
        ux:=740
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF20") {
        btn:="player"
        ux:=727
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF15") {
        btn:="player"
        ux:=721
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF10") {
        btn:="player"
        ux:=714
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF6") {
        btn:="player"
        ux:=708
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF3") {
        btn:="player"
        ux:=705
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    if (what=="RF1") {
        btn:="player"
        ux:=695
        uy:=275
        bx:=Player[1]
        by:=Player[2]
    }
    ;Tooltip, %btn% -- %bx% : %by% / %ux% %uy%,920,120,7
    if (btn=="player") && (PlayerSel!=UniBtnSelCol) {
        MouseMove,%bx%,%by%,0
        Sleep, 30
        Send {LButton Down}
        Sleep, 5
        Send {LButton Up}
        Sleep, 300
    }
    if (btn=="auto") && (AutoSel!=UniBtnSelCol) {
        MouseMove,%bx%,%by%,0
        Sleep, 30
        Send {LButton Down}
        Sleep, 5
        Send {LButton Up}
        Sleep, 300
    }
    MouseMove,%ux%,%uy%,0
    Sleep, 30
    Send {LButton Down}
    Sleep, 5
    Send {LButton Up}
}
