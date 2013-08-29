
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 100 }
	backSound=audio.stop()
	Csound=audio.play(Sound2)
	if GameDifficulty==1 and SaveVariable[1]==0 then
		local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
		local file = io.open( path, "w" )
		file:write(1)
		file:write( "\n")
		file:write(SaveVariable[2])
		file:write( "\n")
		file:write(SaveVariable[3])
		file:write( "\n")
		io.close( file )
		storyboard.gotoScene( "EndScreen3", options)
	elseif GameDifficulty==0.85 and SaveVariable[2]==0 then
		local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
		local file = io.open( path, "w" )
		file:write(SaveVariable[1])
		file:write( "\n")
		file:write(1)
		file:write( "\n")
		file:write(SaveVariable[3])
		file:write( "\n")
		io.close( file )
		storyboard.gotoScene( "EndScreen3", options)
	elseif GameDifficulty==0.7 and SaveVariable[3]==0 then
		local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
		local file = io.open( path, "w" )
		file:write(SaveVariable[1])
		file:write( "\n")
		file:write(SaveVariable[2])
		file:write( "\n")
		file:write(1)
		file:write( "\n")
		io.close( file )
		storyboard.gotoScene( "EndScreen3", options)
	else
	LevelSelected=0
	GameDifficulty=0
	BossDead=0
	DeadChecker=0
	MovingSceneChecker=0
	LevelStage=1
	storyboard.gotoScene( "Menu", options)
	end
end

function scene:createScene( event )
	local group = self.view
	backSound=audio.play( Music10, { channel=1, loops=-1, fadein=100 }  ) 
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	text1 = display.newText("You Win\n Score:",100,50, "Emulogic", 28)
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

	text2 = display.newText("Main Menu",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*0.75
	group:insert(text2)
	
	text3 = display.newText("000000",100,50, "Emulogic", 28)
	text3.x=w/2
	text3.y=h*0.5
	group:insert(text3)
	
	if ScoreCounter<1000000 then
			text3.text=ScoreCounter
	else
		text3.text="999999"
	end

end

function scene:enterScene( event )
	box2:addEventListener("touch", changeScene)
end

function scene:exitScene()
	box2:removeEventListener("touch", changeScene)
end

function scene:didExitScene( event )
	storyboard.purgeScene( "EndScreen2" )
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