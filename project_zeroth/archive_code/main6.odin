package zeroth

import "core:fmt"
import "base:builtin"
import "core:time"

HEAD_SEAT_COUNT :: 2
TAIL_SEAT_COUNT :: 2
SEAT_COUNT_PER_SIDE :: 9
SEAT_COUNT_PER_TABLE :: SEAT_COUNT_PER_SIDE * 2
TABLE_COUNT :: 2
TOTAL_SEAT_COUNT :: SEAT_COUNT_PER_TABLE * TABLE_COUNT

TokenType :: enum { Weak, Strong, Surprise, Unknown } // +, -, !, ?
Polarity  :: enum { Negative, Positive } // -, +
Parity    :: enum { Even, Odd } // 0, 1: Positive and Negative tables

Position :: enum {
    Head, Tail,
    L1, L2, L3, L4, L5, L6, L7, L8, L9,
    R1, R2, R3, R4, R5, R6, R7, R8, R9
}

Token :: struct {
    awake: bool,
    type: TokenType,      // Weak, Strong, Surprise, Unknown
    polarity: Polarity,   // Negative, Positive    
    seat_parity: Parity,  // table (Parity)
    seat_position: Position,  // specific seat position (Position)
    lifecycle: int        // 1 (birth) to 20 (death/transformation)
}

tokens: [dynamic]Token

create_head_tokens :: proc() {
    // Create Even and Odd Start Tokens
    even_neg_token := Token{
        awake = false,
        type = TokenType.Weak,
        polarity = Polarity.Negative,
        seat_parity = Parity.Even,
        seat_position = Position.Head,
        lifecycle = 1,
    }

    even_pos_token := Token{
        awake = false,
        type = TokenType.Strong,
        polarity = Polarity.Positive,
        seat_parity = Parity.Even,
        seat_position = Position.Head,
        lifecycle = 1,
    }

    odd_neg_token := Token{
        awake = false,
        type = TokenType.Weak,
        polarity = Polarity.Negative,
        seat_parity = Parity.Odd,
        seat_position = Position.Head,
        lifecycle = 1,
    }

    odd_pos_token := Token{
        awake = false,
        type = TokenType.Strong,
        polarity = Polarity.Positive,
        seat_parity = Parity.Odd,
        seat_position = Position.Head,
        lifecycle = 1,
    }

    append(&tokens, even_neg_token, even_pos_token, odd_neg_token, odd_pos_token)
}

main :: proc() {

    for a in 1..=100_000 {
        b := a + 1
        for b in 1..=100_000 {
            if a * b == a/b {
                create_head_tokens()
                fmt.println("Tokens created: ", len(tokens))
                time.sleep(1000)
            }
        }
    }
}