INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,0,0,'Attack','Attack','AniBtlAttack','EBDN',65533,1,1,0,1,1,1,1,100,0,0,0,0,0,20,0,0,0)
,(1,1,1,'Move','Move','AniBtlMove','0',65533,3,0,0,20,0,1,0,0,0,0,0,0,0,15,0,255,0)
,(1,2,2,'Counter','Counter','AniBtlCounter','EBID',65533,2,0,0,30,1,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,3,3,'Item','Item','AniBtlItem','0',65533,4,0,0,0,1,1,0,0,0,0,0,0,0,20,0,255,0)
,(1,4,4,'Penalty','When you can''t act due to status','0','0',65533,5,0,0,0,1,1,0,0,0,0,0,0,0,20,0,255,0)
,(1,5,5,'Flee','Flee','0','0',65533,7,0,0,0,1,1,0,0,0,0,0,0,0,20,0,255,0)
,(1,6,6,'Triple Advantage','Triple Advantage Damage','0','EBI',65533,8,0,0,12,100,100,1,100,0,0,0,0,0,0,0,255,0)
,(1,20,0,'Needle Shoot','[#32IAttack - One -  Petrify (20%)]
Launches a sharply pointed boulder at an enemy.','AniBtlArtsEarth00','EBIQ',65533,20,1,1,30,100,1,2,180,0,17,20,0,5,20,20,255,0)
,(1,21,1,'Earth Lance','[#32IAttack (Set) - Area (S) - Petrify (20%)]
Summons lances of earth from below the ground.','AniBtlArtsEarth01','EBIQ',65533,20,1,1,32,100,4,2,210,0,17,20,0,7,20,60,255,0)
,(1,22,2,'Grand Press','[#32IAttack (Set) - Area (M) - MOV-50%]
Creates a localized earthquake below enemies.','AniBtlArtsEarth02','EBIQ',65533,20,1,1,32,100,6,2,270,0,35,50,0,10,25,120,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,23,3,'Yggdrasil','[#32IAttack (Set) - Area (L) - Petrify (30%)]
Summons a sentient tree to skewer enemies.','AniBtlArtsEarth03','EBIQ',65533,20,1,1,32,100,8,2,330,0,17,30,0,15,25,240,255,0)
,(1,24,4,'Ancient Glyph','[#32IAttack (Set) - Area (XL) - Petrify (20%)]
Summons a megalith high above, then drops it.','AniBtlArtsEarth04','EBIQ',65533,20,1,1,32,100,12,2,360,0,17,20,0,20,30,360,255,0)
,(1,25,5,'Earth Pulse','[#32IRecovery - One - HP Regen]
Stimulates healing. Heals 30% HP for 4 turns.','AniBtlArtsEarth05','PMBIQ',65533,20,4,1,30,100,1,113,30,0,0,0,0,5,20,30,255,0)
,(1,26,6,'Crest','[#32ISupport - One - DEF+25% (4 turns)]
Temporarily grants earth''s protection to raise defense.','AniBtlArtsEarth06','PMBIQ',65533,20,4,1,30,100,1,66,25,0,0,0,0,5,20,30,255,0)
,(1,27,7,'La Crest','[#32ISupport - Area (M) - DEF+25% (4 turns)]
Temporarily grants earth''s protection to raise defense.','AniBtlArtsEarth07','PMBIQ',65533,20,4,1,31,100,6,66,25,0,0,0,0,5,20,60,255,0)
,(1,28,8,'Adamantine Shield','[#32ISupport - Area (M) - Physical Immunity]
A shield protects targets from one physical attack.','AniBtlArtsEarth08','PMBIQ',65533,20,4,1,31,100,6,150,1,0,0,0,0,10,20,200,255,0)
,(1,35,15,'Aqua Bleed','[#33IAttack - One]
Strikes an enemy with a heavy mass of water.','AniBtlArtsWater00','EBIQ',65533,20,1,2,30,100,1,2,180,0,0,0,0,5,20,20,255,0)
,(1,36,16,'Frost Edge','[#33IAttack - Area (M) - Freeze (20%)]
Attacks enemies with blades of crystallized ice.','AniBtlArtsWater01','EBIQ',65533,20,1,2,31,100,6,2,215,0,16,20,0,7,20,60,255,0)
,(1,37,17,'Hydro Cannon','[#33IAttack (Set) - Line (M)]
Strikes with a high-pressure water current.','AniBtlArtsWater02','EBIQ',65533,20,1,2,11,100,3,2,275,0,0,0,0,10,25,110,255,0)
,(1,38,18,'Crystal Flood','[#33IAttack (Set) - Line (L) - Freeze (30%)]
Creates a glistening river of ice.','AniBtlArtsWater03','EBIQ',65533,20,1,2,11,100,6,2,335,0,16,30,0,15,25,220,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,39,19,'Maelstrom','[#33IAttack - All]
Creates a powerful whirlpool. ','AniBtlArtsWater04','EBIQ',65533,20,1,2,12,100,100,2,365,0,0,0,0,20,30,350,255,0)
,(1,40,20,'Tear','[#33IRecovery - One - HP Heal (S)]
Heals a small amount of HP with the power of water.','AniBtlArtsWater05','PMBCIQ',65533,20,3,2,30,100,1,108,300,10,0,0,0,3,20,20,255,0)
,(1,41,21,'Teara','[#33IRecovery - One - HP Heal (M)]
Heals a medium amount of HP with the power of water.','AniBtlArtsWater06','PMBCIQ',65533,20,3,2,30,100,1,108,600,10,0,0,0,4,20,60,255,0)
,(1,42,21,'Tearal','[#33IRecovery - One - HP Heal (L)]
Heals a large amount of HP with the power of water.','AniBtlArtsWater07','PMBCIQ',65533,20,3,2,30,100,1,108,1200,10,0,0,0,6,25,120,255,0)
,(1,43,22,'Thelas','[#33IRecovery - One - Revive & HP Heal (S)]
Revives one ally, and heals a small amount of HP.','AniBtlArtsWater08','PMRBCIQ',65533,20,3,2,30,100,1,116,300,10,0,0,0,5,20,50,255,0)
,(1,44,23,'Athelas','[#33IRecovery - One - Revive & HP Heal (M)]
Revives one ally, and heals a medium amount of HP.','AniBtlArtsWater09','PMRBCIQ',65533,20,3,2,30,100,1,116,600,10,0,0,0,7,25,150,255,0)
,(1,50,30,'Fire Bolt','[#34IAttack - One - Burn (20%)]
Shoots a blazing orb of fire at an enemy.','AniBtlArtsFire00','EBIQ',65533,20,1,3,30,100,1,2,180,0,15,20,0,5,20,20,255,0)
,(1,51,31,'Heatwave','[#34IAttack - Area (S) - Burn (30%)]
Covers the earth''s surface with intense heat.','AniBtlArtsFire01','EBIQ',65533,20,1,3,31,100,4,2,220,0,15,30,0,7,20,50,255,0)
,(1,52,32,'Flame Tongue','[#34IAttack - Area (M) - Burn (20%)]
Flames erupt from the ground, skewering enemies.','AniBtlArtsFire02','EBIQ',65533,20,1,3,31,100,6,2,280,0,15,20,0,10,25,120,255,0)
,(1,53,33,'Volcanic Rain','[#34IAttack - Area (L) - Burn (30%)]
Causes incandescent volcanic bombs to rain from the sky.','AniBtlArtsFire03','EBIQ',65533,20,1,3,31,100,8,2,310,0,15,30,0,15,25,180,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,54,34,'Flare Bomb','[#34IAttack - Area (XL) - Burn (20%)]
Two flames collide, causing a great explosion.','AniBtlArtsFire04','EBIQ',65533,20,1,3,31,100,12,2,340,0,15,20,0,20,25,240,255,0)
,(1,55,34,'Purgatorial Flame','[#34IAttack - Area (S) - Burn (50%)]
Summons the flames of Gehenna to reduce enemies to ash.','AniBtlArtsFire05','EBIQ',65533,20,1,3,31,100,4,2,450,0,15,50,0,25,30,400,255,0)
,(1,56,35,'Impassion','[#34IRecovery - One - CP Regen]
Raises spirit. Restores 20CP for 4 turns.','AniBtlArtsFire06','PMBIQ',65533,20,4,3,30,100,1,115,10,0,0,0,0,5,20,40,255,0)
,(1,59,36,'Heat Up','[#34IRecovery - Area (L) - Cures status down - CP+5]
Cures status down, and restores 5CP.','AniBtlArtsFire09','PMBIQ',65533,20,4,3,31,100,8,73,0,0,102,5,0,5,20,50,255,0)
,(1,57,37,'Forte','[#34ISupport - One - STR+25% (4 turns)]
Temporarily grants fire''s blessing to raise attack.','AniBtlArtsFire07','PMBIQ',65533,20,4,3,30,100,1,65,25,0,0,0,0,5,20,30,255,0)
,(1,58,38,'La Forte','[#34ISupport - Area (M) - STR+25% (4 turns)]
Temporarily grants fire''s blessing to raise attack.','AniBtlArtsFire08','PMBIQ',65533,20,4,3,31,100,6,65,25,0,0,0,0,5,20,60,255,0)
,(1,65,45,'Air Strike','[#35IAttack - One]
Attacks an enemy with a mass of compressed air.','AniBtlArtsWind00','EBIQ',65533,20,1,4,30,100,1,2,180,0,0,0,0,4,20,20,255,0)
,(1,66,46,'Spark Arrow','[#35IAttack (Set) - Line (S) - Seal (20%)]
Unleashes a line of lightning towards enemies.','AniBtlArtsWind01','EBIQ',65533,20,1,4,11,100,2,2,210,0,11,20,0,6,20,50,255,0)
,(1,67,47,'Aerial','[#35IAttack (Set) - Area (L)]
Creates a whirlwind containing pieces of rubble.','AniBtlArtsWind02','EBIQ',65533,20,1,4,32,100,8,2,270,0,0,0,0,9,25,120,255,0)
,(1,68,48,'Judgment Bolt','[#35IAttack (Set) - Line (M) - Seal (50%)]
Brings down judgment upon foes with lightning.','AniBtlArtsWind03','EBIQ',65533,20,1,4,11,100,3,2,330,0,11,50,0,14,25,220,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,69,49,'Ragna Vortex','[#35IAttack - All - Seal (30%)]
Swallows up enemies with a lightning-imbued whirlwind.','AniBtlArtsWind04','EBIQ',65533,20,1,4,12,100,100,2,360,0,11,30,0,18,30,360,255,0)
,(1,70,50,'Breath','[#35IRecovery - Area (M) - HP Heal (S)]
Heals allies in an area with purifying breath.','AniBtlArtsWind05','PMBCIQ',65533,20,3,4,31,100,6,108,250,10,0,0,0,5,20,40,255,0)
,(1,71,51,'Holy Breath','[#35IRecovery - Area (L) - HP Heal (M)]
Heals allies in an area with purifying sacred breath.','AniBtlArtsWind06','PMBCIQ',65533,20,3,4,31,100,8,108,550,10,0,0,0,7,25,120,255,0)
,(1,72,52,'Recuria','[#35IRecovery - Area (XL) - Cures abnormal status]
Cures abnormal status (except K.O.)','AniBtlArtsWind07','PMBIQ',65533,20,4,4,31,100,12,72,0,0,0,0,0,5,20,50,255,0)
,(1,80,60,'Soul Blur','[#36IAttack - One - Faint (30%)]
Emits a spacetime-shaking pulse.','AniBtlArtsTime00','EBIQ',65533,20,1,5,30,100,1,2,200,0,18,30,0,7,7,30,255,0)
,(1,81,61,'Demonic Scythe','[#36IAttack - Area (M) - K.O. (30%)]
Steals foes'' souls with the Grim Reaper''s scythe.','AniBtlArtsTime01','EBIQ',65533,20,1,5,31,100,6,2,240,0,20,30,0,10,10,100,255,0)
,(1,82,62,'Grim Butterfly','[#36IAttack - Area (XL) - Nightmare (50%)]
A swarm of butterflies plunges enemies into despair.','AniBtlArtsTime02','EBIQ',65533,20,1,5,31,100,12,2,310,0,21,50,0,20,15,200,255,0)
,(1,83,63,'Shadow Blade','[#36IAttack - Area (L) - HP Absorb]
A demonic blade. Absorb 5% of damage dealt as HP.','AniBtlArtsTime03','EBIQ',65533,20,1,5,31,100,8,112,410,5,0,0,0,30,30,400,255,0)
,(1,84,64,'Chrono Drive','[#36ISupport - Area (M) - SPD+25%/MOV+50% (4 turns)]
Speeds up the flow of time for targeted allies.','AniBtlArtsTime04','PMBIQ',65533,20,4,5,31,100,6,69,25,0,70,50,0,5,20,20,255,0)
,(1,85,65,'Chrono Break','[#36ISupport - Area (M) - SPD-25% - Delay+15]
Slows down the flow of time for targeted enemies.','AniBtlArtsTime05','EBIQ',65533,20,2,5,31,100,6,22,100,15,34,25,0,5,20,50,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,86,66,'Chrono Burst','[#36ISupport - Self - Act twice in succession]
Alters the laws of time, allowing the user to act twice more.','AniBtlArtsTime06','MBIQ',65533,20,4,5,30,0,1,81,0,0,0,0,0,0,0,200,255,0)
,(1,95,75,'Golden Sphere','[#37IAttack (Set) - Area (S) - Blind (30%)]
Attacks enemies with golden magic orbs.','AniBtlArtsGold00','EBIQ',65533,20,1,6,32,100,4,2,170,0,13,30,0,7,20,30,255,0)
,(1,96,76,'Dark Matter','[#37IAttack (Set) - Area (L) - Suction - MOV-50%]
Draws in and compresses enemies.','AniBtlArtsGold01','EBIQ',65533,20,1,6,32,100,8,2,250,0,35,50,0,10,25,100,255,0)
,(1,97,77,'Cross Crusade','[#37IAttack - All]
A cross-shaped void bathes all in holy light.','AniBtlArtsGold02','EBIQ',65533,20,1,6,12,100,100,2,320,0,0,0,0,15,25,200,255,0)
,(1,98,78,'Altair Cannon','[#37IAttack - All - ATS/ADF-25%]
Blasts of light fall from above.','AniBtlArtsGold03','EBIQ',65533,20,1,6,12,100,100,2,400,0,78,25,0,30,30,400,255,0)
,(1,99,79,'Fortuna','[#37ISupport - Area (M) - ATS/ADF+25% (4 turns)]
Grants light''s clarity to raise ATS/ADF.','AniBtlArtsGold04','PMBIQ',65533,20,4,6,31,100,6,67,25,0,68,25,0,5,20,30,255,0)
,(1,100,80,'Shining','[#37ISupport - One - Insight]
Grants insight status for 4 turns.','AniBtlArtsGold05','PMBIQ',65533,20,4,6,30,100,1,71,0,0,0,0,0,5,20,50,255,0)
,(1,101,81,'Seraphic Ring','[#37IRecovery - All - Cures K.O. - HP Heal (Full) - HP Regen]
Fully heals, and heals 30% HP for 4 turns.','AniBtlArtsGold06','PMRBCIQ',65533,20,3,6,12,100,100,107,100,0,113,30,0,10,20,400,255,0)
,(1,110,90,'Luminous Ray','[#38IAttack (Set) - Line (S)]
Unleashes a beam of lunar light.','AniBtlArtsSilver00','EBIQ',65533,20,1,7,11,100,2,2,170,0,0,0,0,7,20,30,255,0)
,(1,111,91,'Silver Thorn','[#38IAttack - Area (M) - Confuse (40%)]
Blades of condensed insanity rain from above.','AniBtlArtsSilver01','EBIQ',65533,20,1,7,31,100,6,2,240,0,19,40,0,10,25,100,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,112,92,'Phantom Phobia','[#38IAttack - Area (XL) - Status down (random)]
Terrifies enemies with an illusion of death.','AniBtlArtsSilver02','EBIQ',65533,20,1,7,31,100,12,2,300,0,44,25,0,15,25,200,255,0)
,(1,113,93,'Claiomh Solarion','[#38IAttack - All]
Annihilates all with a beam of condensed magical energy.','AniBtlArtsSilver03','EBIQ',65533,20,1,7,12,100,100,2,420,0,0,0,0,30,30,420,255,0)
,(1,114,94,'Analyze','[#38ISupport - One - Analysis]
Analyzes and obtains data on an enemy.','AniBtlArtsSilver04','EBIQ',65533,20,2,7,30,100,1,203,0,0,0,0,0,5,20,10,255,0)
,(1,115,95,'Saintly Force','[#38ISupport - One - STR/DEF+25% (4 turns) - Cures status down]
Buffs an ally with pure radiance.','AniBtlArtsSilver05','PMBIQ',65533,20,4,7,30,100,1,73,0,0,82,25,0,5,20,50,255,0)
,(1,116,96,'Crescent Mirror','[#38ISupport - All - Magic Reflect - ATS+25% (4 turns)]
Reflects one magic attack. Increases ATS by 25%.','AniBtlArtsSilver06','PMBIQ',65533,20,4,7,12,100,100,151,1,0,67,25,0,10,20,150,255,0)
,(1,200,0,'Autumn Leaf Cutter','[Attack (Set) - Area (S) - Impede - Delay+15]
(Class C) Slashes foes while dashing by them. Unbalance+10%.','AniBtlCraft00','EB',0,30,1,0,10,2,4,217,110,100,22,100,15,0,25,20,10,1)
,(1,201,1,'Motivate','[Support - Area (XL/Self) - STR+25% - CP+10]
An encouraging shout to rouse allies to battle.','AniBtlCraft01','PMBI',0,30,4,0,33,0,12,65,25,0,102,10,0,0,30,30,255,5)
,(1,202,2,'Arc Slash','[Attack (Set) - Line (S) - Delay+30]
(Class B) Unleashes an arc-shaped shock wave. Can unbalance.','AniBtlCraft02','EB',0,30,1,0,11,100,2,1,120,0,22,100,30,0,20,30,0,15)
,(1,203,3,'Gale','[Attack - Area (L) - Seal (50%)]
(Class A) Slices up enemies at high speed. Unbalance+20%.','AniBtlCraft03','EB',0,30,1,0,31,100,8,1,130,0,11,50,5,0,25,35,20,35)
,(1,204,4,'Flame Impact','[Attack (Set) - Area (S) - Burn (50%) - Faint (50%)]
(Class S+) A powerful downward slash. Unbalance+30%.','AniBtlCraft04','EB',0,30,1,0,10,1,4,1,150,0,76,50,5,0,30,35,30,55)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,210,5,'Flame Slash','[Attack - Area (M) - Burn (100%)]
(Class SS) Bathes sword in flames and slashes enemies.','AniBtlSCraft00','EBI',0,31,1,0,31,100,6,1,300,0,15,100,0,0,40,100,255,0)
,(1,211,6,'Azure Flame Slash','[Attack - Area (L) - Burn (100%)]
(Class SSS) Bathes sword in blue flames and slashes enemies.','AniBtlSCraft00','EBI',0,31,1,0,31,100,8,1,420,0,15,100,0,0,40,100,255,0)
,(1,220,0,'Flamberge','[Attack - One - Impede - Burn (50%)]
(Class B) Pierces enemy with a burning arrow. Unbalance+20%.','AniBtlCraft00','EBD',1,30,1,0,1,1,1,217,120,100,15,50,0,0,30,20,20,1)
,(1,221,1,'Blessed Arrow','[Recovery (Set) - Area (S) - HP Heal (S) - CP+40]
Fires a blessed arrow into the air, healing allies in an area.','AniBtlCraft01','PBID',1,30,3,0,32,1,4,108,450,10,102,40,0,0,30,40,255,8)
,(1,222,2,'Molten Rain','[Attack (Set) - Area (L)]
(Class C) Rains burning arrows onto enemies. Can unbalance.','AniBtlCraft02','EBD',1,30,1,0,32,1,8,1,100,0,0,0,0,0,30,35,0,24)
,(1,223,3,'Heavenly Gift','[Support (Set) - Area (M) - Insight - CP Regen]
Grants allies insight status and restores 20CP every turn.','AniBtlCraft03','PBID',1,30,4,0,32,1,6,71,0,0,115,10,0,0,30,50,255,52)
,(1,230,4,'Rosetta Arrow','[Magic Attack (Set) - Line (M) - Mute (100%)]
(Class SS) Fires an arrow containing condensed magical energy.','AniBtlSCraft00','EBI',1,31,1,0,11,100,3,2,300,0,12,100,0,0,40,100,255,0)
,(1,231,5,'Judgment Arrow','[Magic Attack (Set) - Line (L) - Mute (100%)]
(Class SS+) Annihilates enemies with an arrow of judgment.','AniBtlSCraft01','EBI',1,31,1,0,11,100,6,2,350,0,12,100,0,0,40,100,255,0)
,(1,240,1,'Resounding Beat','[Support (Set) - Area (M) - DEF+25% - HP Regen]
Boosts the DEF of allies by 25% and heals 30% HP every turn.','AniBtlCraft00','PMBI',2,30,4,0,32,100,6,66,25,0,113,30,0,0,30,20,255,1)
,(1,241,2,'Blue Lullaby','[Magic Attack (Set) - Area (M) - Sleep (30%)]
(Class C) Lulls foes to sleep with soothing sounding bubbles.','AniBtlCraft01','EB',2,30,1,0,10,3,6,2,110,0,14,30,0,0,30,30,255,6)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,242,3,'Holy Song','[Recovery - Area (L/Self) - HP Heal (M) - Cures all bar K.O.]
Purifies allies with a holy song.','AniBtlCraft02','PMBI',2,30,3,0,33,0,8,108,900,10,74,0,0,0,30,30,255,31)
,(1,243,4,'Nocturne Bell','[Magic Attack (Set) - Area (L) - Sleep (50%) Nightmare (30%)]
(Class A) Steals foes'' consciousness with silver bells.','AniBtlCraft03','EB',2,30,1,0,32,100,8,218,130,50,21,30,0,0,30,40,255,57)
,(1,244,0,'Detector','[Support - One - Analysis - Balance Down]
Analyzes an enemy, making it easier to unbalance them.','AniBtlCraft04','EBI',2,30,2,0,30,100,1,26,100,0,203,0,0,0,30,20,255,9)
,(1,250,5,'Seventh Rhapsody','[Magic Attack - Area (XL) - Confuse (100%)]
(Class SS+) Utterly destroys foes with the power of music.','AniBtlSCraft00','EBI',2,31,1,0,31,100,12,2,350,0,19,100,0,0,40,100,255,0)
,(1,260,0,'Armor Breaker','[Attack - One - DEF-25% - Seal (30%)]
(Class A+) Tears the armor from enemies. Unbalance+30%.','AniBtlCraft00','EBD',3,30,1,0,1,1,1,219,135,30,31,25,0,0,30,25,30,1)
,(1,261,1,'Earth Cleaver','[Attack (Set) - Line (M) - MOV-50%]
(Class B) Splits the earth beneath foes'' feet. Unbalance+10%.','AniBtlCraft01','EB',3,30,1,0,11,100,3,1,120,0,35,50,0,0,30,30,10,9)
,(1,262,2,'Brilliant Spin','[Attack (Set) - Area (L) - Suction - Faint (30%)]
(Class S) Draws foes into a vortex of light. Can unbalance.','AniBtlCraft02','EB',3,30,1,0,20,0,8,1,140,0,18,30,0,0,30,45,0,36)
,(1,263,3,'Radiant Wings','[Support - Self - STR/DEF+50% - Insight - ATS/ADF-50%]
Increases physical abilities at the expense of magical ones.','AniBtlCraft03','MBI',3,30,4,0,30,0,1,77,50,3,78,50,3,0,30,30,255,45)
,(1,270,4,'Radiant Dance','[Attack - Area (M)]
(Class SS) Slices up foes with a blade of light.','AniBtlSCraft00','EBI',3,31,1,0,31,100,6,1,330,0,0,0,0,0,40,100,255,0)
,(1,271,5,'Radiant Waltz','[Attack - Area (XL)]
(Class SSS) Cuts up foes with a series of beautiful slashes.','AniBtlSCraft01','EBI',3,31,1,0,31,100,12,1,400,0,0,0,0,0,40,100,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,280,0,'Break Shot','[Attack - One - Impede - DEF-25%]
(Class A) Fires an armor-piercing round. Unbalance+20%.','AniBtlCraft00','EBD',4,30,1,0,1,1,1,217,130,100,31,25,0,0,30,20,20,1)
,(1,281,1,'Energy Shell','[Recovery - Area (M) - HP/EP Heal (25%)]
Launches a special recovery bullet filled with energy.','AniBtlCraft01','PBID',4,30,3,0,2,1,6,103,25,0,104,25,0,0,30,30,255,17)
,(1,282,2,'Petrification Shell','[Attack - Area (L) - Petrify (50%)]
(Class B) Fires a bullet that can petrify. Can unbalance.','AniBtlCraft02','EBD',4,30,1,0,2,1,8,1,120,0,17,50,0,0,30,30,0,34)
,(1,283,3,'Burst Drive','[Support - Area (M) - Accelerate]
Breaks the time barrier, allowing allies to act faster.','AniBtlCraft03','PBID',4,30,4,0,2,1,6,201,0,0,0,0,0,0,30,35,255,57)
,(1,290,4,'Ultimate Shot','[Attack - Area (L) - Random abnormal status]
(Class SS) Fires a bullet of unimaginable power.','AniBtlSCraft00','EBI',4,31,1,0,31,100,8,1,300,0,40,100,0,0,40,100,255,0)
,(1,300,1,'Serene Blessing','[Recovery - One - Cures K.O. - HP Heal (50%) - CP+20]
Heals an ally with the calm of the moon.','AniBtlCraft00','PRBID',5,30,3,0,1,1,1,107,50,0,102,20,0,0,30,30,255,1)
,(1,301,2,'Ethereal Edge','[Magic Attack (Set) - Line (M) - ATS-50%]
(Class B) Releases several magical blades. Unbalance+10%.','AniBtlCraft01','EB',5,30,1,0,11,100,3,2,120,0,32,50,0,0,30,30,10,16)
,(1,302,3,'Crescent Shell','[Support - Area (M) - DEF+50% - Magic Reflect]
Strengthens allies with the crescent moon''s power.','AniBtlCraft02','PBI',5,30,4,0,31,100,6,66,50,0,151,1,0,0,30,30,255,25)
,(1,303,4,'Aster Flare','[Magic Attack - Area (L) - Burn (30%) Confuse (30%)]
(Class A) Muddles an enemy''s cognitive abilities with flame.','AniBtlCraft03','EB',5,30,1,0,31,100,8,2,130,0,79,30,0,0,30,40,255,48)
,(1,304,0,'Detector','[Support - One - Analysis - Balance Down]
Analyzes an enemy, making it easier to unbalance them.','AniBtlCraft04','EBI',5,30,2,0,30,100,1,26,100,0,203,0,0,0,30,20,255,1)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,310,5,'Lord Albireon','[Magic Attack - All]
(Class SSS) Turns all to dust with the light of mighty towers.','AniBtlSCraft00','EBI',5,31,1,0,12,100,100,2,400,0,0,0,0,0,40,100,255,0)
,(1,320,0,'Rapid Thrust','[Attack - One - Impede - Delay+30]
(Class A) A series of three rapid thrusts. Unbalance+20%.','AniBtlCraft00','EBD',6,30,1,0,1,1,1,217,130,100,22,100,30,0,30,20,20,1)
,(1,331,1,'Rune Blade','[Magic Attack - Area (M) - ADF-50%]
(Class B) Cuts enemies in half with a magical slash.','AniBtlCraft01','EB',6,30,1,0,2,3,6,2,120,0,33,50,0,0,30,30,255,16)
,(1,342,2,'Noble Command','[Support - Area (XL/Self) - STR/ATS/SPD+25%]
Raises the morale of allies with an inspiring shout.','AniBtlCraft02','PMBI',6,30,4,0,33,1,12,65,25,0,131,25,0,0,30,25,255,26)
,(1,353,3,'Treasure Sword','[Attack (Set) - Area (M) - Seal (50%) Freeze (50%)]
(Class A) Seals foes in ice, then shatters it. Unbalance+20%.','AniBtlCraft03','EB',6,30,1,0,10,3,6,219,130,50,16,50,0,0,30,40,20,46)
,(1,360,4,'Crystal Saber','[Attack - Area (L)]
(Class SS) Imprisons foes in a barrier, then eliminates them.','AniBtlSCraft00','EBI',6,31,1,0,31,100,8,1,300,0,0,0,0,0,40,100,255,0)
,(1,370,0,'Sweep','[Attack - Area (M) - Impede - SPD-25%]
(Class B) Mows down foes with twin gunswords. Can unbalance.','AniBtlCraft00','EB',7,30,1,0,2,5,6,217,120,100,34,25,0,0,25,30,0,1)
,(1,371,1,'Flash Grenade','[Attack - Area (L) - Blind (30%) Seal (30%)]
(Class D) Throws a grenade which emits bright light.','AniBtlCraft01','EB',7,30,1,0,31,100,8,219,100,30,13,30,0,0,30,35,255,17)
,(1,372,2,'Scud Ripper','[Attack (Set) - Line (S) - Faint (30%) K.O. (30%)]
(Class A) Strikes enemies'' weak points. Unbalance+20%.','AniBtlCraft02','EB',7,30,1,0,11,100,2,220,130,30,20,30,0,0,20,30,20,33)
,(1,373,3,'Bullet Cyclone','[Attack - Area (M) - Seal (50%) - Delay+35]
(Class S+) Dominates foes with rapid attacks. Unbalance+30%.','AniBtlCraft03','EB',7,30,1,0,2,3,6,219,150,50,22,100,35,0,25,40,30,56)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,380,4,'Sylphid Dance','[Attack - Area (XL)]
(Class SS+) Overwhelms foes with a dance of death.','AniBtlSCraft00','EBI',7,31,1,0,31,100,12,1,350,0,0,0,0,0,40,100,255,0)
,(1,390,0,'Gale Stinger','[Attack (Set) - Line (S) - Seal (50%)]
(Class C) Launches a blast of wind forwards. Can unbalance.','AniBtlCraft00','EB',8,30,1,0,11,100,2,1,110,0,11,50,0,0,30,20,0,1)
,(1,391,1,'Turbulence','[Attack - Area (M) - Blind (50%)]
(Class A) Envelops foes in turbulent winds. Unbalance+10%.','AniBtlCraft01','EBD',8,30,1,0,2,1,6,1,130,0,13,50,0,0,30,30,10,14)
,(1,392,2,'Wild Rage','[Support - Self - HP-30% - CP+50]
Cries out with wild anger, trading HP for CP.','AniBtlCraft02','MBI',8,30,4,0,30,0,1,5,30,0,102,50,0,0,30,0,255,25)
,(1,393,3,'Savage Fang','[Attack (Set) - Area (M) - MOV-50% - Delay+35]
(Class S+) Skewers foes with great force. Unbalance+20%.','AniBtlCraft03','EB',8,30,1,0,20,0,6,221,150,50,22,100,35,0,30,40,20,47)
,(1,400,4,'Calamity Hawk','[Attack - Area (L)]
(Class SS+) Descends upon foes with a hawklike aura.','AniBtlSCraft00','EBI',8,31,1,0,31,100,8,1,350,0,0,0,0,0,40,100,255,0)
,(1,410,0,'Buster Arm','[Attack - Area (M) - Impede - Faint (50%)]
(Class B) Airgetlam attacks with great force. Unbalance+20%.','AniBtlCraft00','EBD',9,30,1,0,2,1,6,217,120,100,18,50,0,0,30,30,20,1)
,(1,411,1,'Ultimate Barrier','[Support - Self - Physical Immunity]
Creates a silver barrier, granting immunity to one attack.','AniBtlCraft01','MBI',9,30,4,0,30,0,1,150,1,0,0,0,0,0,30,20,255,1)
,(1,412,2,'Riot Beam','[Attack (Set) - Line (M) - STR-25%]
(Class A) Airgetlam fires a beam of light.','AniBtlCraft02','EB',9,30,1,0,11,100,3,1,130,0,30,25,0,0,30,30,255,42)
,(1,413,3,'Megaton Press','[Attack - Area (L) - Faint (70%) - Delay+40]
(Class S) Airgetlam crushes foes as a sphere. Unbalance+30%.','AniBtlCraft03','EB',9,30,1,0,31,100,8,220,140,70,22,100,40,0,30,40,30,55)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,420,4,'Gigant Breaker','[Attack - All]
(Class SSS) Turns Airgetlam into a hammer and strikes foes.','AniBtlSCraft00','EBI',9,31,1,0,12,100,100,1,400,0,0,0,0,0,40,100,255,0)
,(1,430,0,'Rapid Volley','[Attack (Set) - Area (M) - Delay+15]
(Class C) Fires a series of rapid shots. Can unbalance.','AniBtlCraft00','EBD',10,30,1,0,10,1,6,1,110,0,22,100,15,0,30,20,0,1)
,(1,431,1,'Freezing Bullet','[Magic Attack (Set) - Area (M) - Freeze (50%)]
(Class C) Fires a magical bullet imbued with the power of ice.','AniBtlCraft01','EBD',10,30,1,0,10,1,6,2,110,0,16,50,0,0,30,30,255,1)
,(1,432,2,'Wild Card','[Support - One - Random effect on ally or enemy]
Draws a card, leaving everything to chance. What will happen?','AniBtlCraft02','PEB',10,30,2,0,12,100,100,222,0,0,0,0,0,0,30,5,255,42)
,(1,433,3,'Chaos Trigger','[Attack (Set) - Line (M) - Confuse (50%) Nightmare (50%)]
(Class S) Fires a bullet of pure insanity. Can unbalance.','AniBtlCraft03','EB',10,30,1,0,11,100,3,223,140,50,19,50,0,0,30,45,0,54)
,(1,440,4,'Cross Raven','[Attack (Set) - Area (XL)]
(Class SSS) Wildly fires bullets which all hit at once.','AniBtlSCraft00','EBI',10,31,1,0,32,100,12,1,400,0,0,0,0,0,40,100,255,0)
,(1,450,0,'Thundering Roar','[Attack - Area (L) - Seal (90%) - SPD-25%]
(Class B) Attacks with bullets and lightning. Unbalance+10%.','AniBtlCraft00','EB',11,30,1,0,2,5,8,219,120,90,34,25,0,0,30,30,10,1)
,(1,451,1,'Lightning Charge','[Support - Self - STR/SPD+50% - Insight]
Raises physical abilities with a war cry.','AniBtlCraft01','MBI',11,30,4,0,30,0,1,80,50,3,71,0,3,0,30,30,255,1)
,(1,452,2,'Flash','[Attack (Set) - Area (M) - Seal (30%) - Delay+30]
(Class S) Overtakes foes like a lightning bolt. Unbalance+30%. ','AniBtlCraft02','EB',11,30,1,0,10,3,6,219,140,30,22,100,30,0,30,40,30,1)
,(1,460,3,'Plasma Storm','[Attack - All - Faint (100%)]
(Class SSS+) Races across the battlefield, dominating foes.','AniBtlSCraft00','EBI',11,31,1,0,12,100,100,1,500,0,18,100,0,0,40,100,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,470,0,'Laser Bullet','[Attack (Set) - Line (S) - Impede - Delay+20]
(Class C) A kick that releases a shock wave. Unbalance+10%.','AniBtlCraft00','EB',12,30,1,0,11,100,2,217,110,100,22,100,20,0,30,20,10,1)
,(1,471,1,'Zero Impact','[Attack - One - Faint (90%)]
(Class S) A blast of energy from close range. Unbalance+50%.','AniBtlCraft01','EBD',12,30,1,0,1,1,1,1,140,0,18,90,0,0,30,30,50,1)
,(1,472,2,'Dragon Boost','[Support - Self - STR/DEF+50%]
Strengthens the body through an explosion of energy.','AniBtlCraft02','MBI',12,30,4,0,30,0,1,65,50,3,66,50,3,0,30,30,255,1)
,(1,480,3,'Dragon Kick','[Attack - Area (L)]
(Class SS+) An explosive dragon kick from above.','AniBtlSCraft00','EBI',12,31,1,0,2,100,8,1,350,0,0,0,0,0,40,100,255,0)
,(1,500,0,'Assist','Assist','AniBtlLinkChase','EBI',65533,11,1,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,501,1,'Rush','Rush','AniBtlLinkRush','EBI',65533,11,1,0,31,100,6,1,100,0,0,0,0,0,0,0,255,0)
,(1,502,2,'Rush 2','Increases the power of Rush.','AniBtlLinkRush','EBI',65533,11,1,0,31,100,6,1,130,0,0,0,0,0,0,0,255,0)
,(1,503,3,'Burst','Burst','AniBtlLinkBurst','EBI',65533,11,1,0,12,100,100,1,100,0,0,0,0,0,0,0,255,0)
,(1,510,4,'Finishing Blow','Finishing Blow','AniBtlLinkLastAttack','EBI',65533,11,1,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,520,5,'Cover','Sometimes defends partner from an attack, halving damage.','AniBtlLinkProtect','PBI',65533,10,4,0,1,1,1,0,0,0,0,0,0,0,0,0,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,521,6,'Auto-Tear','Sometimes heals partner''s HP when they are attacked.','AniBtlLinkFirstAid','PBI',65533,10,3,0,30,100,1,103,20,0,0,0,0,0,0,0,255,0)
,(1,522,7,'Counterattack','Sometimes counterattacks foe when partner is attacked.','AniBtlLinkCounter','EBI',65533,10,1,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,530,8,'Powerful Strike','Increases Finishing Blow''s power and activation frequency.','AniBtlLinkUtmostAttack','EBI',65533,10,1,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,531,9,'Cheer','Sometimes encourages partner when they are attacked. CP+50.','AniBtlLinkLivelyYell','PBI',65533,10,3,0,30,100,1,103,25,0,102,50,0,0,0,0,255,0)
,(1,532,10,'Arts Support','Sometimes increases the power of partner''s arts by 1.2x.','AniBtlLinkBoostArts','PBI',65533,10,4,0,30,100,1,0,0,0,0,0,0,0,0,0,255,0)
,(1,533,11,'Vengeance','Sometimes counters with a critical when partner is attacked.','AniBtlLinkRageCounter','EBI',65533,10,1,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,534,12,'Auto-Charge','Sometimes restores partner''s EP after they use arts.','AniBtlLinkQuickCharge','PBI',65533,10,3,0,30,100,1,101,100,0,0,0,0,0,0,0,255,0)
,(1,535,13,'Auto-Curia','Sometimes cures a partner''s abnormal status or status down.','AniBtlLinkQuickCure','PBI',65533,10,3,0,30,100,1,103,25,0,74,0,0,0,0,0,255,0)
,(1,536,14,'Deadly Assist','Assist attacks deal critical damage and cause delay+20.','AniBtlLinkMomentChase','EBI',65533,10,1,0,30,100,1,1,100,0,22,100,20,0,0,0,255,0)
,(1,537,15,'Protective Wall','Sometimes protects partner, reducing incoming damage by 90%.','AniBtlLinkSolidGuard','PBI',65533,10,4,0,1,1,1,0,0,0,0,0,0,0,0,0,255,0)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,7,0,'Attack','The Ashen Knight''s basic attack.','AniBtlAttack','EBI',65533,1,0,0,30,100,1,1,100,0,0,0,0,0,20,0,0,0)
,(1,8,2,'Counter','Counter','AniBtlCounter','EBI',65533,2,0,0,30,100,1,1,100,0,0,0,0,0,0,0,255,0)
,(1,550,2,'Assist','Assist (1.2x damage)','AniBtlLinkChase','EBI',65533,11,0,0,30,100,1,1,120,0,0,0,0,0,0,0,255,0)
,(1,551,1,'Spirit','[Support - Self - Consumes #4C500#0CEP, Heals 50% HP/CP+50]','AniBtlSinki','PMBI',65533,30,3,0,30,0,1,103,50,0,102,50,0,0,30,500,255,5)
,(1,552,1,'Qinggong','[Support - Self - STR/SPD+25%]
Focuses energy, increasing physical capabilities.','AniBtlCraft00','PMBI',65533,30,3,0,30,0,1,80,25,3,0,0,0,0,25,40,255,5)
,(1,553,1,'Morning Moon','[Support - Self - Halves damage - 50% chance to counter]
Counters cause unbalance 100% of the time.','AniBtlCraft01','PMBI',65533,30,0,0,30,0,1,0,0,0,0,0,0,0,70,90,255,5)
,(1,554,5,'Destructive Impact','Charge attack that uses a regular attack (weaponless version)','AniBtlSCraft00','EBI',65533,31,1,0,30,100,1,1,240,0,0,100,0,0,40,100,255,100)
,(1,563,0,'Lustrous Slash','[Attack - 30% chance to unbalance - Can''t guard/counter]
Two slashes in quick succession.','AniBtlCraft12','EBI',65533,30,0,0,34,100,1,1,110,0,0,0,0,0,20,20,30,0)
,(1,564,0,'Flame Impact','[Attack - 50% chance to unbalance - Can''t guard/counter]
A powerful downward slash.','AniBtlCraft13','EBI',65533,30,0,0,34,100,1,1,120,0,0,0,0,0,20,60,50,0)
,(1,565,5,'Enlightened Domination','--','AniBtlSCraft10','EBI',65533,31,1,0,30,100,1,1,250,0,0,100,0,0,40,100,255,100)
;
INSERT INTO magics (project_id,magic_id,sort_id,name,description,animation,label,character_id,category_id,type_id,element_id,target_type_id,target_range,target_size,effect1_id,effect1_data1,effect1_data2,effect2_id,effect2_data1,effect2_data2,cast_delay,recovery_delay,cost,unbalance,level_learn) VALUES 
(1,900,0,'Piercing Strike','[Attack - One - Delay+30]
(Class B) Thrusts sword forwards, piercing a foe.','AniBtlCraft00','EB',65533,30,1,0,1,2,1,1,120,0,22,100,30,0,30,25,255,0)
,(1,901,1,'Soaring Bird','[Attack (Set) - Line (S) - SPD-25%]
(Class C) Releases a bird-shaped shock wave.','AniBtlCraft01','EB',65533,30,1,0,11,100,2,1,110,0,34,25,0,0,25,30,255,0)
;