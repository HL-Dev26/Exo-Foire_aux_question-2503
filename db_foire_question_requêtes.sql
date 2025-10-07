/*1-Sélectionner tous les utilisateurs (identifiant, nom, prénom, email).*/
SELECT user_id, user_lastname, user_firstname, user_email FROM t_users;

/*2-Sélectionner toutes les questions (date, intitulé, réponse, identifiant utilisateur) triées par date de la plus ancienne à la plus récente.*/ la plus récente.*/
SELECT question_date, question_label, question_response, user_id FROM t_questions ORDER BY question_date ASC;

/*3-Sélectionner les questions (identifiant, date, intitulé, réponse) de l’utilisateur n°2.*/
SELECT user_id, question_date, question_label, question_response FROM t_questions WHERE user_id='2';

/*4-Sélectionner les questions (date, intitulé, réponse, identifiant utilisateur) de l’utilisateur Eva Satiti.*/
SELECT
	question_date,
	question_label,
	question_response,
	t_users.user_id
FROM t_questions
INNER JOIN t_users 
ON 
	t_users.user_id = t_questions.user_id
WHERE
	user_firstname='Eva'
	AND user_lastname='Satiti';

/*5-Sélectionner les questions (identifiant, date, intitulé, réponse, identifiant utilisateur) dont l’intitulé contient “SQL”.
 Le résultat est trié par le titre et par ordre décroissant.*/ /*Le résultat est trié par le titre et par ordre décroissant.*/
SELECT question_id, 
		 question_date, 
		 question_label, 
		 question_response, 
		 user_id
FROM t_questions
WHERE question_label 
LIKE '%SQL%'
ORDER BY question_label DESC;

/*6-Sélectionner les catégories (nom, description) sans question associée.*/
SELECT t_categories.category_name, category_description, t_categories_questions.question_id FROM t_categories
LEFT JOIN t_categories_questions ON t_categories_questions.category_name = t_categories.category_name
WHERE question_id IS NULL;

/*7-Sélectionner les questions triées par titre (ordre alphabétique) avec le nom et prénom de l’auteur (nécessite une jointure).*/
SELECT question_label,
	 user_lastname, 
	 user_firstname 
FROM t_questions
INNER JOIN t_users
ON
	 t_users.user_id = t_questions.user_id 
GROUP BY question_label ASC; 

/*8-Sélectionner les catégories (nom) avec, pour chaque catégorie le nombre de questions associées (nécessite une jointure).*/
SELECT 
	t_categories.category_name, 
	COUNT(t_categories_questions.category_name) 
FROM t_categories
LEFT JOIN t_categories_questions
ON t_categories.category_name = t_categories_questions.category_name
GROUP BY category_name; 
