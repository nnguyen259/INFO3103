DROP PROCEDURE IF EXISTS addMagic;
DROP PROCEDURE IF EXISTS editMagic;
DROP PROCEDURE IF EXISTS getMagic;
DROP PROCEDURE IF EXISTS getMagics;
DROP PROCEDURE IF EXISTS deleteMagic;
DROP PROCEDURE IF EXISTS duplicateProject;
DELIMITER //
 
CREATE PROCEDURE addMagic(IN projectIdIn int, IN idIn int, IN sortIdIn int, 
						IN nameIn varchar(255), IN descriptionIn varchar(255), IN animationIn varchar(255), IN labelIn varchar(255), 
						IN chId int, IN categoryId int, IN typeId int, IN elementId int, 
						IN tType int, IN tRange int, IN tSize int, 
						IN e1 int, IN e1d1 int, IN e1d2 int, 
						IN e2 int, IN e2d1 int, IN e2d2 int, 
						IN cDelay int, IN rDelay int, IN costIn int, 
						IN unb int, IN learn int)
BEGIN
    INSERT INTO magics (project_id, magic_id, sort_id, 
    					name, description, animation, label, 
    					character_id, category_id, type_id, element_id, 
    					target_type_id, target_range, target_size, 
    					effect1_id, effect1_data1, effect1_data2, 
    					effect2_id, effect2_data1, effect2_data2, 
    					cast_delay, recovery_delay, cost, 
    					unbalance, level_learn)
	VALUES(projectIdIn, idIn, sortIdIn, 
		nameIn, descriptionIn, animationIn, labelIn, 
		chId, categoryId, typeId, elementId, 
		tType, tRange, tSize, 
		e1, e1d1, e1d2, 
		e2, e2d1, e2d2, 
		cDelay, rDelay, costIn, 
		unb, learn);

END //

CREATE PROCEDURE editMagic(IN projectIdIn int, IN idIn int, IN sortIdIn int, 
						IN nameIn varchar(255), IN descriptionIn varchar(255), IN animationIn varchar(255), IN labelIn varchar(255), 
						IN chId int, IN categoryId int, IN typeId int, IN elementId int, 
						IN tType int, IN tRange int, IN tSize int, 
						IN e1 int, IN e1d1 int, IN e1d2 int, 
						IN e2 int, IN e2d1 int, IN e2d2 int, 
						IN cDelay int, IN rDelay int, IN costIn int, 
						IN unb int, IN learn int)
BEGIN
    UPDATE magics SET sort_id = sortIdIn, 
    					name = nameIn, description = descriptionIn, animation = animationIn, label = labelIn, 
    					character_id = chId, category_id = categoryId, type_id = typeId, element_id = elementId, 
    					target_type_id = tType, target_range = tRange, target_size = tSize, 
    					effect1_id = e1, effect1_data1 = e1d1, effect1_data2 = e1d2, 
    					effect2_id = e2, effect2_data1 = e2d1, effect2_data2 = e2d2, 
    					cast_delay = cDelay, recovery_delay = rDelay, cost = costIn, 
    					unbalance = unb, level_learn = learn
    			WHERE project_id = projectIdIn AND magic_id = idIn;

END //

CREATE PROCEDURE getMagic(IN pId int, IN mId int)
BEGIN
	SELECT * FROM magics WHERE project_id = pId AND magic_id = mId;
END //

CREATE PROCEDURE getMagics(IN pId int)
BEGIN
	SELECT * FROM magics WHERE project_id = pId;
END //

CREATE PROCEDURE deleteMagic(IN pId int, IN, mId int)
BEGIN
	DELETE FROM magics WHERE project_id = pId AND magic_id = mId AND locked = false;
END //

CREATE PROCEDURE duplicateProject(IN bId int, pId int)
BEGIN
	CREATE TEMPORARY TABLE tmp SELECT * FROM magics WHERE project_id = bId;
	UPDATE tmp SET project_id = pId WHERE project_id = bId;
	INSERT INTO magics SELECT * FROM tmp WHERE project_id = pId
	ON DUPLICATE KEY UPDATE id = (SELECT MAX(id)+1 FROM magics);
END //

DELIMITER ;
