--load all the music st the start
local backgroundMusic1 = audio.loadStream("OPMusic1.mp3")
local backgroundMusic2 = audio.loadStream("OPMusic2.mp3")
local backgroundMusic3 = audio.loadStream("OPMusic3.mp3")
local cannonBlast = audio.loadSound("Blast.mp3")

display.setStatusBar( display.HiddenStatusBar )			--Hide the status bar from the screen
local dice = require( "dice" )							--referance the dice class created as a seperate file
h,w = display.contentHeight, display.contentWidth		--sets short variables as width and length

--End Page, this adds all the display objects for the game complete screen
local endLuffy = display.newImage("fyluffy.png",0,0)
endLuffy.width=endLuffy.width*h/endLuffy.height
endLuffy.height=h
endLuffy.x=w/2
endLuffy.y=h/2

local endScreenBox = display.newRoundedRect(0,0,h*0.67,h/6,h/30)
endScreenBox.strokeWidth = 4
endScreenBox:setStrokeColor(255, 255, 255)
endScreenBox:setFillColor(10,95,170)
endScreenBox.x = w*0.74
endScreenBox.y = h/3

local endScreenTextImage = display.newImage("wwScore.png")
endScreenTextImage.width=h*0.63
endScreenTextImage.height=h/8
endScreenTextImage.x = w*0.74
endScreenTextImage.y = h/3

local endScreen = display.newText("Blank Score", 0, 0, nil, h/6)
endScreen:setTextColor(255,255,255)
endScreen.x = w*0.745
endScreen.y = h/3

local restartButtonBox = display.newRoundedRect(0,0,h*0.5,h*0.16,h/30)
restartButtonBox.strokeWidth = 4
restartButtonBox:setStrokeColor(255, 255, 255)
restartButtonBox:setFillColor(10,95,170)
restartButtonBox.x = w*0.74
restartButtonBox.y = h*2/3
restartButtonBox.isVisible = false

local restartButton = display.newImage("wwRestartQ.png")
restartButton.width=h*0.45
restartButton.height=h/8
restartButton.x = w*0.74
restartButton.y = h*2/3

--Game Page, these are the display objects for the game page itself
local GamePage=display.newGroup()
local background = display.newImage("sea.png")
background.height=h
background.width=w
background.x = w/2
background.y = h/2
GamePage:insert(1,background)

local whatWay = 0										--this variable is the check to make sure the solution is in only rows or cols(can only be solved horizontally or virtically)
local rollNumber = 0									--the var that counts amount of rolls
local diceTable = {}									--the main table for the faces(dice)
pic={}													--the image table for the constantly regenerated images

--this loops for the 2d array and create the 25 objects and display
for i=0,4,1 do
	diceTable[i] = {}
	for j = 0,4,1 do
		diceTable[i][j] = dice.new(i,j)
		diceTable[i][j]:numPic(i,j)
		diceTable[i][j].picBox.isVisible = false
	end
end

local picB =diceTable[4][4].picBox.contentBounds.xMax		--this var is just to reduce the amount of redundant code

local midRestartButtonBox = display.newImage("bButton.png")	--then the other game page display objects
midRestartButtonBox.width=w-picB-(h*2/35)
midRestartButtonBox.height=h/4
midRestartButtonBox.x=picB+(h/35)+(midRestartButtonBox.width/2)
midRestartButtonBox.y=(h/35)+(h/8)
GamePage:insert(2,midRestartButtonBox)

local midRestartButton = display.newImage("wwRestart.png")
midRestartButton.width=w-picB-(h*4/35)
midRestartButton.height=h/7
midRestartButton.x = picB+(h/35)+(midRestartButtonBox.width/2)
midRestartButton.y = (h/35)+(h/8)
GamePage:insert(3,midRestartButton)

local scoreBox = display.newRoundedRect( 0,0,h/4,h/5,h/20)
scoreBox:setFillColor(255,255,255)
scoreBox.x = picB+(h/35)+(midRestartButtonBox.width/2)
scoreBox.y = h/2
GamePage:insert(4,scoreBox)

local scoreText = display.newText("0", 0, 0, nil, h/5)
scoreText:setTextColor(10,95,170)
scoreText.x = picB+(h/35)+(midRestartButtonBox.width/2)
scoreText.y = h/2
GamePage:insert(5,scoreText)

local throwButtonBox = display.newImage("bButton.png")
throwButtonBox.width=w-picB-(h*2/35)
throwButtonBox.height=h/4
throwButtonBox.x=picB+(h/35)+(throwButtonBox.width/2)
throwButtonBox.y=h-(h/8)-(h/35)
GamePage:insert(6,throwButtonBox)

