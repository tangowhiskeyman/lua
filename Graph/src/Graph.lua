require "table_functions"

Graph = { value = nil , parentGraph = nil, graphChildren = nil}

function Graph:new (o, value, parentGraph, graphChildren)

    o = o or { }
    setmetatable(o, self)
    self.__index = self

    self.value = value
    self.parentGraph = parentGraph
    self.graphChildren = graphChildren

    return o

end

function Graph:isGraph()

    return true

end

--original_type = type
--
--function type(v)
--
--    object_type =  original_type(v)
--
--    if object_type == "table" and getmetatable(v) == self then
--
--        return "Graph"
--
--    else
--
--        return original_type(v)
--
--    end
--
--end



function Graph:getValue ()

    return self.value

end

function Graph:setValue (value)

    self.value = value

end

function Graph:getChildren ()

    if self.value then

        if type( self.value == "table" ) then

            return self.value[2]

        else

            return nil

        end

    else

        return nil

    end

end

function Graph:setChildren (children)

    if type(self.value) ~= "table" then

        self.value = {  }

    end

    if type(self.value[2]) ~= "table" then

        self.value[2] = {  { } }

    end


    self.value[2] = children

end

function Graph:getGraphChildren ()

    return self.graphChildren

end

function Graph:setGraphChildren (children)

    self.graphChildren = children

end

function Graph:hasChildren()

    children = self:getChildren()

    return children and type( children == "table")

end

function Graph:hasGraphChildren()

    --if self.graphChildren then
    --
    --    print (self.graphChildren and #self.graphChildren > 0)
    --
    --end

    return  (self.graphChildren and #self.graphChildren > 0)

end

function Graph:getParent ()

    return self.value[1]

end

function Graph:setParent (parent)

    if not self.value then

        self.value = { }

    end

    self.value[1] = parent

end

function Graph:getParentGraph ()

    return self.parentGraph

end

function Graph:setParentGraph (parentGraph)

    self.parentGraph = parentGraph

end

function Graph:hasParentGraph()

    return self.parentGraph

end

function Graph:addChild (child)

    if not debug.getinfo(2).name ~= "GetGraphHelper" then

        if not self:hasChildren() then

            self:setChildren ( {  } )

        end

        children = self:getChildren()

        table.insert ( children,  #children + 1, child )

        --print (child)
        --child:setParent ( self )

    end

end

function Graph:addChildGraph (child)

    if not self:hasGraphChildren() then

        self:setGraphChildren ( { } )

    end

    graphChildren = self:getGraphChildren()

    table.insert ( graphChildren,  #graphChildren + 1, child)

    child:setParentGraph ( self )

    --if not debug.getinfo(2).name and not debug.getinfo(2).name ~= "GetGraphHelper" then
    --
    --    self:addChild(child:getValue())
    --
    --end

    --child:setParent(self:getValue())


end

function Graph:valueToString(tab)

    return to_string ( self:getValue(), tab )

end

function Graph:Search(target)

    if self:getParent() == target then

        return self

    elseif self:hasGraphChildren() then

        graphChildren = self:getGraphChildren()

        for _, v in pairs (graphChildren) do

            return v:Search(target)

        end

    end

end

function toStringHelper(graph, visiting, tab)

    str = "\n"

    if graph and graph.isGraph and graph.isGraph() then

        tab = tab .. "\t"

        if not visiting[graph] then

            visiting[graph] = true

            str = str .. tab .. "graph = " .. tostring(graph) .. "\n"

            str = str .. tab .. "value = " .. graph:valueToString(tab) .. "\n"

            --str = str .. "parentGraph = " .. toStringHelper(graph:getParentGraph(), visiting, tab) .. "\n"

            str = str .. tab .. "parentGraph = " .. tostring(graph:getParentGraph()) .. "\n"

            if graph:hasGraphChildren() then

                str = str .. tab .. "graphChildren = \n\t{"

                graphChildren = graph:getGraphChildren()

                for _, v in pairs (graphChildren) do

                    str = str .. tab .. toStringHelper(v, visiting, tab) --.. ", "

                end

                str = str .. tab .. " }"

            else

                str = str .. tab .. "graphChildren = nil\n"

            end

        end

    else

        return tostring(graph)

    end

    return str

end


function Graph:toString()

    visiting = { }

    tab = ""

    return toStringHelper(self, visiting, tab)

end


return Graph


