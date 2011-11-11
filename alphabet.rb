require_relative "wav.rb"

letters = {
  "A" => "ALPHA",
  "B" => "BRAVO",
  "C" => "CHARLIE",
  "D" => "DELTA",
  "E" => "ECHO",
  "F" => "FOXTROT",
  "G" => "GOLF",
  "H" => "HOTEL",
  "I" => "INDIA",
  "J" => "JULIET",
  "K" => "KILO",
  "L" => "LIMA",
  "M" => "MIKE",
  "N" => "NOVEMBER",
  "O" => "OSCAR",
  "P" => "PAPA",
  "Q" => "QUEBEC",
  "R" => "ROMEO",
  "S" => "SIERRA",
  "T" => "TANGO",
  "U" => "UNIFORM",
  "V" => "VICTOR",
  "W" => "WHISKEY",
  "X" => "XRAY",
  "Y" => "YANKEE",
  "Z" => "ZULU",
  " " => "SPACE"
}

SOUNDS = letters.inject({}) {|map, entry| map[entry[0]] = Wav::Sound.fromFile("#{entry[1].downcase}.wav") ; map}

def spell(string)
  string.upcase.each_char.inject(nil) {|sound, letter| sound.nil? ? SOUNDS[letter] : sound.combine(SOUNDS[letter]) }
end
