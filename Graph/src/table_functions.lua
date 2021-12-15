table_functions = { }

to_string_helper = function (graph_table, visiting)

    local str = ""

    if not visiting[graph_table] then

        visiting[graph_table] = true

        if type(graph_table) == "table" then --table

            str = str .. "{ "

            for _, child in next, graph_table do

                str = str .. to_string_helper(child, visiting)

                if _ ~= #graph_table then

                    str = str .. ", "

                end

            end

            str = str .. " }"

        elseif type(graph_table) == "string" then

            str = str .. "'" .. graph_table .. "'"

        else

            str = str .. tostring(graph_table)

        end

    end


    return (str)

end

function to_string(graph_table)

    local visiting = { }

    return to_string_helper(graph_table, visiting)

end

function print_table(graph_table)

    print(to_string(graph_table))

end

return table_functions