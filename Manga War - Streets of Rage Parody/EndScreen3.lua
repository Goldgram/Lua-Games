
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 100 }
	Specialsound=audio.stop()
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
	
	text1 = display.newText(" Congratulations!\n	You Have Unlocked:",100,50, "Emulogic", 22)
	text1.x=w/2
	text1.y=h*0.25
	group:insert(text1)
	
	oBox1 = display.newRoundedRect( 0, 0, 310, 60,10)
	oBox1:setFillColor(255,255,255) 
	oBox1.x=w/2
	oBox1.y=h*0.75
	group:insert(oBox1)
	
	box2 = display.newRoundedRect( 0, 0, 300, 50,10)
	box2:setFillColor(0,0,0) 
	box2.x=w/2
	box2.y=h*0.75
	group:insert(box2)

	text2 = display.newText("OK",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*0.75
	group:insert(text2)
	
	if GameDifficulty==1 then
		Wintext="RORONOA ZORO"
	elseif GameDifficulty==0.85 then
		Wintext="SASUKE UCHIHA"
	elseif GameDifficulty==0.7 then
		Wintext="GOKU"
	end
	text3 = display.newText(Wintext,100,50, "Emulogic", 22)
	text3.x=w/2
	text3.y=h*0.5
	group:insert(text3)
	
end

function scene:enterScene( event )
	Csound=audio.stop()
	Specialsound=audio.play(Sound3)
	box2:addEventListener("touch", changeScene)
end

function scene:exitScene()
	box2:removeEventListener("touch", changeScene)
end

function scene:didExitScene( event )
	storyboard.purgeScene( "EndScreen3" )
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