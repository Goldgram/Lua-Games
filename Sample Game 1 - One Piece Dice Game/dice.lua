local dice = {}
local dice_mt = { __index = dice }

function dice.new(i,j)
	local newDice = {state = 0, number = math.random(1,6),picBox= display.newRoundedRect((h/35)+(i*h/5.25),(h/35)+(j*h/5.25),h/5.5,h/5.5,h/30)}
	return setmetatable( newDice, dice_mt )
end

function dice:numPic(i,j)
	display.remove(pic[i..j])
	pic[i..j] = display.newImage( "face"..self.number..".png")
	pic[i..j].width = h/5.5
	pic[i..j].height = h/5.5
	pic[i..j].x = (h/8.5)+(i*h/5.25)
	pic[i..j].y = (h/8.5)+(j*h/5.25)
end

function dice:clickDice()
	if self.state == 0 then
		self.state = 1
		self.picBox:setFillColor( 255, 0, 0 )
	elseif self.state == 1 then
		self.state = 0
		self.picBox:setFillColor( 255, 255, 255 )
	end
end

function dice:rollDice(i,j)
	self.number=math.random(1,6)
	self:numPic(i,j)
	self.state = 0
	self.picBox:setFillColor( 255, 255, 255 )
end

return dice

