
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function changeScene(event)
	local options = {effect = "fade", time = 100 }
	backSound=audio.stop()
	storyboard.gotoScene( "EndScreen", options)
end

function scene:createScene( event )
	local group = self.view
	
	local physics = require ("physics")
	
	if LevelDifficulty==1 then
		HoleAmount=w*0.22
		ObjectType=1
	elseif LevelDifficulty==2 then
		HoleAmount=w*0.19
		ObjectType=3
	elseif LevelDifficulty==3 then
		HoleAmount=w*0.15
		ObjectType=5
	end

	physics.setGravity(0,9.81)
	physics.start(true)

	local Background = display.newImage("Images/DarkBackground.jpg")
	Background.width=w
	Background.height=h
	Background.x=w/2
	Background.y=h/2
	group:insert(Background)

	Hole1,Hole2,Hole3,Hole4=0,0,0,0
	
	local HoleNumber1=math.random(1,4)
	if HoleNumber1==1 then
		Hole1=HoleAmount
	elseif HoleNumber1==2 then
		Hole2=HoleAmount
	elseif HoleNumber1==3 then
		Hole3=HoleAmount
	elseif HoleNumber1==4 then
		Hole4=HoleAmount
	end

	if LevelDifficulty==1 then
		local HoleNumber2=math.random(1,4)
		if HoleNumber2==HoleNumber1 then
			local HoleNumber3=math.random(1,3)
			HoleNumber2=HoleNumber2+HoleNumber3
			if HoleNumber2>4 then
				HoleNumber2=HoleNumber2-4
			end
		end
		if HoleNumber2==1 then
			Hole1=HoleAmount
		elseif HoleNumber2==2 then
			Hole2=HoleAmount
		elseif HoleNumber2==3 then
			Hole3=HoleAmount
		elseif HoleNumber2==4 then
			Hole4=HoleAmount
		end
	end

	local RandomHolePlace=math.random(w*0.02+HoleAmount,h-w*0.02-HoleAmount)
	local Rwall1 = display.newImage("Images/Hazard.png")
	Rwall1.rotation=90
	Rwall1.height=w*0.02
	Rwall1.width=h
	Rwall1.x=w-w*0.01
	Rwall1.y=RandomHolePlace-Hole4-(Rwall1.width/2)
	physics.addBody( Rwall1, "static")
	group:insert(Rwall1)

	local Rwall2 = display.newImage("Images/Hazard.png")
	Rwall2.rotation=90
	Rwall2.height=w*0.02
	Rwall2.width=h
	Rwall2.x=w-w*0.01
	Rwall2.y=RandomHolePlace+Hole4+(Rwall2.width/2)
	physics.addBody( Rwall2, "static")
	group:insert(Rwall2)

	RandomHolePlace=math.random(w*0.02+HoleAmount,h-w*0.02-HoleAmount)
	local Lwall1 = display.newImage("Images/Hazard.png")
	Lwall1.rotation=90
	Lwall1.height=w*0.02
	Lwall1.width=h
	Lwall1.x=w*0.01
	Lwall1.y=RandomHolePlace-Hole3-(Lwall1.width/2)
	physics.addBody( Lwall1, "static")
	group:insert(Lwall1)

	local Lwall2 = display.newImage("Images/Hazard.png")
	Lwall2.rotation=90
	Lwall2.height=w*0.02
	Lwall2.width=h
	Lwall2.x=w*0.01
	Lwall2.y=RandomHolePlace+Hole3+(Lwall2.width/2)
	physics.addBody( Lwall2, "static")
	group:insert(Lwall2)

	RandomHolePlace=math.random(w*0.02+HoleAmount,w-w*0.02-HoleAmount)
	local roof1 = display.newImage("Images/Hazard.png")
	roof1.height=w*0.02
	roof1.width=h
	roof1.y=w*0.01
	roof1.x=RandomHolePlace-Hole2-(roof1.width/2)
	physics.addBody( roof1, "static")
	group:insert(roof1)

	local roof2 = display.newImage("Images/Hazard.png")
	roof2.height=w*0.02
	roof2.width=h
	roof2.y=w*0.01
	roof2.x=RandomHolePlace+Hole2+(roof2.width/2)
	physics.addBody( roof2, "static")
	group:insert(roof2)

	RandomHolePlace=math.random(w*0.02+HoleAmount,w-w*0.02-HoleAmount)
	local floor1 = display.newImage("Images/Hazard.png")
	floor1.height=w*0.02
	floor1.width=h
	floor1.y=h-w*0.01
	floor1.x=RandomHolePlace-Hole1-(floor1.width/2)
	physics.addBody( floor1, "static")
	group:insert(floor1)

	local floor2 = display.newImage("Images/Hazard.png")
	floor2.height=w*0.02
	floor2.width=h
	floor2.y=h-w*0.01
	floor2.x=RandomHolePlace+Hole1+(floor2.width/2)
	physics.addBody( floor2, "static")
	group:insert(floor2)

	local Sensor1 = display.newRect(-10, 0, 10, h)
	Sensor1.location=0
	Sensor1.myName="Sensor"
	physics.addBody( Sensor1, "static")
	Sensor1.isSensor = true
	Sensor1:setFillColor(0, 0 ,0)
	group:insert(Sensor1)

	local Sensor2 = display.newRect(w, 0, 10, h)
	Sensor2.location=0
	physics.addBody( Sensor2, "static")
	Sensor2.isSensor = true
	Sensor2.myName="Sensor"
	Sensor2:setFillColor(0, 0 ,0)
	group:insert(Sensor2)

	local Sensor3 = display.newRect(0, -10, w, 10)
	Sensor3.location=0
	physics.addBody( Sensor3, "static")
	Sensor3.isSensor = true
	Sensor3.myName="Sensor"
	Sensor3:setFillColor(0, 0 ,0)
	group:insert(Sensor3)

	local Sensor4 = display.newRect(0, h, w, 10)
	Sensor4.location=0
	physics.addBody( Sensor4, "static")
	Sensor4.isSensor = true
	Sensor4.myName="Sensor"
	Sensor4:setFillColor(0, 0 ,0)
	group:insert(Sensor4)

	ObjectTable={}
	
	for i=1,LevelDifficulty*5,1 do
		CreateRandomObject(i)
		group:insert(ObjectTable[i])
	end

	TimeText = display.newText( "00s", 0, 0, nil, w*0.11 )
	TimeText.x = w*0.89
	TimeText.y = w*0.08
	group:insert(TimeText)

	TimesUP=0

	function TimeText:timer( event )
		GameCount = event.count
		if GameCount==180 then
			TimesUP=1
			changeScene()
		end
		if GameCount<10 then
		self.text = "0"..GameCount.."s"
		elseif GameCount<60 then
		self.text = GameCount.."s"
		elseif (GameCount%60)<10 then
		self.x = w*0.794
		self.text = ((GameCount-(GameCount%60))/60).."m 0"..(GameCount%60).."s"
		else
		self.x = w*0.794
		self.text = ((GameCount-(GameCount%60))/60).."m "..(GameCount%60).."s"
		end
	end

	arrow1 = display.newImage("Images/arrow.png")
	arrow1.x=w*0.5
	arrow1.y=h*0.3
	arrow1.alpha=0.4
	arrow1.width=w*0.2
	arrow1.height=w*0.2
	group:insert(arrow1)

	arrow2 = display.newImage("Images/arrow.png")
	arrow2.x=w*0.5
	arrow2.y=h*0.7
	arrow2.rotation=180
	arrow2.alpha=0.4
	arrow2.width=w*0.2
	arrow2.height=w*0.2
	group:insert(arrow2)

	arrow3 = display.newImage("Images/arrow.png")
	arrow3.x=w*0.25
	arrow3.y=h*0.5
	arrow3.rotation=270
	arrow3.alpha=0.4
	arrow3.width=w*0.2
	arrow3.height=w*0.2
	group:insert(arrow3)

	arrow4 = display.newImage("Images/arrow.png")
	arrow4.x=w*0.75
	arrow4.y=h*0.5
	arrow4.rotation=90
	arrow4.alpha=0.4
	arrow4.width=w*0.2
	arrow4.height=w*0.2
	group:insert(arrow4)

	stop = display.newImage("Images/stop.png")
	stop.x=w*0.5
	stop.y=h*0.5
	stop.alpha=0.4
	stop.width=w*0.2
	stop.height=w*0.2
	group:insert(stop)

	ExtraObjectText = display.newImage("Images/ExtraText.png")
	ExtraObjectText.width=w*0.7
	ExtraObjectText.height=w*0.3
	ExtraObjectText.alpha=0
	ExtraObjectText.x=w/2
	ExtraObjectText.y=h*0.2
	group:insert(ExtraObjectText)
	
	ExtraObjects=16
	
	Timer1=timer.performWithDelay( 1000, TimeText, 180 )
	
end

function scene:enterScene( event )
	backSound=audio.play( backgroundMusic1, { channel=1, loops=-1, fadein=50 }  ) 
	--timer.performWithDelay( 1000, TimeText, 180 )	
	Runtime:addEventListener( "collision", onCollision )
	arrow1:addEventListener("tap", tapped)
	arrow2:addEventListener("tap", tapped)
	arrow3:addEventListener("tap", tapped)
	arrow4:addEventListener("tap", tapped)
	stop:addEventListener("tap", tapped)--]]
	--ExtraTextboxforexample = display.newText( "is this going to print onto the screeen", 0, 0, nil, w*0.11 )
end

function scene:exitScene()
	timer.cancel(Timer1)
	
	Runtime:removeEventListener( "collision", onCollision )
	arrow1:removeEventListener("tap", tapped)
	arrow2:removeEventListener("tap", tapped)
	arrow3:removeEventListener("tap", tapped)
	arrow4:removeEventListener("tap", tapped)
	stop:removeEventListener("tap", tapped)

end

function scene:didExitScene( event )
	storyboard.purgeScene( "GameLevel" )
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