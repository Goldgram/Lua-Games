local storyboard = require "storyboard"

backgroundMusic1 = audio.loadStream("Sounds/Nostrand.mp3")
ClickSound = audio.loadSound("Sounds/ClickA.mp3")
SwooshSound = audio.loadSound("Sounds/SwooshA.mp3")
TaDaSound = audio.loadSound("Sounds/TaDaA.mp3")
RedAlertSound = audio.loadSound("Sounds/RedAlertA.mp3")
ChamberDecompressingSound = audio.loadSound("Sounds/ChamberDecompressingA.mp3")

display.setStatusBar( display.HiddenStatusBar )
h,w = display.contentHeight, display.contentWidth
LevelDifficulty=0

physicsData = (require "polygonShapes").physicsData(1/(300/(w*0.2)))

function CreateRandomObject (i)
	local ObjectNumber=math.random(1,ObjectType)
	local ObjectInnerNumber=math.random(1,3)
	local ObjectInnerInnerNumber=math.random(1,4)
	
	if ObjectNumber==1 then
		if ObjectInnerNumber==1 then
			ObjectTable[i] = display.newImage("Images/StrawHatFlag.png")
			ObjectTable[i].width=w*0.21
			ObjectTable[i].height=w*0.14
		elseif ObjectInnerNumber==2 then
			ObjectTable[i] = display.newImage("Images/Squad11.png")
			ObjectTable[i].width=w*0.16
			ObjectTable[i].height=w*0.16
			ObjectTable[i].rotation=ObjectTable[i].rotation-45
		else
			ObjectTable[i] = display.newImage("Images/L.png")
			ObjectTable[i].width=w*0.13
			ObjectTable[i].height=w*0.156
		end
		physics.addBody( ObjectTable[i], "dynamic", { density=1.5 , friction = 0.1, bounce = 0.4 })		
	elseif ObjectNumber==2 then
		if ObjectInnerNumber==1 then
			ObjectTable[i] = display.newImage("Images/PokeBall.png")
			ObjectTable[i].width=w*0.14
			ObjectTable[i].height=w*0.14
			physics.addBody( ObjectTable[i], "dynamic", {radius = w*0.07, density=1.5 , friction = 0.1, bounce = 0.4})
		elseif ObjectInnerNumber==2 then
			ObjectTable[i] = display.newImage("Images/Sharingan.png")
			ObjectTable[i].width=w*0.18
			ObjectTable[i].height=w*0.18
			physics.addBody( ObjectTable[i], "dynamic", {radius = w*0.09, density=1.5 , friction = 0.1, bounce = 0.4})
		else
			ObjectTable[i] = display.newImage("Images/Dragonball.png")
			ObjectTable[i].width=w*0.22
			ObjectTable[i].height=w*0.22
			physics.addBody( ObjectTable[i], "dynamic", {radius = w*0.11, density=1.5 , friction = 0.1, bounce = 0.4})
		end
	elseif ObjectNumber==3 then
		if ObjectInnerNumber==1 then
			ObjectTable[i] = display.newImage("Images/Triforce.png")
			triangleShape = { 0,-w*0.08, w*0.08,w*0.052, -w*0.08,w*0.052 }
			ObjectTable[i].width=w*0.16
			ObjectTable[i].height=w*0.16
		elseif ObjectInnerNumber==2 then
			ObjectTable[i] = display.newImage("Images/Pyramid.png")
			triangleShape = { 0,w*0.1, -w*0.1,-w*0.072, w*0.1,-w*0.072 }
			ObjectTable[i].width=w*0.2
			ObjectTable[i].height=w*0.2
		else
			ObjectTable[i] = display.newImage("Images/CelestialBeing.png")
			triangleShape = { 0,w*0.12, -w*0.12,-w*0.0864, w*0.12,-w*0.0864 }
			ObjectTable[i].width=w*0.24
			ObjectTable[i].height=w*0.24
		end
		physics.addBody( ObjectTable[i], "dynamic",{ density=1.5 , friction = 0.1, bounce = 0.4, shape=triangleShape } )
	elseif ObjectNumber==4 then
		if ObjectInnerNumber==1 then
			ObjectTable[i] = display.newImage("Images/Seal.png")
			pentagonShape = { 0,-w*0.08, w*0.0742,-w*0.0233, w*0.0451,w*0.0625, -w*0.0451,w*0.0625, -w*0.0742 ,-w*0.0233 }
			ObjectTable[i].width=w*0.16
			ObjectTable[i].height=w*0.16
		elseif ObjectInnerNumber==2 then
			ObjectTable[i] = display.newImage("Images/Badge.png")
			pentagonShape = { 0,w*0.1, -w*0.0927,w*0.0290, -w*0.0564,-w*0.0782, w*0.0564,-w*0.0782, w*0.0927,w*0.0290 }
			ObjectTable[i].width=w*0.2
			ObjectTable[i].height=w*0.2
		else
			ObjectTable[i] = display.newImage("Images/Ouroboros.png")
			pentagonShape = { 0,w*0.12, -w*0.1113,w*0.03495, -w*0.06765,-w*0.09375, w*0.06765,-w*0.09375, w*0.1113 ,w*0.03495 }
			ObjectTable[i].width=w*0.24
			ObjectTable[i].height=w*0.24
		end
		physics.addBody( ObjectTable[i], { density=1.5 , friction = 0.1, bounce = 0.4, shape=pentagonShape } )
	elseif ObjectNumber==5 then
		if ObjectInnerInnerNumber==1 then
			ObjectTable[i] =  display.newImage("Images/pory.png")
			physics.addBody(ObjectTable[i], "dynamic", physicsData:get("pory"))
			ObjectTable[i].width=w*0.2
			ObjectTable[i].height=w*0.2
		elseif ObjectInnerInnerNumber==2 then
			ObjectTable[i] =  display.newImage("Images/BlueFairyTail.png")
			physics.addBody(ObjectTable[i], "dynamic", physicsData:get("BlueFairyTail"))
			ObjectTable[i].width=w*0.2666
			ObjectTable[i].height=w*0.2666
			ObjectTable[i].rotation=ObjectTable[i].rotation-45
		elseif ObjectInnerInnerNumber==3 then
			ObjectTable[i] =  display.newImage("Images/StrawHat.png")
			ObjectTable[i].width=w*0.3
			ObjectTable[i].height=w*0.3
			physics.addBody(ObjectTable[i], "dynamic", physicsData:get("StrawHat"))
		else
			ObjectTable[i] =  display.newImage("Images/HollowMask.png")
			ObjectTable[i].width=w*0.15
			ObjectTable[i].height=w*0.27
			MaskShape={0,-w*0.13,w*0.06,-w*0.105,w*0.07,-w*0.015,w*0.04,w*0.09,0,w*0.135,-w*0.04,w*0.09,-w*0.07,-w*0.015,-w*0.055,-w*0.105}
			physics.addBody( ObjectTable[i], "dynamic",{ density=1.5 , friction = 0.1, bounce = 0.4, shape=MaskShape } )
			--[[
			--another object that i mapped out myself, but has concave angles
			ObjectTable[i] =  display.newImage("Images/CloudSword.png")
			ObjectTable[i].width=w*0.24
			ObjectTable[i].height=w*0.048
			SwordShape={-w*0.09,-w*0.018,w*0.065,-w*0.019,w*0.065,-w*0.004,w*0.12,-w*0.003,w*0.12,w*0.003,w*0.065,w*0.004,w*0.065,w*0.011,-w*0.12,w*0.01 }
			physics.addBody( ObjectTable[i], "dynamic",{ density=1.5 , friction = 0.1, bounce = 0.4, shape=SwordShape } )
			--]]
		end
	end
	ObjectTable[i].x=math.random(w*0.02+ObjectTable[i].width/2,w-w*0.02-ObjectTable[i].width/2)
	ObjectTable[i].y=math.random(w*0.02+ObjectTable[i].height/2,h-w*0.02-ObjectTable[i].height/2)
	ObjectTable[i].Location=0
