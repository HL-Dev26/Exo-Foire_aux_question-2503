/*création des tables*/

USE db_Foire_Aux_Questions;

CREATE TABLE t_users(
	user_id INT AUTO_INCREMENT,
	user_email VARCHAR(128) NOT NULL,
	user_lastname VARCHAR(50) NOT NULL,
	user_firstname VARCHAR(50) NOT NULL,
	UNIQUE(user_email),
	PRIMARY KEY(user_id)
	
);

CREATE TABLE t_questions(
	question_id INT AUTO_INCREMENT,
	question_date DATE NOT NULL,
	question_label VARCHAR(255) NOT NULL,
	question_response TEXT NOT NULL,
	user_id INT,
	PRIMARY KEY(question_id),
	FOREIGN KEY(user_id) REFERENCES t_users(user_id)
);

CREATE TABLE t_categories(
	category_name VARCHAR(30),
	category_description VARCHAR(255),
	category_order TINYINT(3) NOT NULL,
	UNIQUE(category_order), 
	PRIMARY KEY(category_name)
);

CREATE TABLE t_categories_questions(
	question_id INT,
	category_name VARCHAR(30),
	PRIMARY KEY(question_id, category_name),
	FOREIGN KEY (question_id) REFERENCES t_questions(question_id),
	FOREIGN KEY (category_name) REFERENCES t_categories(category_name)
);


/*remplissage des tables*/
	
INSERT INTO t_users (user_lastname, user_firstname, user_email)
VALUES 	('Rabbit', 'Zora', 'zorb@example.com'),
			('Patchouli', 'Édouard', 'patchouli@example.fr'),
			('Satiti', 'Eva', 'eva.stt@example.com');
							
INSERT INTO t_categories (category_name, category_description, category_order)
VALUES 	('Bases de données', 'Les questions relatives aux bases de données', '2'),
			('SQL', 'Les questions sur le langage SQL', '3'),
			('NoSQL', 'Les questions sur l’approche NoSQL', '4'),
			('PHP', 'Les questions relatives à PHP', '1');
			
INSERT INTO t_questions ( question_date, question_label, question_response, user_id)
VALUES 	('2024-11-23', 'Dans MySQL, quel type de données permet de stocker des valeurs numériques dont le maximum est 127 ?', 'Le type TINYINT stocke des valeurs numériques comprises entre -128 et 127', '3'),
			('2024-11-23', 'Quels sont les principaux serveurs SQL gratuits ?', 'MySQL, MariaDB, PostgreSQL, SQLite', '2'),
			('2024-11-27', 'Que signifie le sigle SGBDR ?', 'Système de Gestion de Bases de Données Relationnelles', '1'),
			('2024-12-05', 'Que signifie le sigle SQL ?', 'Structured Query Language !', '2'),
			('2024-12-05', 'Que signifie le sigle noSQL ?', 'Not Only SQL !', '3');

INSERT INTO t_categories_questions (question_id, category_name)
VALUES 	('1', 'Bases de données'),
			('1', 'SQL'),
			('2', 'Bases de données'),
			('2', 'SQL'),
			('3', 'Bases de données'),
			('4', 'Bases de données'),
			('4', 'SQL'),
			('5', 'Bases de données'),
			('5', 'NoSQL');
			
