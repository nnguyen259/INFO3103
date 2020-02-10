DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
	id int not null,
	name varchar(40) not null,
	PRIMARY KEY (id)
);

INSERT INTO target_types(id, name) VALUES (0, 'Special');
INSERT INTO target_types(id, name) VALUES (1, 'Target Single (Movement)');
INSERT INTO target_types(id, name) VALUES (2, 'Target AoE (Movement)');
INSERT INTO target_types(id, name) VALUES (10, 'Set AoE (Can Overlap, Movement)');
INSERT INTO target_types(id, name) VALUES (11, 'Set Line');
INSERT INTO target_types(id, name) VALUES (12, 'Target All');
INSERT INTO target_types(id, name) VALUES (20, 'Set AoE (Cannot Overlap, Movement)');
INSERT INTO target_types(id, name) VALUES (30, 'Target Single (Stationary)');
INSERT INTO target_types(id, name) VALUES (31, 'Target AoE (Stationary)');
INSERT INTO target_types(id, name) VALUES (32, 'Set AoE (Stationary)');
INSERT INTO target_types(id, name) VALUES (33, 'Point Black AoE');
INSERT INTO target_types(id, name) VALUES (34, 'Target All (Divine Knight Battle)');
