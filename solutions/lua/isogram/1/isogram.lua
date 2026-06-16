return function(s)
  local letters_found = {}

  for i = 1, #s, 1 do
    local letter = string.lower(s:sub(i, i))

    if string.match(letter, "%a") then
      if letters_found[letter] then
        return false
      end

      letters_found[letter] = true
    end
  end

  return true
end
