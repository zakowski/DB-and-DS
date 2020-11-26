#1
CREATE VIEW first_cw AS
SELECT a.department_id, a.employee_id, a.last_name, a.first_name, a.salary FROM employees a
WHERE a.salary < (SELECT MAX(salary) FROM employees
WHERE a.department_id = department_id
GROUP BY department_id);

#2
CREATE TABLE mecz (gospodarz VARCHAR(30),gosc VARCHAR(30), gole_gospodarza INT, gole_goscia INT);
INSERT INTO mecz VALUES ('Polska', 'Niemcy', 8,1);
INSERT INTO mecz VALUES ('Chorwacja', 'Niemcy', 3,2);
INSERT INTO mecz VALUES ('Szkocja', 'Chorwacja', 1,1);
INSERT INTO mecz VALUES ('Liban', 'Chorwacja', 1,2);
INSERT INTO mecz VALUES ('Rosja', 'Japonia', 2,1);
INSERT INTO mecz VALUES ('Mo³dawia', 'Chiny', 1,4);
INSERT INTO mecz VALUES ('Szkocja', 'Grecja', 1,1);
INSERT INTO mecz VALUES ('Grecja', 'W³ochy', 3,2);
INSERT INTO mecz VALUES ('USA', 'Bia³oruœ', 0,0);
INSERT INTO mecz VALUES ('Hiszpania', 'Niemcy', 0,0);
INSERT INTO mecz VALUES ('Nowa Zelandia', 'Chorwacja', 1,0);
INSERT INTO mecz VALUES ('Chiny', 'S³owacja', 0,1);
INSERT INTO mecz VALUES ('Japonia', 'Niemcy', 1,1);

#3
