require "Graph"

GraphFactory = { }

function GetGraphHelper  (graph, visiting)

    graphTable = graph:getValue()

    if not visiting [ graphTable ] then

        visiting [ graphTable ] = true

        for _, value in pairs( graphTable ) do

            if type ( value ) == "table" then

                childGraph = Graph:new { value = value }

                graph:addChildGraph ( childGraph )

                return GetGraphHelper ( childGraph, visiting )

            end

        end

    end

    return graph

end


function GetGraph ( graphTable )

    local visiting = { }

    graph = Graph:new { value = graphTable }

    GetGraphHelper ( graph, visiting )

    return graph

end

return GraphFactory