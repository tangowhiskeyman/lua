require "table_functions"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}


dictionary = { name = 'Emre', child = { surname = 'Yanik' } }

--dictionary = { name = 'Emre', surname = 'Yanik' }

print ( to_string2 ( dictionary ) )

