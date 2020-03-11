DROP TABLE IF EXISTS collaborators;
CREATE TABLE collaborators (
	username VARCHAR(50) NOT NULL,
	project_id INT NOT NULL,
	PRIMARY KEY (username, project_id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
);
DROP PROCEDURE IF EXISTS addCollaborator;
DROP PROCEDURE IF EXISTS deleteCollaborator;

DELIMITER //

CREATE PROCEDURE addCollaborator(IN usernameIn VARCHAR(50),IN idIn INT)
begin
INSERT INTO collaborators (username, project_id) VALUES
(usernameIn, idIn)

END //

CREATE PROCEDURE deleteCollaborator(IN usernameIn VARCHAR(50), In idIN INT)
begin
DELETE FROM collaborator WHERE username = usernameIn AND project_id = idIN;

END //

DELIMITER ;
