function traverse(graph_table, target)

    graph = {}

    graph.table = graph_table

    graph.parent = { }

    graph.children = { }

    visited = { }

    local function traverse_helper(graph, target)

        if not visited[graph.table] then

            table.insert(visited, graph.table)

            visited[graph.table] = true

            for _, v in next, graph.table do

                child = {}

                child.table = v

                child.parent = graph

                child.children = { }

                table.insert ( child.children, graph.children )

                if type(v) == "table" then

                    str = str .. " { "

                    traverse_helper (child, target)

                    str = str .. " }"

                else --leaf

                    str = str .. child.table

                    if child.table == target then

                        str = " { " .. str  .. " }"

                    end

                end

                if _ ~= #graph.table then

                    str = str .. ", "

                end

            end

        end

    end

    traverse_helper (graph, target)

end

function reorder (graph)

    local function reorder_helper(graph)



    end

end


graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}

--table.insert(graph.table, graph.table)

--graph.parent.table = { }

str = ""

target_str = 'leaf'

traverse(graph_table, target_str)

print(str)