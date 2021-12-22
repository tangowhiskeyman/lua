require "Graph"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}



simple_graph = Graph:new()
simple_graph:setParent("parent")
child_graph = Graph:new{ value = 'child' }
simple_graph:addChild(child_graph)
--print ( simple_graph:valueToString())
--print ( to_string(simple_graph))
print ( to_string2(simple_graph))


--
--
--
--child_graph2 = Graph:new{ value = 'child2' }
--print ( child_graph2:valueToString())
--
--simple_graph:addChildGraph(child_graph2)
--print ( simple_graph:valueToString())

--print_table ( simple_graph:getParent())
--print_table ( simple_graph:getChildren())
--
--complexGraph = Graph:new { value = graph_table }
--print (to_string ( complexGraph:getValue() ))
--
--print_table ( complexGraph:getParent())
--print ( complexGraph:toString())