require "table_functions"


t = {'emre','sofia','ali', 'fatma'}

print(#t)
print(t[4])

if  #t  > 0 then

    a = pack(unpack(t))
end

print (a)
