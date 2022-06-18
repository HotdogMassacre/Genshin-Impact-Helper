CKTooltip(t,x:=0,y:=0,ttl:=0)
{
    SetTimer, TooltipClear, OFF
    if (!x) 
        x:=(A_ScreenWidth // 2)
    if (!y) 
        y:=(A_ScreenHeight // 2)
    if (!ttl) 
        ttl:=800

    Tooltip,%t%,%x%,%y%,1
    SetTimer, TooltipClear, %ttl%
}