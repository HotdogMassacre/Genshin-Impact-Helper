#SingleInstance force
#MaxHotkeysPerInterval, 1000
#InstallKeybdHook
;#Warn

SetWorkingDir, %A_ScriptDir%

CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, Tooltip, Screen
SetBatchLines, -1
SetKeyDelay, 0
SetMouseDelay, 0
SetTitleMatchMode, 2

#Include, lib\Gdip_All.ahk
#Include, lib\Gdip_ImageSearch.ahk
#Include, lib\PaddleOCR\PaddleOCR.ahk
#Include, lib\VA.ahk

pToken := Gdip_Startup()

#Include, modules/Data/Variables.ahk

#Include, modules/Core/String.ahk
#Include, modules/Core/Scanner.ahk
#Include, modules/Core/Tooltip.ahk
#Include, modules/Core/Functions.ahk

#Include, modules/3rdParty/String.ahk
#Include, modules/3rdParty/Print.ahk
#Include, modules/3rdParty/Morse.ahk
#Include, modules/3rdParty/Tooltip.ahk

; Register Core Hotkeys
Hotkey, $^Esc, HandleExit
Hotkey, $^End, HandleDebug
Hotkey, $SC029, ToggleHotkeys
Hotkey, $!SC029, ToggleKeyStateChecker
Hotkey, $NumpadAdd, MouseLocToggle
Hotkey, $NumpadDiv, HandleReload
Hotkey, IfWinActive, ahk_exe GenshinImpact.exe

#IF HotKeys
Hotkey, If, % HotKeys

#Include, modules/Cheese/Configurator.ahk
#Include, modules/Party/Switcher.ahk
#Include, modules/Party/Loader.ahk
#Include, modules/Party/Active.ahk

#Include, modules/HotKeys/Main.ahk

Nothing:
return

;region -- Auto Functions for Performing Repetitive Tasks
#Include, modules/Auto/Expeditions.ahk
#Include, modules/Auto/Movement.ahk
#Include, modules/Auto/Magnet.ahk
#Include, modules/Auto/Loot.ahk
;endregion

#Include, modules/Combat.ahk
#Include, modules/sr_rotation.ahk
#Include, modules/sr_timers.ahk
#Include, modules/sr_party.ahk
#Include, modules/Skip.ahk
#Include, modules/sr_unicore.ahk

;region -- Map Stuffs
#Include, modules/Map/Teleport.ahk
#Include, modules/Map/Zoom.ahk
;endregion

;region -- To The Max -- QOL Functions for doing "Max" counts like purchase/craft/etc.
#Include, modules/Max/Purchase.ahk
#Include, modules/Max/Craft.ahk
;endregion

;region -- Easy Mode QOL Functions
#Include, modules/Easy/Cook.ahk
#Include, modules/Easy/Time.ahk
#Include, modules/Easy/Lock.ahk
#Include, modules/Easy/Upgrade.ahk
#Include, modules/Easy/Refine.ahk
;endregion

#Include, modules/Scanning/TakeBitmap.ahk

#Include, modules/Reactions/Breaker.ahk

; Core Subroutines
MouseLocToggle:
    MLS:=!MLS
    CKTooltip("Toggling MouseLoc/Color " (MLS ? "ON":"OFF"))
    if (MLS) {
        SetTimer, MouseLoc, 100
    } else {
        SetTimer, MouseLoc, Off
        Tooltip,,,,5
    }
return

MouseLoc:
    MouseGetPos, mx, my
    PixelGetColor, cC, mx, my, RGB, Fast
    Tooltip, %mx% %my% - Color: %cC%, 20, 20, 5
return

ToggleHotkeys:
    HotKeys("TOGGLE")
return

HandleStartup:
    global StartToggle:=!StartToggle
    
    if (!StartToggle) {
        global HotKeys:=false
        global GIROT:=false
        global ESSkill:=false
    } else {
        global HotKeys:=true
        global GIROT:=true
        global ESSkill:=true
    }

    if (!HotKeys) {
        for k,v in OtherHotkeys {
            Hotkey, % k, OFF
        }
    } else {
        for k,v in OtherHotkeys {
            Hotkey, % k, ON
        }        
    }

    if (!ESSkill){
        global EST:=false
    } else {
        global EST:=true
    }

    SM:="Toggled HotKeys: " (HotKeys ? "ON":"OFF") " ES Usage: " (ESSkill ? "ON":"OFF") " Rotation: " (GIROT ? "ON" : "OFF")
    CKTooltip(SM)
return

HandleDebug:
    Debug:=!Debug
    if (Debug) {
        CKTooltip("Debugging: ON")
    } else {
        CKTooltip("Debugging: OFF")
    }
return

HandleReload:
    CKTooltip("Reloading Script")
    Sleep, 800
    Reload
return

HandleExit:
    CKTooltip("Exiting App")
    Sleep, 800
    ExitApp
return

TooltipClear:
    SetTimer, TooltipClear, Off
    Tooltip
return
#Include, modules/volume.ahk

ToggleKeyStateChecker:
    global KSCT:=!KSCT
    SM:=% "KeyState Checker: " (KSCT ? "ON":"OFF")
    if (KSCT) {
        SetTimer, KeyStateChecker, 300
    } else {
        SetTimer, KeyStateChecker, OFF
    }
    CKTooltip(SM)
return

KeyStateChecker:
    if (KSCT) {
        if (!GetKeyState("r","P")) {
            Send {capslock Up}
            SetCapslockState, OFF
        }
        if (GetKeyState("Capslock","T")) {
            Send {capslock Up}
            SetCapslockState, OFF
        }
        if (GetKeyState("x","P")) && (!AutoMagnet) {
            Send {x Up}
        }
    } else {
        return
    }
return

ToggleFullRotation:
    global FullRotation:=!FullRotation
    CKTooltip("FullRotation: " (FullRotation ? "ON":"OFF"))
return
#IF

Fire(keySent:=0,wait:=15) {
    if (keySent==0) {
        Click
    } else {
        ;CKTooltip(keySent)
        Send {%keySent%}
    }
    if (wait>0) {
        Sleep, %wait%
    }
}

StartRotation()
{
    global Rotation:=1
    if (Rotation) {
        global _start = A_TickCount
        SetTimer, Rotation, 125
    }
}
return

StopRotation()
{
    global Rotation:=0
    if (!Rotation) {
        global _start = 0
        Send {LButton Up}
        SetTimer, Rotation, OFF
    }
}
return

~LButton::StartRotation()
~LButton Up::StopRotation()

Rotation:
    elapsed := A_TickCount - _start
    if (GIROT) {
        if (!GetKeyState("LSHIFT","P")) {
            if (elapsed>450) {
                if (EST) {
                    Fire("e")
                }
                if (QBT) {
                    Fire("q")
                }
            }
            Fire(0)
        }
    }
return

$NumpadDiv::
{
    CKTooltip("Reloading Script")
    Sleep, 800
    Reload
}
^F5::Reload
$NumpadMult::Suspend
$Capslock::F12

$+F1::
{
    WinGet, WndID, ID, Genshin Impact
    global WndID
    CKTooltip(WndID)
}