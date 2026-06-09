#NoEnv
#SingleInstance Force
#MaxThreadsPerHotkey 2

; ==================================================
; CONTROLS
; ==================================================
; F1 = Start / Pause Macro (if a Sleep is currently running,
;      the pause may take a moment to take effect)
; F2 = Close Macro

; ==================================================
; CONFIGURATION
; ==================================================
; Resolution used during development: 2560x1440
; AutoHotkey v1.1.37
; Coordinates obtained using Window Spy from AutoHotkey
; CoordMode: Screen

CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

; ==================================================
; REFERENCE PIXELS
; ==================================================

missionX := 2057
missionY := 55
missionColor := "0xFFAA33"

challengerX := 2073
challengerY := 1203
challengerColor := "0xFFDD00"

returnX := 1546
returnY := 107
returnColor := "0xFFFFFF"

; ==================================================
; ARENA CLICKS (Challenger -> Master/Diamond -> Yes)
; ==================================================

arena1X := 774
arena1Y := 726

arena2X := 2216
arena2Y := 630

arena3X := 1098
arena3Y := 959

; ==================================================
; CHALLENGER SELECTION (Main -> Secondary)
; ==================================================

challenger1X := 617
challenger1Y := 775

challenger2X := 600
challenger2Y := 908

challenger3X := 601
challenger3Y := 1038

startArenaX := 613
startArenaY := 1286

; ==================================================

running := false

F1::
running := !running

if (running)
{
    Gosub, Macro
}
return

F2::ExitApp

Macro:
while (running)
{
    ; Reload weapon before starting
    Send, {r down}
    Sleep, 100
    Send, {r up}
    Sleep, 3000

    ; Hold S for 1 second to walk down
    Send, {s down}
    Sleep, 1000
    Send, {s up}

    ; Press E to enter the arena
    Send, {e down}
    Sleep, 100
    Send, {e up}

    ; Wait for the yellow Mission indicator to disappear
    ; If your game does not have Mission, use the white compass eagle instead
    Loop
    {
        if (!running)
            break

        PixelGetColor, color, %missionX%, %missionY%, RGB

        if (color != missionColor)
            break

        Sleep, 100
    }

    Sleep, 500

    ; Arena clicks (Challenger, Master/Diamond, Yes)
    Click, %arena1X%, %arena1Y%

    Sleep, 900
    Click, %arena2X%, %arena2Y%

    Sleep, 900
    Click, %arena3X%, %arena3Y%

    ; Wait for challenger selection screen
    ; Yellow Mission indicator gone + green challenger ready indicator visible
    ; If your game does not have Mission, use the white compass eagle instead
    Loop
    {
        if (!running)
            break

        PixelGetColor, missionColorCurrent, %missionX%, %missionY%, RGB
        PixelGetColor, challengerColorCurrent, %challengerX%, %challengerY%, RGB

        if (missionColorCurrent != missionColor
            && challengerColorCurrent = challengerColor)
            break

        Sleep, 200
    }

    ; Select challengers (main + secondary)
    Click, %challenger1X%, %challenger1Y%
    Sleep, 900

    Click, %challenger2X%, %challenger2Y%
    Sleep, 900

    Click, %challenger3X%, %challenger3Y%
    Sleep, 900

    ; Start arena
    Click, %startArenaX%, %startArenaY%

    ; Arena loading time
    Sleep, 2400

    ; Hold Space to skip arena intro
    Send, {Space down}
    Sleep, 1600
    Send, {Space up}
    Sleep, 1500

    ; Fire weapon 10 times
    Loop, 10
    {
        Click
        Sleep, 200
    }

    ; Arena completed
    ; Wait for yellow Mission indicator + white compass eagle
    ; If your game does not have Mission, use only the white compass eagle
    Loop
    {
        if (!running)
            break

        PixelGetColor, missionColorCurrent, %missionX%, %missionY%, RGB
        PixelGetColor, returnColorCurrent, %returnX%, %returnY%, RGB

        if (missionColorCurrent = missionColor
            && returnColorCurrent = returnColor)
            break

        Sleep, 200
    }
}
return
