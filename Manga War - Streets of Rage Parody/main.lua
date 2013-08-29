local storyboard = require "storyboard"


Music1 = audio.loadStream("Sounds/ST1.mp3")
Music2 = audio.loadStream("Sounds/ST2.mp3")
Music3 = audio.loadStream("Sounds/ST3.mp3")
Music4 = audio.loadStream("Sounds/ST4.mp3")
Music5 = audio.loadStream("Sounds/ST5.mp3")
Music6 = audio.loadStream("Sounds/ST6.mp3")
Music7 = audio.loadStream("Sounds/TITLE.mp3")
Music8 = audio.loadStream("Sounds/MAINMENU.mp3")
Music9 = audio.loadStream("Sounds/BOSS.mp3")
Music10 = audio.loadStream("Sounds/RESULT.mp3")
Music11 = audio.loadStream("Sounds/FAILURE.mp3")

Sound1 = audio.loadSound("Sounds/SLAM.mp3")
Sound2 = audio.loadSound("Sounds/Click.mp3")
Sound3 = audio.loadSound("Sounds/TaDa.mp3")
Sound4 = audio.loadSound("Sounds/Boom.mp3")

display.setStatusBar( display.HiddenStatusBar )
h,w = display.contentHeight, display.contentWidth

LevelSelected=0
GameDifficulty=0


function CreateEnemy(i,j)
	if BossDead==0 then
		if j~=0 then
			RandomEnemyNumber=math.random(1,j)
			if RandomEnemyNumber==1 then
				Enemy[i]= sprite.newSprite( spriteSet1 )
				Enemy[i].Xsize=Enemy1Xsize
				Enemy[i].Ysize=Enemy1Ysize
				Enemy[i].Speed=35
				Enemy[i].Name="Slug Hollow"
				Enemy[i].MaxHealthAmount=15
				Enemy[i].Health=15
				Enemy[i].DeadTime=Enemy1DeadTime
				Enemy[i].AttackTime=Enemy1AttackTime
				Enemy[i].Power=5
			elseif RandomEnemyNumber==2 then
				Enemy[i]= sprite.newSprite( spriteSet2 )
				Enemy[i].Xsize=Enemy2Xsize
				Enemy[i].Ysize=Enemy2Ysize
				Enemy[i].Speed=32.5
				Enemy[i].Name="Magellan"
				Enemy[i].MaxHealthAmount=20
				Enemy[i].Health=20
				Enemy[i].DeadTime=Enemy2DeadTime
				Enemy[i].AttackTime=Enemy2AttackTime
				Enemy[i].Power=10
			else
				Enemy[i]= sprite.newSprite( spriteSet3 )
				Enemy[i].Xsize=Enemy3Xsize
				Enemy[i].Ysize=Enemy3Ysize
				Enemy[i].Speed=30
				Enemy[i].Name="Jibakurai"
				Enemy[i].MaxHealthAmount=30
				Enemy[i].Health=30
				Enemy[i].DeadTime=Enemy3DeadTime
				Enemy[i].AttackTime=Enemy3AttackTime
				Enemy[i].Power=15
			end
			ScreenSideNumber=math.random(1,2)
		else
			Enemy[i]= sprite.newSprite( spriteSet4 )
			Enemy[i].Xsize=Enemy4Xsize
			Enemy[i].Ysize=Enemy4Ysize
			Enemy[i].Speed=Boss.Speed*5
			Enemy[i].Name=Boss.Name
			Enemy[i].MaxHealthAmount=55
			Enemy[i].Health=55
			Enemy[i].DeadTime=Enemy4DeadTime
			Enemy[i].AttackTime=Enemy4AttackTime
			Enemy[i].Power=Boss.Power*1.5
			ScreenSideNumber=2
		end
		
		if ScreenSideNumber == 1 then
			Enemy[i].x=-Enemy[i].Xsize*0.75
			Enemy[i]:prepare("Rstand")
			Enemy[i].Direction=0
		else 
			Enemy[i].x=w+Enemy[i].Xsize*0.75
			Enemy[i]:prepare("Lstand")
			Enemy[i].Direction=1
		end
		Enemy[i].y=math.random((WalkingBounds.yMin*1.1),(WalkingBounds.yMax*0.9))
		Enemy[i].State=0
		Enemy[i]:play()
	end
