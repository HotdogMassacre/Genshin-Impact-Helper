Auto(what) {
    if (what=="ROTATION") {
        global GIROT:=!GIROT
        if (GIROT) { 
            HotKeys("ON")
            global KSCT:=true
            SetTimer, KeyStateChecker, 50
        }
        SM:=% "Auto Rotation: " (GIROT ? "ON" : "OFF") "`nHotKeys: " (HotKeys ? "ON":"OFF") "`nSkill: " (ESSkill ? "ON":"OFF") "`nBurst: " (QBSkill ? "ON":"OFF")
    }
    if (what=="SIGHT") {
        global ESStatus:=!ESStatus
        SM:=% "Elemental Sight: " (ESStatus ? "ON" : "OFF")
        if (ESStatus) {
            SetTimer, ElementalSightTimer, ON
        }
        if (!ESStatus) {
            SetTimer, ElementalSightTimer, OFF
        }
    }
    CKTooltip(SM,,,1400)
}

HotKeys(what) {
    if (what=="TOGGLE") {
        HotKeys:=!HotKeys
        SM:="HotKeys " (HotKeys ? "ON":"OFF")
        if (!HotKeys) {
            for k,v in MainHotkeys {
                Hotkey, % k, OFF
            }
        } else {
            for k,v in MainHotkeys {
                Hotkey, % k, ON
            }        
        }
    }
    if (what=="ON") {
        HotKeys:=true
        SM:="HotKeys ON"
        for k,v in MainHotkeys {
            Hotkey, % k, ON
        }
    }
    if (what=="OFF") {
        HotKeys:=false
        SM:="HotKeys OFF"
        for k,v in MainHotkeys {
            Hotkey, % k, OFF
        }
    }
    CKTooltip(SM)
}

Skills(what) {
    if (what=="ES") {
        global ESSkill:=!ESSkill
        if (!ESSkill){
            EST:=false
        } else {
            EST:=true
        }
        SM:="Elemental Skill " (ESSkill ? "ON":"OFF")
    }
    if (what=="QB") {
        global QBSkill:=!QBSkill
        if (!QBSkill){
            QBT:=false
        } else {
            QBT:=true
        }
        SM:="Elemental Burst " (QBSkill ? "ON":"OFF")        
    }
    if (what=="BOTH") {
        global ESQBSkill:=!ESQBSkill
        if (!ESQBSkill){
            EST:=false
            QBT:=false
        } else {
            EST:=true
            QBT:=true
        }
        SM:="Elemental Skill & Burst " (ESQBSkill ? "ON":"OFF")
    }
    CKTooltip(SM)
}

;region -- Unicore Functions
GameSpeed(state) {
    if (state == 1) {
        Send {F12 Down}
    }
    if (state == 0) {
        Send {F12 Up}
    }
}

