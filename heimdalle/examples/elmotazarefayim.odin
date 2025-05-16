package examples

import "core:slice"
import "core:fmt"
import "core:intrinsics"
import "core:math"
import rl "vendor:raylib"

// <- window size constants ->
SCREEN_WIDTH :i32= 1280
SCREEN_HEIGHT :i32= 720

Exemplar :: proc() {
    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "HeimDalle")
    defer rl.CloseWindow()
    player_pos := rl.Vector2{640, 320}
    player_vel : rl.Vector2
    player_grounded: bool

    rl.SetTargetFPS(60)
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.BLACK)
        
        // <- Call the procs below to draw ->
        //HelloHeimDalle() // -> draws a pixelated HeimDalle Bridge; uncomment to see

        AboveNBelow() // -> draws a pixelated Sidis Checkerboard; uncomment to see

        //wowza() // -> draws a pixelated HeimDalle Bridge with a twist; uncomment to see

        // CosWave() // -> draws a pixelated Cosine Wave; uncomment to see

        //TanWave() // -> draws a pixelated Tangent Wave; uncomment to see

        // SinWave() // -> draws a pixelated Sine Wave; uncomment to see
        //NewWave3D()
        //NewWaveTwo()
        //NewWaveThree()

        if rl.IsKeyDown(.LEFT) {
            player_vel.x = -400
        } else if rl.IsKeyDown(.RIGHT) {
            player_vel.x = 400
        } else {
            player_vel.x = 0
        }

        player_vel.y += 2000 * rl.GetFrameTime()

        if player_grounded && rl.IsKeyPressed(.SPACE) {
            player_vel.y = -600
            player_grounded = false
        }

        player_pos += player_vel * rl.GetFrameTime()
        if player_pos.y > f32(rl.GetScreenHeight()) - 64 {
            player_pos.y = f32(rl.GetScreenHeight()) - 64
            player_grounded = true
        }

        rl.DrawRectangleV(player_pos, {64, 64}, rl.GREEN)
    }

    // <- Call the procs below to see the QGate in action ->
    // fmt.println(QGate(2, 2)) // -> returns true; uncomment to see


    // <- Call the procs below to see the trigonometric functions in action ->
    // fmt.println(BigTan(2)) // -> returns 2.1850399; uncomment to see
    // fmt.println(BigCos(2)) // -> returns -0.41614684; uncomment to see
    // fmt.println(BigSin(2)) // -> returns 0.9092974; uncomment to see

    // <- Call the procs below to see the power functions in action ->
    // fmt.println(DoublePow(2)) // -> returns 4; uncomment to see
    // fmt.println(TriplePow(2)) // -> returns 8; uncomment to see
    // fmt.println(QuadPow(2)) // -> returns 16; uncomment to see
    // fmt.println(PentaPow(2)) // -> returns 32; uncomment to see
    // fmt.println(HexaPow(2)) // -> returns 64; uncomment to see
    // fmt.println(SeptaPow(2)) // -> returns 128; uncomment to see
    // fmt.println(OctaPow(2)) // -> returns 256; uncomment to see
    // fmt.println(NonaPow(2)) // -> returns 512; uncomment to see
    // fmt.println(TenPow(2)) // -> returns 1024; uncomment to see

    // <- Call the procs below to see the root functions in action ->
    // fmt.println(HalfPow(2)) // -> returns 1.414; uncomment to see
    // fmt.println(ThirdPow(2)) // -> returns 1.259; uncomment to see
    // fmt.println(FourthPow(2)) // -> returns 1.189; uncomment to see
    // fmt.println(FifthPow(2)) // -> returns 1.148; uncomment to see
    // fmt.println(SixthPow(2)) // -> returns 1.122; uncomment to see
    // fmt.println(SeventhPow(2)) // -> returns 1.104; uncomment to see
    // fmt.println(EighthPow(2)) // -> returns 1.090; uncomment to see
    // fmt.println(NinthPow(2)) // -> returns 1.080; uncomment to see
    // fmt.println(TenthPow(2)) // -> returns 1.071; uncomment to see
    // fmt.println(WowPow(2)) // -> returns 1; uncomment to see
    // fmt.println(KingPow(2)) // -> returns 1; uncomment to see
}

A : [5000][5000]b64 = true
B : [5000][5000]b64 = false

HeimDalleGate :: proc() -> any { // Qbit genny
    if A == A || A != A || B == B || B != B || A == B || A != B {
        fmt.println("123! Open the HeimDalle and Set Us Free!")
        Exemplar()
        fmt.println(QGate(1, 2))
        CosmoNums()
        CosmoPolys()
        CosmoTrios()
        fmt.println(TenPow(10000000000))
        fmt.println("& Beyond the HeimDalle!")
    }
    return nil
}

