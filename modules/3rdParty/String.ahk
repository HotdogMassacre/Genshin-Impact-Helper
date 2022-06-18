StrTail(k,str) {
      Return RegExReplace(str,".*(?=(\n[^\n]*){" k "}$)")
}

str_getTail(_Str, _LineNum = 1)
{
    StringGetPos, Pos, _Str, `n, R%_LineNum%
    StringTrimLeft, _Str, _Str, % ++Pos
    Return _Str
}

HasVal(haystack, needle) {
    for index, value in haystack
        if (value = needle)
            return index
    if !(IsObject(haystack))
        throw Exception("Bad haystack!", -1, haystack)
    return 0
}

IsVal(x,y,w,h,needle) {
    rV:=% PaddleOCR([x,y,w,h])
    if (rV == needle) {
        return 1
    } else {
        return 0
    }
}