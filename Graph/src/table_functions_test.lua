require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}


--graph_table = { name = 'Emre', child = { surname = 'Yanik' } }

--graph_table = { name = 'Emre', surname = 'Yanik' }

--print ( to_string2 ( dictionary ) )
--
print ( to_string ( graph_table ) )





--repeat
--
--    a, b = next (dictionary)
--    print (a, b)
--
--until not a

