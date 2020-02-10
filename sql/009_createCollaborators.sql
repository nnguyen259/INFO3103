DROP TABLE IF EXISTS collaborators;
CREATE TABLE collaborators (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	project_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
);
