--!strict
local Base = require(script.Parent.BasePart)
type BaseBlock = Base.BaseBlock

export type SpeedPart = BaseBlock & {
	speed: number
}

local SpeedPart = {}
SpeedPart.__index = SpeedPart
setmetatable(SpeedPart, { __index = Base })

function SpeedPart.new(part: BasePart, speed: number): SpeedPart
	local self = {
		part = part,
        speed = speed
	} :: any

	return setmetatable(self, SpeedPart) :: SpeedPart
end

function SpeedPart:Init(): nil
	self.part.Touched:Connect(function(hit: BasePart)
		local model = hit.Parent
		local hum = model and model:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = self.speed
		end
	end)
    return
end

return SpeedPart