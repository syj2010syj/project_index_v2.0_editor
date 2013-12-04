    
    require "Type.lua" --自定义类型
    
    require "BJ.lua" --导入BJ的Lua
    
    printTo = function(id, time, s) --向指定玩家发送消息
        if not GetCreepCampFilterState() then return end --文字接收选项
        if not s then
            time, s = 60, time
        end
        if type(id) == "number" then
            DisplayTimedTextToPlayer(Player(id), 0, 0, time, s)
        else
            DisplayTimedTextToPlayer(id, 0, 0, time, s)
        end
    end
    
    luaDebug = function(s)
        old.print(s)
    end

    print = function(time, s) --如果不填time则默认60秒
        if not GetCreepCampFilterState() then return end --文字接收选项
        if s then
            for i = 0, 15, 1 do
                printTo(i, time, s)
            end
        elseif time then
            s = time
            time = 60
            print(time, s)
        end
    end
    
    Debug2 = function(s)
        if s then
            print(s)
        else
            return true --正式版本改为false
        end
    end
    
    Debug = function()
        return false
    end
    
    Debug = Debug2
    
    luaDone = function()
        if Debug() then
            SaveInteger(LuaHT, 0, 0, 2) --通报lua引擎启动成功并显示
        else
            SaveInteger(LuaHT, 0, 0, 1) --通报lua引擎启动成功
        end
    end
    
    string2id = function(s)
        local id = 0
        local i = -1
        local n = 1
        while true do
            local sub = string.byte(s, i)
            if sub then
				id = id + sub * n
                i = i - 1
                n = n * 256
            else
                return id
            end
        end
    end
    
    id2string = function(i)
        local i4 = i%256
        local i3 = i/256%256
        local i2 = i/256/256%256
        local i1 = i/256/256/256%256
        return string.char(i1, i2, i3, i4)
    end
