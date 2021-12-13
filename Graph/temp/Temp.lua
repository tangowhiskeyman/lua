t={1,2,{3,4,5}}

function f(t)

    b = t
    return b

end

function to_string(table)

    function to_string(table)

        str = ""

        for _, v in next, table do

            if type(v) == "table" then --table

                str = str .. "{ " .. to_string(v) .. " }"

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

    return ("{ " .. to_string(table) .. " }")

end

function print_table(table)

    print(to_string(table))

end

a=f(t)

print(a)

print_table(f(t))
