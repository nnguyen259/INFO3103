DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	id int not null,
	name varchar(20) not null,
	PRIMARY KEY (id)
);

INSERT INTO categories(id, name) VALUES (1, 'Normal Attack');
INSERT INTO categories(id, name) VALUES (2, 'Counter Attack');
INSERT INTO categories(id, name) VALUES (3, 'Move');
INSERT INTO categories(id, name) VALUES (4, 'Item Usage');
INSERT INTO categories(id, name) VALUES (5, 'Penalty');
INSERT INTO categories(id, name) VALUES (7, 'Flee');
INSERT INTO categories(id, name) VALUES (8, 'Triple Advantage');
INSERT INTO categories(id, name) VALUES (10, 'Passive Link Ability');
INSERT INTO categories(id, name) VALUES (11, 'Active Link Ability');
INSERT INTO categories(id, name) VALUES (20, 'Art');
INSERT INTO categories(id, name) VALUES (30, 'Craft');
INSERT INTO categories(id, name) VALUES (31, 'S-Craft');
