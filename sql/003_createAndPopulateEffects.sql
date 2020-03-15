DROP TABLE IF EXISTS effects;
CREATE TABLE effects (
	id INT NOT NULL,
	name VARCHAR(30) NOT NULL,
	desc1 VARCHAR(100),
	desc2 VARCHAR(100),
	PRIMARY KEY (id)
);

INSERT INTO effects (id,name,desc1,desc2) VALUES 
(0,'No Effect',NULL,NULL)
,(1,'Deal Physical Damage','Damage Modifier',NULL)
,(2,'Deal Magic Damage','Damage Modifier',NULL)
,(5,'Deal Damage (%)','Amount (%)',NULL)
,(11,'Inflitct Seal','Success Rate (%)','(Optional) Duration')
,(12,'Inflict Mute','Success Rate (%)','(Optional) Duration')
,(13,'Inflict Blind','Success Rate (%)','(Optional) Duration')
,(14,'Inflict Sleep','Success Rate (%)','(Optional) Duration')
,(15,'Inflict Burn','Success Rate (%)','(Optional) Duration')
,(16,'Inflict Freeze','Success Rate (%)','(Optional) Duration')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(17,'Inflict Petrify','Success Rate (%)','(Optional) Duration')
,(18,'Inflict Faint','Success Rate (%)','(Optional) Duration')
,(19,'Inflict Confuse','Success Rate (%)','(Optional) Duration')
,(20,'Inflict KO','Success Rate (%)',NULL)
,(21,'Inflict Nightmare','Success Rate (%)','(Optional) Duration')
,(22,'Delay Target','Success Rate (%)','Delay Amount')
,(26,'Unbalance Target','Success Chance',NULL)
,(30,'Reduce STR','Amount (%)','(Optional) Duration')
,(31,'Reduce DEF','Amount (%)','(Optional) Duration')
,(32,'Reduce ATS','Amount (%)','(Optional) Duration')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(33,'Reduce ADF','Amount (%)','(Optional) Duration')
,(34,'Reduce Speed','Amount (%)','(Optional) Duration')
,(35,'Reduce MOV','Amount (%)','(Optional) Duration')
,(40,'Inflict Random Affliction','Success Rate (%)','(Optional) Duration')
,(44,'Inflict Random Status','Amount (%)','(Optional) Duration')
,(65,'Increase STR','Amount (%)','(Optional) Duration')
,(66,'Increase DEF','Amount (%)','(Optional) Duration')
,(67,'Increase ATS','Amount (%)','(Optional) Duration')
,(68,'Increase ADF','Amount (%)','(Optional) Duration')
,(69,'Increase SPD','Amount (%)','(Optional) Duration')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(70,'Increase MOV','Amount (%)','(Optional) Duration')
,(71,'Grant Insight',NULL,'(Optional) Duration')
,(72,'Cure Status',NULL,NULL)
,(73,'Cure Stat Down',NULL,NULL)
,(74,'Cure Status + Stat Down',NULL,NULL)
,(76,'Inflict Burn + Faint','Success Rate (%)','(Optional) Duration')
,(77,'Increase STR/DEF + Insight','Amount (%)','(Optional) Duration')
,(78,'Decrease ATS/ADF','Amount (%)','(Optional) Duration')
,(79,'Inflict Burn + Confuse','Success Rate (%)','(Optional) Duration')
,(80,'Increase STR/SPD','Amount (%)','(Optional) Duration')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(81,'Gain 2 Turns',NULL,NULL)
,(82,'Increase STR/DEF','Amount (%)','(Optional) Duration')
,(101,'Restore EP','Amount',NULL)
,(102,'Restore CP','Amount',NULL)
,(103,'Restore HP (%)','Amount (%)',NULL)
,(104,'Restore EP (%)','Amount (%)',NULL)
,(107,'Revive + Heal (%)','Amount (%)',NULL)
,(108,'Heal','Potency',NULL)
,(112,'Drain HP','Potency',NULL)
,(113,'HP Regen (%)','Amount (%)','(Optional) Duration')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(115,'CP Regen','Amount/Turn (x2)','(Optional) Duration')
,(116,'Revive + Heal','Potency',NULL)
,(131,'Increase ATS/SPD','Amount (%)','(Optional) Duration')
,(150,'Grant Physical Immunity','Number of Times',NULL)
,(151,'Grant Magic Reflect','Number of Times',NULL)
,(201,'Accelerate',NULL,NULL)
,(203,'Analyze Target',NULL,NULL)
,(217,'Damage + Impede','Damage Multiplier','Success Rate (%)')
,(218,'Magic Damage + Sleep','Damage Multiplier','Success Rate (%)')
,(219,'Damage + Seal','Damage Multiplier','Success Rate (%)')
;
INSERT INTO effects (id,name,desc1,desc2) VALUES 
(220,'Damage + Faint','Damage Multiplier','Success Rate (%)')
,(221,'Damage + Reduce MOV','Damage Multiplier','Amount (%)')
,(222,'Random Effect',NULL,NULL)
,(223,'Damage + Nightmare','Damage Multiplier','Success Rate (%)')
;

DROP PROCEDURE IF EXISTS getEffects;
DROP PROCEDURE IF EXISTS getEffect;
DELIMITER //

CREATE PROCEDURE getEffects()
BEGIN
	SELECT * FROM effects;
END //

CREATE PROCEDURE getEffect(IN idIn int)
BEGIN
	SELECT * FROM effects WHERE id = idIn;
END //

DELIMITER ;
