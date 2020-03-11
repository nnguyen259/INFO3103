DROP TABLE IF EXISTS collaborators;
CREATE TABLE collaborators (
	username VARCHAR(50) NOT NULL,
	project_id INT NOT NULL,
	PRIMARY KEY (username, project_id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
);
