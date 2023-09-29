local house = {}

local lines = {
  [[the house that Jack built.]],
  [[the malt
that lay in]],
  [[the rat
that ate]],
  [[the cat
that killed]],
  [[the dog
that worried]],
  [[the cow with the crumpled horn
that tossed]],
  [[the maiden all forlorn
that milked]],
  [[the man all tattered and torn
that kissed]],
  [[the priest all shaven and shorn
that married]],
  [[the rooster that crowed in the morn
that woke]],
  [[the farmer sowing his corn
that kept]],
  [[the horse and the hound and the horn
that belonged to]]
}

house.verse = function(which)
  local verse = ""
  for line = 1, which do
    verse = lines[line] .. " " .. verse
  end
  verse = "This is " .. verse

  return verse:sub(1, -2)
end

house.recite = function()
  local verse = house.verse(1)
  for line = 2, 12 do
    verse = verse .. "\n" .. house.verse(line)
  end

  return verse
end

return house
