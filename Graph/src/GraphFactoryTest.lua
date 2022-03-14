require "GraphFactory"
require "Graph"

graph_table =

{ 'grand_parent', {
    { 'parent', {
        { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
    { 'uncle', {
        { 'cousin_1' }, { 'cousin_2' }}}}}

simple_table =
{ 'parent',
  { 'child', 'child2'}}

graph = GetGraph( simple_table)

print ( graph:Search("child"):toString())