end

function PlayerStand()
	if BossDead==0 and MovingSceneChecker==0 then
		if Player.State~=4 then
			CrossH.alpha=0
			Player.State=0
			if Player.QueChecker == 1 then
				Player.QueChecker=0
				PlayerAttack()
			else
				if Player.Direction==0 then
					Player.Display:prepare("Rstand")			
				elseif Player.Direction==1 then
					Player.Display:prepare("Lstand")
				end
				Player.Display:play()
			end
		end
	end
end

function StandEnemy(l)
	if BossDead==0 then
		StartLoopNum=0
		EndLoopNum=0
		if l=="All" then
			StartLoopNum=1
			EndLoopNum=#Enemy
		else
			StartLoopNum=l
			EndLoopNum=l
		end
		for k=StartLoopNum,EndLoopNum,1 do
			if Enemy[k].Tran then
				transition.cancel(Enemy[k].Tran)
			end
			if Enemy[k].State~=4 then
				if Player.Display.x>=Enemy[k].x then
					Enemy[k].Direction=0
				else
					Enemy[k].Direction=1
				end
				if Enemy[k].Direction==0 then
					Enemy[k]:prepare("Rstand")
				elseif Enemy[k].Direction==1 then
					Enemy[k]:prepare("Lstand")
				end
				Enemy[k]:play()
				Enemy[k].State=0
			end
		end
	end
end

function BombsAway(event)
	if BossDead==0 then
		if event.count==7 then
			Boom1.alpha=0
			EnemyBackBar.alpha=0
			EnemyBackBarCover.alpha=0
			EnemyNameBar.alpha=0
			EnemyNameText.alpha=0
		elseif event.count==6 then
			Boom2.alpha=0
			
			PlayerHit()
		elseif event.count==5 then
			Boom3.alpha=0
			Boom1.alpha=1
			Boom1:prepare("Boom")
			Boom1:play()
			audio.play(Sound4)
			PlayerHit()
		elseif event.count==4 then
			Boom4.alpha=0
			Boom2.alpha=1
			Boom2:prepare("Boom")
			Boom2:play()
			audio.play(Sound4)
			PlayerHit()
		elseif event.count==3 then
			Boom5.alpha=0
			Boom3.alpha=1
			Boom3:prepare("Boom")
			Boom3:play()
			audio.play(Sound4)
			PlayerHit()
		elseif event.count==2 then
			Boom4.alpha=1
			Boom4:prepare("Boom")
			Boom4:play()
			audio.play(Sound4)
			PlayerHit()
		elseif event.count==1 then
			Boom5.alpha=1
			Boom5:prepare("Boom")
			Boom5:play()
			audio.play(Sound4)
		end
	end	
end

function GundamAttack()
	if BossDead==0 and MovingSceneChecker==0 then
		SpecialButton:removeEventListener("tap", GundamAttack)
		Gundam.x=-144
		transition.to( Gundam, {x=w+144,time = 4800} )
		transition.to( SpecialButton, {y=(h+(SpecialButton.height/2)),time = 1000} )
		timer.performWithDelay(600, BombsAway,7)
	end	
end

function CheckIfAnyonesDead()
	for o=1,#Enemy,1 do
		if Enemy[o].State~=4 then
			if Enemy[o].Health<=0 then
				Enemy[o].State=4
				DeadChecker=#Enemy
				for i=1,#Enemy,1 do
					if Enemy[i].State==4 then
						DeadChecker=DeadChecker-1
					end
				end
				if Enemy[o].Direction==0 then
					Enemy[o]:prepare("Rdead")
				elseif Enemy[o].Direction==1 then
					Enemy[o]:prepare("Ldead")
				end
				Enemy[o]:play()
				Multiplier=((ComboCounter-(ComboCounter%5))/5)+1
				ScoreCounter=ScoreCounter+(Enemy[o].MaxHealthAmount*Multiplier)
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
				Player.Special=Player.Special+Enemy[o].MaxHealthAmount
				function RemoveEnemy ()	
					Enemy[o].x=w*1.5
					if DeadChecker==0 then
						timer.performWithDelay(1000,StageChecker)
					end
				end
				function DeadFade ()
					if Enemy[o].Name==Boss.Name then
						timer.performWithDelay(Enemy[o].DeadTime/3, StageChecker,1)
					else
						transition.to( Enemy[o], {alpha=0, time = 1000,onComplete = RemoveEnemy} )
					end
				end
				timer.performWithDelay((Enemy[o].DeadTime*2/3), DeadFade,1)
				CrossH.alpha=0
				ShowHealth()	
			end
		end
	end
	if Player.Health<=0 then
		Player.State=4
		if Player.Direction==0 then
			Player.Display:prepare("Rdead")
		elseif Player.Direction==1 then
			Player.Display:prepare("Ldead")
		end
		audio.play(Sounde)
		Player.Display:play()
		timer.performWithDelay((Player.Rdead3*1.5),StageChecker)
	end
