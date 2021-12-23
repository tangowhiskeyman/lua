require "DataDumper"

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
        print (1)
        self.value = {  }

    end

    if type(self.value[2]) ~= "table" then
        print (2)
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

    return  children and type( children == "table")

end

function Graph:hasGraphChildren()

    return  self.graphChildren and #self.graphChildren > 0

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

    return self.parentGraph == parentGraph

end

function Graph:hasParentGraph()

    return self.parentGraph

end

function Graph:addChild (child)

    if not debug.getinfo(2).name ~= "SetGraph" then

        if not self:hasChildren() then

            self:setChildren ( {  } )



        end

        children = self:getChildren()

        print (children)
        print (self.value)
        print (self.value[1])
        print (self.value[2])
        table.insert ( children,  #children + 1, child:getValue() )

    end

end

function Graph:addChildGraph (child)

    if not self:hasGraphChildren() then

        self:setGraphChildren ( { } )

    end

    graphChildren = self:getGraphChildren()

    table.insert ( graphChildren,  #graphChildren + 1, child)

    child:setParentGraph ( self )


end

function Graph:valueToString()

    return to_string ( self )

end



function Graph:toString()

    visiting = { }

    str = "value = " .. self:valueToString()

    str = str .. ", graphChildren = "

    if self:hasGraphChildren() then

        str = str .. " = "

        children = self:getGraphChildren()

        if not visiting[self] then

            visiting[self] = true

            for _, child in next, children do

                str = str .. child:toString()

                if not(_ == #children) then

                    str = str .. ", "

                end

            end

            --str = "{ " .. str .. " }"

        end

    end

    return str

end


return Graph


