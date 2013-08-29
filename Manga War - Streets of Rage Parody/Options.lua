
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
	Csound=audio.play(Sound2)
	if event.target == box2 and Boxchecker==0 then
		storyboard.gotoScene( "Menu", options)
		
	end
end


function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/MainBackground.png",0,0)
	group:insert(Back1)
	
	obox1 = display.newRoundedRect( 0, 0, 380, 70,10)
	obox1:setFillColor(255,255,255) 
	obox1.x=w*0.5
	obox1.y=h*0.3
	group:insert(obox1)
	
	box1 = display.newRoundedRect( 0, 0, 370, 60,10)
	box1:setFillColor(0,0,0) 
	box1.x=w/2
	box1.y=h*0.3
	group:insert(box1)
	
	text1 = display.newText("Clear All Saved Data",50,50, "Emulogic", 18)
	text1:setTextColor(255,255,255) 
	text1.x=w/2
	text1.y=h*0.3
	group:insert(text1)
	
	obox2 = display.newRoundedRect( 0, 0, 160, 70,10)
	obox2:setFillColor(255,255,255) 
	obox2.x=w*0.5
	obox2.y=h*0.75
	group:insert(obox2)
	
	box2 = display.newRoundedRect( 0, 0, 150, 60,10)
	box2:setFillColor(0,0,0) 
	box2.x=w/2
	box2.y=h*0.75
	group:insert(box2)

	text2 = display.newText("Back",100,50, "Emulogic", 28)
	text2:setTextColor(255,255,255) 
	text2.x=w/2
	text2.y=h*0.75
	group:insert(text2)
	
	obox3 = display.newRoundedRect( 0, 0, 330, 160,20)
	obox3:setFillColor(255,255,255) 
	obox3.x=w*0.5
	obox3.y=h*0.5
	obox3.alpha=0
	group:insert(obox3)
	
	box3 = display.newRoundedRect( 0, 0, 320, 150,20)
	box3:setFillColor(0,0,0) 
	box3.x=w/2
	box3.y=h*0.5
	box3.alpha=0
	group:insert(box3)

	text3 = display.newText("Are You Sure?",100,75, "Emulogic", 22)
	text3:setTextColor(255,255,255) 
	text3.x=w/2
	text3.y=h*0.35
	text3.alpha=0
	group:insert(text3)
	
	box4 = display.newRoundedRect( 0, 0, 100, 50,10)
	box4:setFillColor(0,255,0) 
	box4.x=w*0.3
	box4.y=h*0.57
	box4.alpha=0
	group:insert(box4)

	text4 = display.newText("YES",100,50, "Emulogic", 28)
	text4:setTextColor(255,255,255) 
	text4.x=w*0.3
	text4.y=h*0.57
	text4.alpha=0
	group:insert(text4)
	
	box5 = display.newRoundedRect( 0, 0, 100, 50,10)
	box5:setFillColor(255,0,0) 
	box5.x=w*0.7
	box5.y=h*0.57
	box5.alpha=0
	group:insert(box5)

	text5 = display.newText("NO",100,50, "Emulogic", 28)
	text5:setTextColor(255,255,255) 
	text5.x=w*0.7
	text5.y=h*0.57
	text5.alpha=0
	group:insert(text5)
	
	Boxchecker=0
	
	function DeleteOrNot(event)
		
		if Boxchecker==1 then
			if event.target == box4 then
				local path = system.pathForFile( "GameData.txt", system.ResourceDirectory )
				local file = io.open( path, "w" )
				for i = 1, 3, 1 do
					file:write(0)
					file:write( "\n")
				end
				io.close( file )
					
			end
			Boxchecker=0
			obox3.alpha=0
			box3.alpha=0
			text3.alpha=0
			box4.alpha=0
			text4.alpha=0
			box5.alpha=0
			text5.alpha=0
		end
	end
	
	function AreYouSure()
		if Boxchecker==0 then
			
			Boxchecker=1
			obox3.alpha=1
			box3.alpha=1
			text3.alpha=1
			box4.alpha=1
			text4.alpha=1
			box5.alpha=1
			text5.alpha=1
		end
	end
	
	
end

function scene:enterScene( event )
	
	box1:addEventListener("tap", AreYouSure)
	box2:addEventListener("tap", changeScene)
	box4:addEventListener("tap", DeleteOrNot)
	box5:addEventListener("tap", DeleteOrNot)
end

function scene:exitScene()
	box1:removeEventListener("tap", AreYouSure)
	box2:removeEventListener("tap", changeScene)
	box4:removeEventListener("tap", DeleteOrNot)
	box5:removeEventListener("tap", DeleteOrNot)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "Options" )
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