AutoLoot:
    AutoLoot:=!AutoLoot
    global WndID := WinExist("A")

    if (!AutoLoot)
        SetTimer, AutoLootTimer, Off
    if (AutoLoot)
        SetTimer, AutoLootTimer, 50
    CKTooltip("AutoLoot: " (AutoLoot ? "ON" : "OFF"))
return

; TIMER LABELS
AutoLootTimer:
    if (!GetKeyState("LSHIFT","P")) {
        PixelGetColor, fC, 1185, 535, 3, Fast ; Scan Approximate First Option for F Key to See if Cooking is Selected. Doesn't work very well.    
        if (fC != "0xFFFFFF")
        {
            ControlSend, , f, ahk_id %WndID%
        }
    }
return