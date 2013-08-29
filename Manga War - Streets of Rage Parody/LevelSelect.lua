
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
	
	Csound=audio.play(Sound2)
	if event.target == box1 then
		LevelSelected=1
	elseif event.target == box2 then
		LevelSelected=2
	elseif event.target == box3 then
		LevelSelected=3
	elseif event.target == box4 then
		LevelSelected=4
	elseif event.target == box5 then
		LevelSelected=5
	elseif event.target == box6 then
		LevelSelected=6
	elseif event.target == box7 then
		LevelSelected=0
	end
	if LevelSelected~=0 then
		storyboard.gotoScene( "Difficulty", options)
	else
	storyboard.gotoScene( "Menu", options)
	end
	
end


function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	obox1 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox1:setFillColor(255,255,255) 
	obox1.x=w*0.3
	obox1.y=h*0.2
	group:insert(obox1)
	
	box1 = display.newRoundedRect( 0, 0, 150, 40,5)
	box1:setFillColor(0,0,0) 
	box1.x=w*0.3
	box1.y=h*0.2
	group:insert(box1)
	
	text1 = display.newText("Level 1",100,50, "Emulogic", 18)
	text1:setTextColor(255,255,255) 
	text1.x=w*0.3
	text1.y=h*0.2
	group:insert(text1)
	
	obox2 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox2:setFillColor(255,255,255) 
	obox2.x=w*0.3
	obox2.y=h*0.4
	group:insert(obox2)
	
	box2 = display.newRoundedRect( 0, 0, 150, 40,5)
	box2:setFillColor(255,0,0)
	box2.x=w*0.3
	box2.y=h*0.4
	group:insert(box2)

	text2 = display.newText("Level 2",100,50, "Emulogic", 18)
	text2:setTextColor(255,255,255) 
	text2.x=w*0.3
	text2.y=h*0.4
	group:insert(text2)
	
	obox3 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox3:setFillColor(255,255,255) 
	obox3.x=w*0.3
	obox3.y=h*0.6
	group:insert(obox3)
	
	box3 = display.newRoundedRect( 0, 0, 150, 40,5)
	box3:setFillColor(255,0,0)
	box3.x=w*0.3
	box3.y=h*0.6
	group:insert(box3)

	text3 = display.newText("Level 3",100,50, "Emulogic", 18)
	text3:setTextColor(255,255,255) 
	text3.x=w*0.3
	text3.y=h*0.6
	group:insert(text3)	
	
	obox4 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox4:setFillColor(255,255,255) 
	obox4.x=w*0.7
	obox4.y=h*0.2
	group:insert(obox4)
	
	box4 = display.newRoundedRect( 0, 0, 150, 40,5)
	box4:setFillColor(255,0,0)
	box4.x=w*0.7
	box4.y=h*0.2
	group:insert(box4)
	
	text4 = display.newText("Level 4",100,50, "Emulogic", 18)
	text4:setTextColor(255,255,255) 
	text4.x=w*0.7
	text4.y=h*0.2
	group:insert(text4)
	
	obox5 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox5:setFillColor(255,255,255) 
	obox5.x=w*0.7
	obox5.y=h*0.4
	group:insert(obox5)
	
	box5 = display.newRoundedRect( 0, 0, 150, 40,5)
	box5:setFillColor(255,0,0)
	box5.x=w*0.7
	box5.y=h*0.4
	group:insert(box5)

	text5 = display.newText("Level 5",100,50, "Emulogic", 18)
	text5:setTextColor(255,255,255) 
	text5.x=w*0.7
	text5.y=h*0.4
	group:insert(text5)
	
	obox6 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox6:setFillColor(255,255,255) 
	obox6.x=w*0.7
	obox6.y=h*0.6
	group:insert(obox6)
	
	box6 = display.newRoundedRect( 0, 0, 150, 40,5)
	box6:setFillColor(255,0,0)
	box6.x=w*0.7
	box6.y=h*0.6
	group:insert(box6)

	text6 = display.newText("Level 6",100,50, "Emulogic", 18)
	text6:setTextColor(255,255,255) 
	text6.x=w*0.7
	text6.y=h*0.6
	group:insert(text6)
	
	obox7 = display.newRoundedRect( 0, 0, 160, 50,5)
	obox7:setFillColor(255,255,255) 
	obox7.x=w*0.5
	obox7.y=h*0.8
	group:insert(obox7)
	
	
	box7 = display.newRoundedRect( 0, 0, 150, 40,5)
	box7:setFillColor(0,0,0) 
	box7.x=w/2
	box7.y=h*0.8
	group:insert(box7)

	text7 = display.newText("Back",100,50, "Emulogic", 28)
	text7:setTextColor(255,255,255) 
	text7.x=w/2
	text7.y=h*0.8
	group:insert(text7)
	
	SaveVariable={}
	local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
	local file = io.open( path, "r" )
	for i = 1, 3, 1 do
		SaveVariable[i] = file:read( "*n" )
	end
	io.close( file )
	
	if SaveVariable[1] == 1 then
		box2:setFillColor(0,0,0) 
		box3:setFillColor(0,0,0) 
		box4:setFillColor(0,0,0) 
	end
	if SaveVariable[2] == 1 then
		box2:setFillColor(0,0,0) 
		box3:setFillColor(0,0,0) 
		box4:setFillColor(0,0,0) 
		box5:setFillColor(0,0,0) 
	end
	if SaveVariable[3] == 1 then
		box2:setFillColor(0,0,0) 
		box3:setFillColor(0,0,0) 
		box4:setFillColor(0,0,0) 
		box5:setFillColor(0,0,0) 
		box6:setFillColor(0,0,0) 
	end
end

function scene:enterScene( event )
	
	box1:addEventListener("tap", changeScene)
	
	if SaveVariable[1] == 1 then
		box2:addEventListener("tap", changeScene)
		box3:addEventListener("tap", changeScene)
		box4:addEventListener("tap", changeScene)
	end
	if SaveVariable[2] == 1 then
		box2:addEventListener("tap", changeScene)
		box3:addEventListener("tap", changeScene)
		box4:addEventListener("tap", changeScene)
		box5:addEventListener("tap", changeScene)
	end
	if SaveVariable[3] == 1 then
		box2:addEventListener("tap", changeScene)
		box3:addEventListener("tap", changeScene)
		box4:addEventListener("tap", changeScene)
		box5:addEventListener("tap", changeScene)
		box6:addEventListener("tap", changeScene)
	end
	box7:addEventListener("tap", changeScene)
	
	
end

function scene:exitScene()
	box1:removeEventListener("tap", changeScene)
	
	if SaveVariable[1] == 1 then
		box2:removeEventListener("tap", changeScene)
		box3:removeEventListener("tap", changeScene)
		box4:removeEventListener("tap", changeScene)
	end
	if SaveVariable[2] == 1 then
		box2:removeEventListener("tap", changeScene)
		box3:removeEventListener("tap", changeScene)
		box4:removeEventListener("tap", changeScene)
		box5:removeEventListener("tap", changeScene)
	end
	if SaveVariable[3] == 1 then
		box2:removeEventListener("tap", changeScene)
		box3:removeEventListener("tap", changeScene)
		box4:removeEventListener("tap", changeScene)
		box5:removeEventListener("tap", changeScene)
		box6:removeEventListener("tap", changeScene)
	end
	box7:removeEventListener("tap", changeScene)
end

function scene:didExitScene( event )
	storyboard.purgeScene( "LevelSelect" )
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