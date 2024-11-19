
function scrClient()
{
	var type = async_load[? "type"]
	var buff = async_load[? "buffer"]

	switch(type) {
		case network_type_data:
			var Size = async_load[? "size"]
			var Buffer=buffer_read(buff, buffer_text)
			var Hello=json_parse(Buffer)
		
			switch Hello.Type
			{
				
				case "Monster":
				//instance_destroy(obEnemy)
				//with obEnemy
				{
					//if Hello.iD!=Type
					{
						var Create=instance_create_depth(Hello.xx, Hello.yy, -5, obEnemy)
						Create.Monster=Hello.MonsterType
						Create.Type=Hello.iD
					}
				}
				
				break
				
				case "SyncMonster":
				with obEnemy
				{
					if Type=Hello.MonsterType
					{
						myX=Hello.MonsterX
						myY=Hello.MonsterY
						//x=Hello.MonsterX
						//y=Hello.MonsterY
					}
					
				}
				break
				
				case "AlreadyIn":
				show_message_async("Account Already Logged-in")
				break
				case "Wrong":
				show_message_async("Wrong Password")
				break;
				case "AlreadyExists":
				show_message_async("User Already Exists")
				break
				case "Complete":
				show_message_async("Register Complete")
				break
				
				case "Login":
				room_goto(roStart)
				
				globalvar Name;
				Name=Hello.Name
				
				var Struct = {
					Type: "Stalk",
				}

				scrSend(Struct)
				
				break
				
				case "NoUser":
				show_message_async("User Doesn't Exists")
				break
				case "Spear":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						var iD=instance_create_depth(x, y-65, depth-10, obSpear)
						iD.image_xscale=image_xscale
					}
				}
				with obPlayer
				{
					if clientiD=Hello.iD
					{
						var iD=instance_create_depth(x, y-65, depth-10, obSpear)
						iD.image_xscale=image_xscale
						
					}
				}
				break
				case "Health":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						Health=Hello.Healthy
						
						instance_create_depth(x, y, depth-10, obBlood)
						audio_play_sound(fxHurt, 1, 0)
						
						sprite_index=Hurt
						image_index=0
						Attacking=1
						
						hspeed=Hello.Push
					}
				}
				
				with obPlayer
				{
					if clientiD=Hello.iD
					{
						Health=Hello.Healthy
						
						instance_create_depth(x, y, depth-10, obBlood)
						audio_play_sound(fxHurt, 1, 0)
						
						sprite_index=Hurt
						image_index=0
						Attacking=1
						
						hspeed=Hello.Push
					}
				}
				break
				case "Attacker":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						sprite_index=asset_get_index(Hello.Asset)
						image_index=0
						Attacking=1
					}
				}
				break
				case "Stalk":
				clientiD=Hello.iD
				
				if room=roStart
				{
					var xStart=Hello.xPos
					var yStart=Hello.yPos
				}
				instance_destroy(obEnemy)
				
				var iD=instance_create_depth(xStart, yStart, 0, obPlayer)
				iD.playeriD=clientiD
				iD.Health=Hello.Health
				
				break
			
				case "Movie":
				with obPlayer
				{
					//moveX=Hello.XX
					//x=Hello.XX
				}
				break
				
				case "Movie2":
				with obPlayer
				{
					//moveY=Hello.YY
					//y=Hello.YY
				}
				break
			
				case "iD":
				var xPosition=Hello.xPos
				var yPosition=Hello.yPos
			
				var iD=instance_create_depth(xPosition, yPosition, 0, obOther)
				iD.OtheriD=Hello.iD
				iD.Nom=Hello.Nom
				iD.Health=Hello.Health
				
				//show_message_async("lol")
				break
			
				case "otheriD1":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						MoveType=Hello.Mov
					}
				}
				break
				
				case "otheriD":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						MoveType2=Hello.Mov
					}
				}
				break
			
				case "otheriD2":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						MoveType=Hello.Mov
					}
				}
				break
				
				case "StopMove":
				with obOther
				{
					if OtheriD=Hello.iD and !Attacking
					{
						sprite_index=Stand
					}
				}
				break
				
				case "Ping":
				Ping=abs(Hello.Time-current_time)
				break
				
				case "Delete":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						instance_destroy()
					}
				}
				break
				
				case "SyncX":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						x=Hello.xPos
					}
				}
				with obPlayer
				{
					if clientiD=Hello.iD
					{
						x=Hello.xPos
					}
				}
				break
				
				case "SyncY":
				with obOther
				{
					if OtheriD=Hello.iD
					{
						y=Hello.yPos
					}
				}
				with obPlayer
				{
					if clientiD=Hello.iD
					{
						y=Hello.yPos
					}
				}
				break
			}
	
		break
	
	}
	
}