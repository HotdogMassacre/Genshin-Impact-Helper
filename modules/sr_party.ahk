PartyOCR: ;SC027 = ;
    global Party1:="", Party2:="", Party3:="", Party4:=""
    Party1:=% ScanChar(PaddleOCR([1645, 250, 150, 75]))
    Party2:=% ScanChar(PaddleOCR([1645, 340, 150, 75]))
    Party3:=% ScanChar(PaddleOCR([1645, 430, 150, 75]))
    Party4:=% ScanChar(PaddleOCR([1645, 526, 150, 75]))
    SM:=% "Party Setup Complete: `n" "Party1: " Party1 "`nParty2: " Party2 "`nParty3: " Party3 "`nParty4: " Party4
    CKTooltip(SM,0,0,3000)
return

TakePartyBitmap: ; SHIFT-` -- This outputs some screens so you can do UpdateEquippedParty Easier.
    pBitmap1 := Gdip_BitmapFromScreen(1785 "|" 240 "|" 35 "|" 35)
    Gdip_SaveBitmapToFile(pBitmap1, op "Party1.bmp")
    Gdip_DisposeImage(pBitmap1)
    pBitmap2 := Gdip_BitmapFromScreen(1785 "|" 336 "|" 35 "|" 35)
    Gdip_SaveBitmapToFile(pBitmap2, op "Party2.bmp")
    Gdip_DisposeImage(pBitmap2)
    pBitmap3 := Gdip_BitmapFromScreen(1785 "|" 427 "|" 35 "|" 35)
    Gdip_SaveBitmapToFile(pBitmap3, op "Party3.bmp")
    Gdip_DisposeImage(pBitmap3)
    pBitmap4 := Gdip_BitmapFromScreen(1785 "|" 523 "|" 35 "|" 35)
    Gdip_SaveBitmapToFile(pBitmap4, op "Party4.bmp")
    Gdip_DisposeImage(pBitmap4)
return

UpdateEquippedParty: ; SHIFT-'
    Party1_XStart:="1645", Party1_XEnd:="1780", Party1_YStart:="237", Party1_YEnd:="300"
    Party2_XStart:="1645", Party2_XEnd:="1780", Party2_YStart:="333", Party2_YEnd:="400"
    Party3_XStart:="1645", Party3_XEnd:="1780", Party3_YStart:="424", Party3_YEnd:="485"
    Party4_XStart:="1645", Party4_XEnd:="1780", Party4_YStart:="520", Party4_YEnd:="590"

    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    ;Gdip_SaveBitmapToFile(bmpHaystack, iPath)
    ;Gdip_DisposeImage(pBitmap)
    ;bmpHaystack := Gdip_CreateBitmapFromFile("screen.bmp")
    bmpNeedle1 := Gdip_CreateBitmapFromFile(cp "ayato.bmp")
    bmpNeedle2 := Gdip_CreateBitmapFromFile(cp "ayaka.bmp")
    bmpNeedle3 := Gdip_CreateBitmapFromFile(cp "raiden.bmp")
    bmpNeedle4 := Gdip_CreateBitmapFromFile(cp "diona.bmp")
    RET1 := Gdip_ImageSearch(pBitmap,bmpNeedle1,LIST1,0,0,0,0,100,,4,0)
    RET2 := Gdip_ImageSearch(pBitmap,bmpNeedle2,LIST2,0,0,0,0,100,,4,0)
    RET3 := Gdip_ImageSearch(pBitmap,bmpNeedle3,LIST3,0,0,0,0,100,,4,0)
    RET4 := Gdip_ImageSearch(pBitmap,bmpNeedle4,LIST4,0,0,0,0,100,,4,0)
    MsgBox, % "Ayato? " RET1 " @ " LIST1 "`nAyaka? " RET2 " @ " LIST2 "`nVenti? " RET3 " @ " LIST3 "`nBennett? " RET4 " @ " LIST4
    Gdip_DisposeImage(pBitmap)
    ;Gdip_DisposeImage(bmpNeedle)
    Gdip_DisposeImage(bmpNeedle1)
    Gdip_DisposeImage(bmpNeedle2)
    Gdip_DisposeImage(bmpNeedle3)
    Gdip_DisposeImage(bmpNeedle4)
return