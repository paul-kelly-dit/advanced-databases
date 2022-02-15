CREATE TABLE people (
  age INT, 
  name varchar(150)
);

delimiter //
CREATE TRIGGER agecheck BEFORE INSERT ON people FOR EACH ROW IF NEW.age < 0 THEN SET NEW.age = 0; END 
IF; //

INSERT INTO people VALUES (-20, 'Sid'), (30, 'Josh');
select * from people;
