DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    owner_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

INSERT INTO projects(id, name) VALUES (1, "base");