QGate :: proc(x, y: int) -> bool { // supermath genny
    if x * y == x / y && x * y != x / y {
        fmt.println("QGate is true! This we already knew!")
        fmt.println("Now do what you do and close the HeimDalle plus two!")
    }
    return true
}

CosmoNums :: proc() {
        a := 11 * 11
        b := 111 * 111
        c := 1111 * 1111
        d := 11111 * 11111
        e := 111111 * 111111
        f := 1111111 * 1111111
        g := 11111111 * 11111111
        h := 111111111 * 111111111
        i :i128= 1111111111 * 111111111111
        fmt.println(a)
        fmt.println(b)
        fmt.println(c)
        fmt.println(d)
        fmt.println(e)
        fmt.println(f)
        fmt.println(g)
        fmt.println(h)
        fmt.println(i)    
}

CosmoPolys :: proc() {
    a := 11 * 111
    b := 111 * 1111
    c := 1111 * 11111
    d := 11111 * 111111
    e := 111111 * 1111111
    f := 1111111 * 11111111
    g := 11111111 * 111111111
    h := 111111111 * 1111111111
    i := 1111111111 * 1111111111
    fmt.println(a)
    fmt.println(b)
    fmt.println(c)
    fmt.println(d)
    fmt.println(e)
    fmt.println(f)
    fmt.println(g)
    fmt.println(h)
    fmt.println(i)    
}

CosmoTrios :: proc() {
    a := 11 * 1111
    b := 111 * 11111
    c := 1111 * 111111
    d := 11111 * 1111111
    e := 111111 * 11111111
    f := 1111111 * 111111111
    g := 11111111 * 1111111111
    h := 111111111 * 11111111111
    i := 1111111111 * 1111111111
    fmt.println(a)
    fmt.println(b)
    fmt.println(c)
    fmt.println(d)
    fmt.println(e)
    fmt.println(f)
    fmt.println(g)
    fmt.println(h)
    fmt.println(i)
}

BigTan :: proc(x: int) -> f32 {
    return math.tan_f32(f32(x))
}

BigCos :: proc(x: int) -> f32 {
    return math.cos_f32(f32(x))
}

BigSin :: proc(x: int) -> f32 {
    return math.sin_f32(f32(x))
}

DoublePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 2)
}

TriplePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 3)
}

QuadPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 4)
}

PentaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 5)
}

HexaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 6)
}

SeptaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 7)
}

OctaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 8)
}

NonaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 9)
}

TenPow :: proc(x: int) -> f64 {
    return f64(math.pow(f32(x), 10000000000))
}

HalfPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.5)
}

ThirdPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.333)
}

FourthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.25)
}

FifthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.2)
}

SixthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.166)
}

SeventhPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.142)
}

EighthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.125)
}

NinthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.111)
}

TenthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.1)
}

WowPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), (1/137))
}

KingPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), (2/3))
}

// <- The procs below are the pixelated drawings ->
// <- They use the Raylib library to draw ->
// <- They are commented out to avoid confusion ->


HelloHeimDalle :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 1..=SCREEN_WIDTH {
        for y in 1..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if int(math.cos_f32(center.x)) * int(math.sin_f32(center.y)) >= int(math.tan_f32(9.9)) {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}

AboveNBelow :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 1..=SCREEN_WIDTH {
        for y in 1..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.pow(math.tan_f32(center.x * center.y), 6) <= math.pow(math.tan_f32(center.x / center.y), (2/3)) * .000001 ||
            math.pow(math.tan_f32(center.x * center.y), 6) == math.pow(math.tan_f32(center.x / center.y), (2/3)) * .000001 {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}

wowza :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.sin_f32((center.x * center.y) * 3.6) >= math.sin_f32(center.y / 360) * 1 { // <- Multiply by 1.x to change parallax effect :: eg. 1.1, 1.2, 1.3, 1.etc-> 
                rl.DrawPixelV(center, color)
            }
        }
    }
}

CosWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigCos(int(center.x * center.y)) <= BigCos(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

TanWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigTan(int(center.x * center.y)) <= BigTan(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

SinWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigSin(int(center.x * center.y)) <= BigSin(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}


NewWave3D :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.cos_f32(center.x * center.x * center.x) + math.sin_f32(center.y * center.y * center.y) <= BigTan(0.0) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

NewWaveTwo :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.cos_f32(center.x) * math.sin_f32(center.y) >= BigTan(0.0) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

NewWaveThree :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.cos_f32(center.x) / math.sin_f32(center.y) <= BigTan(0.0) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

Redone := 1
Orangeone := 2
Yellowone := 3
Greenone := 4
Blueone := 5
Indigoone := 6
Violetone := 7
Brownone := 8
Chromaone := 9

Whiteprima := 1.0
Monochromaprima := 1.1
Blackprima := 1.2