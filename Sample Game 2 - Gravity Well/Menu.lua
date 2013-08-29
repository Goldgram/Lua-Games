
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 100 }
	audio.play(ClickSound)
	if event.phase == "began" then
		if event.target == Easy then
			LevelDifficulty=1
		elseif event.target == Medium then
			LevelDifficulty=2
		elseif event.target == Hard then
			LevelDifficulty=3
		end
		storyboard.gotoScene( "GameLevel", options)
	end
end


function scene:createScene( event )
	local group = self.view
	
	Background = display.newImage("Images/gravity.png")
	Background.width=h
	Background.height=h
	Background.x=w*0.5
	Background.y=h*0.5
	group:insert(Background)
	
	Title = display.newImage("Images/Title.png")
	Title.width=w*0.9
	Title.height=w*0.45
	Title.x=w*0.52
	Title.y=h*0.18
	group:insert(Title)
	
	Easy = display.newImage("Images/Easy.png")
	Easy.width=w*0.8
	Easy.height=h*0.15
	Easy.x=w/2
	Easy.y=h*0.48
	group:insert(Easy)
	
	Medium = display.newImage("Images/Medium.png")
	Medium.width=w*0.8
	Medium.height=h*0.15
	Medium.x=w/2
	Medium.y=h*0.68
	group:insert(Medium)
	
	Hard = display.newImage("Images/Hard.png")
	Hard.width=w*0.8
	Hard.height=h*0.15
	Hard.x=w/2
	Hard.y=h*0.88
	group:insert(Hard)
end

function scene:enterScene( event )
	audio.play(SwooshSound)
	Easy:addEventListener("touch", changeScene)
	Medium:addEventListener("touch", changeScene)
	Hard:addEventListener("touch", changeScene)
end

function scene:exitScene()
	Easy:removeEventListener("touch", changeScene)
	Medium:removeEventListener("touch", changeScene)
	Hard:removeEventListener("touch", changeScene)
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