from enum import IntFlag, Enum
from dataclasses import dataclass
import numpy as np

# === ENUMS & BITFLAGS ===

class TokenType(Enum):
    """Defines different types of tokens."""
    WEAK = 1
    STRONG = 2
    SURPRISE = 3
    UNKNOWN = 4

class TokenProperties(IntFlag):
    """Bitflags for token states (allows combinations)."""
    POSITIVE = 1 << 0  # 0001
    NEGATIVE = 1 << 1  # 0010
    EVEN     = 1 << 2  # 0100
    ODD      = 1 << 3  # 1000

class Position(Enum):
    """Defines where tokens exist in the system."""
    HEAD = 0
    TAIL = 1
    L1 = 2
    L2 = 3
    L3 = 4
    L4 = 5
    R1 = 6
    R2 = 7
    R3 = 8
    R4 = 9

# === STRUCT-LIKE TOKEN CLASS ===

@dataclass
class Token:
    """Represents a single token in the Zeroth Machine."""
    token_type: TokenType
    properties: TokenProperties
    position: Position
    lifecycle: int = 1  # Default lifecycle (1-20 cycles)

    def transform(self):
        """Handles token evolution after 20 cycles."""
        if self.lifecycle >= 20:
            if self.token_type == TokenType.WEAK:
                self.token_type = TokenType.UNKNOWN
            elif self.token_type == TokenType.STRONG:
                self.token_type = TokenType.SURPRISE
        self.lifecycle += 1

    def move(self):
        """Defines basic movement logic based on properties."""
        if self.properties & TokenProperties.EVEN:
            self.position = Position.R1
        elif self.properties & TokenProperties.ODD:
            self.position = Position.L1

# === TOKEN CREATION FUNCTION ===

def create_initial_tokens():
    """Generates the first four starting tokens."""
    return np.array([
        Token(TokenType.WEAK, TokenProperties.NEGATIVE | TokenProperties.EVEN, Position.HEAD),
        Token(TokenType.STRONG, TokenProperties.POSITIVE | TokenProperties.EVEN, Position.HEAD),
        Token(TokenType.WEAK, TokenProperties.NEGATIVE | TokenProperties.ODD, Position.HEAD),
        Token(TokenType.STRONG, TokenProperties.POSITIVE | TokenProperties.ODD, Position.HEAD),
    ])

# === PROCESSING FUNCTION ===

def process_tokens(tokens):
    """Processes all tokens for one cycle."""
    for token in tokens:
        token.transform()  # Check if it needs to evolve
        token.move()  # Move token based on its properties
        print(f"Token {token.token_type.name} at {token.position.name} - Lifecycle: {token.lifecycle}")

# === MAIN SIMULATION LOOP ===

tokens = create_initial_tokens()

for _ in range(20):  # Simulate 20 cycles
    process_tokens(tokens)
