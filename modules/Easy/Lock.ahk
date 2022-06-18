PerformLock(lnv) {
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    ;bmpNeedle:= Gdip_CreateBitmapFromFile(needle)
    bmpNeedle:=Gdip_CreateBitmapFromFile(lnv)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,50,,4,0)
    Tooltip,"Needle: " RET " @ " LIST
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
}

ItemLock:
    MouseGetPos, mx, my
    Click
    Sleep, 10
    MouseMove, 1750, 439, 0
    Click
    Sleep, 10
    MouseMove, %mx%, %my%, 0
return

LockUnlock() {
    lBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    lNeedle:=Gdip_CreateBitmapFromFile("needles\NoFilter\Lock_Opened.png")
    uNeedle:=Gdip_CreateBitmapFromFile("needles\NoFilter\Lock_Closed.png")
    LRET := Gdip_ImageSearch(lBitmap,lNeedle,L1,0,0,0,0,50,,4,0)
    URET := Gdip_ImageSearch(lBitmap,uNeedle,L2,0,0,0,0,50,,4,0)
    Gdip_DisposeImage(lBitmap)
    Gdip_DisposeImage(lNeedle)
    Gdip_DisposeImage(uNeedle)
    print(LRET)
    print(URET)
    if (L1!="") {
        LockLoc:=LOCSplit(L1)
        LX := LockLoc[1]
        LY := LockLoc[2]
        LI:=1
        CKTooltip("LockLoc" LX " / " LY)
    } else if (L2!="") {
        LockLoc:=LOCSplit(L2)
        LX := LockLoc[1]
        LY := LockLoc[2]
        LI:=2
        CKTooltip("LockLoc" LX " / " LY)
    } else {
        LI:=0
        CKTooltip("No Lock Location Found")
    }
    if (LI>0) {
        MouseMove, LX, LY, 0
        Sleep, 15
        Click
    } else {
        return
    }
}

LockIt:
    GameSpeed(1)
    MouseGetPos, mx, my
    Click
    Sleep,50
    Click 1750, 430
    Sleep,50
    MouseMove, %mx%, %my%, 0
    GameSpeed(0)
return

LockIt2:
    MouseGetPos, mx, my
    Click
    Sleep, 150
    LockUnlock()
    Sleep, 70
    MouseMove, mx, my, 0
    ;Tooltip,"Needle: " %RET% " @ " %L1%,250,400,18
return