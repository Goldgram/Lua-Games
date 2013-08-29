
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function changeScene5(event)
	local options = {effect = "fade", time = 100 }
	backSound=audio.stop()
	if Player.Health<=0 then
		storyboard.gotoScene( "EndScreen1", options)
	elseif LevelSelected==3 then
		storyboard.gotoScene( "LevelSelect", options)
	else
		storyboard.gotoScene( "PreLevel4", options)
	end

end

function scene:createScene( event )
	local group = self.view
	
	background1 = display.newImage("Images/Levels/Level03/Background1.png",0,0)
	group:insert(background1)
	background2 = display.newImage("Images/Levels/Level03/Background2.png",0,0)
	group:insert(background2)
	background3= display.newImage("Images/Levels/Level03/Background3.png",0,h-100)
	group:insert(background3)

	block1 = display.newImage("Images/MenuParts/FrameChar"..PlayerChoice..".png",0,0)
	group:insert(block1)
	block2 = display.newImage("Images/MenuParts/FrameLvl3.png",240,0)
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

	require "sprite"

	if PlayerChoice==1 then
		Player={Name="Monkey D. Luffy",Color="Red",MaxHealthAmount=60,Speed=3.8,Power=15,
		Rstand1=1,Rstand2=3,Rstand3=1200,
		Lstand1=11,Lstand2=3,Lstand3=1200,
		Rrun1=21,Rrun2=8,Rrun3=1000,
		Lrun1=31,Lrun2=8,Lrun3=1000,
		Rattack11=41,Rattack12=5,Rattack13=500,
		Lattack11=51,Lattack12=5,Lattack13=500,
		Rattack21=81,Rattack22=10,Rattack23=700,
		Lattack21=91,Lattack22=10,Lattack23=700,
		Rattack31=61,Rattack32=10,Rattack33=800,
		Lattack31=71,Lattack32=10,Lattack33=800,
		Rhit1=4,Rhit2=2,Rhit3=300,
		Lhit1=14,Lhit2=2,Lhit3=300,
		Rdead1=6,Rdead2=3,Rdead3=600,
		Ldead1=16,Ldead2=3,Ldead3=600
		}
	elseif PlayerChoice==2 then
		Player={
		Name="Naruto Uzumaki",Color="Orange",MaxHealthAmount=85,Speed=3.8,Power=11,
		Rstand1=1,Rstand2=4,Rstand3=1600,
		Lstand1=11,Lstand2=4,Lstand3=1600,
		Rrun1=21,Rrun2=6,Rrun3=1100,
		Lrun1=31,Lrun2=6,Lrun3=1100,
		Rattack11=41,Rattack12=7,Rattack13=600,
		Lattack11=51,Lattack12=7,Lattack13=600,
		Rattack21=61,Rattack22=8,Rattack23=1100,
		Lattack21=71,Lattack22=8,Lattack23=1100,
		Rattack31=81,Rattack32=10,Rattack33=1600,
		Lattack31=91,Lattack32=10,Lattack33=1600,
		Rhit1=27,Rhit2=2,Rhit3=300,
		Lhit1=37,Lhit2=2,Lhit3=300,
		Rdead1=5,Rdead2=4,Rdead3=700,
		Ldead1=15,Ldead2=4,Ldead3=700
		}
	elseif PlayerChoice==3 then
		Player={
		Name="Ichigo Kurosaki",Color="Blue",MaxHealthAmount=85,Speed=3.7,Power=13,
		Rstand1=1,Rstand2=1,Rstand3=1200,
		Lstand1=11,Lstand2=1,Lstand3=1200,
		Rrun1=21,Rrun2=3,Rrun3=400,
		Lrun1=31,Lrun2=3,Lrun3=400,
		Rattack11=41,Rattack12=5,Rattack13=600,
		Lattack11=51,Lattack12=5,Lattack13=600,
		Rattack21=61,Rattack22=6,Rattack23=1000,
		Lattack21=71,Lattack22=6,Lattack23=1000,
		Rattack31=81,Rattack32=10,Rattack33=1100,
		Lattack31=91,Lattack32=10,Lattack33=1100,
		Rhit1=3,Rhit2=1,Rhit3=300,
		Lhit1=13,Lhit2=1,Lhit3=300,
		Rdead1=3,Rdead2=3,Rdead3=700,
		Ldead1=13,Ldead2=3,Ldead3=700
		}
	elseif PlayerChoice==4 then
		Player={
		Name="Roronoa Zoro",Color="Green",MaxHealthAmount=72,Speed=4,Power=11,
		Rstand1=1,Rstand2=4,Rstand3=1600,
		Lstand1=11,Lstand2=4,Lstand3=1600,
		Rrun1=21,Rrun2=8,Rrun3=1000,
		Lrun1=31,Lrun2=8,Lrun3=1000,
		Rattack11=41,Rattack12=7,Rattack13=700,
		Lattack11=51,Lattack12=7,Lattack13=700,
		Rattack21=61,Rattack22=8,Rattack23=1000,
		Lattack21=71,Lattack22=8,Lattack23=1000,
		Rattack31=81,Rattack32=8,Rattack33=1000,
		Lattack31=91,Lattack32=8,Lattack33=1000,
		Rhit1=69,Rhit2=2,Rhit3=300,
		Lhit1=79,Lhit2=2,Lhit3=300,
		Rdead1=5,Rdead2=6,Rdead3=3000,
		Ldead1=15,Ldead2=6,Ldead3=3000
		}
	elseif PlayerChoice==5 then
		Player={
		Name="Sasuke Uchiha",Color="Purple",MaxHealthAmount=60,Speed=4,Power=13,
		Rstand1=1,Rstand2=6,Rstand3=1200,
		Lstand1=11,Lstand2=6,Lstand3=1200,
		Rrun1=21,Rrun2=6,Rrun3=1100,
		Lrun1=31,Lrun2=6,Lrun3=1100,
		Rattack11=41,Rattack12=7,Rattack13=600,
		Lattack11=51,Lattack12=7,Lattack13=600,
		Rattack21=61,Rattack22=10,Rattack23=1200,
		Lattack21=71,Lattack22=10,Lattack23=1200,
		Rattack31=81,Rattack32=8,Rattack33=900,
		Lattack31=91,Lattack32=8,Lattack33=900,
		Rhit1=7,Rhit2=3,Rhit3=300,
		Lhit1=17,Lhit2=3,Lhit3=300,
		Rdead1=27,Rdead2=4,Rdead3=700,
		Ldead1=37,Ldead2=4,Ldead3=700
		}
	elseif PlayerChoice==6 then
		Player={
		Name="Goku",Color="Yellow",MaxHealthAmount=72,Speed=3.7,Power=15,
		Rstand1=1,Rstand2=4,Rstand3=2000,
		Lstand1=11,Lstand2=4,Lstand3=2000,
		Rrun1=21,Rrun2=4,Rrun3=800,
		Lrun1=31,Lrun2=4,Lrun3=800,
		Rattack11=41,Rattack12=6,Rattack13=700,
		Lattack11=51,Lattack12=6,Lattack13=700,
		Rattack21=61,Rattack22=7,Rattack23=1000,
		Lattack21=71,Lattack22=7,Lattack23=1000,
		Rattack31=81,Rattack32=9,Rattack33=1200,
		Lattack31=91,Lattack32=9,Lattack33=1200,
		Rhit1=5,Rhit2=2,Rhit3=400,
		Lhit1=15,Lhit2=2,Lhit3=400,
		Rdead1=5,Rdead2=3,Rdead3=700,
		Ldead1=15,Ldead2=3,Ldead3=700
		}
	end
	
	Sounda = audio.loadSound("Sounds/"..PlayerChoice.."a.mp3")
	Soundb = audio.loadSound("Sounds/"..PlayerChoice.."b.mp3")
	Soundc = audio.loadSound("Sounds/"..PlayerChoice.."c.mp3")
	Soundd = audio.loadSound("Sounds/"..PlayerChoice.."d.mp3")
	Sounde = audio.loadSound("Sounds/"..PlayerChoice.."e.mp3")

	sheet = sprite.newSpriteSheet( "Images/CharacterSprites/"..Player.Name..".png", 200, 200 )
	spriteSet = sprite.newSpriteSet(sheet, 1, 100)
	sprite.add( spriteSet, "Rstand", Player.Rstand1, Player.Rstand2, Player.Rstand3, 0 )
	sprite.add( spriteSet, "Lstand", Player.Lstand1, Player.Lstand2, Player.Lstand3, 0)
	sprite.add( spriteSet, "Rrun", Player.Rrun1, Player.Rrun2, Player.Rrun3, 0 )
	sprite.add( spriteSet, "Lrun", Player.Lrun1, Player.Lrun2, Player.Lrun3, 0)
	sprite.add( spriteSet, "Rattack1", Player.Rattack11, Player.Rattack12, Player.Rattack13, 1 )
	sprite.add( spriteSet, "Lattack1", Player.Lattack11, Player.Lattack12, Player.Lattack13, 1 )
	sprite.add( spriteSet, "Rattack2", Player.Rattack21, Player.Rattack22, Player.Rattack23, 1 )
	sprite.add( spriteSet, "Lattack2", Player.Lattack21, Player.Lattack22, Player.Lattack23, 1 )
	sprite.add( spriteSet, "Rattack3", Player.Rattack31, Player.Rattack32, Player.Rattack33, 1 )
	sprite.add( spriteSet, "Lattack3", Player.Lattack31, Player.Lattack32, Player.Lattack33, 1 )
	sprite.add( spriteSet, "Rhit", Player.Rhit1, Player.Rhit2, Player.Rhit3, 1 )
	sprite.add( spriteSet, "Lhit", Player.Lhit1, Player.Lhit2, Player.Lhit3, 1 )
	sprite.add( spriteSet, "Rdead", Player.Rdead1, Player.Rdead2, Player.Rdead3, 1 )
	sprite.add( spriteSet, "Ldead", Player.Ldead1, Player.Ldead2, Player.Ldead3, 1 )

	Player.Display= sprite.newSprite( spriteSet )
	Player.Display.x = w*0.2
	Player.Display.y = h*0.65
	group:insert(Player.Display)

	Player.State=0
	Player.Direction=0
	Player.AttackType=0
	Player.Health=Player.MaxHealthAmount
	Player.QueChecker=0
	Player.Special=0

	Gundam = display.newImage("Images/CharacterSprites/OrangeGundam.png",0,0)
	Gundam.y=100
	Gundam.x=w+144
	group:insert(Gundam)

	sheet5 = sprite.newSpriteSheet( "Images/CharacterSprites/Explosion.png", 96, 96 )
	spriteSet5 = sprite.newSpriteSet(sheet5, 1, 15)
	sprite.add( spriteSet5, "Boom", 1, 15, 900, 1 )
	Boom1= sprite.newSprite( spriteSet5 )
	Boom1.x=w*0.9
	Boom1.y=h*0.7
	Boom1.alpha=0
	Boom2= sprite.newSprite( spriteSet5 )
	Boom2.x=w*0.7
	Boom2.y=h*0.7
	Boom2.alpha=0
	Boom3= sprite.newSprite( spriteSet5 )
	Boom3.x=w*0.5
	Boom3.y=h*0.7
	Boom3.alpha=0
	Boom4= sprite.newSprite( spriteSet5 )
	Boom4.x=w*0.3
	Boom4.y=h*0.7
	Boom4.alpha=0
	Boom5= sprite.newSprite( spriteSet5 )
	Boom5.x=w*0.1
	Boom5.y=h*0.7
	Boom5.alpha=0
	group:insert(Boom1)
	group:insert(Boom2)
	group:insert(Boom3)
	group:insert(Boom4)
	group:insert(Boom5)

	PlayerBackBar=display.newRoundedRect(5,5,8+(2*Player.MaxHealthAmount),25,4)
	PlayerBackBar:setFillColor( 100, 100, 100 )
	group:insert(PlayerBackBar)

	playerSpecialbackbar=display.newRoundedRect(5,22,8+(2*Player.MaxHealthAmount),18,4)
	playerSpecialbackbar:setFillColor( 100, 100, 100 )
	group:insert(playerSpecialbackbar)

	PlayerNameText=display.newText( Player.Name, 9, 37, "Emulogic", 11 )
	PlayerNameBar=display.newRoundedRect(5,32,PlayerNameText.width+8,20.5,4)
	PlayerNameBar:setFillColor( 100, 100, 100 )
	group:insert(PlayerNameBar)
	group:insert(PlayerNameText)

	Cross = display.newImage("Images/Targets/"..Player.Color.."cross.png",0,0)
	Cross.alpha=0
	group:insert(Cross)

	CrossH = display.newImage("Images/Targets/"..Player.Color.."crosshair.png",0,0)
	CrossH.alpha=0
	group:insert(CrossH)

	WalkingArea = display.newRect( 0, h*0.60,w, h*0.25)
	WalkingArea.alpha=0
	WalkingBounds=WalkingArea.contentBounds
	group:insert(WalkingArea)

	SpecialButton=display.newImage("Images/Targets/SpecialButton.png")
	SpecialButton.x=w/2
	SpecialButton.y=h+(SpecialButton.height/2)
	group:insert(SpecialButton)

	Enemy1Xsize=60
	Enemy1Ysize=45
	Enemy1DeadTime=1500
	Enemy1AttackTime=800
	sheet1 = sprite.newSpriteSheet( "Images/CharacterSprites/enemy1.png", 200, 200 )
	spriteSet1 = sprite.newSpriteSet(sheet1, 1, 100)
	sprite.add( spriteSet1, "Rstand", 1, 6, 1500, 0 )
	sprite.add( spriteSet1, "Lstand", 11, 6, 1500, 0) 
	sprite.add( spriteSet1, "Rrun", 21, 7, 1000, 0 )
	sprite.add( spriteSet1, "Lrun", 31, 7, 1000, 0)
	sprite.add( spriteSet1, "Rattack", 41, 9, Enemy1AttackTime, 1 )
	sprite.add( spriteSet1, "Lattack", 51, 9, Enemy1AttackTime, 1 )
	sprite.add( spriteSet1, "Rhit", 61, 1, 300, 1 )
	sprite.add( spriteSet1, "Lhit", 71, 1, 300, 1 )
	sprite.add( spriteSet1, "Rdead", 62, 3, Enemy1DeadTime, 1 )
	sprite.add( spriteSet1, "Ldead", 72, 3, Enemy1DeadTime, 1 )

	Enemy2Xsize=45
	Enemy2Ysize=90
	Enemy2DeadTime=1000
	Enemy2AttackTime=900
	sheet2 = sprite.newSpriteSheet( "Images/CharacterSprites/enemy2.png", 200, 200 )
	spriteSet2 = sprite.newSpriteSet(sheet2, 1, 100)
	sprite.add( spriteSet2, "Rstand", 1, 4, 2000, 0 )
	sprite.add( spriteSet2, "Lstand", 11, 4, 2000, 0) 
	sprite.add( spriteSet2, "Rrun", 21, 8, 1500, 0 )
	sprite.add( spriteSet2, "Lrun", 31, 8, 1500, 0)
	sprite.add( spriteSet2, "Rattack", 41, 8, Enemy2AttackTime, 1 )
	sprite.add( spriteSet2, "Lattack", 51, 8, Enemy2AttackTime, 1 )
	sprite.add( spriteSet2, "Rhit", 61, 2, 450, 1 )
	sprite.add( spriteSet2, "Lhit", 71, 2, 450, 1 )
	sprite.add( spriteSet2, "Rdead", 81, 4, Enemy2DeadTime, 1 )
	sprite.add( spriteSet2, "Ldead", 91, 4, Enemy2DeadTime, 1 )

	Enemy3Xsize=65
	Enemy3Ysize=80
	Enemy3DeadTime=1100
	Enemy3AttackTime=500
	sheet3 = sprite.newSpriteSheet( "Images/CharacterSprites/enemy3.png", 200, 200 )
	spriteSet3 = sprite.newSpriteSet(sheet3, 1, 100)
	sprite.add( spriteSet3, "Rstand", 1, 4, 1000, 0 )
	sprite.add( spriteSet3, "Lstand", 11, 4, 1000, 0) 
	sprite.add( spriteSet3, "Rrun", 21, 5, 1500, 0 )
	sprite.add( spriteSet3, "Lrun", 31, 5, 1500, 0)
	sprite.add( spriteSet3, "Rattack", 41, 3, Enemy3AttackTime, 1 )
	sprite.add( spriteSet3, "Lattack", 51, 3, Enemy3AttackTime, 1 )
	sprite.add( spriteSet3, "Rhit", 61, 1, 300, 1 )
	sprite.add( spriteSet3, "Lhit", 71, 1, 300, 1 )
	sprite.add( spriteSet3, "Rdead", 62, 2, Enemy3DeadTime, 1 )
	sprite.add( spriteSet3, "Ldead", 72, 2, Enemy3DeadTime, 1 )

	Boss={
		Name="Goku",Color="Yellow",MaxHealthAmount=72,Speed=3.7,Power=15,
		Rstand1=1,Rstand2=4,Rstand3=2000,
		Lstand1=11,Lstand2=4,Lstand3=2000,
		Rrun1=21,Rrun2=4,Rrun3=800,
		Lrun1=31,Lrun2=4,Lrun3=800,
		Rattack11=41,Rattack12=6,Rattack13=700,
		Lattack11=51,Lattack12=6,Lattack13=700,
		Rattack21=61,Rattack22=7,Rattack23=1000,
		Lattack21=71,Lattack22=7,Lattack23=1000,
		Rattack31=81,Rattack32=9,Rattack33=1200,
		Lattack31=91,Lattack32=9,Lattack33=1200,
		Rhit1=5,Rhit2=2,Rhit3=400,
		Lhit1=15,Lhit2=2,Lhit3=400,
		Rdead1=5,Rdead2=3,Rdead3=700,
		Ldead1=15,Ldead2=3,Ldead3=700
		}

	Enemy4Xsize=65
	Enemy4Ysize=80
	Enemy4DeadTime=Boss.Rdead3
	Enemy4AttackTime=Boss.Rattack13
	sheet4 = sprite.newSpriteSheet( "Images/CharacterSprites/"..Boss.Name..".png", 200, 200 )
	spriteSet4 = sprite.newSpriteSet(sheet4, 1, 100)
	sprite.add( spriteSet4, "Rstand", Boss.Rstand1, Boss.Rstand2, Boss.Rstand3, 0 )
	sprite.add( spriteSet4, "Lstand", Boss.Lstand1, Boss.Lstand2, Boss.Lstand3, 0)
	sprite.add( spriteSet4, "Rrun", Boss.Rrun1, Boss.Rrun2, Boss.Rrun3, 0 )
	sprite.add( spriteSet4, "Lrun", Boss.Lrun1, Boss.Lrun2, Boss.Lrun3, 0)
	sprite.add( spriteSet4, "Rattack", Boss.Rattack11, Boss.Rattack12, Boss.Rattack13, 1 )
	sprite.add( spriteSet4, "Lattack", Boss.Lattack11, Boss.Lattack12, Boss.Lattack13, 1 )
	sprite.add( spriteSet4, "Rhit", Boss.Rhit1, Boss.Rhit2, Boss.Rhit3, 1 )
	sprite.add( spriteSet4, "Lhit", Boss.Lhit1, Boss.Lhit2, Boss.Lhit3, 1 )
	sprite.add( spriteSet4, "Rdead", Boss.Rdead1, Boss.Rdead2, Boss.Rdead3, 1 )
	sprite.add( spriteSet4, "Ldead", Boss.Ldead1, Boss.Ldead2, Boss.Ldead3, 1 )

	Enemy={}
	HealthBar={}
	EnemyHealthBar={}
	SpecialBar={}
	CurrentEnemy=0
	MovingSceneChecker=0
	LevelStage=1
	BossDead=0
	
	TimeTextBack=display.newRoundedRect( 0, -h*0.1,96, 60,w*0.015)
	TimeTextBack:setFillColor( 100, 100, 100 )
	TimeTextBack.x=w/2
	group:insert(TimeTextBack)
	
	TimeText = display.newText( "00:00", 0, 0, "Emulogic", 18 )
	TimeText.x = w*0.5
	TimeText.y = h*0.045
	group:insert(TimeText)
	
	GameCount=0
	
	ComboCounter=0
	ScoreText = display.newText( "000000", 0, 0, "Emulogic", 14 )
	ScoreText.x = 50
	ScoreText.y = 310
	group:insert(ScoreText)
	
	ComboText = display.newText( "", 0, 0, "Emulogic", 15 )
	ComboText.x = 340
	ComboText.y = 310
	group:insert(ComboText)

	ComboTextText = display.newText( "HIT COMBO", 0, 0, "Emulogic", 12 )
	ComboTextText.x = 420
	ComboTextText.y = 310
	ComboTextText.alpha=0
	group:insert(ComboTextText)

	function ShowHealth()
		if BossDead==0 then
			for i=1,#HealthBar,1 do
				HealthBar[i]:setFillColor(255, 255, 150)
			end
			for i=1,Player.Health,1 do
				HealthBar[i] = display.newRect(7+(2*i),8,2,19)
				group:insert(HealthBar[i])
				if Player.Health<=(Player.MaxHealthAmount/3) then
					HealthBar[i]:setFillColor( 255, 0, 0 )
				else
					HealthBar[i]:setFillColor( 0, 255, 0 )
				end
			end
			if Player.Special>Player.MaxHealthAmount then
				Player.Special=Player.Special-Player.MaxHealthAmount
				transition.to( SpecialButton, {y=h-(SpecialButton.height/2),time = 300 })
				SpecialButton:addEventListener("tap", GundamAttack)
			end
			playerSpecialbackbarcover=display.newRect(9,30,(2*Player.MaxHealthAmount),6)
			playerSpecialbackbarcover:setFillColor( 200, 200, 200 )
			group:insert(playerSpecialbackbarcover)
			for i=1,Player.Special,1 do
				SpecialBar[i] = display.newRect(7+(2*i),30,2,6)
				SpecialBar[i]:setFillColor( 255, 150, 0 )
				group:insert(SpecialBar[i])
			end
			if CurrentEnemy~=0 then
				if EnemyBackBar~=nil then
					EnemyBackBar.alpha=0
					EnemyBackBarCover.alpha=0
					EnemyNameBar.alpha=0
					EnemyNameText.alpha=0
				end
				if Enemy[CurrentEnemy].State~=4 then
					EnemyNameText=display.newText( Enemy[CurrentEnemy].Name, 0, 27, "Emulogic", 11 )
					EnemyNameText.x=w-7-(EnemyNameText.width/2)
					EnemyNameBar=display.newRoundedRect(w-11-EnemyNameText.width,23,EnemyNameText.width+6,20,4)
					EnemyNameBar:setFillColor( 100, 100, 100 )
					group:insert(EnemyNameBar)
					EnemyBackBar=display.newRoundedRect(w-13-(3*Enemy[CurrentEnemy].MaxHealthAmount),5,w-(w-8-(3*Enemy[CurrentEnemy].MaxHealthAmount)),25,4)
					EnemyBackBar:setFillColor( 100, 100, 100 )
					group:insert(EnemyBackBar)
					EnemyBackBarCover=display.newRect(w-9-(3*Enemy[CurrentEnemy].MaxHealthAmount),8,(3*Enemy[CurrentEnemy].MaxHealthAmount),19)
					EnemyBackBarCover:setFillColor(255, 255, 150)
					group:insert(EnemyBackBarCover)
					group:insert(EnemyNameText)
				end
			end
			for i=1,#EnemyHealthBar,1 do
				EnemyHealthBar[i].alpha=0
			end
			if CurrentEnemy~=0 then
				for i=1,Enemy[CurrentEnemy].Health,1 do
					EnemyHealthBar[i] = display.newRect(w-9-(3*i),8,3,19)
					group:insert(EnemyHealthBar[i])
					if Enemy[CurrentEnemy].Health<=(Enemy[CurrentEnemy].MaxHealthAmount/3) then
						EnemyHealthBar[i]:setFillColor( 255, 0, 0 )
					else
						EnemyHealthBar[i]:setFillColor( 0, 255, 0 )
					end
				end
			end
			CheckIfAnyonesDead()
		end
	end

	function StageChecker (event)
		if BossDead==0 then
			if Player.Health<=0 then
				BossDead=1
				changeScene5()
			else
				function StageCreateEnemies()
					if LevelStage==1 then
						j=2
						k=2
						LevelStage=2
					elseif LevelStage==2 then
						j=3
						k=2
						LevelStage=3
					elseif LevelStage==3 then
						j=4
						k=3
						LevelStage=4
					elseif LevelStage==4 then
						j=1
						k=0
						LevelStage=5
					end
					for i=1,j,1 do
						CreateEnemy(i,k)
						group:insert(Enemy[i])
					end
					MovingSceneChecker=0
				end
				if LevelStage==1 then
					StageCreateEnemies()
				elseif LevelStage==2 and DeadChecker==0 and MovingSceneChecker==0 then
					Player.Display:prepare("Rrun")
					Player.Display:play()
					transition.to( background2, { x = background2.x-240, time = 4000,onComplete = PlayerStand} )	
					transition.to( background3, { x = background3.x-240, time = 4000,onComplete = PlayerStand} )	
					timer.performWithDelay(3900, StageCreateEnemies,1)
					MovingSceneChecker=1
					DeadChecker=1
				elseif LevelStage==3 and DeadChecker==0 and MovingSceneChecker==0 then
					Player.Display:prepare("Rrun")
					Player.Display:play()
					transition.to( background2, { x = background2.x-240, time = 4000,onComplete = PlayerStand} )	
					transition.to( background3, { x = background3.x-240, time = 4000,onComplete = PlayerStand} )	
					timer.performWithDelay(3900, StageCreateEnemies,1)
					MovingSceneChecker=1
					DeadChecker=1
				elseif LevelStage==4 and DeadChecker==0 and MovingSceneChecker==0 then
					StageCreateEnemies()
					DeadChecker=1
					backSound=audio.stop()
					backSound=audio.play( Music9, { channel=1, loops=-1, fadein=100 }  ) 
				elseif LevelStage==5 and DeadChecker==0 and MovingSceneChecker==0 then	
					BossDead=1
					changeScene5()
				end
			end
		end
	end

	function CheckPlace ()
		if BossDead==0 then
			if Player.State==2 then
				group:insert(Player.Display)
			elseif Player.State~=3 then
				Player.Used=0
				for i=1,#Enemy,1 do
					Enemy[i].Used=0
				end
				for i=1,#Enemy,1 do
					CurrentHighestCharAmount=h+100
					CurrentHighestChar=0
					for j=1,#Enemy,1 do
						if Enemy[j].Used==0 then
							if CurrentHighestCharAmount > Enemy[j].y+(Enemy[j].Ysize/2) then
								CurrentHighestChar=j
								CurrentHighestCharAmount=Enemy[j].y+(Enemy[j].Ysize/2)
							end
						end
					end
					Enemy[CurrentHighestChar].Used=1
					group:insert(Enemy[CurrentHighestChar])
					if Player.Used==0 then
						if Player.Display.y+35>Enemy[CurrentHighestChar].y+(Enemy[CurrentHighestChar].Ysize/2) then
							group:insert(Player.Display)
						else
							Player.Used=1
						end
					end
				end
			else
				group:insert(Enemy[CurrentEnemy])
			end
			group:insert(Gundam)
			group:insert(Boom1)
			group:insert(Boom2)
			group:insert(Boom3)
			group:insert(Boom4)
			group:insert(Boom5)
			group:insert(background3)
			group:insert(ScoreText)
			group:insert(ComboText)
			group:insert(ComboTextText)
			group:insert(block1)
			group:insert(block2)
			group:insert(SpecialButton)
			group:insert(SideLeft)
			group:insert(SideRight)
			group:insert(SideTop)
			group:insert(SideBottom)
		end
	end

	function TimeText:timer()
		if BossDead==0 then
			GameCount = GameCount+1
			if GameCount<10 then
				TimeText.text = "00:0"..GameCount
			elseif GameCount<60 then
				TimeText.text = "00:"..GameCount
			elseif (GameCount%60)<10 and GameCount<600 then
				TimeText.text = ("0"..(GameCount-(GameCount%60))/60)..":0"..(GameCount%60)
			elseif GameCount<600 then
				TimeText.text = ("0"..(GameCount-(GameCount%60))/60)..":"..(GameCount%60)
			elseif (GameCount%60)<10 then
				TimeText.text = ((GameCount-(GameCount%60))/60)..":0"..(GameCount%60)
			else
				TimeText.text = ((GameCount-(GameCount%60))/60)..":"..(GameCount%60)
			end
		end	
	end

	ShowHealth()
	PlayerStand()
	StageChecker()
	CheckPlace ()
	if ScoreCounter<1000000 then
		if ScoreCounter<10 then
			ScoreText.text="00000"..ScoreCounter
		elseif ScoreCounter<100 then
			ScoreText.text="0000"..ScoreCounter
		elseif ScoreCounter<1000 then
			ScoreText.text="000"..ScoreCounter
		elseif ScoreCounter<10000 then
			ScoreText.text="00"..ScoreCounter
		elseif ScoreCounter<100000 then
			ScoreText.text="0"..ScoreCounter
		elseif ScoreCounter<1000000 then
			ScoreText.text=ScoreCounter
		end
	else
		ScoreText.text="999999"
	end
end

function scene:enterScene( event )
	backSound=audio.play( Music3, { channel=1, loops=-1, fadein=100 }  ) 
	transition.to( block1, {x=-160, time = 300} )
	transition.to( block2, {x=640, time = 300} )
	Runtime:addEventListener("touch", UsePlayer)
	Timer1=timer.performWithDelay(1500, MoveEnemys,0)
	Timer2=timer.performWithDelay(1200, EnemyCheckForAttack,0)
	Timer3=timer.performWithDelay(20, CheckPlace,0)
	Timer4=timer.performWithDelay( 1000, TimeText, 3599 )
end

function scene:exitScene()
	Runtime:removeEventListener("touch", UsePlayer)
	timer.cancel(Timer1)
	timer.cancel(Timer2)
	timer.cancel(Timer3)
	timer.cancel(Timer4)
	
end

function scene:didExitScene( event )
	storyboard.purgeScene( "GameLevel3" )
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