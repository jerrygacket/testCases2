3 (MySQL). Имеется таблица логов пользователей (логин пользователя, id записи, дата-время, событие). 
Напишите sql-запрос, который выводит логин и последнее событие каждого пользователя.

Пришлось почитать документацию.

CREATE TABLE mysql_test_a ( 
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
login VARCHAR(30) NOT NULL, 
ev_text VARCHAR(30) NOT NULL,  
reg_date TIMESTAMP 
); 

INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('1', 'John', 'ev1', '2007-04-30 13:10:02.047');
INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('2', 'John', 'ev2', CURRENT_TIMESTAMP); 
INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('3', 'John', 'ev3', '2010-04-30 13:10:02.047'); 
INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('4', 'Karl', 'ev4', '2011-04-30 13:10:02.047'); 
INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('5', 'Karl', 'ev5', CURRENT_TIMESTAMP); 
INSERT INTO `mysql_test_a` (`id`, `login`, `ev_text`, `reg_date`) VALUES ('6', 'Karl', 'ev6', '2007-04-30 13:10:02.047'); 

SELECT login, ev_text FROM mysql_test_a WHERE reg_date IN (SELECT MAX(reg_date) FROM mysql_test_a GROUP BY login);

login 	ev_text
John	ev2
Karl	ev5
