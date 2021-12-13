require "Graph"

GraphFactory = { }

instance = nil

function GraphFactory:new()

    o = o or { }
    setmetatable(o, self)
    self.__index = self

    return o
end

function GraphFactory:GetInstance()

    if not instance then

        instance = GraphFactory:new()

    end

    return instance
end


function GetGraph ( graphTable )

    parent = Graph:new { value = graphTable }

    for _, child in next, graphTable do

        if type(child) == "table" then -- child, graph

            child = GetGraph(v)


        else -- leaf

            child = Graph:new { value =  v, parent = parent }

        end

        parent:addChild ( child )

    end

    return  parent

end

return GraphFactory