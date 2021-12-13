require "table_functions"

Graph = { }

function Graph:new (o, value, parent )

    o = o or { }
    setmetatable(o, self)
    self.__index = self

    self.value =  value or { }
    self.parent = parent or { }

    return o

end

function Graph:getValue ()

    return self.value

end

function Graph:setValue (value)

    self.value = value

end


function Graph:addChild (child)

    table.insert (self.value, #self.value + 1, child.value)



    child.parent = self

end

function Graph:toString()

    str = self.value

    for _, child in next, self.children do

        str = str .. "{ "

        str = str .. child.toString()

        str = str .. " }"

        if not(_ == #self.children) then

            str = str .. ", "

        end

    end

    str = "{ " .. str .. " }"

    return str

end


return Graph