end

function PlayerHit()
	if BossDead==0 then
		if Player.AttackType==1 and Player.Direction==0 then
			HealthDeduction=2*Player.Power
			HitLength=Player.Rattack23
		elseif Player.AttackType==2 and Player.Direction==1 then
			HealthDeduction=2*Player.Power
			HitLength=Player.Rattack23
		elseif Player.AttackType==3 and Player.Direction==0 then
			HealthDeduction=1.5*Player.Power
			HitLength=Player.Rattack33
		elseif Player.AttackType==4 and Player.Direction==1 then
			HealthDeduction=1.5*Player.Power
			HitLength=Player.Rattack33
		else
			HealthDeduction=1*Player.Power
			HitLength=Player.Rattack13
		end
		for m=1,#Enemy,1 do
			if Enemy[m].State~=4 then
				YouSunkMyBattleship=0
				if Player.AttackType==1 or Player.AttackType==2 then
					if Player.Direction==0 and Enemy[m].x>=Player.Display.x and Enemy[m].x<=Player.Display.x+20+(Enemy[m].Xsize) and Enemy[m].y<=Player.Display.y+40 and Enemy[m].y>=Player.Display.y-40 then
						YouSunkMyBattleship=1
					elseif Player.Direction==1 and Enemy[m].x<=Player.Display.x and Enemy[m].x>=Player.Display.x-20-(Enemy[m].Xsize) and Enemy[m].y<=Player.Display.y+40 and Enemy[m].y>=Player.Display.y-40 then
						YouSunkMyBattleship=1
					end
				elseif Player.AttackType==3 or Player.AttackType==4 then
					if Enemy[m].x>=Player.Display.x-20-(Enemy[m].Xsize*0.75) and Enemy[m].x<=Player.Display.x+20+(Enemy[m].Xsize*0.75) and Enemy[m].y<=Player.Display.y+40 and Enemy[m].y>=Player.Display.y-40 then
						YouSunkMyBattleship=1
					end
				elseif Player.AttackType==0 then
					if Player.Direction==0 and Enemy[m].x>=Player.Display.x and Enemy[m].x<=Player.Display.x+20+(Enemy[m].Xsize*0.75) and Enemy[m].y<=Player.Display.y+40 and Enemy[m].y>=Player.Display.y-40 then
						YouSunkMyBattleship=1
					elseif Player.Direction==1 and Enemy[m].x<=Player.Display.x and Enemy[m].x>=Player.Display.x-20-(Enemy[m].Xsize*0.75) and Enemy[m].y<=Player.Display.y+40 and Enemy[m].y>=Player.Display.y-40 then
						YouSunkMyBattleship=1
					end
				end
				if (Gundam.x>=-4 and Gundam.x<=100 and Enemy[m].x>=-4 and Enemy[m].x<=100) or (Gundam.x>=92 and Gundam.x<=196 and Enemy[m].x>=92 and Enemy[m].x<=196) or (Gundam.x>=188 and Gundam.x<=292 and Enemy[m].x>=188 and Enemy[m].x<=292) or (Gundam.x>=284 and Gundam.x<=388 and Enemy[m].x>=284 and Enemy[m].x<=388) or (Gundam.x>=380 and Gundam.x<=484 and Enemy[m].x>=380 and Enemy[m].x<=484) then
					YouSunkMyBattleship=1
					HealthDeduction=30
					
				end
				if YouSunkMyBattleship==1 then
					if Enemy[m].Tran then
						transition.cancel(Enemy[m].Tran)
					end
					if Enemy[m].Direction==0 then
						Enemy[m]:prepare("Rhit")
					elseif Enemy[m].Direction==1 then
						Enemy[m]:prepare("Lhit")
					end
					
					Enemy[m]:play()
					Enemy[m].State=3
					ComboCounter=ComboCounter+1
					ComboText.text=ComboCounter
					ComboTextText.alpha=1
					Enemy[m].Health=Enemy[m].Health-(HealthDeduction*GameDifficulty)
					local function StandEnemyWithPer()
						StandEnemy(m)
					end
					Enemy[m].GotHitTimer=timer.performWithDelay(HitLength,StandEnemyWithPer)
					ShowHealth()
				end
			end
		end
	end
