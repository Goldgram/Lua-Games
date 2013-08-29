
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function changeScene10(event)
	local options = {effect = "fade", time = 10 }
	Ssound=audio.stop()
	storyboard.gotoScene( "GameLevel6", options)
end

function scene:createScene( event )
	local group = self.view
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	text1 = display.newText("Current Score:",100,50, "Emulogic", 28)
	text1:setTextColor(255,255,255) 
	text1.x=w/2
	text1.y=h/3
	group:insert(text1)
	
	text2 = display.newText("",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*2/3
	group:insert(text2)
	
	Doortime=3000
	Scenetime=4300
	if ScoreCounter==0 then
	text1.alpha=0
	text2.y=h/2
	text2.text="Ready..."
	Doortime=1000
	Scenetime=3300
	else
		if ScoreCounter<1000000 then
				text2.text=ScoreCounter
		else
			text3.text="999999"
		end
	end
	block1 = display.newImage("Images/MenuParts/FrameChar"..PlayerChoice..".png",-320,0)
	group:insert(block1)
	block2 = display.newImage("Images/MenuParts/FrameLvl6.png",480,0)
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
	
	function CloseDoors()
		Specialsound=audio.stop()
		Ssound=audio.play(Sound1)
		transition.to( block1, {x=160, time = 300} )
		transition.to( block2, {x=320, time = 300} )
	end
	
	
end

function scene:enterScene( event )
	
	Specialsound=audio.play(Sound3)
	timer.performWithDelay(Doortime,CloseDoors)
	Timer1=timer.performWithDelay(Scenetime,changeScene10)
end

function scene:exitScene()
	timer.cancel(Timer1)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "PreLevel6" )
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