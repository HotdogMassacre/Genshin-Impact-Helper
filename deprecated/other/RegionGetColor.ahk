regionGetColor(x, y, w, h, hwnd=0) {
; created by Infogulch - thanks to Titan for much of this
; x, y, w, h  ~  coordinates of the region to average
; hwnd        ~  handle to the window that coords refers to
   DllCall("QueryPerformanceCounter", "Int64 *", Start1)
   regionGetBmp(bmp, dc, obj, x, y, w, h, hwnd)
   
   retval := Format(AvgBitmap(bmp, w, h), "Integer", "Hex")
   
   regionCleanBmp(bmp, dc, obj)
   DllCall("QueryPerformanceCounter", "Int64 *", End1), DllCall("QueryPerformanceFrequency", "Int64 *", f)
   return retval, ErrorLevel := (End1-Start1)/f
}

regionGetBmp(ByRef membmp, ByRef memdc, ByRef memobj, x, y, w, h, hwnd=0) {
; created by Infogulch
; x, y, w, h  ~  coordinates of the region to get
; hwnd        ~  handle to the window that coords refers to (omit for screen-relative)
   If !hwnd, hdc := GetDC( hwnd )
      hcdc := hdc
   Else
   {
      WinGetPos, , , hwndW, hwndH, ahk_id %hwnd%
      hcdc := CreateCompatibleDC( hdc )
      , hbmp := CreateCompatibleBitmap( hdc, hwndW, hwndH )
      , hobj := SelectObject( hcdc, hbmp )
      , PrintWindow( hwnd, hcdc, 0 )
   }
   memdc := CreateCompatibleDC( hdc )
   , membmp := CreateCompatibleBitmap( hdc, w, h )
   , memobj := SelectObject( memdc, membmp )
   , BitBlt( memdc, 0, 0, w, h, hcdc, x, y, 0xCC0020 )
   If hbmp
      DeleteObject(hbmp), SelectObject(hcdc, hobj), DeleteDC(hcdc)
   ReleaseDC(hwnd, hdc)
}
regionCleanBmp(bmp, dc, obj) {
   DeleteObject(bmp), SelectObject(dc, obj), DeleteDC(dc)
}

AvgBitmap(hbmp, w, h) {
; by Infogulch
; hbmp  ~  handle to an existing bitmap
; pc    ~  size of the bitmap, should be w * h
; http://msdn.microsoft.com/en-us/library/dd144850(VS.85).aspx
   
   pc := w*h, DllCall("GetBitmapBits", "UInt", hbmp, "UInt", VarSetCapacity(bits, pc*4, 0), "UInt", &bits)
   SumIntBytes(bits, pc, ca, cr, cg, cb)
   return ((Round(cr/pc) & 0xff) << 16) | ((Round(cg/pc) & 0xff) << 8) | (Round(cb/pc) & 0xff)
}
Histogram(hbmp, w, h) {
   pc := w*h, DllCall("GetBitmapBits", "UInt", hbmp, "UInt", VarSetCapacity(bits, pc*4, 0), "UInt", &bits)
   SumIntBytes(bits, pc, ca, cr, cg, cb)
   avglum := LumR(cr/pc)+LumG(cg/pc)+LumB(cb/pc)
   i := pc
   while i-- > 0
      NumPut(lum(NumGet(bits,i*4)) > avglum ? 0xffffff : 0, bits, i*4)
   DllCall("SetBitmapBits", "UInt", hbmp, "UInt", pc*4, "UInt", &bits)
   return avglum
}
SumIntBytes( ByRef arr, len, ByRef a, ByRef r, ByRef g, ByRef b ) {
; by infogulch
; 32 bit:             16,843,009 px ||       4,104 x       4,104 px screen
; 64 bit: 72,340,172,838,076,673 px || 268,961,285 x 268,961,285 px screen
   static f, i
   if !i
   {
      t =
      (LTrim Join
      558bec81eccc0000005356578dbd34ffffffb933000000b8ccccccccf3abc745
      f800000000eb098b45f883c0018945f88b45f83b450c0f83940000008b45f88b
      4d088b1481c1ea1833c08b4d1003118b490413c88b451089108948048b45f88b
      4d088b1481c1ea1081e2ff00000033c08b4d1403118b490413c88b4514891089
      48048b45f88b4d088b1481c1ea0881e2ff00000033c08b4d1803118b490413c8
      8b451889108948048b45f88b4d088b148181e2ff00000033c08b4d1c03118b49
      0413c88b451c8910894804e957ffffff5f5e5b8be55dc3
      )
      VarSetCapacity(f, tl := StrLen(t)/2), i := 0
      While i < tl
         NumPut("0x" SubStr(t, i*2+1, 2), f, i++, "UChar")
   }
      VarSetCapacity(a, 8, 0), VarSetCapacity(r, 8, 0)
   , VarSetCapacity(g, 8, 0), VarSetCapacity(b, 8, 0)
   , DllCall( &f, "UInt", &arr, "UInt", len
      , "UInt", &a, "UInt", &r, "UInt", &g, "UInt", &b
      , "CDecl")
   , a := NumGet(a, 0, "UInt64"), r := NumGet(r, 0, "UInt64")
   , g := NumGet(g, 0, "UInt64"), b := NumGet(b, 0, "UInt64")
}


