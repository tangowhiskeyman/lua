require "Graph"
require "GraphFactory"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}


simple_graph = Graph:new()
--print ( simple_graph:valueToString())
--
simple_graph:setParent("parent")
--print ( simple_graph:valueToString())
--
simple_graph:addChild("child")
simple_graph:addChild("child2")
print ( simple_graph:valueToString())

--simple_graph = Graph:new()
--print ( simple_graph:toString())

--simple_graph:setParent("parent")
--print ( simple_graph:valueToString())
--
--childGraph = Graph:new{value = 'child'}
--simple_graph:addChildGraph(childGraph)
--childGraph2 = Graph:new{value = 'child2'}
--simple_graph:addChildGraph(childGraph2)
--
--print ( simple_graph:valueToString())
--graph = Graph:new()
--graph:setValue(graph_table)
--print (graph:toString())
print (simple_graph:toString())
