BubbleBreaker:
    global CCBreaker:=!CCBreaker
    SM:=% "CC Breaker: " (CCBreaker ? "ON":"OFF")
    CKTooltip(SM)
    ;Tooltip,%BubbleC% found,300,200,19
    if (CCBreaker) {
        SetTimer, DoCCBreak, 50
    } else {
        SetTimer, DoCCBreak, OFF
    }
return

DoCCBreak:
    pixelGetColor,BubbleCol,1394,545,RGB,Fast
    pixelGetColor,TenshuCol,625,540,RGB,Fast
    pixelGetColor,TenshuCol2,1510,740,RGB,Fast
    CB:=% HasVal(BreakerColors,BubbleCol)
    CZ:=% HasVal(BreakerColors,TenshuCol)
    CX:=% HasVal(BreakerColors,TenshuCol2)
    if (Debug) {
        SM:=% "Bubble=" BubbleCol "/" CB " " "Tenshu=" TenshuCol "/" CZ " " "Tenshu2=" TenshuCol2 "/" CX
        CKTooltip(SM)
    }
    if (CB>0) || (CZ>0) || (CX>0) {
        OC:=ScanScreen("1392","517","40","40","needles\breaker_bubble_0.png","breaker_0")
        OZ:=ScanScreen("612","525","25","25","needles\breaker_tenshukaku_1.png","breaker_1")
        OX:=ScanScreen("1500","725","25","25","needles\breaker_tenshukaku_2.png","breaker_2")
        if (OC>0) || (OZ>0) || (OX>0) {
            Send {Space}
        }
    }
return