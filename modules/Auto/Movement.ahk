AutoRun(ars:="toggle") {
    if (ars=="toggle") {
        global AutoRun:=!AutoRun
        if (AutoRun) {
            SetTimer, AutoRunTimer, 30
        }
    }
    if (ars=="start") {
        global AutoRun:=1
        if (AutoRun) {
            SetTimer, AutoRunTimer, 30
        }
    }
    if (ars=="stop") {
        global AutoRun:=0
        Send {w Up}
        SetTimer, AutoRunTimer, OFF
        return
    }
}


+w::
{
    AutoRun("toggle")
}
return

~w::
{
    if (AutoRun) {
        AutoRun("stop")
    }
}
return

~s::
{
    if (AutoRun) {
        AutoRun("stop")
    }
}
return

AutoRunTimer:
    if (AutoRun) {
        Send {w Down}
    } else {
        Send {w Up}
    }
return