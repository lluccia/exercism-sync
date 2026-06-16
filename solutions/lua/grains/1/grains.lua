local grains = {}

function grains.square(n)
  return math.pow(2, n-1)
end

function grains.total()
  local total = 0
  for s = 1,64 do
    total = total + grains.square(s)
  end
  return total
end

return grains
