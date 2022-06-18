AutoChecker:
    GTB:=0, PH1:=0, CCR:=0,
    O1:=0, O2:=0, O3:=0, O4:=0, O5:=0, O6:=0
    R1:=0, R2:=0, R3:=0, R4:=0, R5:=0, R6:=0
    CL2:=1270 ;CL1+20
    STC:=0x253

    pixelGetColor,O1,CL2,427,RGB,Fast
    pixelGetColor,O2,CL2,502,RGB,Fast
    pixelGetColor,O3,CL2,579,RGB,Fast
    pixelGetColor,O4,CL2,652,RGB,Fast
    pixelGetColor,O5,CL2,727,RGB,Fast
    pixelGetColor,O6,CL2,802,RGB,Fast

    R1:=% SubStr(O1,1,5)
    R2:=% SubStr(O2,1,5)
    R3:=% SubStr(O3,1,5)
    R4:=% SubStr(O4,1,5)
    R5:=% SubStr(O5,1,5)
    R6:=% SubStr(O6,1,5)

    if (CCR==0) {
        if (R1==STC)
            CCR:=1, PH1:=427
    }
    if (CCR==0) {
        if (R2==STC)
            CCR:=1, PH1:=502
    }
    if (CCR==0) {
        if (R3==STC)
            CCR:=1, PH1:=577
    }
    if (CCR==0) {
        if (R4==STC)
            CCR:=1, PH1:=652
    }
    if (CCR==0) {
        if (R5==STC)
            CCR:=1, PH1:=727
    }
    if (CCR==0) {
        if (R6==STC)
            CCR:=1, PH1:=802
    }
    ;Tooltip,GOT RESULTS %CCR% %PH1% `n %R1% %O1% `n %R2% %O2% `n %R3% %O3% `n %R4% %O4% `n %R5% %O5% `n %R6% %O6%,300,150,9
    if (CCR==1) {
        MouseMove,%CL2%,%PH1%,0
        Sleep,30
        Click
    }
return