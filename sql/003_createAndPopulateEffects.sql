DROP TABLE IF EXISTS effects;
CREATE TABLE effects (
	id INT NOT NULL,
	name VARCHAR(30) NOT NULL,
	desc1 VARCHAR(100),
	desc2 VARCHAR(100),
	PRIMARY KEY (id)
);

INSERT INTO effects(id, name, desc1, desc2) VALUES (0, 'No Effect', NULL, NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (1, 'Deal Physical Damage', 'Damage Modifier', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (2, 'Deal Magic Damage', 'Damage Modifier', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (5, 'Reduce Own HP', 'Amount (%)', NULL);

INSERT INTO effects(id, name, desc1, desc2) VALUES (22, 'Delay Target', 'Success Rate (%)', 'Delay Amount');
INSERT INTO effects(id, name, desc1, desc2) VALUES (26, 'Unbalance Target', 'Success Chance', NULL);

INSERT INTO effects(id, name, desc1, desc2) VALUES (34, 'Reduce Speed', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (65, 'Increase STR', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (66, 'Increase DEF', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (67, 'Increase ATS', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (68, 'Increase ADF', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (69, 'Increase SPD', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (70, 'Increase MOV', 'Amount (%)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (71, 'Grant Insight', NULL, '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (72, 'Cure Status', NULL, NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (73, 'Cure Stat Down', NULL, NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (74, 'Cure Status + Stat Down', NULL, NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (77, 'Increase STR/DEF + Insight', 'Amount', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (78, 'Decrease ATS/ADF', 'Amount', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (80, 'Increase STR/SPD', 'Amount', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (81, 'Gain 2 Turns', NULL, NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (82, 'Increase STR/DEF', 'Amount', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (101, 'Restore EP', 'Amount', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (102, 'Restore CP', 'Amount', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (103, 'Restore HP (%)', 'Amount (%)', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (104, 'Restore EP (%)', 'Amount (%)', NULL);
INSERT INTO effects(id, name, desc1, desc2) VALUES (115, 'CP Regen', 'Amount/Turn (x2)', '(Optional) Duration');
INSERT INTO effects(id, name, desc1, desc2) VALUES (203, 'Analyze Target', NULL, NULL);

DROP PROCEDURE IF EXISTS getEffects;
DROP PROCEDURE IF EXISTS getEffect;
DELIMITER //

CREATE PROCEDURE getEffects()
BEGIN
	SELECT * FROM effects;
END //

CREATE PROCEDURE getEffect(IN idIn int)
BEGIN
	SELECT * FROM effect WHERE id = idIn;
END //

DELIMITER ;
