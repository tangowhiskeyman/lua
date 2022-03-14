
table_functions = { }

function to_string_helper (graph_table, visiting, tab)

    str = ""

    if type(graph_table) == "table" then --table

        str = str .. "\n" .. tab .. "{ "
        tab = tab .. "\t"

        if not visiting[graph_table] then

            visiting[ graph_table ] = true

            for _, child in next, graph_table do

                str = tab .. str ..  to_string_helper(child, visiting, tab)

                if next (graph_table, _) then

                    str = str .. ", "

                end

            end

        end

        str =   str .. " }"

        --str = "\n" .. tab .. "{ " .. str .. " }"

    elseif type(graph_table) == "string" then

        str = str .. "'" .. graph_table .. "'"

    else

        str = str ..  tostring(graph_table)

    end

    return str

end

function to_string(graph_table, tab)

    if not tab then

        tab = ""

    end

    local visiting = { }

    return to_string_helper(graph_table, visiting, tab)

end



function to_string_helper2 (graph_table, visiting)

    str = ""

    if type(graph_table) == "table" then --table

        if not visiting[graph_table] then

            visiting[ graph_table ] = true

            str = str .. "{ "

            function pairsByKeys (t, f)

                local a = { }

                for n in pairs( t ) do -- create a list with all keys

                    a[ #a + 1 ] = n

                end

                table.sort( a, function ( a, b ) if a > b then return a end end ) -- sort the list

                local i = 0 -- iterator variable

                return function () -- iterator function

                    i = i + 1

                    return a[ i ], t[ a[ i ] ], i, #a -- return key, value, index, size

                end

            end

            for key, val, i, size in pairsByKeys(graph_table) do

                if key and type(key) == "string" then

                    str = str .. tostring(key) .. " = ".. to_string_helper2 ( val, visiting )

                else

                    str = str .. to_string_helper2 ( val, visiting )

                end

                if size ~= i then

                    str = str .. ", "

                end

            end

            str = str .. " } "

        end

    elseif type(graph_table) == "string" then

        str = str .. "'" .. graph_table .. "'"

    else

        str = str .. tostring(graph_table)

    end

    return str

end

function to_string2(graph_table)

    local visiting = { }

    local tab = ""

    return to_string_helper2(graph_table, visiting, tab)

end



return table_functions