# Checkers: human versus joystick agent

## Goal

Let a human play the bottom side of Activision Checkers on an Atari 2600
while an agent plays the top side through the right joystick port.  The agent
must use the same directions and fire button available to a person.

## Why this is the first title

Checkers is the smallest practical first experiment in this collection:

- The cartridge image is 2 KiB, which fits the existing 4K board's 27C16
  option.
- Game 4 is a dedicated two-human-player mode: left joystick controls the
  bottom pieces and right joystick controls the top pieces.
- A move has no real-time deadline, and the game rejects illegal placements.
- The game state is a fixed 8 by 8 board, so video-based state recognition is
  tractable and easy to validate against expected squares.

## Reference material

The freely usable local copy is the implementation reference:

- [`references/activision-checkers-manual.pdf`](references/activision-checkers-manual.pdf)

Source attribution and an accessible HTML transcription are retained here:

- [Activision Checkers instructions, archived by AtariAge](https://www.atariage.com/manual_html_page.php?SoftwareLabelID=77)
- [Manual scan source at Digital Press](https://www.digitpress.com/library/manuals/atari2600/checkers.pdf)

The implementation-critical rules from the manual are: select Game 4; the
left joystick plays bottom pieces and the right joystick plays top pieces;
move the flashing X diagonally; press fire to pick up a checker and again to
place it.  Forced jumps and chained jumps are enforced by the game.

## Setup contract

The first prototype deliberately does not automate console switches.

1. A human inserts a legally obtained Checkers cartridge image, selects
   Game 4, chooses sides with the right difficulty switch, and presses Reset.
2. The human uses the left joystick port.
3. The agent owns only the right joystick port and a video feed.
4. The agent acts only when the flashing X indicates its turn.

This keeps the current joystick-only boundary intact.

## First deliverable: deterministic move executor

Build this before image recognition or game strategy.  Give it a known board
state and a requested legal move, such as `c3 -> d4`.  It must drive the right
joystick to:

1. Navigate the flashing X to the source square.
2. Press fire once to pick up the checker.
3. Navigate to the destination square, including each landing square of a
   chained jump.
4. Press fire once to place the checker.
5. Confirm from video that the board changed and the turn passed.

Represent controller output as `neutral`, eight compass directions, and
`fire`; send bounded press durations followed by neutral intervals.  Log every
command with a frame timestamp.  A replayable command trace is the acceptance
test: the same initial board and trace must produce the same final board.

## Follow-on increments

1. **Board recognizer:** classify each playable square as empty, human piece,
   agent piece, or king, and find the flashing-X cursor.
2. **Move generator:** implement standard English draughts moves, compulsory
   captures, and multi-jumps; compare its legal-move set with what the game
   accepts.
3. **Policy:** begin with random legal choices, then add a shallow material
   and mobility search.  Strategy is not needed to prove the interface.
4. **Human session loop:** wait for a stable opponent move, choose, execute,
   verify, and surface a clear recovery state if a command does not match the
   observed board.

## Definition of done for milestone 1

From a documented initial position, the executor completes ten consecutive
known legal agent moves against a human-operated left joystick, without a
misplaced fire press or manual intervention.
