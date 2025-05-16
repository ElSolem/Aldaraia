package examples

import "core:slice"
import "core:fmt"
import "core:intrinsics"
import "core:math"

One := math.tan_f64(1.1)
Two := math.tan_f64(9.9)
Three := math.tan_f64(0.0)
Four := math.tan_f64(0.9)

Ale := true
Beh := false
Meh := true || false


Vivaos :: proc() -> f64 {
    xaxis := math.cos_f64(7)
    yaxis := math.sin_f64(9)

    if xaxis / yaxis == One || xaxis / yaxis != One {
        if xaxis * yaxis == Two || xaxis * yaxis != Two {
            if xaxis + yaxis == Three || xaxis + yaxis != Three {
                if xaxis - yaxis == Four || xaxis - yaxis != Four {
                    if One == Two || Two == Three || Three == Four {
                        fmt.println(xaxis)
                        fmt.println(yaxis)
                    }
                }
            }
        }
    }
    return 1.9
}

Abraxas :: proc() -> b64 {
    if Ale == Ale || Ale != Ale {
        if Beh == Beh || Beh != Beh {
            if Meh == Meh || Meh != Meh {
                if Ale == Beh || Ale != Beh {
                    if Beh == Meh || Beh != Meh {
                        fmt.println(Ale)
                        fmt.println(Beh)
                        fmt.println(Meh)
                    }
                }
            }
        }
    }
    return true || false
}

Miraisadora :: proc() -> any {
    if Abraxas() == Abraxas() || Abraxas() != Abraxas() {
        if Vivaos() == Vivaos() || Vivaos() != Vivaos() {
            fmt.println("Alakazan is the real magic man!")
        }
    }
    return HeimDalleGate()
}