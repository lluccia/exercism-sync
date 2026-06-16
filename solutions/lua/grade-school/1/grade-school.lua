local School = {}
School.__index = School

function School:new()
    local instance = setmetatable({}, School)
    instance._roster = {}
    return instance
end

function School:add(student, grade)
    if self._roster[grade] == nil then
        self._roster[grade] = {}
    end
    table.insert(self._roster[grade], student)
    table.sort(self._roster[grade])
end

function School:roster()
    return self._roster
end

function School:grade(g)
    return self._roster[g] and self._roster[g] or {}
end

return School
