require "Graph"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}

graph_table2 = { 'uncle', { { 'cousin_1' }, { 'cousin_2' }}}

graph = Graph:new{ value = graph_table }
print_table(graph:getValue())

--[[graph2 = Graph:new{ value = graph_table2 }
print_table(graph2:getValue())]]

graph:setValue(graph_table2)
print_table(graph:getValue())

single_child_table = { 'new_child_graph' }
single_child_value = 'new_child_value'

print_table(single_child)

single_child_graph = Graph:new{ value = single_child_table}
single_child_graph2 = Graph:new{ value = single_child_value}


print_table(single_child_graph:getValue())

graph:addChild(single_child_graph)
print_table(graph:getValue())

graph:addChild(single_child_graph2)
print_table(graph:getValue())
