
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
	
	Csound=audio.play(Sound2)
	if event.target == box1 then
		GameDifficulty=1
	elseif event.target == box2 then
		GameDifficulty=0.85
	elseif event.target == box3 then
		GameDifficulty=0.7
	end
	storyboard.gotoScene( "PlayerSelect", options)

end


function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	obox1 = display.newRoundedRect( 0, 0, 190, 60,10)
	obox1:setFillColor(255,255,255) 
	obox1.x=w*0.5
	obox1.y=h*0.25
	group:insert(obox1)
	
	box1 = display.newRoundedRect( 0, 0, 180, 50,10)
	box1:setFillColor(0,0,0) 
	box1.x=w/2
	box1.y=h*0.25
	group:insert(box1)
	
	text1 = display.newText("Easy",100,50, "Emulogic", 28)
	text1:setTextColor(255,255,255) 
	text1.x=w/2
	text1.y=h*0.25
	group:insert(text1)
	
	obox2 = display.newRoundedRect( 0, 0, 190, 60,10)
	obox2:setFillColor(255,255,255) 
	obox2.x=w*0.5
	obox2.y=h*0.5
	group:insert(obox2)
	
	box2 = display.newRoundedRect( 0, 0, 180, 50,10)
	box2:setFillColor(0,0,0) 
	box2.x=w/2
	box2.y=h*0.5
	group:insert(box2)

	text2 = display.newText("Medium",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*0.5
	group:insert(text2)
	
	obox3 = display.newRoundedRect( 0, 0, 190, 60,10)
	obox3:setFillColor(255,255,255) 
	obox3.x=w*0.5
	obox3.y=h*0.75
	group:insert(obox3)
	
	box3 = display.newRoundedRect( 0, 0, 180, 50,10)
	box3:setFillColor(0,0,0) 
	box3.x=w/2
	box3.y=h*0.75
	group:insert(box3)

	text3 = display.newText("Hard",100,50, "Emulogic", 28)
	text3:setTextColor(255,255,255) 
	text3.x=w/2
	text3.y=h*0.75
	group:insert(text3)
	
end

function scene:enterScene( event )
	
	box1:addEventListener("tap", changeScene)
	box2:addEventListener("tap", changeScene)
	box3:addEventListener("tap", changeScene)
	
end

function scene:exitScene()
	box1:removeEventListener("tap", changeScene)
	box2:removeEventListener("tap", changeScene)
	box3:removeEventListener("tap", changeScene)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "Difficulty" )
end

function scene:destroyScene( event )
	local group = self.view
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene)
scene:addEventListener( "destroyScene", scene )

return scene