regionWaitColor(color, X, Y, W, H, hwnd=0, interval=100, timeout=5000, a="", b="", c="") {
   CompareColor := (color != "" ? color : regionGetColor(X, Y, W, H, hwnd))
   Start := A_TickCount
   while !(color ? retVal : !retVal) && !(timeout > 0 ? A_TickCount-Start > timeout : 0)
   {
      retVal := regionCompareColor( CompareColor, x, y, w, h, hwnd, a, b, c)
      If interval
         Sleep interval
   }
   ErrorLevel := A_TickCount-Start
   Return (color ? retVal : !retVal)
}
regionCompareColor(color, x, y, w, h, hwnd=0, a="", b="", c="") {
   return withinVariation(regionGetColor(x, y, w, h, hwnd), color, a, b, c)
}

;general color functions
withinVariation( x, y, a, b="", c="") {
; return wether x is within �A �B �C of y
; if a is blank return wether x = y
; if b or c is blank, they are set equal to a
    If (a = "")
        return (x = y)
    v := Variation(x, y)
    return v >> 16 & 0xFF <= a
        && v >> 8  & 0xFF <= (b+0 ? b : a)
        && v       & 0xFF <= (c+0 ? c : a)
}
Variation( x, y ) {
    return Abs((x & 0xFF0000) - (y & 0xFF0000))
         | Abs((x & 0x00FF00) - (y & 0x00FF00))
         | Abs((x & 0x0000FF) - (y & 0x0000FF))
}
Color_Invert(x, a = "") {
; by Infogulch
; inverts the rgb/bgr hex color passed
; x: color to be inverted
; a: true to invert alpha as well
   return ~x & (a ? 0xFFFFFFFF : 0xFFFFFF)
}
Lum(color) {
   ; http://rosettacode.org/wiki/Grayscale_image
   return 0.2126*(color >> 16 & 0xff) + 0.7152*(color >> 8 & 0xff) + 0.0722*(color & 0xff)
}
LumR(r) {
   return 0.2126*r ;255*(r/255)**2.2
}
LumG(g) {
   return 0.7152*g ;255*(g/255)**2.2
}
LumB(b) {
   return 0.0722*b ;255*(b/255)**2.2
}
Color_FromRGB(r, g, b) {
   return ((round(r)&0xff)<<16) | ((round(g)&0xff)<<8) | (round(b)&0xff)
}
Color_ToRGB(c, ByRef r, ByRef g, ByRef b) {
   r := c >> 16 & 0xff, g := c >> 8 & 0xff, b := c & 0xff
}


Format(x, type, format) {
   ; this ought to be built-in. instead i have to have this ugly wrapper function.
   ofmt := A_Format%type%
   SetFormat, %type%, %format%
   x += 0
   SetFormat, %type%, %ofmt%
   return x
}

;required mfc wrapper not included in GDIP:
;CreateCompatibleBitmap(hdc, w, h) {
;   return DllCall("CreateCompatibleBitmap", "UInt", hdc, "Int", w, "Int", h)
;}