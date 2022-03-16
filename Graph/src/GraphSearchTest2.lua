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

while target do

    parentGraph = target:getParentGraph()

    newChildGraph = Graph:new()

    newChildGraph:setParent(parentGraph:getParentGraph():getParent())

    parentGraph = parentGraph:getGraphChildren()

    for _, value in pairs(parentGraph) do

        if type(value) == "table" then

            if not (value:getParent() == target:getParent()) then

                newChildGraph:addChildGraph(value, true)

            end

        else

        end

    end

    newGraph = Graph:new()

    newGraph:addChildGraph(newChildGraph, true)

    newGraph:setParent(target:getParent())

    

end

print(  newGraph:toString() )