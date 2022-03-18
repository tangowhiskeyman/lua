require "GraphFactory"
require "Graph"

function flipGraph(graph, parentValue)

    if graph and graph:hasParentGraph() then

        parentGraph = graph:getParentGraph()

        if parentGraph:hasParentGraph() then

            parentParentGraph = parentGraph:getParentGraph()

            if not parentValue then

                parentValue = graph:getParent()

            end

            newChildGraph = flipGraph(parentParentGraph)

            if not newChildGraph then

                newChildGraph = Graph:new()

                newChildGraph:setParent(parentParentGraph:getParent())

                parentGraph = parentGraph:getGraphChildren()

                for _, value in pairs(parentGraph) do

                    if type(value) == "table" then

                        if not (value:getParent() == parentValue) then

                            newChildGraph:addChildGraph(value, true)

                        end

                    else

                    end

                end

            end

            newGraph = Graph:new()

            newGraph:setParent(parentValue)

            newGraph:addChildGraph(newChildGraph, true)

            return newGraph

        else

            return graph

        end

    else

        return nil

    end

end

local flat_tree =
{ 'parent', {
    { 'sibling_a' }, { 'sibling_b' }, { 'leaf' }, { 'sibling_c' }, { 'sibling_d' }}}
local expected =
{ 'leaf', {
    { 'parent', {
        { 'sibling_a' }, { 'sibling_b' }, { 'sibling_c' }, { 'sibling_d' }}}}}

target_element = 'leaf'

graph = GetGraph(flat_tree)

target = graph:Search(target_element)

if target then

    newGraph = flipGraph(target, target_element)

    print(  newGraph:toString() )

end

print(  newGraph:toString() )