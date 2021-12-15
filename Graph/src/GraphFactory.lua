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

    if not type(graphTable) == "table" then

        error("graphTable must be a table got: ", type(graphTable), graphTable)

    elseif #graphTable == 0 then

        error("graphTable must be a table with at least one element got: ", print_table(graphTable))

    else

        value = graphTable[1]

    end

    graph = Graph:new { graphTable = graphTable, value =  value }

    for _, child in next, graphTable do

        if _ > 1 then

            if type(child) == "table" then -- child graph

                child_graph = GraphFactory:GetInstance():GetGraph(child)

            else -- leaf

                child_graph = Graph:new { value =  child, parent = graph }

            end

            graph:addChild ( child_graph )

            print_table(graph:getChildren())

        end

    end

    return  graph

end

return GraphFactory