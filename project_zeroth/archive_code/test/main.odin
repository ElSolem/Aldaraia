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

Seat :: struct {
    table: Parity,    // which table 
    seat: Position    // specific seat on the table
}
Token :: struct {
    timestamp: time.Time,
    position: Seat,   // table and seat
    type: TokenType,      // Weak, Strong, Surprise, Unknown
    polarity: Polarity,   // Negative, Positive    
    lifecycle: int        // 1 (birth) to 20 (death/transformation)
}

tokens := make(map[string]Token)
token_counter := 0  // Global counter for unique token keys

create_tokens_for_time :: proc(time_to_create: time.Time) {
    // Buffer to hold the formatted time string
    time_buffer: []u8 = make([]u8, 20)
    
    // Create tokens for Even table (head)
    time_str_even := fmt.tprint(time.to_string_hms(time_to_create, time_buffer))
    token_key_even_weak := fmt.tprint(time_str_even, "-Weak-", token_counter)
    tokens[token_key_even_weak] = Token{
        timestamp = time_to_create,
        type = TokenType.Weak,
        polarity = Polarity.Negative,  // Negative polarity for weak
        position = Seat{ table = Parity.Even, seat = Position.Head },
        lifecycle = 1,
    }
    token_counter += 1  
    
    token_key_even_strong := fmt.tprint(time_str_even, "-Strong-", token_counter)
    tokens[token_key_even_strong] = Token{
        timestamp = time_to_create,
        type = TokenType.Strong,
        polarity = Polarity.Positive,  // Positive polarity for strong
        position = Seat{ table = Parity.Even, seat = Position.Head },
        lifecycle = 1,
    }
    token_counter += 1  

    // Create tokens for Odd table (head)
    time_str_odd := fmt.tprint(time.to_string_hms(time_to_create, time_buffer))
    token_key_odd_weak := fmt.tprint(time_str_odd, "-Weak-", token_counter)
    tokens[token_key_odd_weak] = Token{
        timestamp = time_to_create,
        type = TokenType.Weak,
        polarity = Polarity.Positive,  // Positive polarity for weak (Odd table)
        position = Seat{ table = Parity.Odd, seat = Position.Head },
        lifecycle = 1,
    }
    token_counter += 1  

    token_key_odd_strong := fmt.tprint(time_str_odd, "-Strong-", token_counter)
    tokens[token_key_odd_strong] = Token{
        timestamp = time_to_create,
        type = TokenType.Strong,
        polarity = Polarity.Negative,  // Negative polarity for strong (Odd table)
        position = Seat{ table = Parity.Odd, seat = Position.Head },
        lifecycle = 1,
    }
    token_counter += 1  
}

main :: proc() {
    time_now := time.now()
    create_tokens_for_time(time_now)  // First round of token creation
    fmt.println("Token Counter after creation:", token_counter)  
    for key, token in tokens {
        fmt.println("Token:", key, ", Polarity:", token.polarity)
    }

    time.sleep(1000 * time.Millisecond)  // Sleep for 1 second

    time_now = time.now()
    create_tokens_for_time(time_now)  
    fmt.println("Token Counter after second creation:", token_counter)  
    for key, token in tokens {
        fmt.println("Token:", key, ", Polarity:", token.polarity)
    }
}
