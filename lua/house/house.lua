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
  local verse_table = {"This is"}
  for line = which, 1, -1 do
    table.insert(verse_table, lines[line])
  end

  return table.concat(verse_table, " ")
end

house.recite = function()
  local verse_table = {}
  for line = 1, 12 do
    table.insert(verse_table, house.verse(line))
  end

  return table.concat(verse_table, "\n")
end

return house
