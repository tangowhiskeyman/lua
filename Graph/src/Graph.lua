require "table_functions"

Graph = { graphTable = nil, parent = nil, children = nil}

function Graph:new (o, graphTable, parent, children)

    o = o or { }
    setmetatable(o, self)
    self.__index = self
    self.graphTable = graphTable
    self.parent = parent
    self.children = children

    return o

end

function Graph:getGraphTable ()

    return self.graphTable

end

function Graph:setGraphTable (graph_table)

    self.graphTable = graphTable

end


function Graph:getValue ()

    if self.graphTable then

        return self.graphTable[1]

    else

        return nil

    end

end

function Graph:setValue (value)

    if not self.graphTable then

        self.graphTable = { }

    end

    self.graphTable[1] = value

end

function Graph:getChildren ()

    return self.children

end

function Graph:setChildren (children)

    self.children = children

end

function Graph:getParent ()

    return (self.parent)

end

function Graph:setParent (parent)

    self.parent = parent

end

function Graph:addChild (childGraph)

    if not self.children then

        self.children = { }

    end

    table.insert (self.children,  #self.children + 1, childGraph)

    if not self.graphTable[2] then

        self.graphTable[2] = { }

    end

    table.insert (self.graphTable[2],  #self.graphTable[2] + 1, childGraph:getValue())

    childGraph.parent = self

end


function Graph:toString()

    str = self.value

    for _, child in next, self.children do

        str = str .. "{ "

        str = str .. child.toString()

        str = str .. " }"

        if not(_ == #self.children) then

            str = str .. ", "

        end

    end

    str = "{ " .. str .. " }"

    return str

end


return Graph






