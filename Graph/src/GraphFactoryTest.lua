require "GraphFactory"
require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}



GraphFactory:GetInstance():GetGraph(graph_table)
print(1)
print_table(graph:getValue())


