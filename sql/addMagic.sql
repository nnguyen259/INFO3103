DROP PROCEDURE IF EXISTS addMagic;
DELIMITER //
 
CREATE PROCEDURE addMagic(IN projectIdIn int, IN idIn int, IN sortIdIn int, IN nameIn varchar(255), IN descriptionIn varchar(255), IN animationIn varchar(255), IN labelIn varchar(255), IN chId int, IN categoryId int, IN typeId int, IN elementId int, IN tType int, IN tRange int, IN tSize int, IN e1 int, IN e1d1 int, IN e1d2 int, IN e2 int, IN e2d1 int, IN e2d2 int, IN cDelay int, IN rDelay int, IN costIn int, IN unb int, IN learn int)
BEGIN
    INSERT INTO magics (project_id, magic_id, sort_id, name, description, animation, label, character_id, category_id, type_id, element_id, target_type_id, target_range, target_size, effect1_id, effect1_data1, effect1_data2, effect2_id, effect2_data1, effect2_data2, cast_delay, recovery_delay, cost, unbalance, level_learn)
	VALUES(projectIdIn, idIn, sortIdIn, nameIn, descriptionIn, animationIn, labelIn, chId, categoryId, typeId, elementId, tType, tRange, tSize, e1, e1d1, e1d2, e2, e2d1, e2d2, cDelay, rDelay, costIn, unb, learn);

END //
 
DELIMITER ;