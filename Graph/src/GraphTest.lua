require "Graph"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}

--graph_table2 = { 'uncle', { { 'cousin_1' }, { 'cousin_2' }}}

--graph = Graph:new{ graphTable = graph_table }
--print_table(graph:getGraphTable())
--graph2 = Graph:new{ value = graph_table2 }
--print_table(graph2:getValue())
--graph:setValue(graph_table2)
--print_table(graph:getGraphTable())
--print_table(single_child_table)
--single_child_graph = Graph:new{ graphTable = single_child_table}

--print_table(single_child_graph:getGraphTable())
--graph:addChild(single_child_graph)
--print_table(graph:getGraphTable())
--print_table(single_child_graph:getChildren())
--single_child_graph:addChild(single_child_graph2)
--print_table(graph:getGraphTable())
--print_table(single_child_graph:getChildren())
--print_table(single_child_graph:getGraphTable())

simple_parent_table = { 'simple_parent_leaf' }
simple_parent_graph = Graph:new{ graphTable = simple_parent_table }

single_child_table = { 'single_child_leaf' }
single_child_graph = Graph:new{ graphTable = { single_child_table } }

print_table(simple_parent_graph:getGraphTable())

simple_parent_graph:addChild(single_child_graph)

print_table(single_child_graph:getParent():getGraphTable())
print_table(simple_parent_graph:getGraphTable())



print_table(simple_parent_graph:getChildren())
