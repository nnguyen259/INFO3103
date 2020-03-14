DROP TABLE IF EXISTS collaborators;
CREATE TABLE collaborators (
	username VARCHAR(50) NOT NULL,
	project_id INT NOT NULL,
	PRIMARY KEY (username, project_id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
);
DROP PROCEDURE IF EXISTS addCollaborator;
DROP PROCEDURE IF EXISTS deleteCollaborator;
DROP PROCEDURE IF EXISTS collaboratorsInProjects;
DROP PROCEDURE IF EXISTS projectsWithCollaborator;

DELIMITER //
CREATE PROCEDURE collaboratorsInProjects(IN idIn INT)
begin
		SELECT * FROM collaborators WHERE project_id = idIn;
end //

CREATE PROCEDURE projectsWithCollaborator(IN nameIn VARCHAR(50))
begin
		SELECT * FROM collaborators WHERE username = nameIn;
end //

CREATE PROCEDURE addCollaborator(IN usernameIn VARCHAR(50),IN idIn INT)
begin
INSERT INTO collaborators (username, project_id) VALUES
(usernameIn, idIn);

END //

CREATE PROCEDURE deleteCollaborator(IN usernameIn VARCHAR(50), In idIN INT)
begin
DELETE FROM collaborator WHERE username = usernameIn AND project_id = idIN;

END //

DELIMITER ;
