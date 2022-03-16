require "GraphFactory"
require "Graph"
require "table_functions"

graph_table = { 0,{ { 1, { 4, 5 } }, { 2, { 6, 7 } }, { 3, { 8, 9 } } } }

graph = GetGraph( graph_table)

graphChildren = graph:getGraphChildren()

print (graph:toString())
--print (to_string (graphChildren))