end

function onCollision( event )
	if ( event.phase == "ended" ) and event.object1.myName=="Sensor" and (event.object2.x>w or event.object2.x<0 or event.object2.y>h or event.object2.y<0) then
		event.object2.Location=1
		audio.play(SwooshSound)
	elseif ( event.phase == "ended" ) and event.object1.myName=="Sensor" and (event.object2.x<w or event.object2.x>0 or event.object2.y<h or event.object2.y>0) then
		event.object2.Location=0
	end
	local EndCount=0
	for i=1,#ObjectTable,1 do
		EndCount=EndCount+ObjectTable[i].Location
	end
	if EndCount==(#ObjectTable) and TimesUP==0 then
		changeScene()
	end
end

function tapped(event)
	audio.play(ChamberDecompressingSound)
	if event.target == arrow1 then
		physics.setGravity(0,-9.81)
	elseif event.target == arrow2 then
		physics.setGravity(0,9.81)
	elseif event.target == arrow3 then
		physics.setGravity(-9.81,0)
	elseif event.target == arrow4 then
		physics.setGravity(9.81,0)
	else
		physics.setGravity(0,0)
	end
	
	if LevelDifficulty==3 then
		local RandCreate=math.random(1,3)
		if RandCreate==1 then
			ExtraObjectText.alpha=1
			transition.to( ExtraObjectText, { alpha = 0, time = 1000} )
			CreateRandomObject (ExtraObjects)
			ExtraObjects=ExtraObjects+1
		end
	end
end

storyboard.gotoScene( "Menu" )