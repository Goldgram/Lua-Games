
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 100 }
	backSound=audio.stop()
	Csound=audio.play(Sound2)
	LevelSelected=0
	GameDifficulty=0
	BossDead=0
	DeadChecker=0
	MovingSceneChecker=0
	LevelStage=1
	storyboard.gotoScene( "Menu", options)
end

function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	
	text1 = display.newText("Game Over",100,50, "Emulogic", 28)
	text1.x=w/2
	text1.y=h/3
	group:insert(text1)
	
	oBox1 = display.newRoundedRect( 0, 0, 360, 70,10)
	oBox1:setFillColor(255,255,255) 
	oBox1.x=w/2
	oBox1.y=h*2/3
	group:insert(oBox1)
	
	box1 = display.newRoundedRect( 0, 0, 350, 60,10)
	box1:setFillColor(0,0,0) 
	box1.x=w/2
	box1.y=h*2/3
	group:insert(box1)

	text2 = display.newText("Main Menu",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*2/3
	group:insert(text2)

	

end

function scene:enterScene( event )
	backSound=audio.play( Music11, { channel=1, loops=-1, fadein=100 }  ) 
	box1:addEventListener("touch", changeScene)
end

function scene:exitScene()
	box1:removeEventListener("touch", changeScene)
end

function scene:didExitScene( event )
	storyboard.purgeScene( "EndScreen1" )
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