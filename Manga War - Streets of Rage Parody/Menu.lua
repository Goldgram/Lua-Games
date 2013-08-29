
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
	Csound=audio.play(Sound2)
	if event.target == Box1 then
		LevelSelected=0
		storyboard.gotoScene( "Difficulty", options)
	elseif event.target == Box2 then
		storyboard.gotoScene( "LevelSelect", options)
	elseif event.target == Box3 then
		storyboard.gotoScene( "Options", options)
	end
	
end


function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	Box1 = display.newRoundedRect( 0, 0, 300, 60,10)
	Box1:setFillColor(255,255,255) 
	Box1.x=w/2
	Box1.y=h*0.25
	group:insert(Box1)
	
	inBox1 = display.newRoundedRect( 0, 0, 290, 50,5)
	inBox1:setFillColor(0,0,0) 
	inBox1.x=w/2
	inBox1.y=h*0.25
	group:insert(inBox1)
	
	text1 = display.newText("PLAY",100,50, "Emulogic", 28)
	text1:setTextColor(255,255,255) 
	text1.x=w/2
	text1.y=h*0.25
	group:insert(text1)
	
	Box2 = display.newRoundedRect( 0, 0, 300, 60,10)
	Box2:setFillColor(255,255,255) 
	Box2.x=w/2
	Box2.y=h*0.5
	group:insert(Box2)
	
	inBox2 = display.newRoundedRect( 0, 0, 290, 50,5)
	inBox2:setFillColor(0,0,0) 
	inBox2.x=w/2
	inBox2.y=h*0.5
	group:insert(inBox2)
	
	text2 = display.newText("Level Select",100,50, "Emulogic", 23)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*0.5
	group:insert(text2)
	
	Box3 = display.newRoundedRect( 0, 0, 300, 60,10)
	Box3:setFillColor(255,255,255) 
	Box3.x=w/2
	Box3.y=h*0.75
	group:insert(Box3)
	
	inBox3 = display.newRoundedRect( 0, 0, 290, 50,5)
	inBox3:setFillColor(0,0,0) 
	inBox3.x=w/2
	inBox3.y=h*0.75
	group:insert(inBox3)
	
	text3 = display.newText("Options",100,50, "Emulogic", 28)
	text3:setTextColor(255,255,255) 
	text3.x=w/2
	text3.y=h*0.75
	group:insert(text3)

end

function scene:enterScene( event )
	Csound=audio.stop()
	backSound=audio.play( Music8, { channel=1, loops=-1, fadein=50 }  ) 
	Box1:addEventListener("tap", changeScene)
	Box2:addEventListener("tap", changeScene)
	Box3:addEventListener("tap", changeScene)
	
end

function scene:exitScene()
	Box1:removeEventListener("tap", changeScene)
	Box2:removeEventListener("tap", changeScene)
	Box3:removeEventListener("tap", changeScene)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "Menu" )
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