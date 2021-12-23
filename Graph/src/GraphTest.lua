require "Graph"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}





simple_graph = Graph:new()
print ( simple_graph:valueToString())
simple_graph:setParent("parent")
print ( simple_graph:valueToString())
child_graph = Graph:new{ value = 'child' }
--print ( child_graph:valueToString())
--grand_child_graph = Graph:new{ value = 'grand_child' }
--print ( grand_child_graph:valueToString())
--child_graph:addChild(grand_child_graph)
--print ( child_graph:valueToString())
simple_graph:addChild(child_graph)
print ( simple_graph:valueToString())

--simple_graph2 = Graph:new()
--print ( simple_graph2:valueToString())
--simple_graph2:setParent("parent2")
--print ( simple_graph2:valueToString())
--child_graph2 = Graph:new{ value = 'child2' }
--print ( child_graph2:valueToString())
--grand_child_graph2 = Graph:new{ value = 'grand_child2' }
--print ( grand_child_graph2:valueToString())
--child_graph2:addChild(grand_child_graph2)
--print ( child_graph2:valueToString())
--simple_graph2:addChild(child_graph2)
--print ( simple_graph2:valueToString())
--
--simple_graph2:addChild(simple_graph)
--
--print ( simple_graph2:valueToString())