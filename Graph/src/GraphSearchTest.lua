require "GraphFactory"
require "Graph"

simple_table = { 1, { 4, 5 } }

graph_table = { 0,{ { 1, { 4, 5 } }, { 2, { 6, 7 } }, { 3, { 8, 9 } } } }

target_element = 4

graph = GetGraph( simple_table )

target = graph:Search(target_element)

if target then

  --print (target:getParent())

  parentGraph =  target:getParentGraph()
  parent = parentGraph:getParent()
  parentGraph:setParent(target:get)
  
end
