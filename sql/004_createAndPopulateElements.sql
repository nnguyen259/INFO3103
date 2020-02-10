DROP TABLE IF EXISTS elements;
CREATE TABLE elements (
	id int not null,
	name varchar(20) not null,
	PRIMARY KEY (id)
);

INSERT INTO elements(id, name) VALUES (0, 'Null');
INSERT INTO elements(id, name) VALUES (1, 'Earth');
INSERT INTO elements(id, name) VALUES (2, 'Water');
INSERT INTO elements(id, name) VALUES (3, 'Fire');
INSERT INTO elements(id, name) VALUES (4, 'Wind');
INSERT INTO elements(id, name) VALUES (5, 'Time');
INSERT INTO elements(id, name) VALUES (6, 'Space');
INSERT INTO elements(id, name) VALUES (7, 'Mirage');
