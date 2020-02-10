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
