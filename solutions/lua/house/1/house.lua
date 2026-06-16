local house = {}

local song_verses = {
  {'house', 'Jack built'},
  {'malt', 'lay in'},
  {'rat', 'ate'},
  {'cat', 'killed'},
  {'dog', 'worried'},
  {'cow with the crumpled horn', 'tossed'},
  {'maiden all forlorn', 'milked'},
  {'man all tattered and torn', 'kissed'},
  {'priest all shaven and shorn', 'married'},
  {'rooster that crowed in the morn', 'woke'},
  {'farmer sowing his corn', 'kept'},
  {'horse and the hound and the horn', 'belonged to'},
}

local song
song = function(which, song_length)
  local verses

  if which == 1 then
    verses = "the " .. song_verses[song_length - which + 1][1]
  else
    verses = song(which - 1, song_length) .. "\n"
      .. "that " .. song_verses[song_length - which + 2][2]
      .. " the " .. song_verses[song_length - which + 1][1]
  end

  if which == song_length then
    verses = verses
      .. " that " .. song_verses[song_length - which + 1][2]
  end

  return verses
end

house.verse = function(which)
  return "This is " .. song(which, which) .. "."
end
house.recite = function()
  local recite = ""

  for i = 1, 12 do
    recite = recite
    if i > 1 and i < 13 then recite = recite .. "\n" end
    recite = recite .. house.verse(i)
  end

  return recite
end

return house
