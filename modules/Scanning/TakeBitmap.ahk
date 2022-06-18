TakeBitmap(x,y,w,h,file:="default.png") {
    pBitmap1 := Gdip_BitmapFromScreen(x "|" y "|" w "|" h)
    Gdip_SaveBitmapToFile(pBitmap1,file,100)
    Gdip_DisposeImage(pBitmap1)
}

TakeBitmap:
    ;TakeBitmap(996,738,250,35)
    ;TakeBitmap(1314,1006,250,35)
    ;TakeBitmap(1832,30,35,35)
    ;TakeBitmap(1013,860,300,35)
    ;TakeBitmap(1474,1000,175,35)
    TakeBitmap(1766,188,25,25)
    CKTooltip("Bitmap Completed")
return