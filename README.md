## Atari 2600 cartridge and Checkers agent project

This repository combines a simple Atari 2600 cartridge PCB with a focused
development project: let a human play Activision Checkers against an agent
that operates the second physical joystick.

The current first milestone is not a stronger Checkers engine. It is a
reliable, observable joystick move executor: given a legal move, the agent
must navigate the in-game cursor, pick up a checker, place it, and verify the
result from video.

## Repository layout

| Path | Contents |
| --- | --- |
| [`board/`](board/) | Two-layer fabrication files for the **4K rev C** Atari 2600 cartridge PCB, its drill file, BOM, and connector references. |
| [`rom/`](rom/) | The 2 KiB Activision Checkers cartridge image used as the current development target. |
| [`development/`](development/) | Checkers agent plan, manual reference, and a reproducible 6502 assembly reconstruction. |

## Cartridge hardware

The PCB fabrication files are in [`board/4k rev c/`](board/4k%20rev%20c/).
It is a 4K-class cartridge design. The BOM specifies:

- U1: 27C16 or 27C32 EPROM (CMOS is acceptable; speed is not critical)
- U2: 74LS04, 14-pin DIP hex inverter
- C1: 0.1 µF ceramic bypass capacitor

The complete Gerber set consists of top/bottom copper, solder mask,
silkscreen, outline, and Excellon drill data. Provide the complete directory
to a PCB fabricator; do not upload individual layers in isolation. The
repository currently contains fabrication output rather than an editable
schematic or native PCB project, so board changes should begin by recovering
or recreating those design sources.

Reference images:

- [`board/cartridge-slot-pinout.jpg`](board/cartridge-slot-pinout.jpg)
- [`board/cartridge-pal.jpg`](board/cartridge-pal.jpg)

## Checkers target

[`rom/Checkers (Activision).bin`](rom/Checkers%20(Activision).bin) is a 2 KiB
Atari 2600 ROM and fits the 27C16 option. Its SHA-256 is:

```text
140615d6873181e3a9f23338c623b62ee7f8a0c9da78766f7444b846c44201cf
```

In Checkers Game 4, the human uses the left joystick for the bottom pieces;
the agent uses the right joystick for the top pieces. A person selects Game 4
and resets the console. The agent's scope begins once play starts: it has a
video feed and can issue only joystick directions and fire-button presses.

The implementation plan and the definition of done for the first hardware
milestone are in [`development/CHECKERS_AGENT_START.md`](development/CHECKERS_AGENT_START.md).
The freely reusable game manual is kept at
[`development/references/activision-checkers-manual.pdf`](development/references/activision-checkers-manual.pdf).

## Disassembly

[`development/checkers-activision.asm`](development/checkers-activision.asm)
is a DASM-compatible reconstruction of the Checkers ROM, generated with
DiStella and corrected to retain the ROM's original instruction encodings.
It is not the original authored source: its labels remain address-based until
they are proven by emulator debugging.

With [DASM](https://dasm-assembler.github.io/) installed, reproduce and
verify the image from the repository root:

```sh
dasm development/checkers-activision.asm -f3 -odevelopment/checkers-activision.rebuilt.bin
cmp rom/'Checkers (Activision).bin' development/checkers-activision.rebuilt.bin
sha256sum development/checkers-activision.rebuilt.bin
```

`cmp` must exit with `0` and the checksum must match the value above. See
[`development/CHECKERS_DISASSEMBLY.md`](development/CHECKERS_DISASSEMBLY.md)
for caveats, provenance, and suggested annotation work.

## Next work

1. Build a right-port joystick adapter with neutral, eight-direction, and
   fire outputs.
2. Write and replay command traces for known Checkers moves against an
   emulator, then real hardware.
3. Add video-based board, cursor, and turn recognition.
4. Name and document the ROM's zero-page state and move-validation routines
   while preserving the byte-identical assembly build.

## License

The repository is provided under [GPL-3.0](LICENSE). Preserve any applicable
third-party attribution when distributing the included reference material or
derived work.