end

function PlayerAttack()
	if BossDead==0 then
		Player.State=2
		if CurrentEnemy~=0 then
			if Enemy[CurrentEnemy].Tran then
				transition.cancel(Enemy[CurrentEnemy].Tran)
			end
		end
		CrossH.alpha=0
		if Player.AttackType==1 and Player.Direction==0 then
			attackTimeAmmount=Player.Rattack23
			Player.Display:prepare("Rattack2")
			Noise=Soundb
		elseif Player.AttackType==2 and Player.Direction==1  then
			attackTimeAmmount=Player.Rattack23
			Player.Display:prepare("Lattack2")
			Noise=Soundb
		elseif Player.AttackType==3 and Player.Direction==0 then
			attackTimeAmmount=Player.Rattack33
			Player.Display:prepare("Rattack3")
			Noise=Soundc
		elseif Player.AttackType==4 and Player.Direction==1 then
			attackTimeAmmount=Player.Rattack33
			Player.Display:prepare("Lattack3")
			Noise=Soundc
		else
			Noise=Sounda
			attackTimeAmmount=Player.Rattack13
			if Player.Direction==0 then
				Player.Display:prepare("Rattack1")
			elseif Player.Direction==1 then
				Player.Display:prepare("Lattack1")
			end
		end
		audio.play(Noise)
		Player.Display:play()
		attackTimer=timer.performWithDelay(attackTimeAmmount, PlayerStand)
		attackHitTimer=timer.performWithDelay(attackTimeAmmount*0.5, PlayerHit)
	end
end

