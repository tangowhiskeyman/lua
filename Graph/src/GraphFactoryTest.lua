require "GraphFactory"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}



graph = GraphFactory:GetInstance():GetGraph(graph_table)

print_table(graph:getGraphTable())

--print_table(graph:getChildren())
