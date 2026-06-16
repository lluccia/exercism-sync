local Set = { elements = {}, size = 0 }
Set.__index = Set

function Set:is_empty()
    return self.size == 0
end

function Set:contains(element)
    if self:is_empty() then
        return false
    end
    for _, _element in pairs(self.elements) do
        if element == _element then
            return true
        end
    end
    return false
end

function Set:is_subset(other)
    if self:is_empty() then
        return true
    end
    for _, _element in pairs(self.elements) do
        if not other:contains(_element) then
            return false
        end
    end
    return true
end

function Set:is_disjoint(other)
    if self:is_empty() then
        return true
    end
    for _, _element in pairs(self.elements) do
        if other:contains(_element) then
            return false
        end
    end
    return true
end

function Set:add(element)
    if not self:contains(element) then
        self.size = self.size + 1
        self.elements[self.size] = element
    end
end

function Set:intersection(other)
    local intersection = require("custom-set")()
    if self:is_empty() or other:is_empty() then
        return intersection
    end
    for _, _element in pairs(self.elements) do
        if other:contains(_element) then
            intersection:add(_element)
        end
    end
    return intersection
end

function Set:difference(other)
    local difference = require("custom-set")()
    for _, _element in pairs(self.elements) do
        if not other:contains(_element) then
            difference:add(_element)
        end
    end
    return difference
end

function Set:union(other)
    local union = require("custom-set")()
    for _, _element in pairs(self.elements) do
        union:add(_element)
    end
    for _, _element in pairs(other.elements) do
        union:add(_element)
    end
    return union
end

function Set:equals(other)
    if not (self.size == other.size) then
        return false
    end
    for _, _element in pairs(self.elements) do
        if not other:contains(_element) then
            return false
        end
    end
    return true
end

return function(...)
    local instance = setmetatable({}, Set)
    instance.elements = {...}
    instance.size = select("#", ...)
    return instance
end
