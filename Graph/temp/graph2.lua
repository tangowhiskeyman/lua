graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}


function find(graph, target)

    a = {}

    for _, child in next, graph_table do

        table.insert(a, child)

        if type(child) == "table" then -- child, graph

            table.insert(a, find(child, target))

        else -- leaf

            if child == target then

                return a

            end

        end

    end

end

print (find(graph_table, 'leaf'))