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

function GraphFactory:GetGraph ( graphTable )

    print_table(graphTable)

    graph = Graph:new { value = graphTable }

    for _, child in next, graphTable do

        if type(child) == "table" then -- child graph

            child_graph = GraphFactory:GetInstance():GetGraph(child)

        else -- leaf

            child_graph = Graph:new { value =  child, parent = graph }

        end

        graph:addChild ( child_graph )

        if _ ~= #graphTable then

            return  graph

        end

    end

end

return GraphFactory