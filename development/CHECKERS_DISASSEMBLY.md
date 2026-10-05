# Activision Checkers cartridge disassembly

`checkers-activision.asm` is a DASM-compatible reconstruction of
`../rom/Checkers (Activision).bin`, an Atari 2600 2 KiB ROM mapped at
`$F000-$F7FF`.

It is a mechanically generated disassembly, not the original development
source.  Routine and data labels such as `LF448` retain the ROM address until
their purpose is established by debugging and testing.  This is intentional:
the listing is byte-accurate before it is made more readable.

## Build and verify

From the repository root, with DASM installed:

```sh
dasm development/checkers-activision.asm -f3 -odevelopment/checkers-activision.rebuilt.bin
cmp rom/'Checkers (Activision).bin' development/checkers-activision.rebuilt.bin
sha256sum development/checkers-activision.rebuilt.bin
```

The comparison exits with `0`; the expected SHA-256 is:

```text
140615d6873181e3a9f23338c623b62ee7f8a0c9da78766f7444b846c44201cf
```

The one explicit byte directive in the source preserves an original
three-byte absolute `STA $001C` instruction.  DASM normally shortens that
address to the two-byte zero-page form, which is functionally equivalent but
would no longer recreate the original ROM byte-for-byte.

## Relation to `checkers-master/`

`checkers-master/` is a separate 16-bit DOS/VGA Checkers project.  Its source
uses DOS interrupts, mouse input, and BMP graphics; it is not source for this
Atari 2600 cartridge and does not build the supplied ROM.

## Next annotation target

Start by naming the zero-page state at `$80-$B9`, the right/left joystick
handling around `$F08C`, and the move-validation routines around `$F30B` and
`$F51D`.  Use Stella's debugger with the assembled ROM to prove each proposed
name before changing labels.
