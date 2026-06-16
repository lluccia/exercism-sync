return function(phrase)
    local translated={}

    for word in phrase:gmatch("%w+") do

        if string.match(word, "^[aeiou]")
            or string.match(word, "^xr")
            or string.match(word, "^yt") then

            word = word .. "ay"

        elseif string.match(word, "^[bcdfghjklmnpqrstvwxyz]*qu") then
            word = string.gsub(word, "^([bcdfghjklmnpqrstvwxyz]*qu)(.*)$", "%2%1" ) .. "ay"

        elseif string.match(word, "^[bcdfghjklmnpqrstvwxyz]+y") then
            word = string.gsub(word, "^([bcdfghjklmnpqrstvwxyz]+)y(.*)$", "y%2%1" ) .. "ay"

        elseif string.match(word, "^[bcdfghjklmnpqrstvwxyz]+") then
            word = string.gsub(word, "^([bcdfghjklmnpqrstvwxyz]+)(.*)$", "%2%1" ) .. "ay"

        end

        table.insert(translated, word)
    end

    return table.concat(translated, " ")

end


