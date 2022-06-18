UnicoreAutoTrees:
    CKTooltip("LumberJackin' It Off!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("AutoTrees")
    Sleep, 70
    Send {INS}
return

AutoTreesPBAOE:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ATPB") ; Point Blank AutoTrees, you must be climbing the tree to loot it
    Sleep,70
    Send {INS}
return

AutoTreesHalf:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ATHALF") ; A small distance from the tree you get the loots.
    Sleep,70
    Send {INS}
return

AutoTreesMax:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ATMAX") ; LumberJack That Shit with your Telikenetic Powers!
    Sleep,70
    Send {INS}
return

UnicoreAutoChests:
    CKTooltip("OMG TREASURE!!!!!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("AutoLootChests")
    Sleep, 70
    Send {INS}
return

AutoChestsPBAOE:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ACPB") ; Point Blank AutoChests, you must walk up beside the chest to loot it
    Sleep,70
    Send {INS}
return

AutoChestsHalf:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ACHALF") ; Increased Range to Open Chests, probably rare usage
    Sleep,70
    Send {INS}
return

AutoChestsMax:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("ACMAX") ; OPEN ALL THE CHESTS well... up to 16 range... :)
    Sleep,70
    Send {INS}
return

HulkSmash:
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    Sleep, 50
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    HulkSmash:=!HulkSmash
    if (!HulkSmash) {
        CKTooltip("Hulk A Lover Not A Fighter!")
        UniToggleOpt("RF10")
    }
    if (HulkSmash) {
        CKTooltip("HULK SMASH!!!!!!!!!")
        UniToggleOpt("RF50")
    }
    Sleep, 70
    Send {INS}
return

UnicoreUltimate:
    CKTooltip("Going Super Saiyan")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("InfUlt")
    Sleep, 70
    Send {INS}
return

UnicoreCDReducer:
    CKTooltip("Cooldowns Now 50% OFF!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("CDReducer")
    Sleep, 70
    Send {INS}
return

UnicoreGodMode:
    CKTooltip("Bich Im Gawd Now!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("GodMode")
    Sleep, 150
    Send {INS}
return

UnicoreRF50:
    CKTooltip("RapidFire: 50")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF50")
    Sleep, 70
    Send {INS}
return

UnicoreRF40:
    CKTooltip("RapidFire: 40")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF40")
    Sleep, 70
    Send {INS}
return

UnicoreRF30:
    CKTooltip("RapidFire: 30")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF30")
    Sleep, 70
    Send {INS}
return

UnicoreRF20:
    CKTooltip("RapidFire: 20")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF20")
    Sleep, 70
    Send {INS}
return

UnicoreRF15:
    CKTooltip("RapidFire: 15")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF15")
    Sleep, 70
    Send {INS}
return

UnicoreRF10:
    CKTooltip("RapidFire: 10")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF10")
    Sleep, 70
    Send {INS}
return

UnicoreRF6:
    CKTooltip("RapidFire: 6")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF6")
    Sleep, 70
    Send {INS}
return

UnicoreRF3:
    CKTooltip("RapidFire: 3")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF3")
    Sleep, 70
    Send {INS}
return

UnicoreRF1:
    CKTooltip("RapidFire: 1")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RF1")
    Sleep, 70
    Send {INS}
return

UnicoreRapidFire:
    CKTooltip("Unicore Toggle: RapidFire")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RapidFire")
    Sleep, 70
    Send {INS}
return

UnicoreRFAoEMonsters:
    CKTooltip("Unicore Toggle: RapidFire AoE Monsters")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("RFAoEMonsters")
    Sleep, 70
    Send {INS}
return

UnicoreRapidOres:
    CKTooltip("Unicore Toggle: RapidFire Ores")
    RapidOre:=!RapidOre
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniGetOpts()
    if (RFAoEOres!=UniOptColON) {
        if (RFAoEMonsters==UniOptColON) {
            UniToggleOpt("RFAoEMonsters")
        }
        UniToggleOpt("RFAoEOres")
        Sleep, 70
        UniToggleOpt("RF50")
    } else {

    }
    UniToggleOpt("RFAoEMonsters")
return

UnicoreNoClip:
    CKTooltip("Unicore Toggle: NoClip")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniToggleOpt("NoClip")
    Sleep, 70
    Send {INS}
return

UnicoreStronk:
    CKTooltip("Making You Stronk!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniGetOpts()
    if (NoClip!=UniOptColON)
        UniToggleOpt("NoClip")
    if (GodMode!=UniOptColON)
        UniToggleOpt("GodMode")
    if (InfUlt!=UniOptColON)
        UniToggleOpt("InfUlt")
    if (RapidFire!=UniOptColON)
        UniToggleOpt("RapidFire")
    if (RFAoEMonsters!=UniOptColON)
        UniToggleOpt("RFAoEMonsters")
    if (RFAoEOres!=UniOptColON)
        UniToggleOpt("RFAoEOres")
    if (CDReducer!=UniOptColON)
        UniToggleOpt("CDReducer")
    if (InfStam!=UniOptColON)
        UniToggleOpt("InfStam")
    UniToggleOpt("RF30")
    Sleep, 250
    if (AutoLootItems!=UniOptColON)
        UniToggleOpt("AutoLootItems")
    Sleep, 70
    Send {INS}
return

UnicoreWeak:
    CKTooltip("Making You Weak!")
    pixelGetColor,IsUniUp,260,90,RGB,Fast
    if (IsUniUp!="0x00181F") {
        Send {INS}
        Sleep, 325
    }
    UniGetOpts()
    if (NoClip==UniOptColON)
        UniToggleOpt("NoClip")
    if (GodMode==UniOptColON)
        UniToggleOpt("GodMode")
    if (InfUlt==UniOptColON)
        UniToggleOpt("InfUlt")
    if (RapidFire==UniOptColON)
        UniToggleOpt("RapidFire")
    if (RFAoEMonsters==UniOptColON)
        UniToggleOpt("RFAoEMonsters")
    if (RFAoEOres==UniOptColON)
        UniToggleOpt("RFAoEOres")
    if (CDReducer==UniOptColON)
        UniToggleOpt("CDReducer")
    if (InfStam==UniOptColON)
        UniToggleOpt("InfStam")
    UniToggleOpt("RF1")
return

UnicoreReportOpts:
    Tooltip,NoClip %NoClip% GodMode %GodMode% InfUlt %InfUlt% `n RapidFire %RapidFire% RFMonsters %RFAoEMonsters% RFOres %RFAoEOres% `n SpeedDialog %SpeedupDialogs% CDReduce %CDReducer% InfStam %InfStam% `n Loot %AutoLootItems% Chests %AutoLootChests%,300,50,4
    Sleep, 3000
    Tooltip,,,,4
return