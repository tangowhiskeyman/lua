if not broker then broker = 'localhost'

    function multiply(mult)

        return function(value)

            local num = tonumber(value) if num then

                return num * mult

            else

                return value

            end

        end

    end

    -- topic to object map
    mqtt_to_object =
    {
        ['Switch'] = '1/1/1',
        ['Brightness'] = '1/1/2',
        ['Unsigned_lnteger']='1/1/3',
        ['Temperature'] = '1/1/4',
        ['RGB_Color'] = '1/1/5',
        ['Time_And_Day'] = '1/1/6',
        ['Date'] = '1/1/7',
        ['Active_Energy']  = '1/1/8',
        ['HVAC_Mode'] = '1/1/9',
        ['Energy_Hours_Meter'] = '1/1/10'
    }
    -- object to topic map
    object_to_mqtt = {

        ['1/1/1'] = 'Switch',
        ['1/1/2'] = 'Brightness',
        ['1/1/3'] = 'Unsigned_lnteger',
        ['1/1/4'] = 'Temperature',
        ['1/1/5'] = 'RGB_Color',
        ['1/1/6'] = 'Time_And_Day',
        ['1/1/7'] = 'Date',
        ['1/1/8'] = 'Active_Energy',
        ['1/1/9'] = 'HVAC_Mode',
        ['1/1/10'] = 'Energy_Hours_Meter'

    }

    mqtt_to_object_conv = { }

    datatypes = { }

    grp.sender = 'mq'

    require('socket')

    for addr, _ in pairs(object_to_mqtt) do

        local obj = grp.find(addr)

        if obj then

            datatypes[addr] = obj.datatype

        end

    end

    mclient = require('mosquitto').new()

    mclient.ON_CONNECT = function (res, ...)

        log('mqtt connect status', res, ...)

        if res then

            for topic, _ in pairs(mqtt_to_object) do

                mclient:subscribe(topic)

            end

        else

            mclient:disconnect()

        end

    end

    mclient.ON_MESSAGE = function(mid, topic, payload)

        local addr = mqtt_to_object[ topic ]

        if addr then

            local fn = mqtt_to_object_conv[ topic ]

            if fn then

                payload = fn(payload)

            end

            grp.write(addr, payload)

        end

    end
    
    mclient.ON_DlSCONNECT = function(...)

        log('mqtt disconnect', ...)

        mclientfd = nil

    end

    function mconnect()

        local fd

        mclient:login_set('sonaotomasyon' , 'sonaotomasyon')

        mclient:connect(broker)

        fd = mclient:socket()

        -- fd ref is valid
        if fd then

            mclientfd = fd

        end

    end

    mconnect()

    function publishvalue(event)
        
        -- message from us or client is not connected 
        if event.sender  == 'mq' or not mclientfd then
            
            return
        
        end

        local addr = event.dst
        
        local dpt = datatypes[addr]
        
        local topic = object_to_mqtt[addr]
    
        -- unknown object
        if not dpt or not topic then
            
            return
        
        end
    
        local value = busdatatype.decode(event.datahex, dpt) 
        
        if value ==  nil then
            
            if type(value) == 'boolean' then 
                
                value = value and 1 or 0
            
            end
    
            mclient:publish(topic, tostring(value)) 
        
        end
    
    end
    
    lbclient = require('localbus').new(1)

    lbclient:sethandler('groupwrite', publishvalue)
    
    lbclientfd = socket.fdmaskset(lbclient:getfd(), 'r')
    
    -- run timer every 5 seconds
    timer = require('timerfd').new(5)

    timerfd = socket.fdmaskset(timer:getfd(), 'r')

end


-- mqtt connected 
if mclientfd then

    mclientfdset = socket.fdmaskset(mclientfd, mclient:want_write() and 'rw' or  'r')

    res, lbclientstat, timerstat, mclientstat = socket.selectfds(10, lbclientfd, timerfd, mclientfdset)

    -- mqtt not connected
else
    res, lbclientstat, timerstat = socket.selectfds(10, lbclientfd, timerfd)
end

if mclientfd and mclientstat then

    if socket.fdmaskread(mclientstat) then

        mclient:loop_read()

    end

    if socket.fdmaskwrite(mclientstat) then

        mclient:loop_write()

    end

end

if lbclientstat then

    lbclient:step()

end

if timerstat then

    -- clear armed timer
    timer:read()

    if mclientfd then

        mclient:loop_misc()

    else

        mconnect()

    end

end
