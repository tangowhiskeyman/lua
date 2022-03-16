require "GraphFactory"
require "Graph"

local simple_tree = { 'parent', {
    { 'sibling' }, { 'leaf' } } }

local expected = { 'leaf', {
    { 'parent', {
        { 'sibling' } } } } }

target_element = 'leaf'

graph = GetGraph(simple_tree)

target = graph:Search(target_element)

if target then

    newGraph = Graph:new()

    newGraph:setParent(target:getParent())

    newGraph2 = Graph:new()

    parentGraph = target:getParentGraph()

    newGraph2:setParent(parentGraph:getParentGraph():getParent())

    parentGraph = parentGraph:getGraphChildren()

    for _, value in pairs(parentGraph) do

        if type(value) == "table" then

            if not (value:getParent() == target_element) then

                newGraph2:addChildGraph(value, true)

            end

        else

        end

    end

    newGraph:addChildGraph(newGraph2, true)

    print(  newGraph:toString() )

end
