
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function changeScene(event)
	local options = {effect = "fade", time = 100 }
	audio.play(ClickSound)
	storyboard.gotoScene( "Menu", options)
end

function scene:createScene( event )
	local group = self.view

	EndBackground =  display.newImage("Images/hole2.jpg")
	EndBackground.height=h
	EndBackground.width=h*0.75
	EndBackground.x=w/2
	EndBackground.y=h/2
	group:insert(EndBackground)

	MenuBox = display.newRoundedRect( 0, 0,w*0.59, w*0.27,w*0.07)
	MenuBox.x=w/2
	MenuBox.y=h*0.90
	MenuBox:setFillColor( 0, 0, 0 )
	group:insert(MenuBox)

	MenuBox1 = display.newRoundedRect( 0, 0,w*0.55, w*0.23,w*0.05)
	MenuBox1.x=w/2
	MenuBox1.y=h*0.90
	MenuBox1:setFillColor( 255, 255, 255 )
	group:insert(MenuBox1)

	MenuText=  display.newImage("Images/MenuB.png")
	MenuText.height=w*0.25
	MenuText.width=w*0.5
	MenuText.x=w/2
	MenuText.y=h*0.90
	group:insert(MenuText)

	LoseText=  display.newImage("Images/Lose.png")
	LoseText.height=w*0.5
	LoseText.width=w*0.5
	LoseText.x=w/2
	LoseText.y=h*0.5
	group:insert(LoseText)

	TimeUpText=  display.newImage("Images/Time.png")
	TimeUpText.height=w*0.45
	TimeUpText.width=w*0.9
	TimeUpText.x=w*0.53
	TimeUpText.y=h*0.2
	group:insert(TimeUpText)

	WinText=  display.newImage("Images/Win.png")
	WinText.height=w*0.4
	WinText.width=w*0.8
	WinText.x=w*0.56
	WinText.y=h*0.16
	group:insert(WinText)

	EndGame= display.newText("", 0, 0, nil, w/6.5)
	EndGame.x=w/2
	EndGame.y=h*0.5
	group:insert(EndGame)

end

function scene:enterScene( event )
	if GameCount<60 then
		EndGame.text = GameCount.."sec"
	elseif (GameCount%60)<10 then
		EndGame.text = ((GameCount-(GameCount%60))/60)..":0"..(GameCount%60)
	else
		EndGame.text = ((GameCount-(GameCount%60))/60)..":"..(GameCount%60)
	end
	
	if TimesUP==1 then
		audio.play(RedAlertSound)
		WinText.alpha=0
		EndGame.alpha=0
		LoseText.alpha=1
		TimeUpText.alpha=1
	elseif TimesUP==0 then
		audio.play(TaDaSound)
		WinText.alpha=1
		EndGame.alpha=1
		LoseText.alpha=0
		TimeUpText.alpha=0
	end
	
	MenuBox:addEventListener("tap", changeScene)
end

function scene:exitScene()
	MenuBox:removeEventListener("tap", changeScene)
end

function scene:didExitScene( event )
	storyboard.purgeScene( "EndScene" )
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