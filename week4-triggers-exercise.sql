CREATE TABLE student_grade (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    names varchar(200),
    CA_scores int(11),
    test_scores int(11),
    exam_scores int(11),
    total_scores int(11)
);

TODO - Do your triggers before the next step

INSERT INTO student_grade
(id,names,CA_scores ,test_scores,exam_scores) 
VALUES
(1, "John Miller", 20, 20, 40),
(2, "Jean Miller", 12, 20, 50),
(3, "Sean Miller", 20, 15, 30); 
 
 SELECT * FROM student_grade