local throwButton = display.newImage("wwRoll.png")
throwButton.width=w-picB-(h*5/35)
throwButton.height=h/8
throwButton.x = picB+(h/35)+(throwButtonBox.width/2)
throwButton.y = h-(h/8)-(h/35)
GamePage:insert(7,throwButton)

--Start Page, these display objects are for the initial page displayed
local startBackground = display.newRect( 0, 0,w, h)			
startBackground:setFillColor( 0, 180, 220 )

local horizonPic = display.newImage("horizon.png")
horizonPic.height=h*0.40
horizonPic.width=w
horizonPic.x = w/2
horizonPic.y = h*7/9

local titleWords = display.newImage("opTitle.png")
titleWords.height=h*0.55
titleWords.width=w
titleWords.x = w/2
titleWords.y = h*0.29

local startButton = display.newImage("start.png")
startButton.height=h*0.12
startButton.width=w*0.28
startButton.x = w*0.48
startButton.y = h*0.81

local StartPage=display.newGroup()
StartPage:insert(1,startBackground)
StartPage:insert(2,horizonPic)
StartPage:insert(3,titleWords)
StartPage:insert(4,startButton)

--Functions
local function diceTouch(i,j)			
	return function(event)
		diceTable[i][j]:clickDice()
	end
end

local function startGame(event)
	backSound=audio.stop()															--stop the first music
	backSound=audio.play( backgroundMusic2, { channel=1, loops=-1, fadein=1000 }  ) --start the second music
	StartPage.isVisible = false														--hide the start page group
	for i=0,4,1 do
		for j = 0,4,1 do
			diceTable[i][j].picBox.isVisible = true
			pic[i..j].isVisible = true
		end
	end
end

local function restartGame(event)
	backSound=audio.stop()
	backSound=audio.play( backgroundMusic2, { channel=1, loops=-1}) 
	restartButtonBox.isVisible = false
	GamePage.isVisible = true
	scoreText.text="0"
	whatWay,endCount,rollNumber = 0,0,0
	for i=0,4,1 do
		for j = 0,4,1 do
			diceTable[i][j]:rollDice(i,j)
			diceTable[i][j].picBox.isVisible = true
			pic[i..j].isVisible = true
			
		end
	end
	
end

local function diceThrow(event)
	
	audio.play(cannonBlast)
	
	--media.playSound("Blast.mp3")
	rollNumber = rollNumber + 1
	if rollNumber == 100 then
		restartGame(event)
	end	
	scoreText.text=rollNumber
	for i=0,4,1 do
		for j = 0,4,1 do
			if diceTable[i][j].state==0 then
				diceTable[i][j]:rollDice(i,j)
			end
		end		
	end
	for i=0,4,1 do
		if whatWay == 0 or whatWay == 1 then
			local y =diceTable[i][0].number
			if y == diceTable[i][1].number and y == diceTable[i][2].number and y == diceTable[i][3].number and y == diceTable[i][4].number then
				for j = 0,4,1 do
					diceTable[i][j].state = 2
					diceTable[i][j].picBox:setFillColor( 0, 255, 0 )
				end
				whatWay = 1
			end
		end
		if whatWay == 0 or whatWay == -1 then
			local z = diceTable[0][i].number
			if z == diceTable[1][i].number and z == diceTable[2][i].number and z == diceTable[3][i].number and z == diceTable[4][i].number then
				for j = 0,4,1 do
					diceTable[j][i].state = 2
					diceTable[j][i].picBox:setFillColor( 0, 255, 0 )
				end
				whatWay = -1
			end	
		end
	end
	local endCount=0
	for i=0,4,1 do
		for j = 0,4,1 do
			if diceTable[i][j].state~=2 then
				endCount=1
			end
		end
	end
	if endCount==0 then
		backSound=audio.stop()
		backSound=audio.play( backgroundMusic3, { channel=1, loops=-1, fadein=1000 }  ) 
		GamePage.isVisible = false
		for i=0,4,1 do
			for j = 0,4,1 do
				pic[i..j].isVisible = false
				diceTable[j][i].picBox.isVisible = false
			end
		end
		endScreen.text="          "..rollNumber
		restartButtonBox.isVisible = true
	end
end

function flashOne()
	transition.to( startButton, { alpha=0.1, time=1000, onComplete = flashTwo } )
end

function flashTwo()
	transition.to( startButton, { alpha=1, time=50,onComplete = flashOne } )
end

--start game things
flashOne()
backSound=audio.play( backgroundMusic1, { channel=1, loops=-1, fadein=2000 }  ) 

--event listeners
midRestartButtonBox:addEventListener("tap", restartGame)
restartButtonBox:addEventListener("tap", restartGame)
throwButtonBox:addEventListener("tap", diceThrow)
startButton:addEventListener("tap", startGame)
for i=0,4,1 do
	for j = 0,4,1 do
		diceTable[i][j].picBox:addEventListener("tap", diceTouch(i,j))
	end
end