function MoveEnemys()
	if BossDead==0 then
		j=math.random(1,#Enemy)
		if Enemy[j].State==4 then
			j=math.random(1,#Enemy)
		end
		if Enemy[j].State==4 then
			j=math.random(1,#Enemy)
		end
		if Enemy[j].State==0 then
			if Enemy[j].x>Player.Display.x then
				MoveXMin=Player.Display.x+40
				MoveXMax=Player.Display.x+60
				if MoveXMax>=h then
					MoveXMin=h
					MoveXMax=h
				end
			else
				MoveXMin=Player.Display.x-60
				MoveXMax=Player.Display.x-40
				if MoveXMin<=0 then
					MoveXMin=0
					MoveXMax=0
				end
			end
			MoveX=math.random(MoveXMin,MoveXMax)
			MoveYMin=Player.Display.y-50
			if MoveYMin<=WalkingBounds.yMin then
				MoveYMin=WalkingBounds.yMin
				MoveYMax=WalkingBounds.yMin
			end
			MoveYMax=Player.Display.y+50
			if MoveYMax>=WalkingBounds.yMax then
				MoveYMin=WalkingBounds.yMax
				MoveYMax=WalkingBounds.yMax
			end
			MoveY=math.random(MoveYMin,MoveYMax)
			if Player.Display.x>=Enemy[j].x then
				Enemy[j].Direction=0
			else
				Enemy[j].Direction=1
			end
			if Enemy[j].Direction==0 then
				Enemy[j]:prepare("Rrun")
			elseif Enemy[j].Direction==1 then
				Enemy[j]:prepare("Lrun")
			end
			if MoveX >= Enemy[j].x then
				if MoveY >= Enemy[j].y then
					QuarterValue=MoveX+(MoveY-(Enemy[j].Ysize/2))-Enemy[j].x-Enemy[j].y
				else
					QuarterValue=MoveX-(MoveY-(Enemy[j].Ysize/2))-Enemy[j].x+Enemy[j].y
				end
			elseif MoveX <= Enemy[j].x then
				if MoveY >= Enemy[j].y then
					QuarterValue=Enemy[j].x-MoveX+(MoveY-(Enemy[j].Ysize/2))-Enemy[j].y
				else 
					QuarterValue=Enemy[j].x-MoveX-(MoveY-(Enemy[j].Ysize/2))+Enemy[j].y
				end
			end
			if QuarterValue<=80 then
				QuarterValue=80
			end
			Enemy[j]:play()
			function CallStandAllEnemyWithVariable()
				StandEnemy("All")
			end
			Enemy[j].Tran=transition.to( Enemy[j], {x=MoveX, y=MoveY-(Enemy[j].Ysize/2), time = QuarterValue*Enemy[j].Speed ,onComplete = CallStandAllEnemyWithVariable} )
			Enemy[j].State=1
		elseif Enemy[j].State==1 then
			StandEnemy(j)
		end
	end
end

function UsePlayer (event)
	if BossDead==0 then
		if MovingSceneChecker==0 and event.phase=="ended" and Player.State~=3 and Player.State~=4 then-- and ZoroGotHitChecker==0 and ZoroDeadChecker==0 then
			if event.y < event.yStart-20 and event.x > event.xStart+20 then		
				Player.AttackType=1
			elseif event.y < event.yStart-20 and event.x < event.xStart-20 then
				Player.AttackType=2
			elseif event.y > event.yStart+20 and event.x > event.xStart+20 then
				Player.AttackType=3
			elseif event.y > event.yStart+20 and event.x < event.xStart-20 then
				Player.AttackType=4
			else
				Player.AttackType=0
			end
			CurrentLowest=0
			if Player.Direction==0 then
				CurrentLowestX=w
			else
				CurrentLowestX=0
			end
			z=0
			for n=1,#Enemy,1 do
				if event.xStart >= Enemy[n].x-(Enemy[n].Xsize/2) and event.xStart <= Enemy[n].x+(Enemy[n].Xsize/2) and event.yStart >= Enemy[n].y-(Enemy[n].Ysize/2) and event.yStart <= Enemy[n].y+(Enemy[n].Ysize/2) then
					if Enemy[n].State~=4 then
						if Player.Direction==0 then
							if (Enemy[n].x-(Enemy[n].Xsize/2))<=CurrentLowestX then
								CurrentLowest=n
								CurrentLowestX=Enemy[n].x-(Enemy[n].Xsize/2)
							end
						else
							if (Enemy[n].x+(Enemy[n].Xsize/2))>=CurrentLowestX then
								CurrentLowest=n
								CurrentLowestX=Enemy[n].x-(Enemy[n].Xsize/2)
							end
						end
					else 
						z=n
					end
				end
			end
			i=CurrentLowest
			if i~=0 then
				if 	event.xStart>WalkingBounds.xMin and event.xStart<WalkingBounds.xMax and event.yStart>WalkingBounds.yMin-40 and event.yStart<WalkingBounds.yMax then
					if  event.xStart > SpecialButton.x-82.5 and event.xStart < SpecialButton.x+82.5 and event.yStart > SpecialButton.y-28 and event.yStart < SpecialButton.y+28 then
						if attackTimer then
							timer.cancel(attackTimer)
						end
						if attackHitTimer then
							timer.cancel(attackHitTimer)
						end
						if Tran then
							transition.cancel(Tran)
						end
						PlayerStand()
					elseif Player.State==0 and Player.Display.y == (Enemy[i].y+(Enemy[i].Ysize/2)-35) and ((Player.Direction==1 and Player.Display.x == (Enemy[i].x+30+(Enemy[i].Xsize/2))) or (Player.Direction==0 and Player.Display.x == (Enemy[i].x-30-(Enemy[i].Xsize/2)))) then
						CurrentEnemy=i
						ShowHealth()
						PlayerAttack()
					elseif Player.State==2 and Player.Display.y == (Enemy[i].y+(Enemy[i].Ysize/2)-35) and ((Player.Direction==1 and Player.Display.x == (Enemy[i].x+30+(Enemy[i].Xsize/2))) or (Player.Direction==0 and Player.Display.x == (Enemy[i].x-30-(Enemy[i].Xsize/2)))) then
						Player.QueChecker=1
					elseif Player.State==2 and CurrentEnemy==i then
						Player.QueChecker=1
					elseif Player.State==1 and CurrentEnemy==i then
						Player.QueChecker=1
					else 
						if attackTimer then
							timer.cancel(attackTimer)
						end
						if attackHitTimer then
							timer.cancel(attackHitTimer)
						end
						if Tran then
							transition.cancel(Tran)
						end
						CrossH.x=Enemy[i].x
						CrossH.y=Enemy[i].y
						CrossH.height=(Enemy[i].Ysize+Enemy[i].Xsize)*0.6
						CrossH.width=(Enemy[i].Ysize+Enemy[i].Xsize)*0.6
						CrossH.alpha=1
						transition.to( CrossH, {rotation=CrossH.rotation+1800, time = 6000} )
						if event.xStart >= Player.Display.x then
							if Player.State~=1 then
								Player.Display:prepare("Rrun")
							elseif Player.State==1 and Player.Direction==1 then
								Player.Display:prepare("Rrun")
							end
							Player.Direction=0
							EnemySide=Enemy[i].x-30-(Enemy[i].Xsize/2)
							if event.yStart >= Player.Display.y then
								QuarterValue=event.xStart+(event.yStart-35)-Player.Display.x-Player.Display.y
							else
								QuarterValue=event.xStart-(event.yStart-35)-Player.Display.x+Player.Display.y
							end
						elseif event.xStart <= Player.Display.x then
							if Player.State~=1 then
								Player.Display:prepare("Lrun")
							elseif Player.State==1 and Player.Direction==0 then
								Player.Display:prepare("Lrun")
							end
							Player.Direction=1
							EnemySide=Enemy[i].x+30+(Enemy[i].Xsize/2)
							if event.yStart >= Player.Display.y then
								QuarterValue=Player.Display.x-event.xStart+(event.yStart-35)-Player.Display.y
							else 
								QuarterValue=Player.Display.x-event.xStart-(event.yStart-35)+Player.Display.y
							end
						end
						Player.Display:play()
						Tran=transition.to( Player.Display, { x = EnemySide, y = Enemy[i].y+(Enemy[i].Ysize/2)-35, time = (QuarterValue)*Player.Speed*0.6 ,onComplete = PlayerAttack} )	
						Player.State=1
						CurrentEnemy=i
						ShowHealth()
					end
				end
			elseif z==0 then
				Player.QueChecker=0
				if attackTimer then
					timer.cancel(attackTimer)
				end
				if attackHitTimer then
					timer.cancel(attackHitTimer)
				end
				if Tran then
					transition.cancel(Tran)
				end
				CurrentEnemy=0
				if  event.xStart > SpecialButton.x-82.5 and event.xStart < SpecialButton.x+82.5 and event.yStart > SpecialButton.y-28 and event.yStart < SpecialButton.y+28 then
					PlayerStand()
				elseif event.xStart <= Player.Display.x+25 and event.xStart >= Player.Display.x-25 and event.yStart <= Player.Display.y+40 and event.yStart >= Player.Display.y-40 then
					PlayerStand()
				else
					CrossH.alpha=0
					Cross.height=h/12
					Cross.width=h/12
					Cross.alpha=1
					Cross.x=event.xStart
					Cross.y=event.yStart
					transition.to( Cross, { alpha = 0,height=Cross.height/3,width=Cross.width/3, time = 500} )	
					if event.xStart >= Player.Display.x then
						if Player.State~=1 then
							Player.Display:prepare("Rrun")
						elseif Player.State==1 and Player.Direction==1 then
							Player.Display:prepare("Rrun")
						end
						Player.Direction=0
						if event.yStart >= Player.Display.y then
							QuarterValue=event.xStart+(event.yStart-35)-Player.Display.x-Player.Display.y
						else
							QuarterValue=event.xStart-(event.yStart-35)-Player.Display.x+Player.Display.y
						end
					elseif event.xStart <= Player.Display.x then
						if Player.State~=1 then
							Player.Display:prepare("Lrun")
						elseif Player.State==1 and Player.Direction==0 then
							Player.Display:prepare("Lrun")
						end
						Player.Direction=1
						if event.yStart >= Player.Display.y then
							QuarterValue=Player.Display.x-event.xStart+(event.yStart-35)-Player.Display.y
						else 
							QuarterValue=Player.Display.x-event.xStart-(event.yStart-35)+Player.Display.y
						end
					end
					if event.xStart >= WalkingBounds.xMax then
						xTran=WalkingBounds.xMax
					elseif event.xStart <= WalkingBounds.xMin then
						xTran=WalkingBounds.xMin
					else
						xTran=event.xStart
					end
					if event.yStart >= WalkingBounds.yMax then
						yTran=WalkingBounds.yMax-35
					elseif event.yStart <= WalkingBounds.yMin then
						yTran=WalkingBounds.yMin-35
					else
						yTran=event.yStart-35
					end
					Player.Display:play()
					Tran=transition.to( Player.Display, { x = xTran, y = yTran, time = (QuarterValue)*Player.Speed ,onComplete = PlayerStand} )
					Player.State=1	
				end
			end
		end
	end
end

function EnemyHit (q)
	if BossDead==0 then
		if Player.State~=2 and ((Enemy[q].Direction==1 and Player.Display.x<=Enemy[q].x and Player.Display.x>=Enemy[q].x-20-(Enemy[q].Xsize*0.75)) or (Enemy[q].Direction==0 and Player.Display.x>=Enemy[q].x and Player.Display.x<=Enemy[q].x+20+(Enemy[q].Xsize*0.75))) and Player.Display.y>=Enemy[q].y-40 and Player.Display.y<=Enemy[q].y+40 then
			if Tran then
				transition.cancel(Tran)
			end
			if EnemyAttackTimer then
				timer.cancel(EnemyAttackTimer)
			end
			Player.Health=Player.Health-1*Enemy[q].Power
			if Enemy[q].Direction==0 and Player.Display.x>=Enemy[q].x and Player.Display.x<=Enemy[q].x+20+(Enemy[q].Xsize*0.75) then
				Player.Display:prepare("Lhit")
			else
				Player.Display:prepare("Rhit")
			end
			audio.play(Soundd)
			Player.Display:play()
			Player.State=3
			ComboCounter=0
			ComboText.text=""
			ComboTextText.alpha=0
			Enemy[q].AttackHitTimer=timer.performWithDelay(Enemy[q].AttackTime/2, PlayerStand)
			CurrentEnemy=q
			ShowHealth()
		end
	end
end

function EnemyCheckForAttack()
	if BossDead==0 then
		if Player.State~=2 and Player.State~=4 then
			for p=1,#Enemy,1 do
				if Enemy[p].State~=4 and Enemy[p].State~=2 and Enemy[p].State~=3 then
					if Player.Display.y >= Enemy[p].y-40 and Player.Display.y <= Enemy[p].y+40 and (Player.Display.x >= Enemy[p].x and Player.Display.x <= Enemy[p].x+75 and Enemy[p].Direction==0) or (Player.Display.x <= Enemy[p].x and Player.Display.x >= Enemy[p].x-75 and Enemy[p].Direction==1) then
						if Enemy[p].Tran then
							transition.cancel(Enemy[p].Tran)
						end
						if Enemy[p].AttackTimer then
							timer.cancel(Enemy[p].AttackTimer)
						end
						if Player.Display.x >= Enemy[p].x and Player.Display.x <= Enemy[p].x+75 and Enemy[p].Direction==0 then
							Enemy[p]:prepare("Rattack")
							EnemySide=Player.Display.x-30-(Enemy[p].Xsize/2)
						elseif Player.Display.x <= Enemy[p].x and Player.Display.x >= Enemy[p].x-75 and Enemy[p].Direction==1 then
							Enemy[p]:prepare("Lattack")
							EnemySide=Player.Display.x+30+(Enemy[p].Xsize/2)
						end
						Enemy[p].state=2
						Enemy[p]:play()
						function CallStandEnemyAfterAttack()
							StandEnemy(p)
						end
						Enemy[p].Tran=transition.to( Enemy[p], {x=EnemySide, y=Player.Display.y-(Enemy[p].Ysize/2)+35, time = Enemy[p].AttackTime ,onComplete = CallStandEnemyAfterAttack} )
						function EnemyHitWithVar ()
							EnemyHit(p)
						end
						Enemy[p].AttackTimer=timer.performWithDelay(Enemy[p].AttackTime/2, EnemyHitWithVar)
					end
				end
			end
		end
	end
end

storyboard.gotoScene( "Start" )

