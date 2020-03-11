DROP TABLE IF EXISTS types;
CREATE TABLE types (
	id int not null,
	name varchar(20) not null,
	PRIMARY KEY (id)
);

INSERT INTO types(id, name) VALUES (0, 'Other');
INSERT INTO types(id, name) VALUES (1, 'Attacking');
INSERT INTO types(id, name) VALUES (2, 'Debuffing');
INSERT INTO types(id, name) VALUES (3, 'Healing');
INSERT INTO types(id, name) VALUES (4, 'Buffing');

DROP PROCEDURE IF EXISTS getTypes;
DROP PROCEDURE IF EXISTS getType;
DELIMITER //

CREATE PROCEDURE getTypes()
BEGIN
	SELECT * FROM types;
END //

CREATE PROCEDURE getType(IN idIn int)
BEGIN
	SELECT * FROM types WHERE id = idIn;
END //

DELIMITER ;
