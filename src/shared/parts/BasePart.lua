--!strict
export type BaseBlock = {
	part: BasePart,
	Init: (self: BaseBlock) -> ()
}

local BaseBlock = {}
BaseBlock.__index = BaseBlock

function BaseBlock.new(part: BasePart): BaseBlock
	local self = {
		part = part,
	} :: any -- temporarily allow construction
	return setmetatable(self, BaseBlock) :: BaseBlock
end

function BaseBlock:Init(): nil
	-- no-op
	return
end

return BaseBlock