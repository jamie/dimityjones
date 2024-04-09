![Dimity Jones In Puzzle Castle](https://github.com/larryboyko/dimityjones/blob/main/puzzlecastleicon.jpeg?raw=true)
# Dimity Jones In Puzzle Castle
## An Electronic Escape Novel in Eighty-Nine Ciphertexts

A fictional story, contained in a single text file, that requires the reader to solve puzzles as they go along, and to use each chapter's solution as a key to decipher the next. 

Any and all feedback is welcome, from positive to negative, from the sweeping to the picayune. Let me know what confuses or frustrates you -- and especially let me know if (where) you get stuck.
manyegosago@protonmail.com

### Note
While _Dimity Jones_ is still in its debugging/proofreading phase, please refrain from sharing it more widely or putting it any (other) public place.

### How to Work - jamie_ca

1. Clone this repository to your local machine.
2. Ensure Ruby 3.0+ is installed on your machine.
3. Run `ruby check.rb` in the terminal to start decoding, and after each step.

The check script will set up a stub solution script `lib/chapter_01.rb` (or similar for future chapters) and automatically run the script for the current chapter to decode the next chapter. Scripts should assume they receive file input from `STDIN` and output to `STDOUT`.

When you have a script that successfully decodes the next chapter, `ruby check.rb` will give you a ✅ for that chapter and move on to the next one.

(I'm also assuming that each chapter continues the pattern of using `#####` to delimit the chapter text from the solution, and have a helper script `feed.rb` to only pass the encoded payload for each chapter to the solver scripts.)

Good luck!
