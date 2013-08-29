
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
	
	backSound=audio.stop()
	Csound=audio.play(Sound2)
	if event.target == box1 then
		PlayerChoice=1
	elseif event.target == box2 then
		PlayerChoice=2
	elseif event.target == box3 then
		PlayerChoice=3
	elseif event.target == box4 then
		PlayerChoice=4
	elseif event.target == box5 then
		PlayerChoice=5
	elseif event.target == box6 then
		PlayerChoice=6
	end
	if LevelSelected==0 then
		storyboard.gotoScene( "PreLevel1",options)
	else
		storyboard.gotoScene( "PreLevel"..LevelSelected,options)
	end
	
end


function scene:createScene( event )
	local group = self.view
		
	ScoreCounter=0
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	box1 = display.newImage("Images/MenuParts/Char1.png",0,0)
	box1.x=w*0.2
	box1.y=h*0.28
	group:insert(box1)
	
	box2 = display.newImage("Images/MenuParts/Char2.png",0,0)
	box2.x=w*0.5
	box2.y=h*0.28
	group:insert(box2)
	
	box3 = display.newImage("Images/MenuParts/Char3.png",0,0)
	box3.x=w*0.8
	box3.y=h*0.28
	group:insert(box3)
	
	box4 = display.newImage("Images/MenuParts/Char4.png",0,0)
	box4.x=w*0.2
	box4.y=h*0.72
	group:insert(box4)
	
	box5 = display.newImage("Images/MenuParts/Char5.png",0,0)
	box5.x=w*0.5
	box5.y=h*0.72
	group:insert(box5)
	
	box6 = display.newImage("Images/MenuParts/Char6.png",0,0)
	box6.x=w*0.8
	box6.y=h*0.72
	group:insert(box6)
	
	box7 = display.newImage("Images/MenuParts/CharLock.png",0,0)
	box7.x=w*0.2
	box7.y=h*0.72
	box7.alpha=0
	group:insert(box7)
	
	box8 = display.newImage("Images/MenuParts/CharLock.png",0,0)
	box8.x=w*0.5
	box8.y=h*0.72
	box8.alpha=0
	group:insert(box8)
	
	box9 = display.newImage("Images/MenuParts/CharLock.png",0,0)
	box9.x=w*0.8
	box9.y=h*0.72
	box9.alpha=0
	group:insert(box9)
	
	
	
	SaveVariable={}
	local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
	local file = io.open( path, "r" )
	for i = 1, 3, 1 do
		SaveVariable[i] = file:read( "*n" )
	end
	io.close( file )
	
	if SaveVariable[1] == 0 then
		box7.alpha=0.9
	end
	if SaveVariable[2] == 0 then
		box8.alpha=0.9
	end
	if SaveVariable[3] == 0 then
		box9.alpha=0.9
	end
end

function scene:enterScene( event )
	
	box1:addEventListener("tap", changeScene)
	box2:addEventListener("tap", changeScene)
	box3:addEventListener("tap", changeScene)
	if SaveVariable[1] == 1 then
		box4:addEventListener("tap", changeScene)
	end
	if SaveVariable[2] == 1 then
		box5:addEventListener("tap", changeScene)
	end
	if SaveVariable[3] == 1 then
		box6:addEventListener("tap", changeScene)
	end
end

function scene:exitScene()
	box1:removeEventListener("tap", changeScene)
	box2:removeEventListener("tap", changeScene)
	box3:removeEventListener("tap", changeScene)
	if SaveVariable[1] == 1 then
		box4:removeEventListener("tap", changeScene)
	end
	if SaveVariable[2] == 1 then
		box5:removeEventListener("tap", changeScene)
	end
	if SaveVariable[3] == 1 then
		box6:removeEventListener("tap", changeScene)
	end
end

function scene:didExitScene( event )
	storyboard.purgeScene( "PlayerSelect" )
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