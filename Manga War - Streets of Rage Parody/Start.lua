
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 50 }
		backSound=audio.stop()
		Csound=audio.play(Sound2)
		storyboard.gotoScene( "Menu", options)
end


function scene:createScene( event )
	local group = self.view
	
	Back1=display.newImage("Images/MenuParts/StartBackground.png",0,0)
	group:insert(Back1)
	
	StartBox = display.newImage("Images/MenuParts/WordStart.png",0,0)
	StartBox.x=w/2
	StartBox.y=h*0.8
	group:insert(StartBox)
	
	function flashOne()
		transition.to( StartBox, { alpha=0.1, time=1000, onComplete = flashTwo } )
	end

	function flashTwo()
		transition.to( StartBox, { alpha=1, time=50,onComplete = flashOne } )
	end

end

function scene:enterScene( event )
	backSound=audio.play( Music7, { channel=1, loops=-1, fadein=50 }  ) 
	flashOne()
	StartBox:addEventListener("tap", changeScene)
	
end

function scene:exitScene()
	StartBox:removeEventListener("tap", changeScene)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "Start" )
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