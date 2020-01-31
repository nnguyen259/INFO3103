DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO projects(id, name) VALUES (1, "base");