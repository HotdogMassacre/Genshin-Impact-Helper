MapZoom(direction="out",level=1) {
    if (level == "max") {
        level = 5
    }
    
    inloc := "25,425"
    outloc := "25,650"
    zoom_in_btn := LOCSplit(inloc)
    zoom_out_btn := LOCSplit(outloc)

    if (direction=="out") {
        btnlocX := zoom_out_btn[1]
        btnlocY := zoom_out_btn[2]
    } else {
        btnlocX := zoom_in_btn[1]
        btnlocY := zoom_in_btn[2]
    }
    Tooltip, Clicking %direction% for a %level% count at %btnlocX% / %btnlocY%,300,50,18
    if (direction == "out") {
        Loop,%level%
        {
            Click, %btnlocX%, %btnlocY%
            Sleep, 30
        }
    }
    if (direction == "in") {
        Loop,%level%
        {
            Click, %btnlocX%, %btnlocY%
            Sleep, 30
        }        
    }
}

MapZoomMaxIN:
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
return

MapZoomMaxOUT:
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
return

MapZoomHalfIN:
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
    Click 25, 425
    Sleep, 10
return

MapZoomHalfOUT:
    Click 25, 650
    Sleep, 10
    Click 25, 650
    Sleep, 10
return