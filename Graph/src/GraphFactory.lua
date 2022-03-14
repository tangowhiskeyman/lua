require "Graph"

GraphFactory = { }

function GetGraphHelper  (graph, visiting)

    graphTable = graph:getValue()

    if not visiting [ graphTable ] then

        visiting [ graphTable ] = true

        for _, value in pairs( graphTable ) do

            if type ( value ) == "table" then

                tempGraph = Graph:new { value = value }

                childGraph = GetGraphHelper(tempGraph, visiting)

                graph:addChildGraph ( childGraph )

            else

                -- graph:addChild(value)

            end

        end



    end

    return graph

end


function GetGraph ( graphTable )

    local visiting = { }

    graph = Graph:new { value = graphTable }

    return GetGraphHelper ( graph, visiting )

end

return GraphFactory