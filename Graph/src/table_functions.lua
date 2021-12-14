table_functions = { }


function to_string(table)

    function to_string_helper(table)

        str = ""

        for _, v in next, table do

            if type(v) == "table" then --table

                str = str .. "{ " .. to_string_helper(v) .. " }"

            else --value

                if type(v) == "string" then

                    str = str .. "'" .. v .. "'"

                else

                    str = str .. v

                end

                if v == target then


                end

            end

            if _ ~= #table then

                str = str .. ", "

            end

        end

        return (str)

    end

    str = ""

    if not table then

        str = "nil"

    elseif not type(table) == "table" then

        str = "" .. table

    else

        str = "{ " .. to_string_helper(table) .. " }"

    end

    return str

end

function print_table(table)

    print(to_string(table))

end

return table_functions