local Robot = {}

local function generate_name()
    local name = ""
    name = name .. string.char(math.random(65, 90))
    name = name .. string.char(math.random(65, 90))
    name = name .. math.random(0, 9)
    name = name .. math.random(0, 9)
    name = name .. math.random(0, 9)
    return name
end

function Robot:new()
    local robot = {}

    setmetatable(robot, self)
    self.__index = self

    robot.name = generate_name()

    return robot
end

function Robot:reset()
    self.name = generate_name()
end

return Robot