CheckDialogOpts() {
    global GTB:=0, PH1:=0, CCR:=0, ack:=0, acv:=0, OT:=0
    global CL1:=1254, CL2:=CL1+20
    global YLOC := [{"O1": "487"
        , "O2": "509"
        , "O3": "585"
        , "O4": "658"
        , "O5": "733"
        , "O6": "808"}]
    global ACOPTS:=YLOC.1
    
    for ack, acv in ACOPTS {
        if (CCR==0) {
            MouseMove,CL2,%acv%,0
            Sleep, 100
            pixelGetColor,OT,CL1,%acv%,RGB,Fast
            if (OT==MenuSelColor) {
                CCR:=1
                PH1:=acv
            }
        }
        ;Tooltip,ACK %ack% `n ACV %acv% `n CCR %CCR% `n MenuSelColor %MenuSelColor% `n CL1 %CL1% `n CL2 %CL2%,40,40,4
    }
    if (CCR==1) {
        MouseMove,%CL2%,%PH1%,0
        Sleep,30
        Click
    }
}
;endregion

;region -- Menu Automation
ScanConfirm(needle="needles\confirm_long.png") {
    Random, r1, 1, 99
    file=% "scanfile_confirm_" r1 ".png"
    ;pBitmap := Gdip_BitmapFromScreen(X1 "|" Y1 "|" X2 "|" Y2)
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    Gdip_SaveBitmapToFile(pBitmap,file,100)
    bmpNeedle:=Gdip_CreateBitmapFromFile(needle)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,150,,4,0)
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
    ;Tooltip,%RET%`n%LOC%,600,20,5
    ;MsgBox,RET=%RET%`nLOC=%LIST%
    return %LIST%
}

ClickConfirm(needle="needles\confirm_long.png") {
    ;Random, r1, 1, 99
    ;file=% "scanfile_confirm_" "r1" ".png"
    ;pBitmap := Gdip_BitmapFromScreen(X1 "|" Y1 "|" X2 "|" Y2)
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    ;Gdip_SaveBitmapToFile(pBitmap,file,100)
    bmpNeedle:=Gdip_CreateBitmapFromFile(needle)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,50,,4,0)
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
    CLOC:=% LOCSplit(LIST)
    CLOCX:=CLOC[1]
    CLOCY:=CLOC[2]
    ;Tooltip,%RET%`n%CLOCX% -- %CLOCY%,600,20,5
    ;MsgBox,RET=%RET%`nLOC=%LIST%
    if (RET>0) {
        MouseClick,Left,%CLOCX%,%CLOCY%
    }
}

ClickClose(needle="needles\close.png") {
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    bmpNeedle:=Gdip_CreateBitmapFromFile(needle)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,50,,4,0)
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
    CLOC:=% LOCSplit(LIST)
    CLOCX:=CLOC[1]
    CLOCY:=CLOC[2]
    if (RET>0) {
        MouseClick,Left,%CLOCX%,%CLOCY%
    }
}

DoConfirmLoop() {
    needle1:="needles\confirm_long.png"
    needle2:="needles\confirm_long_alt1.png"
    needle3:="needles\confirm_short.png"
    needle4:="needles\confirm_submit.png"
    needle5:="needles\confirm_give.png"
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    bmpNeedle1:=Gdip_CreateBitmapFromFile(needle1)
    bmpNeedle2:=Gdip_CreateBitmapFromFile(needle2)
    bmpNeedle3:=Gdip_CreateBitmapFromFile(needle3)
    bmpNeedle4:=Gdip_CreateBitmapFromFile(needle4)
    bmpNeedle5:=Gdip_CreateBitmapFromFile(needle5)
    RET1:=Gdip_ImageSearch(pBitmap,bmpNeedle1,LIST1,0,0,0,0,50,,4,0)
    RET2:=Gdip_ImageSearch(pBitmap,bmpNeedle2,LIST2,0,0,0,0,50,,4,0)
    RET3:=Gdip_ImageSearch(pBitmap,bmpNeedle3,LIST3,0,0,0,0,50,,4,0)
    RET4:=Gdip_ImageSearch(pBitmap,bmpNeedle4,LIST4,0,0,0,0,50,,4,0)
    RET5:=Gdip_ImageSearch(pBitmap,bmpNeedle5,LIST5,0,0,0,0,50,,4,0)
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
    if (RET1>0) {
        CLOC:=% LOCSplit(LIST1)
        CLOCX:=CLOC[1]
        CLOCY:=CLOC[2]
    } else if (RET2>0) {
        CLOC:=% LOCSplit(LIST2)
        CLOCX:=CLOC[1]
        CLOCY:=CLOC[2]
    } else if (RET3>0) {
        CLOC:=% LOCSplit(LIST3)
        CLOCX:=CLOC[1]
        CLOCY:=CLOC[2]
    } else if (RET4>0) {
        CLOC:=% LOCSplit(LIST4)
        CLOCX:=CLOC[1]
        CLOCY:=CLOC[2]
    } else if (RET5>0) {      
        CLOC:=% LOCSplit(LIST1)
        CLOCX:=CLOC[1]
        CLOCY:=CLOC[2]
    }
    MouseClick,Left,%CLOCX%,%CLOCY%
}

DoClickConfirm() {
    Send {Capslock Down}
    DoConfirmLoop()
    Send {Capslock Up}
    SetCapsLockState, Off
}

DoClickClose() {
    Send {Capslock Down}
    ClickClose("needles\close.png")
    Sleep, 400
    CloseMenu()
    Send {Capslock Up}
    SetCapsLockState, Off
}

CloseMenu() {
    pixelGetColor,MC,27,1026,RGB,Fast
    CC:=% HasVal(MenuSelCol,MC)
    Tooltip,%MC% -- %CC%,150,10,10
    if (CC>0) {
        Send {Esc}
    }
}

; Easy & Safe Funcs
ClickAndConfirm() {
    Click
    MouseMove, 820, 825, 0
    Sleep, 3500
    Click
}
;endregion