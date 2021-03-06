DROP TABLE IF EXISTS magics;
CREATE TABLE magics (
	id int not null auto_increment,
	project_id int not null,
	magic_id int not null,
	sort_id int not null,
	name varchar(50) not null,
	description varchar(200) not null,
	animation varchar(30) not null,
	label varchar(10) not null,
	character_id int not null,
	category_id int not null,
	type_id int not null,
	element_id int not null,
	target_type_id int not null,
	target_range int not null,
	target_size int not null,
	effect1_id int not null,
	effect1_data1 int not null,
	effect1_data2 int not null,
	effect2_id int not null,
	effect2_data1 int not null,
	effect2_data2 int not null,
	cast_delay int not null,
	recovery_delay int not null,
	cost int not null,
	unbalance int not null,
	level_learn int not null,
	locked boolean not null default true,
	PRIMARY KEY (id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (character_id) REFERENCES characters(id),
	FOREIGN KEY (category_id) REFERENCES categories(id),
	FOREIGN KEY (type_id) REFERENCES types(id),
	FOREIGN KEY (element_id) REFERENCES elements(id),
	FOREIGN KEY (target_type_id) REFERENCES target_types(id),
	FOREIGN KEY (effect1_id) REFERENCES effects(id),
	FOREIGN KEY (effect2_id) REFERENCES effects(id)
);


