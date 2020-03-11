DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    owner VARCHAR(50),
    isPublic BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id)
);

INSERT INTO projects(id, name, owner) VALUES (1, 'base', 'root');

DROP PROCEDURE IF EXISTS createProject;
DROP PROCEDURE IF EXISTS renameProject;
DROP PROCEDURE IF EXISTS alterProjectStatus;
DROP PROCEDURE IF EXISTS getProjects;
DROP PROCEDURE IF EXISTS getProject;
DROP PROCEDURE IF EXISTS getProjectsByUser;
DROP PROCEDURE IF EXISTS deleteProject;

DELIMITER //

CREATE PROCEDURE getProjects()
BEGIN
	SELECT * FROM projects WHERE isPublic = TRUE;
END //

CREATE PROCEDURE getProjectsByUser(IN usernameIn varchar(50))
BEGIN
	SELECT * FROM projects WHERE owner = usernameIn;
END //

CREATE PROCEDURE getProject(IN idIn int)
BEGIN
	SELECT * FROM projects WHERE id = idIn;
END //

CREATE PROCEDURE createProject(IN nameIn varchar(255), IN ownerIn varchar(50), IN publicIn boolean)
BEGIN
	IF publicIn IS NULL THEN
		INSERT INTO projects(name, owner) VALUES(nameIn, ownerIn);
	ELSE
		INSERT INTO projects(name, owner, isPublic) VALUES(nameIn, ownerIn, publicIn);
	END IF;
	SELECT LAST_INSERT_ID();
END //

CREATE PROCEDURE renameProject(IN idIn int, IN newName varchar(255))
BEGIN
	UPDATE projects SET name = newName WHERE id = idIn;
END //

CREATE PROCEDURE alterProjectStatus(IN idIn int, IN newStatus boolean)
BEGIN
	UPDATE projects SET isPublic = newStatus WHERE id = idIn;
END //

CREATE PROCEDURE deleteProject(IN idIn int)
BEGIN
	DELETE FROM projects WHERE id = idIn;
END //

DELIMITER ;
