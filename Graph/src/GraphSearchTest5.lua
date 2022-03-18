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

            --flippedGraph = flipGraph(parentParentGraph)

            newChildGraph = Graph:new()

            newChildGraph:setParent(parentParentGraph:getParent())

            graphChildren = parentGraph:getGraphChildren()

            for _, value in pairs(graphChildren) do

                if type(value) == "table" then

                    if not (value:getParent() == parentValue) then

                        newChildGraph:addChildGraph(value, true)

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

local larger_tree =
{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}
local expected =
{ 'leaf', {
    { 'parent', {
        { 'sibling_1' },
        { 'sibling_2' },
        { 'grand_parent', {
            { 'uncle', {
                { 'cousin_1' }, { 'cousin_2' }}}}}}}}}

target_element = 'leaf'

graph = GetGraph(larger_tree)

target = graph:Search(target_element)

--print (target:getParentGraph():valueToString())

print(  graph:valueToString())

if target then

    newGraph = flipGraph(target, target_element)

    print(  newGraph:valueToString())

end
