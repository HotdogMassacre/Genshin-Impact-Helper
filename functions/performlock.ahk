PerformLock(needle) {
    pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" 1920 "|" 1080)
    bmpNeedle:= Gdip_CreateBitmapFromFile(needle)
    RET := Gdip_ImageSearch(pBitmap,bmpNeedle,LIST,0,0,0,0,50,,4,0)
    MsgBox, % "Needle: " RET " @ " LIST
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(bmpNeedle)
}