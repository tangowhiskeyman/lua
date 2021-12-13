
graph = {}

graph.self =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}

--table.insert(graph.self, graph.self)

graph.parent = nil

visited = {}

str = ""

target_graph = {}

traverse (graph, 'leaf')