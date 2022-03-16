require "GraphFactory"
require "Graph"

local deeply_nested_tree =
{ 'level1', {
    { 'level2', {
        { 'level3', {
            { 'level4', {
                { 'leaf' }}}}}}}}}
local expected =
{ 'leaf', {
    { 'level4', {
        { 'level3', {
            { 'level2', {
                { 'level1' }}}}}}}}}

target_element = 'leaf'

graph = GetGraph(deeply_nested_tree)

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
