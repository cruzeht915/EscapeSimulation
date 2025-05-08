--!strict
local Base = require(script.Parent.BasePart)
type BasePartClass = Base.BaseBlock

export type LavaPart = BasePartClass & {}

local LavaPart = {}
LavaPart.__index = LavaPart
setmetatable(LavaPart, { __index = Base })

function LavaPart.new(part: BasePart): LavaPart
	local self = {
		part = part,
	} :: any

	return setmetatable(self, LavaPart) :: LavaPart
end

function LavaPart:Init(): nil
	self.part.Touched:Connect(function(hit: BasePart)
		local model = hit.Parent
		local hum = model and model:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Health = 0
		end
	end)
    return
end

return LavaPart