require "GraphFactory"
require "Graph"

--graph_table =
--
--{ 'grand_parent', {
--    { 'parent', {
--        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
--    { 'uncle', {
--        { 'cousin_1' }, { 'cousin_2' }}}}}

simple_table = { 'x' }

graph = GetGraph( simple_table)

target = graph:Search('x')

if target then

  print (target:toString())
  
end
