E1:
    sa:=% ActiveParty()
    ac=false
    if (sa=="1") {
        Send {e}
    } else {
        Loop {
            ap=% ActiveParty()
            Sleep, 150
            Send {1}
            cs:="done"
        } Until ap == "1" || cs == "done"
    }
    Sleep, 100
    Send {e}
    Sleep, 100
    Loop {
        ap=% ActiveParty()
        Sleep, 150
        Send {%sa%}
    } Until ap==sa
return

E2:
    sa:=% ActiveParty()
    ac=false
    if (sa=="2") {
        Send {e}
    } else {
        Loop {
            ap=% ActiveParty()
            Sleep, 150
            Send {2}
        } Until ap == "2"
    }
    Sleep, 100
    Send {e}
    Sleep, 100
    Loop {
        ap=% ActiveParty()
        Sleep, 150
        Send {%sa%}
    } Until ap==sa
return

E3:
    sa:=% ActiveParty()
    ac=false
    if (sa=="3") {
        Send {e}
    } else {
        Loop {
            ap=% ActiveParty()
            Sleep, 150
            Send {3}
        } Until ap == "3"
    }
    Sleep, 100
    Send {e}
    Sleep, 100
    Loop {
        ap=% ActiveParty()
        Sleep, 150
        Send {%sa%}
    } Until ap==sa
return

E4:
    sa:=% ActiveParty()
    ac=false
    if (sa=="4") {
        Send {e}
    } else {
        Loop {
            ap=% ActiveParty()
            Sleep, 150
            Send {4}
        } Until ap == "1"
    }
    Sleep, 100
    Send {e}
    Sleep, 100
    Loop {
        ap=% ActiveParty()
        Sleep, 150
        Send {%sa%}
    } Until ap==sa
return

E5:
    sa:=% ActiveParty()
    ac=false
    if (sa=="5") {
        Send {e}
    } else {
        Loop {
            ap=% ActiveParty()
            Sleep, 150
            Send {5}
        } Until ap == "5"
    }
    Sleep, 100
    Send {e}
    Sleep, 100
    Loop {
        ap=% ActiveParty()
        Sleep, 150
        Send {%sa%}
    } Until ap==sa
return