BASE:I("Checking statics")


function DestroyStatic()
    local function destroyStaticIfAlive(staticName)
        local static = STATIC:FindByName(staticName, false)
        if static and static:IsAlive() then
            static:Destroy(true)
            
        end
    end
   if zones.oscar and not zones.oscar.active then
        for _, staticName in ipairs({"Static SSM SS-1C Scud-B-1", "Static SSM SS-1C Scud-B-2", "Static SSM SS-1C Scud-B-3", "Static FARP Tent-25",
		"Static FARP Tent-24", "Static FARP Tent-21", "Static FARP Tent-22", "Static FARP Tent-23", 
		"Static Truck ZIL-135", "Static Truck ZIL-135-2"}) do
            destroyStaticIfAlive(staticName)
        end
    end
	if zones.substationnorth and not zones.substationnorth.active then
        for _, staticName in ipairs({"substation1", "substation2", "substation3", "substation4"}) do
            destroyStaticIfAlive(staticName)
        end
    end	
	if zones.substationwest and not zones.substationwest.active then
        for _, staticName in ipairs({"Static GeneratorF-2", "substationW2", "substationW1"}) do
            destroyStaticIfAlive(staticName)
        end
    end	
	if zones.tv and not zones.tv.active then
        for _, staticName in ipairs({"tv2", "tv1"}) do
            destroyStaticIfAlive(staticName)
        end
    end
	if zones.radio and not zones.radio.active then
        for _, staticName in ipairs({"radioTower1"}) do
            destroyStaticIfAlive(staticName)
        end
    end
end

DestroyStatic()

BASE:I("Checking statics completed")

