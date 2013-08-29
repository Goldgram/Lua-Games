
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function changeScene0(event)
	local options = {effect = "fade", time = 50 }
	Ssound=audio.stop()
	storyboard.gotoScene( "GameLevel1", options)
end

function scene:createScene( event )
	local group = self.view
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
	block1 = display.newImage("Images/MenuParts/FrameChar"..PlayerChoice..".png",-320,0)
	group:insert(block1)
	block2 = display.newImage("Images/MenuParts/FrameLvl1.png",480,0)
	group:insert(block2)
	
	SideLeft = display.newRect(-240,0,240,320)
	SideLeft:setFillColor( 100, 100, 100 )
	SideRight = display.newRect(w,0,240,320)
	SideRight:setFillColor( 100, 100, 100 )
	SideTop = display.newRect(0,-240,480,240)
	SideTop:setFillColor( 100, 100, 100 )
	SideBottom = display.newRect(0,h,480,240)
	SideBottom:setFillColor( 100, 100, 100 )
	
	group:insert(SideLeft)
	group:insert(SideRight)
	group:insert(SideTop)
	group:insert(SideBottom)
	
end

function scene:enterScene( event )
	Csound=audio.stop()
	Ssound=audio.play(Sound1)
	transition.to( block1, {x=160, time = 300} )
	transition.to( block2, {x=320, time = 300} )
	Timer1=timer.performWithDelay(2000,changeScene0)
end

function scene:exitScene()
	timer.cancel(Timer1)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "PreLevel1" )
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