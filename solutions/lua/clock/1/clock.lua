local Clock = {
  hours = 0,
  minutes = 0,
}
Clock.__index = Clock

Clock.__tostring = function(clock)
  return string.format("%02d:%02d", clock.hours, clock.minutes)
end

function Clock.at(hours, minutes)
  local instance = setmetatable({}, Clock)

  instance.hours = hours
  instance.minutes = minutes or 0

  local hours_from_minutes = math.floor(instance.minutes / 60)
  if hours_from_minutes ~= 0 then
    instance.hours = instance.hours + hours_from_minutes
  end

  instance.hours = instance.hours % 24
  instance.minutes = instance.minutes % 60

  if instance.minutes < 0 then
    instance.minutes = 60 + instance.minutes
  end

  return instance
end

function Clock:plus(minutes)
  return Clock.at(self.hours, self.minutes + minutes)
end

function Clock:minus(minutes)
  return self:plus(-minutes)
end

function Clock:equals(other)
  return self.hours == other.hours and self.minutes == other.minutes
end

return Clock
