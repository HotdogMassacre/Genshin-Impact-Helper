ScanScreen(X1,Y1,X2,Y2,needle:="needles\teleport.png",k=0,variation=150) {
    file=% "scanfile_" k ".png"
    pBitmap := Gdip_BitmapFromScreen(X1 "|" Y1 "|" X2 "|" Y2)
    ;pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    Gdip_SaveBitmapToFile(pBitmap,file,100)
    bmpNeedle:=Gdip_CreateBitmapFromFile(needle)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,variation,,4,0)
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
    ;Tooltip,%RET%`n%LOC%,600,20,5
    ;MsgBox,RET=%RET%`nLOC=%LIST%
    return %RET%
}

ScanChar(what) {
    If InStr(what,"Ayato",false) {
        return "Kamisato Ayato"
    }
    Else If InStr(what,"Ayaka",false) {
        return "Kamisato Ayaka"
    }
    Else If InStr(what,"Sucrose",false) {
        return "Sucrose"
    }
    Else If InStr(what,"Venti",false) {
        return "Venti"
    }
    Else If InStr(what,"Bennett",false) {
        return "Bennett"
    }
    Else If InStr(what,"Diona",false) {
        return "Diona"
    }
    Else If InStr(what,"Jean",false) {
        return "Jean"
    }
    Else If InStr(what,"Kazuha",false) {
        return "Kaedehara Kazuha"
    }
    Else If InStr(what,"dehara",false) {
        return "Kaedehara Kazuha"
    }
    Else If InStr(what,"Barbara",false) {
        return "Barbara"
    }
    Else If InStr(what,"Ningguang",false) {
        return "Ningguang"
    }
    Else If InStr(what,"Mona",false) {
        return "Mona"
    }
    Else If InStr(what,"Hu Tao",false) {
        return "Hu Tao"
    }
    Else If InStr(what,"Kaeya",false) {
        return "Kaeya"
    }
    Else If InStr(what,"Chongyun",false) {
        return "Chongyun"
    }
    Else If InStr(what,"Aloy",false) {
        return "Aloy"
    }
    Else If InStr(what,"Itto",false) {
        return "Arataki Itto"
    }
    Else If InStr(what,"Arataki",false) {
        return "Arataki Itto"
    }
    Else If InStr(what,"Thoma",false) {
        return "Thoma"
    }
    Else If InStr(what,"Gorou",false) {
        return "Gorou"
    }
    Else If InStr(what,"Miko",false) {
        return "Yae Miko"
    }
    Else If InStr(what,"Sara",false) {
        return "Kujou Sara"
    }
    Else If InStr(what,"Kujou",false) {
        return "Kujou Sara"
    }
    Else If InStr(what,"Sayu",false) {
        return "Sayu"
    }
    Else If InStr(what,"Yoimiya",false) {
        return "Yoimiya"
    }
    Else If InStr(what,"Rosaria",false) {
        return "Rosaria"
    }
    Else If InStr(what,"Eula",false) {
        return "Eula"
    }
    Else If InStr(what,"Yanfei",false) {
        return "Yanfei"
    }
    Else If InStr(what,"Tartaglia",false) {
        return "Tartaglia"
    }
    Else If InStr(what,"Ganyu",false) {
        return "Ganyu"
    }
    Else If InStr(what,"Albedo",false) {
        return "Albedo"
    }
    Else If InStr(what,"Qiqi",false) {
        return "Qiqi"
    }
    Else If InStr(what,"Klee",false) {
        return "Klee"
    }
    Else If InStr(what,"Zhongli",false) {
        return "Zhongli"
    }
    Else If InStr(what,"Xinyan",false) {
        return "Xinyan"
    }
    Else If InStr(what,"Keqing",false) {
        return "Keqing"
    }
    Else If InStr(what,"Diluc",false) {
        return "Diluc"
    }
    Else If InStr(what,"Fischl",false) {
        return "Fischl"
    }
    Else If InStr(what,"Lisa",false) {
        return "Lisa"
    }
    Else If InStr(what,"Beidou",false) {
        return "Beidou"
    }
    Else If InStr(what,"Amber",false) {
        return "Amber"
    }
    Else If InStr(what,"Noelle",false) {
        return "Noelle"
    }
    Else If InStr(what,"Razor",false) {
        return "Razor"
    }
    Else If InStr(what,"Xiangling",false) {
        return "Xiangling"
    }
    Else If InStr(what,"Xiao",false) {
        return "Xiao"
    }
    Else If InStr(what,"Sangonomiya",false) {
        return "Kokomi"
    }
    Else If InStr(what,"Kokomi",false) {
        return "Kokomi"
    }
    Else If InStr(what,"Shenhe",false) {
        return "Shenhe"
    }
    Else If InStr(what,"Yelan",false) {
        return "Yelan"
    }
}