
;REGION Character Switcher
GICSHK := [{"$1": "1"
    , "$2": "2"
    , "$3": "3"
    , "$4": "4"
    , "$5": "5"}]
GICSHotKeys:=GICSHK.1
for key, mapping in GICSHotKeys {
	fn := Func("GICSSend").Bind(mapping)
	HotKey, % key, % fn
}
GICSSend(keySent) {
    KeyWait, %keySent%, T0.35
    if ErrorLevel {
        Send {Alt Down}
        Send %keySent%
        Send {Alt Up}
        Sleep, 150
        Send {q}
    } else {
        Send %keySent%
    }
}
;ENDREGION
